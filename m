Return-Path: <linux-media+bounces-52827-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN+uKNXakWlpnQEAu9opvQ
	(envelope-from <linux-media+bounces-52827-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:40:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E76C13EE2A
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 148F4301052A
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 14:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3995D2DE70C;
	Sun, 15 Feb 2026 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L2Tj5LJm"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013063.outbound.protection.outlook.com [52.101.72.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDBA2DC783
	for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771166406; cv=fail; b=JEh/5VeSFHf0DIMs5Nwdp1ItJZMTpD+ZEFbUXGH5ixRQ2fs+lXnGh3rU+6pj2JxgbHNeggGTdItOilChfpA1vbwnmLDiQGXzjKz2QgOFWVll4GjQ85SE4IXOw8/sdDjpEBCIvj626T2hKtbzNit3oaiuoNmaQfS4dZof1lv/OkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771166406; c=relaxed/simple;
	bh=afYckKynCIUdAs0qTGZVu834Ou24lVncY/WbHMi4cCI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bFM7gn5qVSaVCy1k7M/gou7eozYKpHFIbQ/HoSoDadEB0Cie7uysmgds1GwuEC3W//aCL3nOGGg4JEC95p7FcNBPA1FDpOACo7Bv3CeWYiNBU8oxxZrteKqFSHH/LISHy+yRFQ99a/FeN4rf2kGkHALxxmFqcOd4cCElSf+JSEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L2Tj5LJm; arc=fail smtp.client-ip=52.101.72.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgmGAkLQuUg2bJZASEDcLvbaIfIiIAA7XP4gVWRibCnLI+oECdZe6zf4bGdnCHqsKuEODfAl/TkIFVnp7VWHHVIq0Frxe3lrG6CSi/wWGM9zyQtNl2rzWnttzXjAu2Brs+t9d8aARnmw0UaINpSn620aQcPW+dbjzDtiS7fij11tGNNK2zYpBXQeOsboL02oWlqEL9fgckG9uf2nN0dx26wYAC7wwt68MGp6wOtsZkDEpzmSBqqBoL9mWSgP7uAcfGXby4V8i9jAHVHPg0oOVPqEcBJbVjukXAFMEayu7PvdxG5yLEeWRvOdCHcaGRxTfE2RWWr/szdhyGcRlxcVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLxO6mwTUneOl96BGhq2Rj0n5LYFCUculizNNnN0SOU=;
 b=R6CIh57Ea50WNVeiZOLV2l7jaQISbwekNDVUB/Ey0zpIZ4otqfiBQGyqIN/sN4TcnU3zphVIFhXiwIJq00xkcosMIEt7fBiMg+ESE+kaeV58j/2MUc75ZFH5M+kYQxRdeWPGhhl6z3tGFIzuuzeHH9MOEmxLO3qjzpTGCPsCy9sAw0jZI4HraT4cV5D1LalxYKK53b5ZArmi6qeHdb6KPS1beYzyN9OasK3ckko8N0ZAvWnzFDkcYsqywolMaiium5KLQ644u2/aZpbhs8mCxyJwTDuMGAGT3j4/ojcHjelzLTh8xFLfpT2+ytjLcuHhk3xL+jClt78z3gFKrwVlSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLxO6mwTUneOl96BGhq2Rj0n5LYFCUculizNNnN0SOU=;
 b=L2Tj5LJmiK+agLUn4nkl9x0uAo8KKm1gga6yyccApYQO0lzwWn7j06m/OtdArPAL9xZuDVmpFrbySZpKmJEssEXb/EMpTzI/fQ8ng+0pzls8qyspue0nOuWK1H3Yyt6mTNUMUpz7LyUUL0pYsi7Mx5M2Dvhjqk3vCGg6+sUH+dp3WibVlaVSM6PuyzQ419Adp4ynX0BIEolIwRXS4DqoDd/Xl0QTy0fIceD4HAuy40EHBsh0qlhOuonryUuDh2NUEMevtOEvQa8mRl/VblGxRaquBYEFScDuJvENWT/zTTt1EEq/8rtkkWKc6gnf0ujMhtW6cZjb9MeDaK/jZi4U1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GV2PR04MB11861.eurprd04.prod.outlook.com (2603:10a6:150:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Sun, 15 Feb
 2026 14:40:01 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.20.9587.017; Sun, 15 Feb 2026
 14:40:01 +0000
Message-ID: <81e543df-a188-4c2b-a24a-b599b27b3954@nxp.com>
Date: Sun, 15 Feb 2026 16:39:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] media: v4l2-subdev: Refactor returning routes
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
 <20260211090920.1851141-6-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20260211090920.1851141-6-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR08CA0011.eurprd08.prod.outlook.com
 (2603:10a6:803:104::24) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|GV2PR04MB11861:EE_
X-MS-Office365-Filtering-Correlation-Id: 67740841-487a-445a-2b2b-08de6ca019a1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bG1XbmhoME9WRzZoUXlKNmhsQzB3Rk9ncXZIN0xQVjFkajRjQWY4ODhMUFZ5?=
 =?utf-8?B?Y2Z1dnZHb21WVFhnN0pwR0FjSFR2eTM0YUxxaFBmN2NXN3RmTlJQb2JwVlNX?=
 =?utf-8?B?RHIxaUIySUxoVjFVallxZ3JUZGFSSU90ZXJGTHFxTkg1UHJRSUh2TzhhWHRG?=
 =?utf-8?B?QWlodmUxMTZORmNTMzhtL21kVmVaOHpGdm9USVNiOFJaRlQ2cGpBbnhtSWRR?=
 =?utf-8?B?d3JyQ08vN1RuY1o1NC8waEdhVW1ETWQyOGI2enVyby9mM0lBRXBjZS80YmRX?=
 =?utf-8?B?S25YRHBxMlU2d3Q2czVQV3RteWwyaHZFbVdVTmJoaUdlMFcvektNamhHOWJa?=
 =?utf-8?B?OEJVY0FCRHhwMVFyc3gzRksrZXlGSmJMZWhyZFpkVHZ0YW0zbVRUYTAxb0ZM?=
 =?utf-8?B?WHQ1SWphakVJcDBsVGIwNU1TZWsvK2c2aGRzdkE3MXF6K3FXbEIzSGNscUMy?=
 =?utf-8?B?V0ZsSGN4bk1IYXgxQmdKVGw5Ym9zMExka1V2MjhVWEVpT25LU1pkS25DeW5h?=
 =?utf-8?B?alFKQ3BReGZybHRpT3NYV3JVWk1ObHpIRUl3d291encyWnpiS3U0ZndYZVVG?=
 =?utf-8?B?YUJIc3dXbXpjUVVscnhUZDhPb1VGYjJRT2pKaTFpbGtHTW15dmpzcXhHOGRD?=
 =?utf-8?B?UjZEOTVWbXBSZUJYL1Z4cGtOOXdSeWlteTZtN0d4cFdvNnFIaXhpM0cweFVv?=
 =?utf-8?B?L1NwLzg2REwzKzhIL0N4TXZGdk43dGJQbVJVSFFud3JDV1Rtem5MZ1d3ckIw?=
 =?utf-8?B?T3B1aVo2TjhnLytiTnovVHNabDNhZWQxKzlNS0dOTzlrTUJGNEE3b0VBRjFD?=
 =?utf-8?B?Y1plS25mT29FZnhVSHJ4Q25UdmliWmdUMUV1TytWYkd4NUwxZlBmVHAwS3ZD?=
 =?utf-8?B?UjVYUm9IQ0czWVVVazF3VlJGZ0dIZ2tzNS9Xd3FpUmtpSVFtYTVWbDc0aWlH?=
 =?utf-8?B?YzUxR3c4a0doRk1rajNhdXZhdWhic0V1WEM3N1JaUHkxNHJ0S0x4Z2J3MjhB?=
 =?utf-8?B?ZDhqWU16OFVGWWVhVVF1WHhSdjArTFZTTnlvSGV4NkUrbVlOT3B0VTFRMFEz?=
 =?utf-8?B?SmducGJxb3JHc1VGL2IrNTRycDV1dUhDVFRCSzdNQUd0NWNKRXJSRm41eExW?=
 =?utf-8?B?cVFBTlRUdFF1U1NQWnZYcS9KdVhiOG0vcnpGOElLaHIxU0NBTkRUVjdjNkhz?=
 =?utf-8?B?Ri9WSi94U2VjbXUxU0VFeWtQeURURVFReGhQQ0FYbGM2U0wxTzFCVTlkQTJo?=
 =?utf-8?B?VTBYZ1pBN01YekZuOFlKM0V0ZkZvK3JBalJzR1hjejdmZHRZU21tbkZnTHRr?=
 =?utf-8?B?VW9sNlpQaEoyb1lDdTRBdThJL1dXUlp3L25vTE1YMVlhTkRzcDZKR2JjeXBR?=
 =?utf-8?B?SGJFakZLT1hDbkYrY3NMeWdCZUtFTWI0NjhuZUJqeEgzWm4xYjdzZ2xJV2ZL?=
 =?utf-8?B?bzZ3UkNwS1hPQysyc1orSGpVc3oyNU1vQzk3WW1UQUtLTysyenc1ZTcxYlpl?=
 =?utf-8?B?d21jKzdHV2lpc3Y3YnQ0MnFJNHFpZjVaZGkvVE9QNGQ0UldBWmdod0VRQlpJ?=
 =?utf-8?B?UjZ1dGV5ajRZWmFGR2Y5MFBvbFRSUFVYdmRqeXVLV1NGbTM5Q2hyTGlGcm1r?=
 =?utf-8?B?ekVVL1BqOXVhbnF3WllQS3E4VWErMVRaSmxQTWtlWDdybVdoZ3cxa2FqckxP?=
 =?utf-8?B?cHNQUmk3NWtLMCtYNnlHQjJYWkVVV08vbUdtOXpDQkkxcVdhaW1VL3N3RFFi?=
 =?utf-8?B?dkJOMEptSEhzZ09iNUFlWk16a0gyTDhlenIwNG5pZjlzTHo1cjNTdnhObHZa?=
 =?utf-8?B?SFlYaWM4TU9WVEZ1bkZORnN0VVA4OTVvWFRPUGRSMmRpV2tNaC9WV1BkT1c3?=
 =?utf-8?B?SWI4VjRsaytzVjY2bEZlKzNMRGRVdDQrTU5GbmFRNFFjM3VkMkxUZDBQbWNR?=
 =?utf-8?B?TkN6VE45ekUxMGVCeEhQbWRSU2Zndi9TWGp4TWtFSTYvcVJDL1NUM1F6Vi9S?=
 =?utf-8?B?anV2bGd1QTEwU2tLdVFRRzdXSGhyZmhBL1h0QmhvMGNTdURoKzBrUFFLRlJx?=
 =?utf-8?B?RUorT2RGNUdiN3o5UmM4ekZ6U2Q4RVVrTy9YLzdZSDd5MHZTU3RZNGRKZllQ?=
 =?utf-8?B?RWxabTgzRG1iczVrWC9QYW1Sci9XRzhIVlJNWmh2VzY3WXRWbjBCazNrdjZU?=
 =?utf-8?Q?8j9g47PpgFCs/sBQapIT82c=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?czF5aEpMYmxqYWNmT2FMU0gvSFdVTUY5WWlYdVl0cWVhcEtuTWx4enBVSjRy?=
 =?utf-8?B?S0krc05lMGdCYkxyVytNbmpCRmRBdVdXTHV1K1JQWWxmSk1OdktOT2FFcjJF?=
 =?utf-8?B?T0gyWmxEVFlKanJ1cmpLVlBScVJKc2JZeURZeWRKVFdxUHZ5UXVjVGNIS1BG?=
 =?utf-8?B?SENxbU5WL2RreXFWYUcxb3lOdm1mUmp3T21BUXg2N2NQaE1kSEZkYk1qN3d6?=
 =?utf-8?B?MW1JakYvd21wdlNqSG05RUNab0Q1cVhTRS9GNHdUb2t0SE1MWlkxY0ZJL3Qx?=
 =?utf-8?B?V05rMEZBNmdwV0RCdmhOUHV5Nks1VHlMdTB4VHFlWXBCSCtibm1XcnVLdjQz?=
 =?utf-8?B?RDlwZDJ2MVMzNTRhY2VBc2wyWTE2UFlLUzFVbzhOQk42TEdwSFNlSDJMa3NC?=
 =?utf-8?B?MkFtRlRqYmpOUk9jWDVTTk1ZTEhOaFF1MWM5N29jUWlvNkxIMGpxSWh1Y3dt?=
 =?utf-8?B?NUEySDFCb1VHVmMyZFlxcVVTRk5iellrYVorT054Vmdub1M0M1BDQVlMVTRS?=
 =?utf-8?B?UmJPNU5lQnhHdXQrZXh4M2pUM0tHSUVzOENVRGV2d1R6Y3lVSWlRbUtiSytO?=
 =?utf-8?B?YnFPRlgrYjBiaVpnY1dVWWR5UndKZ21tcHdsNCtXSlhJMlVXaDZyNytQOHEv?=
 =?utf-8?B?ZWZJdlUvczVieVQrMnNkczk2SjVEWWlaNmR4ZFdrYnBReDh3dXI0U3ZpUmt4?=
 =?utf-8?B?YWJzMnFDTnN2SWt6Q0h0bDdreklnbnprWlp1WUVqd0d3NXdLdEt5RmxLMkFZ?=
 =?utf-8?B?MjlzYmVSbVdIV1VzbEdmWVJhOVNlbm9hOUtkS0lpNXBRVlh4U3d1cmZRdkYx?=
 =?utf-8?B?eW1oY2NQM1lpeDJzYmRXVDVKbEhhcXRJbU56TzFNVmNvL0l3YWpzQ01lN1NQ?=
 =?utf-8?B?M2JTSWM2OHJDOGpkZFdkWGhTOERwckpQenB0MVY5R1lPVFNnS3Q4TzRsaTBF?=
 =?utf-8?B?VW9nUm92ak02aC9lVzdmV2FpL1o5OE1WYzZBNWRsMkg2TTd3MEM0SU1oMDdK?=
 =?utf-8?B?S3ZaY0pkZG9CVWYzdnVFKzQ2UjRDc0g5elhSbFU1WkFtNjNtVWFFMGJQbUtS?=
 =?utf-8?B?NHljOXVyNUFkc21seDN4enhwdGI3cEI3VDEzNkFPNzh4bnRacEx1dVFjRGli?=
 =?utf-8?B?UG1jWUcvK3N0UlA1UU80VXlNbmc3WTdYQ2l1ZlVvLy9wUW5aOG9jZElPaGNl?=
 =?utf-8?B?aFFkTitUVEhPbW5oaGRXRmtETXRJK0ZyRzNDK2diUDY5M3Q2M1lGVWF4bEFV?=
 =?utf-8?B?Z0hiaFVaS1VMbkRLY1ZBelpibzZDT0F0ajBibTV5MU9MaG9vaVRzZW0rK0Q2?=
 =?utf-8?B?YXRBQytFYnlsck9PQjgrZ1hqN21uckJDYmhMblIrRTE5NGZKaFVOYTlwTWlB?=
 =?utf-8?B?T3ZGK092RGJYaDdPQWVRUlowNU5CZ1I5b0RKWVV1WnNobnF6SjlmaHBlUDZ5?=
 =?utf-8?B?SVBpNmw5MFcrajlKRXgrcHp2SzJOYldIVU0xQ2pqTFhTQXZ5ZmVLbzdmQ1k2?=
 =?utf-8?B?Q2JsWmZjTWJqWXcrbEljSnB5dlRTVkQ3eXNyR25jcnN0dUNkNTdTclhKa24y?=
 =?utf-8?B?Mm5SKzRSZ29kcW1Scy9CeE1Hb1dYY2JCRGVKNUpNd1o5ZHppbEl2RmxaZmNW?=
 =?utf-8?B?a0NsdlQ5RWJ3SGNXdUF4MCs4MXE2ZVVXMDNXaUtUVGx2K3JlQnRRNU9nczgz?=
 =?utf-8?B?MGRhQi91OTF2ekpQVnVlTXFQRnFrME5neG5HVGlsR1hRYWN5SG55UTJoRHlj?=
 =?utf-8?B?bjV4V3pKUGFCdGRWWEVyN0dqc2R3b2Nvb1RqWWZvbjhtOUlodXVFTTRiLzhR?=
 =?utf-8?B?VlcxSVloSVR3Z2QwbDBIZHZaQjd2Uy9wcFI1RnZSOUxMYXlhWTNEM3U5cXg2?=
 =?utf-8?B?WGV2YVVPRjFuMWNnYlpLM2lMOFlCa0M0RTArZmcwaitqUjUvckFZSGkvOVpF?=
 =?utf-8?B?bGpPSjRBaVdQQ3pXcXQ1L2NJQkNncWtzMzMyMmo2MWJRTit5K0d6MkNFSWpo?=
 =?utf-8?B?UEdMRFFUSjhkVHo5QnlmYmVaUGVZK01Pem12WGczOEFjcGRDeS92QXg1dVJn?=
 =?utf-8?B?N2VSeUVZdytZZVB5eEp6WGxab21wbGx3MHdDZEFKeEdMMWNOOVBwc3BUM2ZM?=
 =?utf-8?B?MnRQZEF1YWtMbWZMRzhDb0hQUFNkK3pUa1hiY1JqMkhGVFN1ZksvQVJKT3c2?=
 =?utf-8?B?aER1MFpWZENlZU9MdUxUVURyMTgrREtyY21KLzFuWlZJeDRmeWdKUktiV1dP?=
 =?utf-8?B?OWgrQnRjNkFvaXlOWlQxRi9oVVNVMUtWbmd6ejE2eXpzd0g0V2Vnd0VGS3pz?=
 =?utf-8?B?Rno3QmhjQ0JCWUlMRkZrQlcwaHpzcFdqS2xVQXYveWcrcVZ6VUtVQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67740841-487a-445a-2b2b-08de6ca019a1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2026 14:40:01.5171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhnFeNXUuhShWgG1t7X6SJG/UF8V+3GeULTLHFvvZxdrhLdZWLflivEeSU1k4jq0uwPIP7IQILpyXfzfACdNyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11861
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52827-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0E76C13EE2A
X-Rspamd-Action: no action

Hi Sakari,

On 2/11/26 11:09, Sakari Ailus wrote:
> Refactor returning the routes by adding a new function that essentially
> does a memcopy and sets the number of the number of the routes in the
Repetition "The number of the number"
> routing table.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++------------
>   1 file changed, 22 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index b2105c34478e..8a433d074587 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -629,6 +629,19 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>                               v4l2_subdev_get_unlocked_active_state(sd);
>   }
>
> +static void subdev_copy_fix_routes(struct v4l2_subdev_routing *routing,
> +                                  const struct v4l2_subdev_route *src,
> +                                  u32 copy_routes, u32 num_routes)
> +{
> +       struct v4l2_subdev_route *routes =
> +               (struct v4l2_subdev_route *)(uintptr_t)routing->routes;
> +
> +       for (u32 i = 0; i < copy_routes; i++)
> +               routes[i] = src[i];
> +
> +       routing->num_routes = num_routes;
> +}

The function just copies routes, no fixing, so I agree with Jacopo's 
comment, subdev_copy_routes seems like a better name.

Clear names for src/dest sound better, and also address the case when 
copy_routes>num_routes, at the calling place it was 
min(state->routing.num_routes, routing->len_routes).

Regards,

Mirela

> +
>   static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                              struct v4l2_subdev_state *state)
>   {
> @@ -1000,7 +1013,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>
>          case VIDIOC_SUBDEV_G_ROUTING: {
>                  struct v4l2_subdev_routing *routing = arg;
> -               struct v4l2_subdev_krouting *krouting;
>
>                  if (!v4l2_subdev_enable_streams_api)
>                          return -ENOIOCTLCMD;
> @@ -1013,13 +1025,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>
>                  memset(routing->reserved, 0, sizeof(routing->reserved));
>
> -               krouting = &state->routing;
> -
> -               memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -                      krouting->routes,
> -                      min(krouting->num_routes, routing->len_routes) *
> -                      sizeof(*krouting->routes));
> -               routing->num_routes = krouting->num_routes;
> +               subdev_copy_fix_routes(routing, state->routing.routes,
> +                                      routing->len_routes,
> +                                      state->routing.num_routes);
>
>                  return 0;
>          }
> @@ -1090,11 +1098,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                   * the routing table.
>                   */
>                  if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> -                       memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -                              state->routing.routes,
> -                              min(state->routing.num_routes, routing->len_routes) *
> -                              sizeof(*state->routing.routes));
> -                       routing->num_routes = state->routing.num_routes;
> +                       subdev_copy_fix_routes(routing, state->routing.routes,
> +                                              routing->len_routes,
> +                                              state->routing.num_routes);
>
>                          return 0;
>                  }
> @@ -1108,11 +1114,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                  if (rval < 0)
>                          return rval;
>
> -               memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -                      state->routing.routes,
> -                      min(state->routing.num_routes, routing->len_routes) *
> -                      sizeof(*state->routing.routes));
> -               routing->num_routes = state->routing.num_routes;
> +               subdev_copy_fix_routes(routing, state->routing.routes,
> +                                      routing->len_routes,
> +                                      state->routing.num_routes);
>
>                  return 0;
>          }
> --
> 2.47.3
>

