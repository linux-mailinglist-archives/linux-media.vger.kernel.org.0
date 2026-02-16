Return-Path: <linux-media+bounces-52877-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIrnHzIhk2kX1wEAu9opvQ
	(envelope-from <linux-media+bounces-52877-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:52:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D37741442FA
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18AEF303C4CF
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EF730EF95;
	Mon, 16 Feb 2026 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MgO3C3a/"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BD0224B0E
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249835; cv=fail; b=pkbCbwMgnMT/bA1L6RkAVdlEkL40CSLEg7rsFr526xGjrT68vT987quD3vXNS+MIg5dnMuyyRmRr1d1mZzXAyay8wUI3E8BVYEEj7OH5dgV3tNHFMh3dxZgetnAHp+H0V9asJb2emjcBjwXJtuZmKJdhyAgPgl8w4NdcF6YlaaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249835; c=relaxed/simple;
	bh=xx7vJ+6iIISLdguuNbTikf5LnamBBA+CH7nRJ09bJIc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kG7DbQX46LWBzwI0evEZEaMbvkWJZl5q4JMk8fn/ZJsi1AlIqcKwrSI4EhjHAU+dzrgyr5iYO8JPaDqqdE9WlFFbO2ssC1mTgcqsPBk29tIZ2vZJ8Ha/5la701bKaIeK8kEeqFRtIG8pvciFJE8GJlmVn4R0f/FM6s/oSJD8TEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MgO3C3a/; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSjCnKZAtKAK/MpzWZCVoGRbqIFLUCWy9CZMZMdaFwxZ++SdFvWz3o4zdKwTiAhCJcbnTZ9Djrhv/4Ms1nluscongAhoo5GeXGgOCsoiGHprucumEjCodhquAS+QgoFpBQOiW76It+QwO2IgqLlsiv/AXTw50PT+163bAFzHvhn0lFz80tnV7K+w9PRx/eAGp3RtMt+7wDn6BD1Ig+sWK8wluU6VMqFrbs9E/YoOdqV7NM2eibGYLWG1UcWbalkadzGqHTjc0hg+fGhaLCBYuBnM4rarqPqv5Y1ozy+22rFqhna6k2TRIeXjRxWrZPVUUSxWDyIfi6rQJm0MX+u20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VApKqX3ueUdlHDqVA7t/xJZq/rjbNoKCmYWDJazWQ9g=;
 b=tQL8nwwtQmVqFVkgWXvl5netsdOBvX2MS9nfpOgdZ+3CExXdFxCzD7Il0DbH1AYQKcZWgy6nG2yM7w+k7aXPjiMHoxDHFeqvnZMsSAbCcLfpjRZPDThWx4PlJlDDJjp3M/KVrWp0tHbchAxKOY51z/xfPBzkCFQtC/jhBwxYH6VQ+6Vnwp0IslSAFYA41u7+6NUAylGYhQtzo1wfIEVqTO40xAynUarzGLz/BCaf942xzgi2pQx+Oyl4SWHf/N5Du4dHzIUy2QJZjot14rYncBNsuv+Rkz5g1tgZR55JzWcntP9F9PSx2RywpaUXYtsAqyLNtgXIHQx4dKOTkzffOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VApKqX3ueUdlHDqVA7t/xJZq/rjbNoKCmYWDJazWQ9g=;
 b=MgO3C3a/KtEYROR72O6J6k/fVoK+slcvgRpbmdItmPdLsVMxQguBWf9GHOic7Tl+OJy19y3Mo0BHHvA+Ls6FHd5yVV5rdXF9jf4MJbCSSKjtf05DD7lkkQAjvdSQr0TLNqZ8KcKCESaoLuXsb43UD2gkARTFiUSY1LdQjyil512O5Ny4hDM2YFflKf40GI3JUn9pF1VtxfZ8keeCK8pGGDE5gpwfomhP8MhbXKKDKWX+QFKCW+Ri0kIkWfw719x4KL1M5X9igJ5KyOrtYxlo0kFxsed7NSaTaoVjy9uBaokUEecAO8pTA4ipnPYpl38EgzNOiGdUHxZMdqSY+cx/eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB9352.eurprd04.prod.outlook.com (2603:10a6:102:2b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Mon, 16 Feb
 2026 13:50:26 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 13:50:26 +0000
Message-ID: <f1898c37-276f-4e20-98ab-ee8f5f3e686a@nxp.com>
Date: Mon, 16 Feb 2026 15:55:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] media: mc: Don't care about unsettable flags in
 MEDIA_IOC_LINK_SETUP
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-9-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20260211090920.1851141-9-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P309CA0022.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::9) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a522ef-8ce0-4d5a-39ce-08de6d625683
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VmpzTWZDMStFeGpkblNvbXpSSVFwU3pLd3c5STU5Uk16aUJpaFY4Q0tFUmNy?=
 =?utf-8?B?RlVFWk44YmYyTUdYYVpRUzFUNzBEK1lzRVNZQVlZSkQ4cHhlT1QyRWQ2c3l1?=
 =?utf-8?B?YlZjeExyUCtZeFovNEk1cEdtMzlqWW15dFpiam4wMTdXd2RuN01iMXlNeWRa?=
 =?utf-8?B?VjVmVWU2UWRjSzFCb3Y2ZkFUKzBTajVtNUVCRFh6aG16bkEycForR3pPYml4?=
 =?utf-8?B?WjdUbldWZlJyemltdFRqS1Z2NTlYQVZsQVl5NVNhVU9BV2ppdFdnUmlCVUZw?=
 =?utf-8?B?RlpWbHRFUHVxdUFMSHNtRDVIUVVacHpzTW1FTHh0OFBSaG9zY0ZRVmVOci9s?=
 =?utf-8?B?QUM2MzR5QXVaSFRnZzA2VFF4T3F4VWQyS3R1TUxMYUFESlVwak8wanFkQkFs?=
 =?utf-8?B?Z0tkbDd2KzBsYkhUMTlHWm9LMTVOSEVnQ3lnK1E1dkl5Q0ZvNGpGZ2hsQllw?=
 =?utf-8?B?ZGJuU0hJZnJsbWFuS2VXRnRJbDFmYm9mN29nTUxQTHM2Y3Zzc1BweHJBLzht?=
 =?utf-8?B?VWcrQkZSaVBTOUgwVzd3NjdMQ0s2TjY3ejM3NjhzcGNLSmNnTndiTTQzU2xY?=
 =?utf-8?B?VmhJQ1lyL0NMRVhIdDNGRkxTOTRNUVJmWGFhd29RU0VTL3FPZHJHTHlmUnpl?=
 =?utf-8?B?MXlvMnBhYUJoTWIxTGxOMGIyeGZ0cTRGZHFHa01XclNlZUtXVkt1ektwdWVl?=
 =?utf-8?B?YUxWeVFaaldVVzdmbW5kdFhDZ2lJMGRUS1R3bTRkUkhQZVhxNElMbnRUS2FH?=
 =?utf-8?B?U1M1dW5FYW9lanNJRU5XTW01cmlnRHBEbEx3blAwK3VobjVSdnZqc0xhakVS?=
 =?utf-8?B?eUZxaVFaY2VvSk1FOUg5Q0hpSTZlblpuckplS0J2aXFNZTRMUllpUklBb052?=
 =?utf-8?B?SFpzMnY3R2hOcDRVeDNCbWdVVHE0RDBza2tCdEFCSkg3L2hNb1dpbkVOR0Y4?=
 =?utf-8?B?S1FBM0QwVGVSekNiOTJpbmlTenNnZ1Y2SWJqaWN2Q2FnN0ZWcEx6NmQ2RlZq?=
 =?utf-8?B?b0xPdHNxTzF6VGVZV2g0TlJFN3dRclY5cnc4VEZxck9wcnJBL2dhRVpwUFlM?=
 =?utf-8?B?OXBCVGJLZU51aGtXYUwrWGl2dzVFVWs3NS9pTDNybEJES2dMWWhOMGpOTDFs?=
 =?utf-8?B?SUpSRnkwNkhiSzVlZzgvejUxVDFDZEoraEdHZ2xCNStFYWlqNERWTjNTQTNm?=
 =?utf-8?B?STRkSGx2NC9JTmxQaW1hZXNWWDFsQlRiYmlhTmxPOVRBdmZNT213Q1VwOTNH?=
 =?utf-8?B?ZVZyMEtDN2ZuOUc5b2xoUkV0RHYyL1c2QnVUQUtLaHM4YUdGeDZiMmkyeXlD?=
 =?utf-8?B?bkc4eEx1L2F6WDI3Q0JhM2pCQjRLekVLNnV3dzdWZHNOY1l3eWhUM3cwMXda?=
 =?utf-8?B?c0V3QjZ0aEw0SnRhS0w1cDhyaVNvKzFwNUllRDlxV3pyVUMxNGlNNmZOOVRD?=
 =?utf-8?B?MkRINlhqOWJVdGlqaFgrVUx4S3JlQW84bU56ZEZCME50SWRGTEpNTmQ0Qk1I?=
 =?utf-8?B?TS9jVWZqRjVYQ3dYYUJ3NmlEYUlMUWdtcklxQ1VxZXJNaFVlZkJldTg4eUpZ?=
 =?utf-8?B?RDFMRXIxS3YzNUxVMytZenJJRFB0MnpoY0NvU0xsaWc3cnVZQWJaT2x0UTc0?=
 =?utf-8?B?cGRDYjgwVGtuMC9Zd00zUUE0dWNXbnVPS0hXcTRNMnZ6U2gyL0kzbjJ1TVpI?=
 =?utf-8?B?MjVEYjByV0E3cW8zcFdHU2J4Qm5vVTZkU0NIMmpFTndPVjVMSEcwYmZYQ21M?=
 =?utf-8?B?U0hUUUNnMVcwMFhjREdpOVAvNjBHMzR2OVFQelhYSmtDdXg0SXkyQ2JhTXcv?=
 =?utf-8?B?VDF2N0VWa1FMVVJ5MWZMK2djRE9KcmNBUEZCOHhoaCtBYnp2WTBVWFBYUFZQ?=
 =?utf-8?B?REsrVzRaTFNGWmduZk9lUEd0UmdQVno2Qzg2dVdudW90bTRqa3U0N3MwbVYw?=
 =?utf-8?B?RGprWlRrTWFsRGZTWGFWUUUwbktCR1FRTDZ2VTNRNlBBQ2FGdWZDc1F6QXBT?=
 =?utf-8?B?R0wyWkdtdGRjcVY2L29qUi9FS2RsbnlzOVp3L1lvckFtRUI4aElEaG9wVnEx?=
 =?utf-8?B?N0JpZ3FJcVNjbVpOaHVXaWRSU2d4UGNlTUxTRWxPZmJJL0F4VVRhalI5ZVJB?=
 =?utf-8?B?QU5ROGx1ZGYwb1pwb2lCVEthK2NZS2E5b0lIa3ZLb1lHQkZZWVczbHlUSGkw?=
 =?utf-8?Q?kb1gOqI6DmZF0GuIWkR/Umk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Rm8xa3BmaWNnRWhjMVZVQ2RUTzF1TWNwQUYxNGJRZVJUaWp2UFA2c3lEU2Qv?=
 =?utf-8?B?OW5JUk4wRHg4OXltUDN0TndTU0FZZHpqV3Jxa0tXWjQ0WEpGNGw3RktzRHpj?=
 =?utf-8?B?WjJTNGlpRGZOZU5ycW5Zb294dXpub2FCeldnY2dPZ2wxQm5kbWVFREFTWEZJ?=
 =?utf-8?B?R2VFSE9OTXVRcWU3dnFOK0dUMTRKV0QrbWhHRStDVzYrNCtTTndBRGN5YWtl?=
 =?utf-8?B?OFRYeVlYcFJkRTI0UVVXdzBLS0V4MjlubU8rS053eFZCZ2dFRGlNTGpFaFpG?=
 =?utf-8?B?Q2tGWmJkdmVVUnpNZkhyWksvNW84cHdtWk9mNWhzR0lGRkZXeEV5V3RDc09T?=
 =?utf-8?B?aEdoK1ZIN3RCZmtRMjduVytUa1l6bDlJMGlJR3orbUZHemtnejEzR1ZuT1ho?=
 =?utf-8?B?NXRZSVFGZmF4ZHBiVDE1VjVJUmhsdGNQVU5uQUc5YUNGL1lVZXMxSDd3TTJP?=
 =?utf-8?B?U3EwbVpZN254VWZrZXFXajRoaGFhTHdGU29JVmQzUWhyNG1nS2pDUXRBVW9E?=
 =?utf-8?B?UUNxbnFncC9ubmtBZmpIdzVDTVdGQTRkMlNqUHNBaW5oU0U3OUJoN1R2Lzky?=
 =?utf-8?B?amZKcyt4UDdTVW5JcVRnaVFsNGZvQlJSQ1Z0bm9TVmZUYTZwSlo4dU83YzFR?=
 =?utf-8?B?aFBPeHAvRTJ0MXZyTU1XS1V0U0RHM2hKaHJPcjZHei9TQmFUamZ1RUtYWjZq?=
 =?utf-8?B?aDdQRGhqNnN0Q29wekxnc21LZ3IvRUJkejRsaHFpYktzWmpMWG1LZXlpK3JQ?=
 =?utf-8?B?UWFYQ2YxRE9QZVl0clZNWU40Rzk1cGVlT1g3MWExa3lBK09ZZ2M1bUV0SHNH?=
 =?utf-8?B?YmpMamQvaWNSZGw4TjRDaS91VkZRQ2tUdng3ZVREcW0xZk0xTVBJenFCRGxy?=
 =?utf-8?B?ZmdVRFk0R3dXMkdoZ0V6ODRjZDNKSkh6YmU0M1JoRFlLTWloWGpIQlN4QWxO?=
 =?utf-8?B?ZHRSeDlkWUlRUENBdlB5R0owdS83L25sRy9FdVd4WllUNnNxbTFoMmI2eVRC?=
 =?utf-8?B?eGE0bDF1ZlZFRk90Q1dabGJtaUUyQ2NGRWhibitoNEUwTnVzMm5BZjQ5K3ox?=
 =?utf-8?B?Y3dmeEtQajQxQnVHQitxaFpvNnp6Z0k2M1FpQy9BVWJBWUxtVnA4SnVPN09U?=
 =?utf-8?B?eGtucFJPOVI5NjU2SmxzdHdVK3NzMTRBOXdGSFJORXdiTHI5WHhaM1dVOTNI?=
 =?utf-8?B?ZEZYY1A4N09MT1RXTXRkNmlWdm1hdk0rOXZLRkFMYlRsTzErbTU4MklHMHBn?=
 =?utf-8?B?YXNsLzJ5ZGpNVTc1ZG5rTWk4cGt2TENQZkFORTZZUmVnTW8xR2U5K2JPU2xP?=
 =?utf-8?B?UytneE5Tb3BJRGhGYkhNNWJCcEFvaG5wOXJIOG5qcEhUdXFOalFTUHpqM3VP?=
 =?utf-8?B?ZlVDZnJLYkNDUld2R0U1ZXozM2crVHRLcEl3NFpWRXZ2R1E2dXF6YWJNVm1G?=
 =?utf-8?B?ZmtLYlY1a3FSV1hDSzFkZ0ZROWtHb2NhR0JMQ3JyTG5XRHVKRGs3Qy9lWGRm?=
 =?utf-8?B?dTF0dDZCejY2djY3bnphR0FUUDlpeHNWK3Y1NnF4OHJwNlpVQStmQUExQ1hC?=
 =?utf-8?B?aUx1V1l1c3VUcnM4Ukx4TDBEQitwMlRueGVxandvbkk4RmRTTXpBWlJNUkJl?=
 =?utf-8?B?VTlNM1hzRkIwN1NkVnFDM1RwV1RFZFZXbE9URjNsd1FsUWlrZnN6QUd3bVEr?=
 =?utf-8?B?T0ZhMEVkZlVUR01FbW5IMTE4eHU5bDdzY1BDQ0tpbDgyVTlZd2lURjU0VDVE?=
 =?utf-8?B?MS9hVzR6U1RFM2duRXc0YUt5ZG43WkNGcGpvVGxxVG1icXNzMDhmZVNaWEQ3?=
 =?utf-8?B?Vld4NFJ0Njk5dXZtVUV1QU1POGs0VEFPL2VkRmVkakxEVTNLZTM5OS80eWxN?=
 =?utf-8?B?ZmN5VVZ5dzMrR1g4MlZhOFR0WUxQUDlQU1YwSURTMGpzUlBQbW1DOHZrUTNq?=
 =?utf-8?B?YmlUemhHcDBicGJLODdnUm1lUHgwdjUzMlNGTWRjdmJaZjFYeXVueUE3OTRM?=
 =?utf-8?B?eDlXMW9yU21mYTBDWVFQS1lWaUN0aVREUWtzTGhYdzFoMitMQmI5MThzK0lo?=
 =?utf-8?B?cjcyTHk4ZFEzZlJ4SEFhMkJxcmtZaFpQaWpjMDc1S2UwR0FiNXQ0TGg2WWRD?=
 =?utf-8?B?bGo2Yk1LUEg0OXdvK0VmRi9tVE02R3pnbndhZHhnM0VMRkxQb2VBdk1iUE1J?=
 =?utf-8?B?cjZZa0lZenJKUXBnK0ZDOUJXTnRMWjNnVHNQMjNZcGozS0t4RU1ISmVPTUVH?=
 =?utf-8?B?VjZ1YTNVQW03bTBFb2FCenpIVHoraUdQekxSZDk0MDVJeGFHSENpSjlOcFda?=
 =?utf-8?B?L3BWZXVmcVZvQzhXVWRaQUNNWkFnT3Y1NGVMTGlpZ1lKQXhpS0Mwdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a522ef-8ce0-4d5a-39ce-08de6d625683
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 13:50:26.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pk8vKvwVenn4dKRUAn3mJr4YGFGR89roecyULtFs8FhM5Wpdw24Q6WI7+oUKl+ceiClQehG/0qCXX1SeuUjVkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9352
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52877-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Queue-Id: D37741442FA
X-Rspamd-Action: no action

Hi Sakari,

On 2/11/26 11:09, Sakari Ailus wrote:
> The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
> flags that are set by the driver are correctly set as the driver expect.
expect->expects
> This poses a problem for adding new flags as programs could not work with
> links that have unknown flags even when the use of these flags wouldn't
> affect the program.
>
> Ignore the non-settable link flags.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/mc/mc-entity.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index b29b519237d6..cf72bfb8885c 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1378,7 +1378,7 @@ static int __media_entity_setup_link_notify(struct media_link *link, u32 flags)
>
>   int __media_entity_setup_link(struct media_link *link, u32 flags)
>   {
> -       const u32 mask = MEDIA_LNK_FL_ENABLED;
> +       const u32 settable_flags = MEDIA_LNK_FL_ENABLED;
>          struct media_device *mdev;
>          struct media_pad *source, *sink;
>          int ret = -EBUSY;
> @@ -1386,10 +1386,6 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
>          if (link == NULL)
>                  return -EINVAL;
>
> -       /* The non-modifiable link flags must not be modified. */
> -       if ((link->flags & ~mask) != (flags & ~mask))
> -               return -EINVAL;
> -
>          if (link->flags & MEDIA_LNK_FL_IMMUTABLE)
>                  return link->flags == flags ? 0 : -EINVAL;
>
> @@ -1403,6 +1399,10 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
>              (media_pad_is_streaming(source) || media_pad_is_streaming(sink)))
>                  return -EBUSY;
>
> +       /* Only allow changing user-settable flags. */
> +       flags &= settable_flags;
> +       flags |= link->flags & ~settable_flags;
> +

The immutable check now compares before filtering, previously this was 
after the filtering. Is this change intentional?

Regards,

Mirela

>          mdev = source->graph_obj.mdev;
>
>          if (mdev->ops && mdev->ops->link_notify) {
> --
> 2.47.3
>

