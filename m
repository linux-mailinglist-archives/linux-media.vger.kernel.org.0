Return-Path: <linux-media+bounces-49784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A522CEB6C1
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 08:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D7E7303ADDB
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 07:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BBD3101AB;
	Wed, 31 Dec 2025 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="MpNN+m1p"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020102.outbound.protection.outlook.com [52.101.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B541E492D;
	Wed, 31 Dec 2025 07:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767164855; cv=fail; b=J81WaAl3HpvWidVb56yIO2UObhETDXOfH67HQ4XhDMDsYVn+OP8ndtypl0kh+BsUSLWxlXTBjkyiOhv0w6cN6LJQWKhhUPCOYk7LvU0n9UNzSX9qNbL+6YC5AIolmzslcpcf0GVfM3ov3gTd7PrLEjJUzuq8qbaarc2uBhs0VhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767164855; c=relaxed/simple;
	bh=47SSyVudXDRrhJNX/vzDB1u23YTxGvliOMofzZQP9zY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YUxi9vGABBAJYVZwWhfX5FNjDr8AQyOWYtX3e5uDVPyY7+T/RxKlVWNkcrmQR7m9z5cx7Rc7Oq7zGxRVb6WvUP+zh7j/ezFBms8BpzosqI5QetWQ5EPbOKkmRhgs3TKXW7P1CAC9CKjIRBxneuY4yyrdnybIiAFey1dyahXRKL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=MpNN+m1p; arc=fail smtp.client-ip=52.101.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/LzFeH/crPkehhvan4H7XLq6V65ahXlQMbmjMgJJR9qIzNgpcjLxyIq6F5DK9Z/Wg7jZuL0dqDRpOtOh/fklq43tCwHty2jsjaWaADnu+dn5dPUGHYCoKcyWOEK49SWFZSqBg3fcD16QS5Hb1AT3jDY1UvpuFcDJTSW3xy+X4en8Si7UHn4fkLp04ksFqEI3qXQ8oVSGx9y10S8obTI0BvTVpXUr8Bdq+pz5W6cn/AkvsN1l6AgeZozC9LOsEVaeTHhfxgaKKsgyHLOTV1SqjNRpeA8HtTtM7VGvmFvAe7eUQOvdyrYZJmi9DreJmJCO05HD2vXNfH3B5hdM2b6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvDDL5PnNI7GJl/6ikk2eDmXVtp4qruiJvvL3iEuqx0=;
 b=n4jDUkmXvYmDTSmzFp//6m3ET+Ou0YRW1BvT1QBgGRS4sr78ds1eZoeP3M7RlkVreqAb4GgkIgGM0YjoYAIHTZy5jAqg0e3G5rPaYMsGBR78rDIjvo2vUkDbuz1mqRMY4HkJFbD+iBOUZ7G7XbXWpbZrz2J2BW+6dFU5UF9yBA3YcXXfg/5hkvqbR3CeOiG16Y7b+fcm3PGYvKsPtcKlN4n+8mTl/YMYZtuVzvjxggr26bmbU8rNpUahe3lmWjorbz42TxMOVtWLqFen36twhFJD1c5Bc9Ik7M0DCB1SwDZjqrhZhlF8oN1Fy4aYIXzybpub99zfrTZU5NxpYJv/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvDDL5PnNI7GJl/6ikk2eDmXVtp4qruiJvvL3iEuqx0=;
 b=MpNN+m1pB0a86gC+yCBmwSGBKiCDVhxkiEugxqPicSmi58UpSqgcCz7KavQA89HogwBAD02aYwRy+jR6FeSVNB3CwW1GzBblkJFhcCO+deefmdTDrxfykgMk4apPztEh3bcH5/JjZHXt7MxBJ7zzelOLMwg9gGsmXy+P8KsxHamm+vMDEUTBWWBzEdlW6vHOeP96IISVu7WaW+wDfYWYzfZbrc/p8jIYMoMBUlgcbauhEbT5hVPvg61L3hGjKKQ4mFGlSDKRTUR38enUE4hPVfytHxc6zfkcxTOPo4IkTz3UidUEppzElVcZAkdZkGRQ5YfM5J+yJ/t3F/S4UCG3Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN2P287MB2030.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c9::8)
 by MAZP287MB0021.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:40::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 07:07:29 +0000
Received: from PN2P287MB2030.INDP287.PROD.OUTLOOK.COM
 ([fe80::85bb:6572:ae6c:5a15]) by PN2P287MB2030.INDP287.PROD.OUTLOOK.COM
 ([fe80::85bb:6572:ae6c:5a15%3]) with mapi id 15.20.9456.008; Wed, 31 Dec 2025
 07:07:29 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Date: Wed, 31 Dec 2025 12:36:37 +0530
Message-Id: <20251231070645.16434-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231070645.16434-1-himanshu.bhavani@siliconsignals.io>
References: <20251231070645.16434-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::11) To PN2P287MB2030.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1c9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2P287MB2030:EE_|MAZP287MB0021:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe4a346-860d-4d1e-298a-08de483b4293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xTeKehFy+tsFteuANvf2CGK4mjTAWxcfFZeDRGjmtzxdEAJwVkyLyG/QkyyU?=
 =?us-ascii?Q?SFoKKpB8MVccBt3GF4m9BZRhNbW9Dc+r0GUlGLhb1uM8/EsUq3M7b4ynr3eu?=
 =?us-ascii?Q?VzmnUSQ37RNZRvFcfOiZkNc0zFI2nhYB5VOW4nrFrRBpwAW7HyCZKLf2uodq?=
 =?us-ascii?Q?FgQhIF2KC8ePq9orT3GNuijelyGuo0I44di8GRmx312hKNLdoXhrPl4WloVE?=
 =?us-ascii?Q?33+3q22+QA3UfpldhIcsWA9/CaObMv2cQa79vCgpDV3eCykPqIYlRqxiTW+0?=
 =?us-ascii?Q?zc8ndOoinLPnsMCYh9HkNqy8U60/O0806Sr1c5VCm7swIFmD3XkpyF65O1CM?=
 =?us-ascii?Q?uHZdSRhQaX+h53MvXALJspWW6rOrWyyxgdOAp3IdL505xg2LbBBJk5DCK44J?=
 =?us-ascii?Q?eM10iSUVFsfwcwfBAkE7wDg2/IWa9KzuDcygrVWph2+T75NQJQ/upD63Cvpi?=
 =?us-ascii?Q?kVr8NBEr5UUcjWme+BQoYWwcx/sGFYfa/V0LPUGHYMLHGZy862o322okIc5n?=
 =?us-ascii?Q?XOQMxbX4F6xUGOtzSEKWFtbWRAW4v65wxXlywekrWsWu5dNf8LhbxmEsQGxa?=
 =?us-ascii?Q?uza0RsToOWKLFOJrl19dk+lIOhec8VcJ357AjG0tzsxa5r8JoMadOl1I3Dhi?=
 =?us-ascii?Q?NkPXuOHAZjmOGJQItKWd/Zpzoplm1U4V5Z5oqZ4Gx/XI6sSACyPIKgDkGAOC?=
 =?us-ascii?Q?YfXp23jUQtfC6JgLv5PIZK9VMfEFlRhRjAYI8jYd1HoqX7bqoOFuWGkKcKZx?=
 =?us-ascii?Q?O8N4lM+/LigNA+XTgEBGmqjcdh/Gn6xFQAJv6YsfQ+BGR2K4oYjsEFKVVl6N?=
 =?us-ascii?Q?FFbJe+9VwnBd/gumlDrcjjmjjpx9TmlWNSCbeZGHD9CP8nqiEVM3Vq0W/dnz?=
 =?us-ascii?Q?oIXqE7JXg9fF3smYBFfZsSxZafUEG5VdD8wpMNpsoJyBCaMPd+SO3szbpOeM?=
 =?us-ascii?Q?NWS9feJxkWsW3OgnNIc5i1TxH9mrvIv82Vi8KjaNxk3R2NOyQEO0a1TpRh5X?=
 =?us-ascii?Q?9M8Wh00OAUmHCUKT3vf71ImJps6M8fIQn0m9iQymYH4lUjCMCM5SQ1+mJnbF?=
 =?us-ascii?Q?FhDuwenGVjvxOGo2ST+3HDqWfljg6zsIgXnW1J/OuOKzzRS50m0dGp/JPJ7r?=
 =?us-ascii?Q?wuB3yTJyQecn/cNgsQBTx1P1BHBFscULpehBCPDu4w72k5TlTPs0h/EdM0xO?=
 =?us-ascii?Q?80Z2Y8okq1z+D89dWYQL1nTwDnR5aL8l3tdXNtUrAC5TzFoLxYegzg0qRnPZ?=
 =?us-ascii?Q?Foy3fDB81/thq0Vvg0CxDu9H71lVphGVWX8tSrMF4x/Y0Kb7VhNLe3CkQphz?=
 =?us-ascii?Q?lZtQRxUjxaASo+HRTDKfXXwuq/J7b+IcAWVP+y2MCQ6WNq+zwK9Zg0NgOhUS?=
 =?us-ascii?Q?xmdHq4JaWPSGpJJxI6+IBPukW83eD/OV3UZXB1BaJGwLqKgQFO4qsIwqMadb?=
 =?us-ascii?Q?vSQBDwBv/xfseBb65GLJcUoPZPU4vEtz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB2030.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BWgO7NJxvM9+Xbye0pOVd4yJnOzTeCV+srigMWdSB6wjD/jXrNdF7t0qKTGK?=
 =?us-ascii?Q?IOxqQ2o4I3xLi63+7U4Fo1YAlc12a1XDSQ9cztuje6shZfkJ1LDdYuips/an?=
 =?us-ascii?Q?AGHsWwX6Rx22mkjFNaYOx4rvp6rWjlAeKL4iryMIi5Ejz9oFpH6cm6xaKKGx?=
 =?us-ascii?Q?r0aGCDy2D25UNz8/8+KLE9EmvlQu8GLsr/TranqY0Tsuz+rjUxAhTIUpUBCA?=
 =?us-ascii?Q?T0gROq5b735Cb+KUpMlAuRmJBX6zUIoTLIdB5P++EOTUc6vL8+eCmpojbDSj?=
 =?us-ascii?Q?u8V1jva0CPoTneFty4GPZaTikONo4Ywx4l9gBweEAX36NpB/Neq3zjoJ8ybE?=
 =?us-ascii?Q?+KCFpZ9v8hTzGxT/pzgBbj3OjsTzZOiQwnM7UGLLVnSpk3k9lluszrDj5s6g?=
 =?us-ascii?Q?/48bTQAahyhRWlSsGRcpN78eylrqJrzMOmdqp1dPcyM0icMEbk4qTJ2OcYVI?=
 =?us-ascii?Q?p/ewrCINUMmuv3ky1iY5ryt5D1q5P0sBVM0nCTTIf3oIJPBt77Safp9yXx0c?=
 =?us-ascii?Q?DifUo94Cqf22yizqerzNSw6GGJqwqF9m6nvf73X4mL/SvBBlrifDniPf+jI5?=
 =?us-ascii?Q?taUzUiTwEWswsEujxr5W/78uXIRgbDmzpySZq6NfNQoZPE2mYulsULb/6zFD?=
 =?us-ascii?Q?eUncEXDaHecwI8j7js38G65MihuO8KQUF1LZ8rnLqTzpATy9ITBVhU3iMseu?=
 =?us-ascii?Q?GVfEQd71GLqyoNIPcg1X4oBDaZ4ZsNfxbmDywAdxFnfGmbgojXyBuW7Qk4su?=
 =?us-ascii?Q?8/ofWtg3Nm7gVrL7UP9fihlo0BhSzhalvfLswS9WcMQwQIbaB3GJOgRtgL78?=
 =?us-ascii?Q?VIgiIgnyn5uN0dbtdSO8ogBfQOkQD3KjK0pTO9sVIdO8dSM5BJdW0njjFcIL?=
 =?us-ascii?Q?ymZVz+X8A7C8bRjmGrPvRsZ1yz25ZB1w46ZAyT94srxq1/ipZbjtqOkT+AM+?=
 =?us-ascii?Q?NfCoEKH4pfemmNAJWNEuh0DwtYY0FrOn4BKnXy9BnLmhJXDZuPwh+z015aoy?=
 =?us-ascii?Q?dFy2SL8ZAQ4QFhzaj6fWh4VLCxVio098KSHBkpgmGhkNw2Ah5S5nJb3e/zXH?=
 =?us-ascii?Q?x582WHynWjxdcmwjrKW/VeMYPzFpBipOe42rJkmldTNY8BcWnpm1YrDuYoLQ?=
 =?us-ascii?Q?FOINq1o5Wz1ZFXLswpNy7VN44n0CxBYB2oqvnfsRF9Hz33HkUazPmV6qXyCR?=
 =?us-ascii?Q?8clinqYLh+xG3Hvw4Ay36wT2hYszcDuOdo2JtA7r1l6FKwNEU72qH7jmMXE+?=
 =?us-ascii?Q?A+alDHSA/oaI0mvG+6NUgLug39WJ1g2ZCD0fMuj1OllRNauDR5n/neJPiOwg?=
 =?us-ascii?Q?Yc6dZ1E5gnN4WlD1EqGH7VUBxxORF8m8QyfBPOL1ICJIfltiPyghEW/rwPbK?=
 =?us-ascii?Q?M3wxGOQSaLM+67EY4t1EusChUvco0RQLTxEc1OEj6r8dV/DzmeoBe0kf36bw?=
 =?us-ascii?Q?0Nj1cbC0NzFtjd9s4s/bLFVGPyj2maNYI8klPNEi8jRuDWXSJ1L1klS0Xt1p?=
 =?us-ascii?Q?LwSK1gLdOHeZY73ccFNAVLkHRrHotJEBa3TQD3dV8k2197RMueGZLQ8UTKkB?=
 =?us-ascii?Q?Y4QNXx86F3z5XhDnkfT20BLFWAr/ZD/qVakijSdW0DwcEvZYQDWrWW3MZiax?=
 =?us-ascii?Q?I4PRWFThXkXrpDgWCttEnK11ebDh6lr1NZRxe/a92S1jS59WcwVu+VhF1PhE?=
 =?us-ascii?Q?k4uOtYdD+uZUT1OEYsXWfpa6U9zJXCtzskN1y2ybOsEF/3+qAyqFO+Z6QDEz?=
 =?us-ascii?Q?Xbrgpz6vtsVa/B8L6ZJ8Nh0hiUqefuWx1WIkBiibs4NHC2Xd6mwL?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe4a346-860d-4d1e-298a-08de483b4293
X-MS-Exchange-CrossTenant-AuthSource: PN2P287MB2030.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 07:07:29.1315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KfCzBTfkd7aeGSP6LhAuhEmYhQAi0So3H50fXB/mrn3F0xXWuC+WXBc4QNRocYnlRYakHLGirnc/XVKqWGoEfWFvBuOnPeBo1hBnHm8+YYl+9ResWb9eD/KXXt31wva
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0021

From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

Add bindings for Omnivision OS05B10 sensor.

Add MAINTAINERS entry for Omnivision OS05B10 binding documentation

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
new file mode 100644
index 000000000000..b76771d81851
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS05B10 Image Sensor
+
+maintainers:
+  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+
+description:
+  The OmniVision OS05B10 is a 5MP (2592x1944) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
+  1/2.78" optical format.
+
+properties:
+  compatible:
+    const: ovti,os05b10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital Domain Power Supply (1.2v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@36 {
+            compatible = "ovti,os05b10";
+            reg = <0x36>;
+            clocks = <&os05b10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os05b10_avdd_2v8>;
+            dvdd-supply = <&os05b10_dvdd_1v2>;
+            dovdd-supply = <&os05b10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 663e86eb9ff1..c85915d5d20e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19234,6 +19234,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS05B10 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+
 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
--
2.34.1


