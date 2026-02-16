Return-Path: <linux-media+bounces-52870-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDEGJkcYk2nD1QEAu9opvQ
	(envelope-from <linux-media+bounces-52870-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:14:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB2F143BB7
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CB853007C9C
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EB92F7478;
	Mon, 16 Feb 2026 13:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F8ceK2Ji"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180552F0C79
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771247681; cv=fail; b=EduWjyYPifRaNlg8H/EyeZ3A8Ad5cx1L6UmaiiipAlKTAP7aLWE68VGJUXLFuoAzTyrrhQ4BZUrmcjyiRCrGjoStuHi4gJ7zuZ2qRQOy59TUHXWlpuvrJDgjA9ZXObeifHWZ3rWGozS118RBURZDaQSgm5OpZDNrObLyLM4pvEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771247681; c=relaxed/simple;
	bh=F7qXYVDX3Vzpsv/XYXT54o/8+aIweX6+/PoDQxwU3IU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RSR50FQ9FQSc+eY6wcYWr4BaYoxin9ot/Df/ChzWHJUIgPMfBsN0bp7/DNRELCDrkvDqvKwVyo4YGnMp+iTAaPy16rQf//6TidXu7xsR2r7YiraCVu8NzC/BWfJMIXpT50edMPEUSaIyEZ3RHagBBo+tt8j8GATkHMb0U7zCSKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F8ceK2Ji; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmGlTb4XoyHGk7YjntmGfEuTVCxKrY41CYMRsJNCgXmszAmUG8XddXL5rbjX4K6ylV+rpWkAaQSy+geUzCI2Tnr2z+YIXvIotb66nGK/WUeS2dPjV/vlOceksjAzgdr67qzAcyKc2OJo7XftUrt3uUm5S7mriGketgEc2oS0+6k3GPHeBz0zqy9o+p5Otc/20HFH++v7Ds3l6+U7QUol3PdnnAFJSBYmkc3Af+iu+gkvWGBpTZzY6vqRmRLpLZ5AOUHcVbVd0OokmrR/lsxo8KY9yqffp5zXrUegpOmmADvx+yCw0StSDBWiESEsN1emLJyKBuTpNFwV58FWo4AJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgORZwJezeOqN8NpMvvGcvXkIgK4TUKI5U8Lcl7zMU4=;
 b=WS2OsDOxePpyzdJodA5aBe7i68jQvd3q2+y4Tn4szXM4NOOx5JSPmGQdMriSvrmTA/luhVAgc2iWmfNa78S+FRivM4RjFUUiNvi7bUY9zKj4A2B4G1OQ0ZFne2e4hPt5q0Oiw9vzMEuYue1TMJcxcHoV5nw7rUxVhB0/3ZH/6jfH2dRNYZg6QoHXYNjfLsNlkZmyiIpOcoxk/9uSk7khlGkXZW1emzI1yCsG/va+k3wcNEcNi5/98vcaV9sLA51snep65sow4Jh+M5vwmW3DR+aycymqebs8gGISJ4bLjJ+bLz0HEzTlCsGFurWcNegC7rU9498geZ2rZ920hZhWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgORZwJezeOqN8NpMvvGcvXkIgK4TUKI5U8Lcl7zMU4=;
 b=F8ceK2Ji0gMMHYuRhtcwXyCmQXZ9M7jSPjqNZjJ6grsC6DUSdSDjZJd8RhAljVG40WJny7NI3rgyV7Tf71g2hH/QNdG0/oAurcDKMkgmUUqzVXlsASXuZ0EDIF/sW7FrKawTreVobqRO+0ywUmW346HinzTwAO5tEVPGvYBFEtiFxYouzR8aIPUpp/y7Ru9r+hYrT0hKoF8pcHTKNgndf05ajZL+oX5kCX/vOvau/oJZCFHGsUO3sxlWcq1oq+kjz+n1SkUdpJNvQsO5vOjd+Y01nUJ1k1IT535k1A+0iIyNiC07y3NNXL9sMFPFs751MVeb4pNuiN/HbQaQdmGzjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DBBPR04MB7499.eurprd04.prod.outlook.com (2603:10a6:10:203::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 13:14:36 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 13:14:36 +0000
Message-ID: <c0a52d14-7b62-40ef-ba59-ee715d635274@nxp.com>
Date: Mon, 16 Feb 2026 15:19:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] media: mc: Add MEDIA_LNK_FL_VALIDATE_LATE
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
 <20260211090920.1851141-8-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20260211090920.1851141-8-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0186.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::23) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DBBPR04MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b6e11f-aab5-4af5-52df-08de6d5d5503
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|366016|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TVgvclBuYnNOT3JaSFVEN1daK1B2UVF5Z1I1VFA4dXF5TEs4RDhkc3NZVDNZ?=
 =?utf-8?B?enlGWG1EamFSRTcwb29LNEYxb01tSUk5azZ0ZWs0QXlwdWZIajZFWkMxeXM4?=
 =?utf-8?B?UmZkSmFxbjkvS0svOW1kWHgzcnFFRGQrbjFnWFZ0eDJiYkRUQ1FkSnZnMU5u?=
 =?utf-8?B?N3pXTmdJNlNZNlFUNTZ3LzdpVWpWQkFaK2k5bGVML0tuRVJVcWdDSFVISG5y?=
 =?utf-8?B?aUhOK0U4SXpHU1NKWUZReHVPaGxpT3V1V1E1OFJjRjl5L2tISnVzbWVKVjh1?=
 =?utf-8?B?WmZjZFN2c0JTcWZJam5SMUdHd0pQZGFtTkVNV0ZQa2VTSWtxRElLTWpLczdO?=
 =?utf-8?B?cndXT1krdHpnc3lTMUdHYmpiLzBGakdRZTZpNlBhSVFSUHVBQWphakYzRFQ0?=
 =?utf-8?B?eVhMVkZFYXpCM3B3Z05sYnR1RnRHWkU2MWExMUJmUzM2UmhHbWRpVWptVGpu?=
 =?utf-8?B?emxISXRlNUlJb045U01oNm9oTHNLbXFUTHRYZEZXaUk5LzNneERwWDRycXVu?=
 =?utf-8?B?K1I1R3dVQnhkd2tOMTJmOTB0SHY3ekFVZy91Y1lReW1mU3kwU1c1REdIOFpK?=
 =?utf-8?B?bitsT2ZDVzRDOW81R1ZKbCtvU0MvWjVReEJlMzU2MGVpZEZuRElVNXBQSlZ4?=
 =?utf-8?B?QlNJeVJ0TUc4V0hraTZac1J1d2tnTFNmV0lTa1FwMXhTc2gzbTJuRStQQTFh?=
 =?utf-8?B?VEQrTHU5c1ZvM1FoaysrN2ZoQXM4OEhvOXJ6dFNNcTZzRU92ZS9FRHVIb3BR?=
 =?utf-8?B?ckMvZXY4T25NeU96aUxObFlLeGRRNm9EdE9ORVdpNDJDY2s2eUtYV1JqRHZ3?=
 =?utf-8?B?ZjN3NVBWUjNhV0NYRnF3MHJXSExzb2gvMkpBcWhoZ2xWQi9tNlJqRWIxTEgv?=
 =?utf-8?B?dGJZYkF2amVOQ3Q0S2daMnBRV2YwSXJKM1hmZS9qOFo5K25aTHhkV3RTRHFW?=
 =?utf-8?B?VlZiOVNEMVZ1OGNCakFTaU1GSUFvcUkzVDNDd2tZNU55ajM2QUU3UExGMUJI?=
 =?utf-8?B?bFpJTlhUY2dJMlFVb3JLZjFyYjdRTFpQVlVFdmt5VHZKbklTT1VqZ0xTRWQ2?=
 =?utf-8?B?Mm9lSkl5c0tJN2licnBOZzF0UjFqUStnT1ZoaURQL09TZk9lbHpHVk05SlBp?=
 =?utf-8?B?QWhtQ1Brb1E3bUdPRWxBM2N5RkE2RjRQNmRDSnROd29ldDVmU0tqc3RvaTJs?=
 =?utf-8?B?b09KNFNYa3NwV3V5dXIxRjV4WGN3VS81aEpMRmhucytiZVA2THZpcERYazBO?=
 =?utf-8?B?bzBRQ3VlM3dtUEdwY080a3krNDZiVlNoaFUzTG5CeGh2VjVUWld6VWc2SDZP?=
 =?utf-8?B?OTIzbU1mblloczF4REhpaDhkdml3V2M4NUFDOEkxWkQ1dDNlTUdtTTgwOXRT?=
 =?utf-8?B?RlFBNjBseWJYdkhTL2JRbnhTNDRpWUZCdG9SaGZlM0NINjNoNktTaVhJUWRI?=
 =?utf-8?B?czRYUCswUG5valVnTGphN3plNG1hbW51OVYzT3dJWmVySjI1bDlQcDFmamY3?=
 =?utf-8?B?NS9ud1RoQ2FSNk5VRTcrZXlMMGhCUEFhTkEvWlEvWDcrc3NQc1Z2ZzV4OUlk?=
 =?utf-8?B?MTI3MlB4VmtMRXNrb1E4akZRd2pOMHpCM1JEblc3MkpRUks2S1hPYm5JOFhV?=
 =?utf-8?B?ZmpUMWlWYUpVMEsxZ0pXaUYrOEZQb2M2TSt3dHY3bXp6alZVR1ZQSElYUis3?=
 =?utf-8?B?Zm00S0ZyZmF3UTJNSmJ1TTNEakdMcDF2TEZKdEJTblZQTGRoT2htWHp5aGxC?=
 =?utf-8?B?eXpDTmhBb25BQXBuVGh2VWw4L2xnMEZLdmV5djk1U1ZhbEN5RmpsM2dlTWo3?=
 =?utf-8?B?ZytvOGNtMy9jL0JUMVVmVVFBbnVORFQ5ZnJFQTNHakFCU2JIb0VxS3l2dHJG?=
 =?utf-8?B?WStzWXdwU3BabXo1RndRSGJPQll0enpsRnM5V2wyT2t0dFd3WklKK0xQTHRp?=
 =?utf-8?B?OE0xTmZuanFSUkJkQWtJVXlGTHVGdmF1YlF6UmJIczREdjFVSmJqQzVzcklE?=
 =?utf-8?B?Y20wOFdPNjJ1VlA0TFlXaEw5WHRtTUViV0haenQxSnlxdTBabFZFTXJhYmFR?=
 =?utf-8?B?ZjVGWjFLMy9BYkxZQkt1YjA5VzFkUGdYZzYwRmFKUHhoc2d4OTc3KzhpMzhQ?=
 =?utf-8?B?Yy80UUZJOU1rblhUZ004ellFMnNpR05TT1QxVlFkYjl3Mjk4YzNaSk1nTldv?=
 =?utf-8?Q?ONwGVcsIQkl74orZ1b/n+rQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(366016)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?alFBcG5qOGZmSHpPU2JwalZTQlVWZEZKYWt4WkZ5cllzV090d1JnVU02bjlL?=
 =?utf-8?B?emxyUE1VQ3NHN1p4OER6YWVwTFB5K2RQVCtkSmRjRTcwSk5mSXo3Um9NYyti?=
 =?utf-8?B?UTJpdDJpNGZJY2o3UjVEUklldDFaNmVwN3pMemE5MkVYS3gyR1QvNTRGNEV3?=
 =?utf-8?B?QndKRHcvU2oycFZvd0d3UGFuTzk2ZUJhc0xOZ20xeDJqYkdoZHZRZ1dkanN4?=
 =?utf-8?B?OXNMbUQ1OE5ka0hCYWg0c3YvWWxFb3E5QjlGZFVMeDN5T0RxcWtGbzcySkw1?=
 =?utf-8?B?cE1HNnJaN1RoMkI0K2xQbWZ1VFQwZkdRWThzY2N4MmRoUlg1V2Z6QWxrcWpG?=
 =?utf-8?B?bUoyaXRDMU5WUXZqTXpGZ1ZvZGlyVXo1YldweGc2QlhrTUFaVDRmeHdnVTZz?=
 =?utf-8?B?cHpVcGtQK3gvU2hxWXBqRXp6a1VxUnErVlAzUldFMmovNmRRbzVRTmsrVlpI?=
 =?utf-8?B?VTMxc1FINk5RWlBUcThsYmZZbS84MzdGZWFzdmZEb09IV0psckxUaWdFSU9M?=
 =?utf-8?B?VEpWaUJsTWtWKzFDVGtHZmtKa1FmbktobzJRTkFWQ0pvNklvNVNCUllQd29Y?=
 =?utf-8?B?aDdJVWQrSEJWdGVTVXM0UWl4Tk40RitoT0JpRnRxaVcwYndQTWRMblZzaU0r?=
 =?utf-8?B?TG45R1VBdXYyOVRzY2I3a3dPUjFBV0FicGwzd3orbkpxWjJSVzQwQkV0VFZm?=
 =?utf-8?B?R2dWNmJickpZUkpITFZIcE5FOEc1eGRicEhDT3FNSy82TTBOKzNZQmc0TXJv?=
 =?utf-8?B?N2trL1l2WW9MeE5qUitDbjdlVlplN3NGVTUrTUZTb1dmanoycUNQZ0NZZy9O?=
 =?utf-8?B?dGtUK3RCZkdFRU1ISk9oU2NpTUREL3lxN3NkMlRYTllielQ1VnAvQmhIYXF5?=
 =?utf-8?B?bjNTU2dLeFNNYmNuZStGbGZ5L0xQelpXVGROUG9paXVYdTl5dkZoY20rSC9P?=
 =?utf-8?B?VWJjZWRsc25wUTlWdGdPQ3VLNVFqVkNOTTBJajhhWG53dGY5TTFLWUphbHhz?=
 =?utf-8?B?eDMvWExRWjRIVnMrTG5vVEFxTHJ3Q2lISHkzd09CYzB1Q1ZQUys2WkMzKzZ1?=
 =?utf-8?B?Mm1zbktDeGNwV2RLbDZ6RGlxcG9tSnNxR0lNUmFndWdoYnBoalBpem5mcGx4?=
 =?utf-8?B?VGR1WlE2Wkd2WmtLYTFucVpJUm13L3JpMHFSUEQ0ZlpTV0QwVUp3UEc2Tk5i?=
 =?utf-8?B?WWVSNUd3VUVrNkNRNks3SnN0QWo4bzJDNWNacUZlMTZZWU50V1R5NDFHVCt2?=
 =?utf-8?B?d2UxZGdPRit2RFhSeXhnUjljdkJuRXJJeFhreDU0cGxRdUpyekgyNDh4aHl3?=
 =?utf-8?B?UTBSOE9DOHRSOWVZdVo3akZxa09oMVZEbUo2dXlsWS9JYlcxMEtQYWY5TTh0?=
 =?utf-8?B?V2FwMSs4SlRuSGN4Tkk2NGpXUWZMN2pRZDhtbnNDazdYTlpWWnpuS3ZNRDRz?=
 =?utf-8?B?TGMwRUFjWWJqSHZlVHIwd1FoRHJOMzlZRDcxZ0liclRxUE1IOVU3bHBQMkJX?=
 =?utf-8?B?TW5JMzRFTVVRbFJaYks3YVROM3JFa25QbGdSN3lJaEJ6Qk5EdFA1TnBUWnhD?=
 =?utf-8?B?RXVwNE8zRVJLVllTTktMMHgxUFRxZlhzOUNWaXh3LzdXQVEwRGNyTUhmVUpO?=
 =?utf-8?B?R3daQW1KVWJkRFFDU3BJT1FJemtFUVhnU21Odys3RUpuZ2hFdk9wdGdTVFRN?=
 =?utf-8?B?UCtzNkdlZll1d3UvRExQaUNvZ0JoZitWaFBFby80YmcwYzlEdVVIbUlJbTBI?=
 =?utf-8?B?MkQ4L2l3K0FjSVpWZlhmTGl6bXZZMEVjL1A1U3lIcWU0aGtSVS9BTVczbWZX?=
 =?utf-8?B?Zlg2aWRNYW55cjZZaHJkR3lqZ2hSUEhxSVZ3NXhNczBEWE04Z1FpV0xPN0w0?=
 =?utf-8?B?aHByQjJCcnQrNXR0SnBlUzlMRlh6VnN3NmNZZnUrTFlZZE1uSStnTE92bGNk?=
 =?utf-8?B?bXo2RzNhUkRNVUkySUVhSWhxbUIwV3N4bVhreVNxZmZLZ0VabWVGL3FiMGZ4?=
 =?utf-8?B?cTRrZ0swby82ZFJuVS9rR0pYVFNqWmQrS2FYc0VPU29IS1FDc0ZUcVdNTWpz?=
 =?utf-8?B?TXlodUphbk95a2RGcFNVNmFnaU5laTlkaVR1TnJEdTJjN2JVSnNTak9xZm8y?=
 =?utf-8?B?VHhsOXhkcjJ0c3A2K2ZVUjVOalNHc014VnNiVFQ1aGhZTEFvcnNGM0RqS3Vv?=
 =?utf-8?B?bEY2Smk1ekRBVlV3ck5RdkRZczU5eU5XSWRsSG5KSGp1UU5MSjNBRkI5V0JZ?=
 =?utf-8?B?KzhPaUplcXlNNDdpNlIxQkdUZ3FDcEVYeTFYWmxnWGg5ZUg3NXhMRk9IM0xs?=
 =?utf-8?B?bTJ3SXZzWmJGVG12K0dtVWNFZ2Z2MEN6ZjE2RTJ4YUwzQmJ3NUxldz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b6e11f-aab5-4af5-52df-08de6d5d5503
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 13:14:36.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASR7sAtkO0FgEr2foDyaCI2qmLiKV9t2KnxpNx9OFSCjoApD4ZvOsEemk1R4Z0Xs7fS9aLE1OWeNBAU8pjeJMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7499
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
	TAGGED_FROM(0.00)[bounces-52870-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,nxp.com:mid,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EDB2F143BB7
X-Rspamd-Action: no action

Hi Sakari,

On 2/11/26 11:09, Sakari Ailus wrote:
> Add MEDIA_LNK_FL_VALIDATE_LATE flag to support late validation of links.
> This is serving the use case where video devices are configured and
> started streaming indepenently of each other but this sequence may be run
> in series, in such a way that a video device in a pipeline starts
> streaming before another one is configured.
>
> Before this flag, drivers have resorted to implementing the link
> validation separately for the video nodes as part of streaming start
> sequence.
>
> media_pipeline_start() shall be called on each leaf entity connected to
> the graph with a link where MEDIA_LNK_FL_VALIDATE_LATE is set before
> uphardware operation.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../media/mediactl/media-ioc-setup-link.rst   |  4 ++
>   .../media/mediactl/media-types.rst            |  5 ++
>   drivers/media/mc/mc-entity.c                  | 58 ++++++++++++++++++-
>   include/uapi/linux/media.h                    |  1 +
>   4 files changed, 66 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> index 23208300cb61..7a9a43c71cde 100644
> --- a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> @@ -49,6 +49,10 @@ Only links marked with the ``DYNAMIC`` link flag can be enabled/disabled
>   while streaming media data. Attempting to enable or disable a streaming
>   non-dynamic link will return an ``EBUSY`` error code.
>
> +The ``VALIDATE_LATE`` flag is used to signal that the validation of the link may
> +be delayed until actual hardware operation even if the rest of the pipeline
> +would be validated at an earlier point of time.
> +
>   If the specified link can't be found the driver returns with an ``EINVAL``
>   error code.
>
> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> index 6332e8395263..d6a690655a01 100644
> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> @@ -391,6 +391,7 @@ must be set for every pad.
>   .. _MEDIA-LNK-FL-ENABLED:
>   .. _MEDIA-LNK-FL-IMMUTABLE:
>   .. _MEDIA-LNK-FL-DYNAMIC:
> +.. _MEDIA-LNK-FL-VALIDATE-LATE:
>   .. _MEDIA-LNK-FL-LINK-TYPE:
>
>   .. flat-table:: Media link flags
> @@ -410,6 +411,10 @@ must be set for every pad.
>          -  The link enabled state can be modified during streaming. This flag
>            is set by drivers and is read-only for applications.
>
> +    *  -  ``MEDIA_LNK_FL_VALIDATE_LATE``
> +       -  The validation of the link may be delayed up to until the start of
> +         hardware operation.
> +
>       *  -  ``MEDIA_LNK_FL_LINK_TYPE``
>          -  This is a bitmask that defines the type of the link. The following
>            link types are currently supported:
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index ef959e9bb313..b29b519237d6 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -772,7 +772,7 @@ static int
>   __media_pipeline_validate_one(struct media_pad *origin,
>                                struct media_pipeline *pipe,
>                                struct media_pad *pad, struct media_link *link,
> -                             bool *has_enabled_link)
> +                             bool *has_enabled_link, bool skip_validation)
>   {
>          struct media_device *mdev = origin->graph_obj.mdev;
>          struct media_entity *entity = pad->entity;
> @@ -782,6 +782,9 @@ __media_pipeline_validate_one(struct media_pad *origin,
>          if (link->flags & MEDIA_LNK_FL_ENABLED && has_enabled_link)
>                  *has_enabled_link = true;
>
> +       if (skip_validation)
> +               return 0;
> +
>          /*
>           * Validate the link if it's enabled and has the
>           * current pad as its sink.
> @@ -833,7 +836,24 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>           * valid, so just increase the start count.
The above comment is no longer accurate.
>           */
>          if (pipe->start_count) {
> +               struct media_link *link;
> +
> +               link = __media_entity_next_link(origin->entity, NULL,
> +                                               MEDIA_LNK_FL_DATA_LINK);
This __media_entity_next_link() will retrieve the first data link. Is 
this guaranteed to be connected to origin pad? Is this intended, or is a 
check for (link->source == origin || link->sink == origin) also necessary?
> +               if (link && link->flags & MEDIA_LNK_FL_VALIDATE_LATE) {
> +                       dev_dbg(mdev->dev,
> +                               "Validating pad '%s':%u late\n",
> +                               origin->entity->name, origin->index);
> +
> +                       ret = __media_pipeline_validate_one(link->sink, pipe,
> +                                                           link->sink, link,
> +                                                           NULL, false);
> +                       if (ret)
> +                               return ret;
> +               }
> +
>                  pipe->start_count++;
> +
>                  return 0;
>          }
>
> @@ -881,9 +901,16 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>                          if (link->sink != pad && link->source != pad)
>                                  continue;
>
> +                       /* Skip late-validated links not connected to origin. */
> +                       bool skip_validation =

Move skip_validation declaration at beginning of the block.

Regards,

Mirela

> +                               link->flags & MEDIA_LNK_FL_VALIDATE_LATE &&
> +                               (link->sink == origin ||
> +                                link->source == origin);
> +
>                          ret = __media_pipeline_validate_one(origin, pipe,
>                                                              origin, link,
> -                                                           &has_enabled_link);
> +                                                           &has_enabled_link,
> +                                                           skip_validation);
>                          if (ret)
>                                  goto error;
>                  }
> @@ -1163,6 +1190,33 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
>          if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
>                  return -EINVAL;
>
> +       /*
> +        * With the late validate flag, either source or sink shall have exactly
> +        * one pad and no links before this one. Similarly, no links may be
> +        * added to entities with a single pad and an existing late-validated
> +        * link.
> +        */
> +       if (flags & MEDIA_LNK_FL_VALIDATE_LATE) {
> +               if (!(source->num_pads == 1 && !source->num_links) &&
> +                   !(sink->num_pads == 1 && !sink->num_links))
> +                       return -EINVAL;
> +       } else {
> +               struct media_entity *entities[] = { source, sink };
> +
> +               for (unsigned int i = 0; i < ARRAY_SIZE(entities); i++) {
> +                       if (entities[i]->num_pads != 1)
> +                               continue;
> +
> +                       struct media_link *__link =
> +                               __media_entity_next_link(entities[i], NULL,
> +                                                        MEDIA_LNK_FL_DATA_LINK);
> +
> +                       if (__link &&
> +                           __link->flags & MEDIA_LNK_FL_VALIDATE_LATE)
> +                               return -EINVAL;
> +               }
> +       }
> +
>          link = media_add_link(&source->links);
>          if (link == NULL)
>                  return -ENOMEM;
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 1c80b1d6bbaf..c96e2118ea99 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -219,6 +219,7 @@ struct media_pad_desc {
>   #define MEDIA_LNK_FL_ENABLED                   (1U << 0)
>   #define MEDIA_LNK_FL_IMMUTABLE                 (1U << 1)
>   #define MEDIA_LNK_FL_DYNAMIC                   (1U << 2)
> +#define MEDIA_LNK_FL_VALIDATE_LATE             (1U << 3)
>
>   #define MEDIA_LNK_FL_LINK_TYPE                 (0xf << 28)
>   #  define MEDIA_LNK_FL_DATA_LINK               (0U << 28)
> --
> 2.47.3
>

