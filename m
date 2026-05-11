Return-Path: <linux-media+bounces-61170-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD5wIGsqAmp0ogEAu9opvQ
	(envelope-from <linux-media+bounces-61170-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 21:13:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BC2514E27
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 21:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B29233035271
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3164C9562;
	Mon, 11 May 2026 19:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WwjaWUd6"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013004.outbound.protection.outlook.com [52.101.83.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FB04ADD85
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 19:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526769; cv=fail; b=PdW4iVblMk9AhG+C47z9EhNjNxFf7XGUZFQDUnTgxzmZickqsz453LeQmHhQM2Vrf6icuba+IOb68PHKCrAwzORF0ULLhChTK9TsEr4xAKbLk8ty75iYwIGNQ7ZSjV3si4gJiuRVA7ENQG6CtOJ1wFPOxe3TauPDVpUKQb93MSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526769; c=relaxed/simple;
	bh=01vRPGEmg+Sv3R1sls49knERp9mzPT4ggJBdek52nP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F6BSoyDsh2fhON0o+PSI6mG8QTLB0N9FX+ULBE+RejMYywGlZvUyRYTkrSBvxUtskbbE8pIesp9ABp44VIbTpcXDeKsMMgvPvFbdBOUHJF/vFg6ay/MEp9qJoirs2wMI4O3x7bnjN6MBLGiME5rhOcP1BrGjXxzgL1dGM4EtvQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WwjaWUd6 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBf49wd7DjyjI2ziL9Db5V6IHJqED7xqkIA/GYB2Oasj+OkKdiZMwJoAEjRY2/bms3C2iHydKPejEopYz+Krhc0etCIPvmz8+lRCJmu/0RsauA5toZaiqadYWlnAySUTRMeusl5If7QOTFQ6upeadxE5S9jFTLpJF++6Ue1a3hF9y1hhKjW7WaE6tNZDaXhXiZ1ozWlriNuN61jzgWw/VU1lJVmfwQTDbXBci1evrR6ppgRU+00L61tlvLPmuIQtq1NfFqfBew/qW8yYtmMJe0nmgjDH/fYMftMXmafDjdVhsI4rE3xULCHqdFSJcbPA+ygpcXsBjmCYrlBIdsI9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6fO3v8I9uYs6jcLhlZu0x7lrIHi2GxufclGsuNZ3Y4=;
 b=iUxwE70IgO81MO7GF8kYIDe5Lr6Jswf2HZ+bu2rZoHGuizcESIV74jgd0vC40m4zl33Sf6e7apAyS+PF8mgsFF9ucQiWmX1HeYmmAYWsorvRlbRwGiJOUfGaz3HxSb6HI3l7WrkYED5hfN5CD2QlRFaQviuMov0e6+UMjBbN+Z8SJyOeKoKKy3dQefAFSbWnvTzAXkv4ALexPpbN5YFS6ggzjtggKWNcMgJJRncw1lWRGvnVhRhhOFpe8ckJHtXDvX6nwSFeQXCLHfQpqszr3Rn5gavcxZ/4Cp0T//LS2x8GKlxhqjvdjPfSp0TSqhkuNTKwo/iLrRNUFPSaNAtvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6fO3v8I9uYs6jcLhlZu0x7lrIHi2GxufclGsuNZ3Y4=;
 b=WwjaWUd6qm1hDsWSM3gdiFgMQ26F9VxwZrKRZNeM1mGTBuzZqkZVEWAyR9krdnh8oisFUk5tIudFFfhxDX85xgZcOBSnDlE7VsqKsHjpXN6aI2b+RJjN+6ef5flSFh1h35MYdkrhrmIB9GG1tghSoVP1ZAcaARfIMjvtrgS9W3oJPzqLDrxVA1gf76yhWewqcwvtkw3qXmqtDRN4EqrqwTaj0zEBLilcVT/8HhBF7xonC4RtIS0XAdJJecd/TuilfOvCHzO02W9u7GtUuzEymJxmlJSP4bglq9HBEWVNfH0SAFGna0MN3JxH3GjPm4/+/GTnEJFwrz0revYAi0imyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9552.eurprd04.prod.outlook.com (2603:10a6:20b:4fb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 19:12:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 19:12:41 +0000
Date: Mon, 11 May 2026 15:12:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans de Goede <hansg@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Brandon Brnich <b-brnich@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>,
	Michael Riesch <michael.riesch@collabora.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Padhi, Beleswar" <b-padhi@ti.com>,
	"Donadkar, Rishikesh" <r-donadkar@ti.com>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Daniel Stone <daniel@fooishbar.org>,
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [ANNv5] Media Summit on May 26th in Nice, France
Message-ID: <agIqHTRBVn3hQV53@lizhi-Precision-Tower-5810>
References: <8c0fe854-145e-46d6-83b2-180e495fde95@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c0fe854-145e-46d6-83b2-180e495fde95@kernel.org>
X-ClientProxiedBy: SA1P222CA0194.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9552:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f40b7b-be02-4f82-ab34-08deaf9145cb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7416014|38350700014|11063799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 x76CGaLPlEt4Z+2ZhMqHI3con71uXWC1XQXX/7nF0eVXPdih/5uEPQVCl6iy+FuhliTZY3AG0ltfgoyox3GIk/U/PL3o69ztjK1GJWpIK3JBirzLgG/jPVJ7VhX5rDRNoDjRjmpWaZ7SASoFXE7I2VdO45ohEsDYMUkRKONuBmevWYSZ3zON+i7wPDYjpCSEcS3xKSCZiW/0d39h42veXP0GUD0J8+0onbtujtUbRnhsuiAqoul+3eDTDC11MWis9uBRZOB9ZAGTTViDSixdfnSA8c6FwyAm86tDIv+N5u2gKTFeHKzRiUCusMkkpF8IX8SZlcSbt043wngi3ocgkW2fSJ9KydImIAAIHixzvwIqnLxa7zXvORT4mGoj9nC63KYkm5NLkFTFO8DGBjED72WcnSRGGEZq+yQra4MN49sf5ICQXhq8oFoyb7Pun3+HfmjGXqOEeRKTKwkcu1XrxvEZCzFS6dV9SUo3zg/nQpZySkoeMmZyetxzB4MTklI1TaHGyVSnmHeUDf0hApK1OENxW7YNa70KBk0XgpZcGBIxr10he4hQnFZZ46sKP68mUJl/9vpVJ8JtKsuZclc3ymHwtWi7qPz3WtI4V49sUn1slfjSA9yucuK9KtQMIZvOrTMNxbAgzPBfZ/IxlhvNKD+caOLMfxutK7h+DgMgfg7y0LeY8GdLgyZ1YNCLUFiizfkOCCj1VaiEXvL5zOEmGQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7416014)(38350700014)(11063799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?iso-8859-1?Q?tzbNtiC/++RUGrkmqi5vsXzdoPkJhJdrzw3yk6eM19KXcyJOSQ3DBLfoTR?=
 =?iso-8859-1?Q?OLOOI/zNP9/mNmKCxebokl1EudHg+1sMzrK5UL/IXeUMFb16ow9n25X6iH?=
 =?iso-8859-1?Q?usr3hZXSpbI4wDn+OpFA7BWP0u7+6J9bxsglh0fdViPx4SLHGEklkObO+M?=
 =?iso-8859-1?Q?238oOZYOGsy8qmTI/ns5JHoGvNKbZV66WI6jqLgaX8mwhz7u6PHKnrZ4Kz?=
 =?iso-8859-1?Q?DPQWZQzj2ALDimvafjlKOBrCWZtjbte6p89vbaziKeV3wTDNsp7ssqY3l7?=
 =?iso-8859-1?Q?hx53o+48vYgzd6ZlcO+Zi4gyuT6xYaK6xVb0I148yiEYIiI6P96FCM4cjK?=
 =?iso-8859-1?Q?zDogT8vVJqoACIKlaDvjBJ4q7kcv0Ka7TTw+0K2AaLZNn+C2/QHnXFSF0f?=
 =?iso-8859-1?Q?J7esMQset8YG6ZN/enxhbkiproBIhPaF0oDR9R4AhkkfSZkGAiPMrC7cnt?=
 =?iso-8859-1?Q?JonPxMm4niwf/MAIJIL1EOgPV0Px2T3M/FjoK4SFmr7UKnXwmUT7QoHwZA?=
 =?iso-8859-1?Q?nVNxOmB7TZpNDkQdK3IvDS7ULsGZOhSXQOVeuTzPVLa2GE99JKRHhng1w2?=
 =?iso-8859-1?Q?s04glG+wqdzTW8vTkWeG8UDT9VZoht0Qt83b79KFDz96/8HPxqNUzpoAjp?=
 =?iso-8859-1?Q?PfoEAoExfZY4Vb8YpnNixJ6J2EUhId0o3ZwolbHrYUkPof0GrNvFfUqR3Y?=
 =?iso-8859-1?Q?dZilRQ1Lsf0vN/nXBbw+aFHmif0GL0EqjcC12oUkZokSE62iM7zC/6kbg/?=
 =?iso-8859-1?Q?CAAk1ILu/tBLWcbHPmn01RVFwVd6zulpZDSNJB+WP0Bc3QDPXJQO68zeHx?=
 =?iso-8859-1?Q?UO73L/JjQWqhFpGRGyfODQyM90MwYbFLIeelUD6s19sBU2NJJ/lLjpTsms?=
 =?iso-8859-1?Q?JJWuOlatQTks6QVBkBsaHE22tMk/zViSG0DQPsERSITXNsNo5asWqjG3YW?=
 =?iso-8859-1?Q?NFfjmaC56potXfNI6q04ndivwURrfg7E3x17065MHW7IDQNWu/D/Pg95xI?=
 =?iso-8859-1?Q?pm2mOMvn/WoDhjs+/cXCedQG1/qNAUmI00NjVLauWXUOypsvINtsQc5QvC?=
 =?iso-8859-1?Q?uN6rOyPSbLkdu4H+Jo8PXCp86QS7z9+FCiqlk2NS5NzdNlv7fGm+nqrmjI?=
 =?iso-8859-1?Q?Nf8jUFL44QuEVZVbzULiqnXmymZKh2367zC/epPP5NaMYSn8VKDOglR51j?=
 =?iso-8859-1?Q?tFnUzLiaLk274+9kOsaK6LjSXIRYZjLwEnphhoBl9dgQBlSqBiUzZGnWZe?=
 =?iso-8859-1?Q?/X76syZ9mDXoUE49FTdsa4k16ToUR4obabEUZkqY211JH+6zfKufKECbHU?=
 =?iso-8859-1?Q?O7CycFlFIND2/jT+OXzvxiQ6O4Lnc9Afu/MyDopBMik3hN2rDe7VK6a3sd?=
 =?iso-8859-1?Q?Q+9qdjB9Z2PHeCj/KJ1BCjN5xA3pV7TX8pMT/HSiIr1zkZEYoBL221TIT+?=
 =?iso-8859-1?Q?jFybB1GhQw8qOyInU7B0yZ/3uHC49U5U1WIvhwSUPP1O6EQpkA1BOvj5gu?=
 =?iso-8859-1?Q?gHIYqNb5nZVD7iQJ1Mi85O82aV4JAfypE0/l4kebbuyJ0ug2KyIISu1XrQ?=
 =?iso-8859-1?Q?bmfhjiHzoewOA/XNeCw0wgAEAac3HY30x81ZePmvrzVO1Ispf+DF1THhcR?=
 =?iso-8859-1?Q?9b6KRTE8UpJRfdj/PS3pfuh0GXkEttniLV4A6vDonjUN7GaZkVoTHCoJVs?=
 =?iso-8859-1?Q?N+rYgMR6FDtaiIhBUXe1SnaiTbf8mlvmSlgEweyUe9ro2V5ahkGhMIhUSW?=
 =?iso-8859-1?Q?jF0kO4y8gVcsQEo/reSbswAudffi1CwpOdrUO+8JYzU8UPg6oMbSx451Ff?=
 =?iso-8859-1?Q?oANxdQlaaA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f40b7b-be02-4f82-ab34-08deaf9145cb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 19:12:41.2601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftlUgwwo01GZSZPbHUeMm3kdOfofsmQn9ATueH35+8VSXkDdwtm+rzV5eRx+gU0DAwitdcg/OPPmtrBlCYGN4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9552
X-Rspamd-Queue-Id: F3BC2514E27
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[nxp.com:s=selector1];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61170-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:-];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,ideasonboard.com,mess.org,linux.intel.com,chromium.org,collabora.com,ragnatech.se,foss.st.com,linaro.org,raspberrypi.com,pengutronix.de,baylibre.com,sys-base.io,ti.com,oss.qualcomm.com,chipsnmedia.com,gmail.com,fooishbar.org];
	NEURAL_HAM(-0.00)[-0.920];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, Apr 29, 2026 at 08:24:23AM +0200, Hans Verkuil wrote:
> (Please pass this on to anyone you think might be interested in this!)
>
> Hi all,
>
> This is the fifth version of this announcement, updating the list of attendees
> and the tentative agenda at the end: please let me know if you see mistakes.
>
> This year's Media Summit will be held on Tuesday May 26th the day before the
> Embedded Recipes Conference in Nice, France:
>
> https://embedded-recipes.org/2026/
>
> The Media Summit will be held at Hotel Campanile and in the same meeting room
> as last year (Nikaia):
>
> https://nice-aeroport.campanile.com/en-us/
>
> It is close to the Airport and to the Embedded Recipes venue.
>
> The meeting room can hold up to 30 people and I will provide video conferencing support,
> just like last year. The location and the meeting room was quite nice last year, so
> I saw no need to change it.
>
> That said, in-person participation is very much preferred. This yearly summit is meant
> for active media developers to meet face-to-face and to discuss media subsystem issues.
>
> And it is also a good opportunity to talk to each other during the Embedded Recipes
> conference to discuss topics in a smaller group. But if you are an active media developer
> and are really not able to attend in person, then remote participation is an option.
>
> If you want to attend the meeting (either in person or remote), then send an email to me
> directly. The deadline for in-person attendance is May 14 as the hotel needs to know the
> final number of attendees by then.

Thanks, I will join in-person.

Frank Li

>
> There is no registration fee, the meeting room is sponsored by Cisco and Collabora, and
> the lunch is sponsored by Ideas on Board! Many thanks to our sponsors, it's very much
> appreciated.
>
> If you have a topic that you want to discuss, just 'Reply All' to this announcement
> and give the topic title, a short description and a guesstimate of the time you need
> for your topic.
>
> See last year's Media Summit Report as an example of what to expect:
>
> https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad089298d@jjverkuil.nl/
>
> Regards,
>
> 	Hans
>
> PS: Be aware that May 24 and 25 are public holidays in France. So many shops may be
> closed those days.
>
> In-person attendees:
> Sakari Ailus <sakari.ailus@linux.intel.com>
> Kieran Bingham <kieran.bingham@ideasonboard.com>
> Brandon Brnich <b-brnich@ti.com>
> Rouven Czerwinski <rouven.czerwinski@linaro.org>
> Mehdi Djait <mehdi.djait@linux.intel.com>
> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Marco Felsch <m.felsch@pengutronix.de>
> Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Paul Kocialkowski <paulk@sys-base.io>
> Jai Luthra <jai.luthra@ideasonboard.com>
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Beleswar Padhi <b-padhi@ti.com>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Loic Poulain <loic.poulain@oss.qualcomm.com>
> Sven Püschel <s.pueschel@pengutronix.de>
> Ricardo Ribalda <ribalda@chromium.org>
> Michael Riesch <michael.riesch@collabora.com>
> Daniel Stone <daniel@fooishbar.org> (Collabora)
> Devarsh Thakkar <devarsht@ti.com>
> Michael Tretter <m.tretter@pengutronix.de>
> Suresh Vankadara <svankada@qti.qualcomm.com>
> Hans Verkuil <hverkuil@kernel.org> (Cisco)
>
> Waiting List (In-person if space, otherwise remote. Decision will be made mid-May):
> Robert Mader <robert.mader@collabora.com>
> Satish Babu Patakokila <spatakok@qti.qualcomm.com>
>
> Remote attendees:
> Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Mauro Carvalho Chehab <mchehab@kernel.org>
> Rishikesh Donadkar <r-donadkar@ti.com>
> Jackson Lee <jackson.lee@chipsnmedia.com>
> Jose A. Perez de Azpillaga <azpijr@gmail.com>
> Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
>
> Agenda (tentative):
>
> 8:45-9:20: Arrive, settle in
>
> 9:20-9:30: Short intro (Hans Verkuil)
>
> 9:30-9:45: Status of ISP support in V4L2
> 	Presenter: Laurent Pinchart
> 	Description: Summary of ISP-related development in V4L2 since the last
> 	Linux Media Summit. This includes a brief overview of technical
> 	developments, and a summary of the efforts to engage with vendors.
>
> 9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Update
> 	Presenter: Paul Kocialkowski
> 	Description: An update on the ongonig work to support stateless codecs in V4L2.
> 	Some of the remaining open topics will be presented and discussed.
>
> 10:45-11:00: break
>
> 11:00-11:30: Vulkan Video Codecs
> 	Presenter: Nicolas Dufresne
> 	Description: Vulkan video codecs: what are the viable options for Linux Media
> 	and what is in preparation outside of our subsystem. The second aspect is
> 	informative as these discussions don't seem to lean toward our subsystem as the
> 	foundation. But I think it's rather useful for everyone to understand why and
> 	what is included.
>
> 11:30-12:00: Protected Video playback on i.MX8MQ
> 	Presenter: Rouven Czerwinski
> 	Description: Introduction to protected video playback
> 	on i.MX8MQ and missing bits for linux-media & protected heap interoperability.
>
> 12:00-13:30: Lunch
>
> 13:30-14:00: HDCP support for HDMI receivers
> 	Presenter: Hans Verkuil
> 	Description: I have been working on adding HDCP support for HDMI receivers.
> 	Specifically the HDCP negotiation between sources and sinks.
>
> 14:00-14:45: Common raw sensor model, streams, metadata and metadata series status
> 	Presenter: Sakari Ailus
> 	Description: The Common Raw Sensor Model defines a new UAPI for camera
> 	sensors in Linux. It provides a more useful UAPI for configuring camera
> 	sensors than the existing practice is. The metadata series includes the
> 	Common Raw Sensor Model and a number of other improvements, such as generic
> 	raw formats, metadata support and finally enabling the streams uAPI.
>
> 14:45-15:15: AI patches
> 	Presenter: Sakari Ailus
> 	Description: What is our policy w.r.t. AI generated patches?
>
> 15:15-15:30: Break
>
> 15:30-15:45: A case for a media-job scheduler
> 	Presenter: Jacopo Mondi
> 	Description: Dan has proposed last year a framework for scheduling operations
> 	across multiple drivers that compose a capture pipeline:
>
> 	https://www.spinics.net/lists/linux-media/msg279502.html
>
> 	To better clarify why this is useful, I would like to discuss and
> 	describe a practical use case based around the Mali-C55 ISP as
> 	integrated in the Renesas RZ/V2H(P) SoC.
>
> 15:45-16:15: The Butterfly Effect or How Support for Complex Hardware may affect the uAPI
> 	Presenter: Michael Riesch
> 	Description: Video capture and camera hardware in recent SoCs is exceedingly complex
> 	and the assumption that there is one central V4L2 driver that registers
> 	the media device does not necessarily hold anymore. IMHO we need a
> 	central media device to rule them all and adaptations to the
> 	v4l2_{async,device}_register_subdev code.
> 	 - Dynamic (de)registration of media entities is desired
> 	 - This requires considerations about the uAPI
> 	 - There is significant overlap with the notion of fault-tolerant V4L2
> 	 - There is also a ton of cleanup work, but the resulting patches must
> 	   not break anything existing
> 	 - So we need to talk about possible migration strategies in order to
> 	   achieve reasonable progress without interfering too much with
> 	   existing and working parts
>
> 16:15-16:45 Overview of Media CI: where do pipelines run?
> 	Presenter: Ricardo Ribalda
> 	Description: How are jobs in pipelines assigned? How does the infrastructure
> 	for Media CI work? Are there things that can be tweaked to make it more
> 	reliable?
>
> 16:45-17:30: Discussion of the media subsystem development process
> 	Presenter: Hans Verkuil
> 	Description: Review of the multi-committer model: current status and next steps.
> 	Are there any bottlenecks, any ideas for improvements, w.r.t. the development process?

