Return-Path: <linux-media+bounces-48831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4660ECC0234
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 23:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F34C3053920
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 22:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04470327C05;
	Mon, 15 Dec 2025 22:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JO6gahvX"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E324D328639;
	Mon, 15 Dec 2025 22:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765839033; cv=fail; b=sdj5dvB3lazmLuJj002fsfSe2oA+3Tg9jRZCj0rUrxHOu8d2ZpXomw5oUk4RKbAzkprUaL3vyUIpXbKRvqhBWjduH04XIW4bi5YYJcvJ95hvYfVf2XpCwnkDNJ/1J0HCayj7xM8iQ2EicmUt1q4zgc/isF7cJOFbqaAHNTGMNdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765839033; c=relaxed/simple;
	bh=7gY1+YaE8rhALfvIfekwAg5NRw/rBENV0gFy0TCAUrk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QC+3je7zsNb4jwJfZ0IyXCYz8RrtVFCgWEpVpi8Ap31VSHQVXdpJHEl2AYpWOOICm0Hqe/7yYtgvjlGZzPUSAOXZA7QIJGuyN/vKBToLjymVJTk/ZLOqqMqLJouCBYaYL68JrIGdr/t/gMxNfAWfVsF7SFgvrjm2wsIzvaW+lL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JO6gahvX; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1i8F4HqBYDCHl89umbEuhMZxqCHjqCnMhMNc/8Zy9a7F/GihvztmEnwYKlgOuEMl0SRpoumLHN0cTTQ6cC0MsQC83fTSgFOO+aI9BVi4n2BgEFETdSgO+u7I5tp4jbX10/cvu9A+bipE+ysvTAEV+W/oYsSJD4Esu3upM2jg7ntPXVJMtWes/lS4Xr9pFI4H1kSCrJWQB3GViHyXwPE0uaxe7MrpBksA3w2DIzGyKwMEHM6OW4NsNG9cQxAlVE2lB/a5M0eJH7pXvt9iNUeoOoU+LS+auySiJBBuX7WguJVtAQb5HQpU3/BP8Atwsk2qtKq++pmuuURWxbWBXyU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftLQxKwVe+XCJnaNRJrxhRGrrOr4EjiRt7qhYKPdkvA=;
 b=M6jFo0XtA+wHtYXoIglg313Mrch6A2Sk3n434ZuvHzqR6qb0YM1SGiPRVefWD8GWtAP8xi/+XTs5h0eu9CfPtvxIKviQDdIw5dxNpgpNooQ6v0okwk+AtXs8ZkdJ6uUUr1phN9Qlh/oTXuei5nhjKrFFCgiNDQNeeCcjbDWXDunIs+JKQ86uD0xlO1EOf97MnHj7/WuIJ/ixRsJWwEjBMOSQdTMZAhCeZThvdJ092Thl1xNKJm2sbR2tZZfkBkAfsHoiQHKaDzZ9dYiBBKED4EzNlTfm7H/bGVlYkSgX8nD/6JdzCUFKr/UtzmXWAqtGcJdM/AIfQd2Yqh2NzSvJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftLQxKwVe+XCJnaNRJrxhRGrrOr4EjiRt7qhYKPdkvA=;
 b=JO6gahvX5E/8Y+EHvVhyWQ6AolA+sUV0BCFY7bf4RftV+uvui+HDd6bGxab+RlxnfJG5WWKH42h68fWiBzzrAfiotsPx0JoKI21lioyrA9IFmuBkQXKp1OQuSl+zqwwoeBr8rmXRRBQjNumMIOl9iWY8KT24TofROZj/VMs3tdR+E+0tbR6J3Gbxq6ef4kEikYgEkPf/wteTbzYaDBj6SnRNP3z2yTwVSYSajdwnU6KC7MBhJDn7bkM4ET76/5U+/yyzcbhzKcc7bzOO2ZeP5b4gXKNOa8gv2xniwSdk9YWNBnQbGbPD/llIFyYASyErzWWby6BzkWQR1ExW2ZNDTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA1PR04MB10794.eurprd04.prod.outlook.com (2603:10a6:102:482::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 22:50:28 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 22:50:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 15 Dec 2025 17:49:56 -0500
Subject: [PATCH v3 5/5] media: nxp: Add dev_err_probe() to all error paths
 in *async_register() helpers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-cam_cleanup-v3-5-a61995068f38@nxp.com>
References: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
In-Reply-To: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765839009; l=5116;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7gY1+YaE8rhALfvIfekwAg5NRw/rBENV0gFy0TCAUrk=;
 b=pTGptWQ9JfwkPrUblMLkZxplLJ0wgtdmfogC+BcBEhWOnr4+KYyQzWgE4/yRYNzY5ucNlhWDq
 4gmQzhHtr+KBbZ55Df3VhvR8WadpW0G74PaNmgDF4rGrPuyHOk500ld
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:510:23c::8) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA1PR04MB10794:EE_
X-MS-Office365-Filtering-Correlation-Id: cd1a076a-ceab-4501-3a43-08de3c2c57db
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|7416014|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bEFGOGgvS1U3Z21nZ2NPR0RNZGRabXoxRFZKdVZVYmcvTHBrRmVtci9mQmZL?=
 =?utf-8?B?b1lNOFlyajNZcHpEa3B2UjQwcTNFaEFpaXZLaXBDU3RYYVo5bDN6Nyt0SFNI?=
 =?utf-8?B?Z3QxR0k1ZUxURlJWdHJMMUlrcFlxTUxseU1HUzd2aVhwZlFsSE9tTEI4cDkx?=
 =?utf-8?B?Vks4R3ZQRlk5bmtla1prRGtXOWdMTmJBTnRPYmhlbXArTENWQkJsVitIT0Uz?=
 =?utf-8?B?S2wvT0QrRzYxV25Ib0UzbXN4dGxDSEdXQnRQVlRQdXQ0RHA3cFBXbDZGOUQ5?=
 =?utf-8?B?a1BCb2lvSVVTZnBCT0tBaEt2MWZtZG9NSytBZzVIY0pMcitIRHk5VVdlNTZI?=
 =?utf-8?B?bU5kODFQUUVzUVRPS3BMSmlDcS9najByclR1aENqWFBGUnVxMDFVUkZXZkdK?=
 =?utf-8?B?YjFOcmR2OUdJak5KTjVVTGRONVlDVXp1cXlmbS9LMWsyaGdrTVFsR0x3Tnk2?=
 =?utf-8?B?Uk93SWVYWnQ3cGRmT2N2SnVxOUFwUWZCRTkxdi82MkRlRGFQck43aEdYQkxj?=
 =?utf-8?B?OHp0cFFweThVL3NTZnpvZ2VobHFuNS9Qc1hXS3FsZEIyejdtMm5BQXZNbXdJ?=
 =?utf-8?B?L2ovQjV4YXVMUWw5c3ZrSXdaWVoxaHlRbW9ieHdNbFFDUU9lVWp6K2hsQ0Vt?=
 =?utf-8?B?YUMrMmxHZVo5dGlHRHFHTFE2Znc4czlKbTBkYTh5NG01YUt5RnVtNXBTODhS?=
 =?utf-8?B?L1pPMHNUY0JzeWd1Nno4SVMzSlB0YjlsRWJFdXY3OGZNZnVRNnI4UmVUdjYx?=
 =?utf-8?B?dUJmdE81MVNMTHUvdXVFVGdwR3Y1ZU1iUUVDbzdBMWs0ck1MSTBob1FCMWhk?=
 =?utf-8?B?SWNwendZRFVTVWNndEVLakU2SFBvMVBrdnRGRHRpWG9uUjdQeDBVRTR4ZFIv?=
 =?utf-8?B?TXZVaXN3aEszdUxNQTkzMVNtRkcrcURBV2U1ZCtUeHRNOHJGbk1LS2w5dDQx?=
 =?utf-8?B?YStaZXNMMndNY3hJQ1VZTXhEMVhzNjZ6MWxPWTEzZ3VmTmJ6dkNNWGFrMkVD?=
 =?utf-8?B?cmhLRlpiRGRlVkNETGVxOFJpeUYvb0NmZGMzWVU4MWN3eit2NHBTSmM0Ri8y?=
 =?utf-8?B?eVRUMTlVdUdCazhDNVpVaU9wMDB4SFdGNTZGeTREOEUvT2xVemthdVVBd3Rs?=
 =?utf-8?B?cTg3TG8vSmxBQitraHBJK2tvY21zVXpycWlIbjc5V3E2d2g5Ui9ReThPMFlJ?=
 =?utf-8?B?R3o1cU5rNXc4a2FtWnJ3MElZOXVBeWJpOGl4YmE1WFd0V3BrQi91YVJtRHNp?=
 =?utf-8?B?c1RCSmZCcE1HK3FOZ1ppV1BiMjJnanYzU0lvanlPMkViOGdoU3VBdWdIcmRL?=
 =?utf-8?B?UmlWVTlLZSs2NEIrdzNaYUhXSUFBSFpoclJBWWhWVDdDMGNoMEg4a21yd21u?=
 =?utf-8?B?a1BnRURRZm9BL3d2T3ZrSkZlUzN6SHo0YnlIa0paVk1uMGF4cld2SjRVNkdE?=
 =?utf-8?B?T1NpckZ5S0pjOFZPZEFmc3JKb21BZHhhOVFlSndDQlhqTEZWWFV0cncyQzBy?=
 =?utf-8?B?Q01IYzRRa0RzYVE2Tjhkcm1WR2RJSW4wT3JNOG4rYVh3K2xDQ3p0WlJid2cx?=
 =?utf-8?B?a2JXaTFmUDFvVnl3bjRZcWpxNmhyM1lBSU9jcUlCTnF1TFJzeGo4ejlPMitZ?=
 =?utf-8?B?VGgvV3k0MWNsUHVLNFB1K3BsZXduYTU5Mm5wWTZ0aDZmbjN2QWJ1TEM4cnl5?=
 =?utf-8?B?QkppNDVrM0pBVmN6SGc5WmJpTGt5b3ZFcmFuOFNHc05EZ1lNQkJ1aFJVTnoy?=
 =?utf-8?B?NHFGRm5aQmhrZHRkK1FweUtQL21mb1VSaUM2V2pNZ0JyZ3BuSTRONWNVVS9t?=
 =?utf-8?B?NjBNcDRZSnNoRlkrTnBUNFY5c212MnFweFhicUJ6TCtTdVhMMytQR3NsZmVZ?=
 =?utf-8?B?a01iVDc0WktWeHFNY1hVOWJaK0FBOHNreUhadU9sTE1OcGxOY3B5Tk0zKzdW?=
 =?utf-8?B?bXUzbVVuelg4eVh1NTZOTm0yNWY0c1RGZ29SbHlRcjF0NEg5Y2Q3OHU1aCtI?=
 =?utf-8?B?OURHdE9MMmZSbDE4WDZTelY1THEwUy9JSSs4dmNHUzQzZEZFZit1YldLdFdB?=
 =?utf-8?B?ZkdvYTNDbm1Uem9kRHdQSE9aQVB6ZERNcG1RZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(7416014)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dFcycnVPVnpBczNwNjZwK0lUSHR4N3V4a1FQQXM3cEJVWmpnWUF1ck1jMkQr?=
 =?utf-8?B?bnA1OG9QbjcySnN3bHFNd2dvUVMyZ0xWYmp2a1pvYkYzZWxoNHhKM3lERlNS?=
 =?utf-8?B?aDhhWXJKWmp6ZjRSZWtEaENoZVBMQkJWcW1xYitZSmNURmFmUzc5RUlMK2Jn?=
 =?utf-8?B?bjNGOXZUc2NNZGgwSVRycmJpWnZzN3VEaTdwMXZwYXpjdGU2QU1lb00vQnJC?=
 =?utf-8?B?ZVIveStJY0tvUnE1RjIrMEI4K3VqamhubldWU1RpMGhMSjcwVVRoYW9yQk40?=
 =?utf-8?B?SHpLSDNyWVdUbDl5cjkvNm1QTjJZZ3lMSTUvZ0FiMGNxM0Zic0NrVCtpV2hW?=
 =?utf-8?B?QUw3RzVpVjVOS2NoYjNuTGVsSHNrVS9mS2JMTzZTUlBKTFdOKzdnQjJra3ZS?=
 =?utf-8?B?Y0FBS1haWnFVTkZyZ1NtQnNUUC9uMGVsSGJFNHgwbXcvNlpreDh4QUE1ZkxV?=
 =?utf-8?B?YSs2TWpBT2ExWVZvc1JJc1hDNmtlVHByNDJDcXZoWThMeVY0VjU2cGJ2UGZE?=
 =?utf-8?B?NXpNVU83MGJ1ZmxyMEV5RXpzQnVEQnFLTnMwWWJFVjZ6cEJKZFh0Ykk2bkR0?=
 =?utf-8?B?T0VOWVNUOHdaRjZXcVZLTVlPdjJXekx5Q1k5U2toYWRhcDdWNGwrYWd4bms5?=
 =?utf-8?B?M0pUL0tKbU8yeWxJYlUxUkFHUGdvc2c2Z213bTBlRXZQcmNNbzJLUFRFaTJI?=
 =?utf-8?B?amtRdlZtc29JUnZWaXVNaHUrMmxPWjZSTGF0bmE3cE9KTU1mOFN6aTcxazRx?=
 =?utf-8?B?ZVJOeXFSY3lvNld5MTlxT0JwNitVR3YvZ3dwN1prNzlBMFU2L1JVRnRQcFZY?=
 =?utf-8?B?Y3krLzRWUHFLb0xRZGdDZW5iTVdyMk5aTUlxN1dVRG1USFhCazFDa0Q3azlE?=
 =?utf-8?B?aWxEeU5kbUMzQk1hYkpRb3RJb1FKR1o1WUg0MUlLSmd0clUvbXNzZW5oNVZW?=
 =?utf-8?B?QjNrcEY2UWFwQ2pwVUxnUXdjbmlMYXhIUTRneU1DYVFNZnc2MHRkVU5wTUgx?=
 =?utf-8?B?bWVQbTZORHpla2dlbXd1REk1YkduQ08yd1oxT3FmZWlIU2FHNFlmbThGZHNZ?=
 =?utf-8?B?czBIa0E5QXhLaUk2N3pONExDY00xTm43bStVTEZYUUsrTlpvRTB1eUhNYTQz?=
 =?utf-8?B?WUFtcytBbjRTV3ZnS3RIZGJ6ZkYzQWF0MG5IZnppT1cxczRhSXVsTXBDdEtv?=
 =?utf-8?B?WU02MGZieGw3cUxsaFQyRjFPQ2lJUDZSSmxTTGNlQi8xbzJISHhkU21CNFhO?=
 =?utf-8?B?MW1VTUYrSmZNQlVROVpseW9NS1NsRnp5ZjErd3hETzBJa3FaenlPTENqV1VU?=
 =?utf-8?B?U0ZrRzNBcDNrVks3RU15UU1PV1dYWTVkdnlyMkRIa05RRmJCa0Z1MWVwV09R?=
 =?utf-8?B?dktXRlhQUFlkaGhYTWVYWGJNVkFSU1hMODVEYUpaL09ienRqSitxSlpnK3p1?=
 =?utf-8?B?Zjk0UzQzQVRwNzB2M0ZDQjBhTjdnVklMRExGbWN3YTcvYjVFZDU2ZEVwN1dV?=
 =?utf-8?B?WDkzaTRJSXBoV2Z1SXFUbjNHTnprbzR3QTRTcnpaMHIxNWpBSEhVb09aNnBi?=
 =?utf-8?B?ZENocjB3NFdkNVJYejE2RDVuNXd6a0VKZVN3SXBZVVBLNEU2c0RIYnh2SmJK?=
 =?utf-8?B?MG9kdHEvVUZMRTROZWFIOWdna2U5bUZGSXphVmxkeUYvdVE2NnBvTEFpT1Q5?=
 =?utf-8?B?Z1dpOFBZb1pQRjJzMm9HdTNlRml3MVhGL2hHNEUzdGFVYzFMU2c0MkxDa1RY?=
 =?utf-8?B?cFZmNFZsK3ZFK0JjczV5VlVhVDR4c2l1Mk9hcmJ3TkhsV0c2Y1hvOW0wQXU5?=
 =?utf-8?B?c2cwQXZ4dUNOdGY0RUpZNHNMTXdPVDd0UnBsS1dSblNjRTNoMXpyZUp3WWtR?=
 =?utf-8?B?VGh5cm9BMTdpRFExMHRUNmIwbWFTSTdYZ1ZHQnNWNjE4U0Evcm91bTBkUG1r?=
 =?utf-8?B?eXcwdWxSVlhYQ3lmUU13Y1BsVURZZFlwNWdlMEt5L1kzdFpuenZweVpCMURm?=
 =?utf-8?B?cjM1NzZlUGdUeDhobXgvdllpajVVT1pWcWI5VUlidEJnajJOaUtGeDR4ZlM2?=
 =?utf-8?B?WVNlK3lWUW1tZTJUaWNPL0hrdnQvQ0w0aHFwRjFyeURFSmI2a3FTbVZGaHND?=
 =?utf-8?Q?GU7jzI3BhrGrJdmf3A1a1f+tN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1a076a-ceab-4501-3a43-08de3c2c57db
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 22:50:28.4309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OA4PsOVfiT2GFnNTJkjOY7IFrl89ji2pBYes7SqD2xugt6mRaZdJGnGpXh6SyuQOBRd8m9mGJRAGKK7yJdH4Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10794

Add dev_err_probe() to all error branches in the *async_register() helpers
to provide clearer diagnostic information when device registration fails.

Drop the explicit error message after returning from
mipi_csis_async_register(), as the error is already reported by this
helper.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- new patch
---
 drivers/media/platform/nxp/imx-mipi-csis.c    | 31 ++++++++++++++++-----------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 27 ++++++++++++++---------
 2 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 9a43fd1eb0bcee7ac0c47f28ad89012de45a70d9..85098824f4917b3cda3aa71c4ed0a41939283e12 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1359,18 +1359,18 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
 						FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
-		return -ENOTCONN;
+		return dev_err_probe(csis->dev, -ENOTCONN,
+				     "failed to get remote endpoint\n");
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		return ret;
+		return dev_err_probe(csis->dev, ret,
+				     "failed to parse endpoint\n");
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
-		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
-			dev_err(csis->dev,
-				"data lanes reordering is not supported");
-			return -EINVAL;
-		}
+		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
+			return dev_err_probe(csis->dev, -EINVAL,
+					     "data lanes reordering is not supported");
 	}
 
 	csis->bus = vep.bus.mipi_csi2;
@@ -1382,15 +1382,22 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
 					      struct v4l2_async_connection);
 	if (IS_ERR(asd))
-		return PTR_ERR(asd);
+		return dev_err_probe(csis->dev, PTR_ERR(asd),
+				     "failed to add remote fwmode to notifier\n");
 
 	csis->notifier.ops = &mipi_csis_notify_ops;
 
 	ret = v4l2_async_nf_register(&csis->notifier);
 	if (ret)
-		return ret;
+		return dev_err_probe(csis->dev, ret,
+				     "failed to register notifier\n");
 
-	return v4l2_async_register_subdev(&csis->sd);
+	ret = v4l2_async_register_subdev(&csis->sd);
+	if (ret)
+		return dev_err_probe(csis->dev, ret,
+				     "failed to register subdev\n");
+
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------
@@ -1549,10 +1556,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, &csis->sd);
 
 	ret = mipi_csis_async_register(csis);
-	if (ret < 0) {
-		dev_err(dev, "async register failed: %d\n", ret);
+	if (ret < 0)
 		goto err_cleanup;
-	}
 
 	/* Initialize debugfs. */
 	mipi_csis_debugfs_init(csis);
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 550f9f725cc18fae910282ad72aa1dde37af0b47..f63e0fb1f3091d560dba10dec92523fc74fb6384 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -727,18 +727,18 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
 						FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
-		return -ENOTCONN;
+		return dev_err_probe(state->dev, -ENOTCONN,
+				     "failed to get remote endpoint fwnode\n");
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		return ret;
+		return dev_err_probe(state->dev, ret,
+				     "failed parse endpoint fwnode\n");
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
-		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
-			dev_err(state->dev,
-				"data lanes reordering is not supported");
-			return -EINVAL;
-		}
+		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
+			return dev_err_probe(state->dev, -EINVAL,
+					     "data lanes reordering is not supported");
 	}
 
 	state->bus = vep.bus.mipi_csi2;
@@ -750,15 +750,22 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
 					      struct v4l2_async_connection);
 	if (IS_ERR(asd))
-		return PTR_ERR(asd);
+		return dev_err_probe(state->dev, PTR_ERR(asd),
+				     "failed add fwnode to notifier\n");
 
 	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
 
 	ret = v4l2_async_nf_register(&state->notifier);
 	if (ret)
-		return ret;
+		return dev_err_probe(state->dev, ret,
+				     "failed to register notifier\n");
 
-	return v4l2_async_register_subdev(&state->sd);
+	ret = v4l2_async_register_subdev(&state->sd);
+	if (ret)
+		return dev_err_probe(state->dev, ret,
+				     "failed to register subdev\n");
+
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------

-- 
2.34.1


