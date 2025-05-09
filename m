Return-Path: <linux-media+bounces-32156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CB9AB18E6
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97EEE9E00D5
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946A722F770;
	Fri,  9 May 2025 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RHrai7QR"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690DF22F767
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805075; cv=fail; b=LbEjJk2mZiwlh8MQTTp7KYPU5yYcc/IstS9R6Uq3HrkztkzsOsFipW63vjDi/Qp7/46QTKLAtdcqrRxqB/MMOvll4OV5BJT5XA3z9o8tt8XAu5EJHBSSO1inXOxsZnqMZOSM4n8fAYYHWgOk5nOgxi+7IOr3P0f75LJ9Ezi96vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805075; c=relaxed/simple;
	bh=u5qEaKm5qEDhmX7Z90m2YEi2zCnw59TVlS2oVfgI8Sc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cRZsiGjoaVX8/s27GtBfEKXOGWP/a5jvM3rFLvaaWXcaUVyeAT8NZ0WeXuytXQWFwho46pk8fAF9MqnXHosVPBqPIj/tsHge0olLrPkITpK1inn1+wqHyXxT2tIprB2VHmXCidVwqa1FDnH8cF7UUW2lKYj1DErFi0sLnRHZP1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RHrai7QR; arc=fail smtp.client-ip=52.101.125.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8ZTMovx5gYgitI3rSb/q9z4NAR5hApmHkK5B0bDUHWt2btNL8n7pTY1EVaq4VYkXWVXRZhmBuUeSnTSwOc6rr8hupuERoa5BuafahoZxdaCoCDrr52Kjr+cNcEIi6yShtiW9dNXhE6y0zFL0RYoVQhfGzTV0z0PYeePgDfLF14u7CHjEdbQsRTnuy5MWuAYXXP0Rk35pvd7fn2TNORb5TpP5vdbJzXEw7R/l+cxw3TSGWyMDEFI9FjPP0mv0q6yNxeXVwQYx1ijy4XH/unoI2n9XmFMma0GYP5rAbrBjjc8vz9CALJ8sSi2oTCqYOgusVXP4zpA8f4+6gpiWo4ZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEA/ewkJTxxZikF0nTE6kzmQO71T8gCGwGH8sHzx9yo=;
 b=ojBAEllaNpvkb65aK5XLJ3tHMWUi4zrv0dMpxx72OnO82F1HwWOml5Rx5mCgQdmSogYUv/dyY/kF4c4gpLrnoJ/JdU+KvMi9iIrqJypm7FgPwnJQud8/G5okCJMveX8GMfP4oZEPdDyIXg0C8XA32hSA7jQWExsVYzkEGiBO2Ztt6A5DK6xF6J4aLzhhO+S1xv0k4cC/ItjFvcL0VcsvUh8p1Q8F19ihdSb9lNT5trx5j2KAzWLiFugHXeDKmbsnWGFBpA0R5ayA+y8B3BLnSyzBe1VxFsleUvZu78RDkYrw3x4TBlEMK8LdH+JMx9+ISi1FIBi8MnaAPXPAQtIBJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEA/ewkJTxxZikF0nTE6kzmQO71T8gCGwGH8sHzx9yo=;
 b=RHrai7QRn7fJM+JbRvjnpZ3wjvl65aEVtUMa9KpVwvkGPyDsQjuUY6cBM/g0edv2mUXhikdUDH5U9zYivX0aYzHMZi1/YaLk+N8VFv0eoypYqhzRyxBh1yjfDORFBWVqLTPmSEwi0d6ZiSi/Da/5mI/mEliMD6Dlhy/ViF9qN0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY7PR01MB14876.jpnprd01.prod.outlook.com (2603:1096:405:252::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 15:37:49 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8722.024; Fri, 9 May 2025
 15:37:49 +0000
Message-ID: <3eb69cea-b511-412e-a126-ce246c2491df@bp.renesas.com>
Date: Fri, 9 May 2025 17:37:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] media: platform: rzg2l-cru: Use
 v4l2_get_link_freq()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-4-dan.scally@ideasonboard.com>
 <aB4OfjTGktdu7Yos@tom-desktop>
 <i4g722z6a3i4xnre6b3ne76w7acxcjy2j3ztww4ndvabungeuw@ovecz2bqewr6>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <i4g722z6a3i4xnre6b3ne76w7acxcjy2j3ztww4ndvabungeuw@ovecz2bqewr6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::17) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY7PR01MB14876:EE_
X-MS-Office365-Filtering-Correlation-Id: eea8226e-7a17-448e-dd4f-08dd8f0f7417
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Nm0yaUo4VFJ1VER1aXlYSGJNbG13Y2cxMXlkbFdDYlpEK3pMTkpmZ25NNDlQ?=
 =?utf-8?B?TUpWVXlKRW85TlBVY0NKOGpFU1p0dXRuYXBCNEFXb1pEbktwL0JTSTdPaWVJ?=
 =?utf-8?B?T1AySTdzWE5CYTExTlhSZ3haaWx5eU1HbjRZb3cxeDh5OEpvOTgzUkdDZS8r?=
 =?utf-8?B?dXRJNys3ZlV0YzIvWlVZSXBXdVBGTTh3UEJMVnRKa3g0WGc1WEE4ZE0ybnRn?=
 =?utf-8?B?STRkUTdxZmoxNkZqbzlNd0lMWXRFT09hMlRWSHpkaEdtaWV3SktJdDJuYXZR?=
 =?utf-8?B?dDZXUUFPQmVTRDVUQUFaQ1kzei96VkVja01mYVJBeXNGRW1MQ1FoSkV2Y2cw?=
 =?utf-8?B?aFNhNURNMTYwOTl1RVI0UldSU3c3Q241NXdQb3RDTEpPUGtmTkY2dWFxN2xl?=
 =?utf-8?B?UnI1TGg5dE9iQk1nTytTa2x2eXJTRWEwTzc4UUQ1bThUY0lDbTdselpjcWlt?=
 =?utf-8?B?dTMwR1R1U2Y0bWtYdHorR2VGNnNabFl0RHpJWUxweTdQdDdaeThucEsySWhK?=
 =?utf-8?B?RldPOCtxTVRxL3BxczM4RU1zaXpJOEd2VTdDNzlZU3FBRXhab3ZBNnNDMjlv?=
 =?utf-8?B?TUpLVTlyOUNJQzBCU0FRRnFqb3lXR3BBWnNTUitUNDF3OGFqVXhENlhheTc4?=
 =?utf-8?B?VjFCWnNUUUdkV2ZvWlhSNkhxc2lhKzdoaDIzMDdWVTFtNjdXK1lJR1Q2Q1N3?=
 =?utf-8?B?SUlqUkVSNE0wT0dkOHZSOVV4cExCU2pkWGJJTU9qYUc5T2F5RmxxRWNkdkV4?=
 =?utf-8?B?QXlGOWp4eGlQYTQ2cm9zelIvZnpBekhrWWlILzd1QkQvRHV5bE1sVG80ZHVa?=
 =?utf-8?B?WnV1QnFVSStkQmxBZzd6dkNhMC9KY2JkL1BQdTFwWHd3TFRtYVdiNy8wQ2xI?=
 =?utf-8?B?S01qNDFMeHlHalUrclVyZHo4bmtZZTcwL0ZCVExqN0EyVXNLR0RHT1dmSjA3?=
 =?utf-8?B?aVNCOXc2NjN4eENSWGhoVEF5QmVhbW11NE1nTXd2ck5ZTUJ5Q3B1bmlKKzUx?=
 =?utf-8?B?Y1Q4dlZjd21Pb3dkOTMrMUhGS0Zob01QVHJtYktzZkhBdUl4UXBSWmRIYVZJ?=
 =?utf-8?B?ZGRtWmVPYXZvMEhSQnlxL05IQmhzdnhSc2lDZ2pORXFUajd1dnBmSlhmcmx5?=
 =?utf-8?B?akkrYkxsbEUyWHZ1R1pRNThJMnR5ZzR0c1UrSFNPUnFUSXFhVVM1V2ZkUnlP?=
 =?utf-8?B?ZE4xVE1DT1EzSFVCa0lHc2VYSlliQm5EOTNLcm9lcDlZUmN2ZkExT0hObktn?=
 =?utf-8?B?WWFMNHV1ZHZ1S2JUbThwc3l4d2VDdi9DNXdIbjZUT0FERVRGTzVOYWZzK3VS?=
 =?utf-8?B?dVZUY25EdTRzRmdvNW9xdTZ4OGNKVzg3d0pWY3ErUzJRQ0xiV2l2Y2pUcVlK?=
 =?utf-8?B?MnlnY0dZR3lDZ0dJQ2hSTnZBc2xiSkYrUEcvc2tjMmpsRjI5R0Jwc0xvQ1Jl?=
 =?utf-8?B?b3BJajJhOXJ0OXZtMTVvc2c1SlU5dzRHUGZRTGw2a25KZW84UHRiMEF4Kzda?=
 =?utf-8?B?QzZmVnY4WnQvVGpZWnZKRDlzUjVOK2VtcmcvTFRqaHMrYXBGc1M0dHpvcGJy?=
 =?utf-8?B?OUl6QWdRd0xUREF2NlUzcGZHaDQwVllrNW50YmVwNFdJOUh4ZGlFYWZieVVU?=
 =?utf-8?B?d3lPMVVISmU2TTM3NDFXamptMjRIelVEdndqK1NDaDBCT211Z0k1SWt5Vktz?=
 =?utf-8?B?MWdPS0kxdy9KbVJURzNGb0ZhcXlaKzl3aDE4NWF4THN0UzRFNGRpcEhrb1NC?=
 =?utf-8?B?SXBRVWRHMURGam5ha2lhZHJhOHVFSFd1ZU45SWtmV01hejNQV0FiOXp3SXI2?=
 =?utf-8?B?TzZ5ZTFUNktQcVNKaGJBWHJwUk9RMytyT3NCUVNSM1NicDdwNTNWdlZIWlV1?=
 =?utf-8?B?L09FcjY0cUd2Q3R4NmNubk54bGdGZDVKNkE3MDRSakJCY21OZ1BuZTBDL1hh?=
 =?utf-8?Q?7R5ahfKoUIs=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WWdSV3BSSDlweHNTOHA4NU9aRlFzajB0V25aaXdxUmdwOGI4UkdrQVNON1NJ?=
 =?utf-8?B?OEx0ZThSUjdZc1lKOXY5bktZUGFuSWNPcVBoS1RWRWJVU3lzV0NqUlZuczhV?=
 =?utf-8?B?WkR6d0dFc21LWjVVSkJiOWdDTlRRamZkcDVWenNWRjVKZ25vRHNEQkxJWkxX?=
 =?utf-8?B?bnM4RS92aUtReVFYTWhlZnZMSDBBaVZnU2hmcTRHUEw1SExjZmNuV2EyWkY5?=
 =?utf-8?B?Z0pUWS93Y3ZjVEZTY3ROSmlOWHhyWkU0a3crb1lRcVF1QXo4ZnA5dkZLMTBw?=
 =?utf-8?B?cFpMSW1uS1hKRllSSWowZ2Y2ZVBjMEdMRENRVGhROHVCam1yR1FGYkhFTHIr?=
 =?utf-8?B?bnAzNVFYTnhlL0h5OElXMGFMS1pTNkY4d3VXcjZhN2NQQ01DbEdMR0p4T3FB?=
 =?utf-8?B?OVEvVC9aQi8yZHlJMVg5aVVLaWhUN1dld2NRQjBQUlRQeFgySm1SVEkybFk2?=
 =?utf-8?B?QjFWMmtQTlh4azltVVhkelJmV0V5cGFrZ3VyVXdCaFZPSUZCRFdIN0JmcnN6?=
 =?utf-8?B?TTFGTUUwR21Dait5bEg4Ym9HdzRKekI0cmJEak14YjVhaWVHcVdvaHE4Q2RO?=
 =?utf-8?B?cHRVT3dza3BrUlFJRWNUZDJveTF1NURSUFMyWktuY2UvRWhIUEs2ZkNlaU5w?=
 =?utf-8?B?aVptS01vUm9GWFJManNCVjNMMmVrYTBTN1RjRXdRQmpkQnVieFZGOC95ek1u?=
 =?utf-8?B?dXBsYmdycHJSZmR2dFRPM3QxU2t5UEVqalZrZVByYTZTb0RwcldrWGZSbnZZ?=
 =?utf-8?B?U2tyeXFXVk85S01NZEhOeDB1ZG55QWYwZGRJamFna3RvVjJiZy9yc1BzU0wr?=
 =?utf-8?B?T3JGdjBHdDBwOENIZ2dybzlqOGdKWGQ4TmQra1BoOHFneVp6Wit3M2tvVm5k?=
 =?utf-8?B?dytXWHp1R00wWGFXbW1TZ2pPbUFYR0hGZGZqSjZDUnRicisrQXczY29VL3hD?=
 =?utf-8?B?VTZQR0VSZ0pRdnE1blRNaU9WNXdFODZsdXZzanptYUJvUldSSzRvUEdVQnht?=
 =?utf-8?B?N1I2dEI4c3FNMDREMlJ2YkZVc0I3YVlUVmd5YkRGUDJiMnJOVExJdHFQVTZw?=
 =?utf-8?B?YTd0c3lFdTRvK2tYSzY1SUR4ZW11clRMUnMwUE84SXZ5R0xGVUZOMlcxMDRh?=
 =?utf-8?B?akFjaERMeVgwNVlVWFZRZ1ZkMC9ZNmQrdlhhcHAxQS9wQ2szbXdROTFsODZy?=
 =?utf-8?B?WjQ2TGZDL3Bsbld3MFFCY3loMXpxWXpxRmp5enNINlI5cTBpb29SYkNYalRq?=
 =?utf-8?B?SWwrQU1LZGsrYjdBRGpDTmlscE15WnNKemtrTmlZQUV6UVFnZVVoZTlITzlh?=
 =?utf-8?B?d0g2N3NEV2JxRHl2NGIyZ3hnWlJaY0t4MnU2TmhwRVNZeVhkNlFJMkVzUlJU?=
 =?utf-8?B?UEk1WUs3NC9zQ2ZGNy9QWURsT0xVWVNqREZhOTFJVmdGN3dUMjB3RjN6cjFI?=
 =?utf-8?B?Z2FoVGNNL1FicXBOa2hXam5KUzJGZWIycHJENFlsWDZhdUJSTWdHcm5ZRlFa?=
 =?utf-8?B?Um9PZW9zM2pMTXV0cEwzNzQ2WHVERXkrL2pYTTJXcTg0STEwR0hvNFVsNzk1?=
 =?utf-8?B?TkFJdGIwZGp4YW0rVXhzNmpmdWV0MTVqMW9SeU5McHJRbUJ6TXFGbURRTTZW?=
 =?utf-8?B?aStEZmNKd2hBZ3h0U1l4Tmx6RDI4QzgzSVlnS3Y4allaWHNIVW9WMFRCNUFm?=
 =?utf-8?B?QnorTjJxbWF2bm43UEx3RXU0UmVZYlpPMmtiY3dWd1l2R01rSlFkQUVlTGt2?=
 =?utf-8?B?Nm5EMDRWNmczY1NtZnUwWFB4L0xsaXh4RC9XSEduNU5lNjNxVDZsLy9rTkZZ?=
 =?utf-8?B?WDhFMXByUFY5Um83OXZPZGtPa05NQUJ5d20wZngyRyt5dmdHeUdxN1l6UzQv?=
 =?utf-8?B?amRmeTNrWjdtSEF4NVc2S1VwWW1nRUt0MnZNZ3NvaDk3MnN3RXQ1bnBBZU1o?=
 =?utf-8?B?aW5VNit6RE1PMjBGNzdmZjBDYzVjeDFHRTN6blhCNzhaeTE4ejliVVJHc3lM?=
 =?utf-8?B?MmlNa2dIbTBqY1ZYdDFhZVQrYUc5QkR0aEdJSnl6cm1ObkJWTEorSnBCSk9k?=
 =?utf-8?B?S05uWm9kb3BwTEJudWRUQTNWWDdFTHk3ZFRBdnZzeEhscTZxd1E3Rk5SSWtR?=
 =?utf-8?B?a2VKR2I3TXRLVTB6MmFPdHBaczRBN2ZBWGpMMzhpMm1GRHFCRjlrSURuaWlC?=
 =?utf-8?Q?OY6RIGYRZEOsEGvUMgBqkv4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea8226e-7a17-448e-dd4f-08dd8f0f7417
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:37:49.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPQHOo6cWe6WbizqDDyU9YJZ32z1cf1jFqGfUW6olh7l1xWHgEQDGHkjN0ksztHSKkcR/QVVTImWrlAU7aKy6PsF+Lynlb2JhvecK50w0zRQcDZjWj5YC1oMwj1ICk1C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14876

Hi Jacopo,
Thanks for your comment.

On 09/05/25 16:50, Jacopo Mondi wrote:
> Hi Tommaso
> 
> On Fri, May 09, 2025 at 04:17:34PM +0200, Tommaso Merciai wrote:
>> Hi Daniel,
>> Thanks for your patch.
>>
>> On Tue, May 06, 2025 at 01:50:12PM +0100, Daniel Scally wrote:
>>> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>>
>>> The rzg2l_csi2_calc_mbps() function currently tries to calculate the
>>> link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
>>> of the remote subdevice. Switch the function to v4l2_get_link_freq()
>>> which correctly targets V4L2_CID_LINK_FREQ before falling back on
>>> V4L2_CID_PIXEL_RATE if the former is unavailable.
>>>
>>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>> ---
>>> Changes in v4:
>>>
>>> 	- Used separate s64 variable as return value for v4l2_get_link_freq()
>>> 	  and as the mbps variable for do_div() to avoid compilation warnings.
>>>
>>> Changes in v3:
>>>
>>> 	- Fixed mbps sign
>>>
>>> Changes in v2:
>>>
>>> 	- None
>>>
>>>   .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 27 +++++++++----------
>>>   1 file changed, 12 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>>> index 9243306e2aa9..8870c2cb8104 100644
>>> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>>> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>>> @@ -282,28 +282,25 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
>>>   	const struct rzg2l_csi2_format *format;
>>>   	const struct v4l2_mbus_framefmt *fmt;
>>>   	struct v4l2_subdev_state *state;
>>> -	struct v4l2_ctrl *ctrl;
>>>   	u64 mbps;
>>> -
>>> -	/* Read the pixel rate control from remote. */
>>> -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
>>> -	if (!ctrl) {
>>> -		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
>>> -			source->name);
>>> -		return -EINVAL;
>>> -	}
>>> +	s64 ret;
>>>
>>>   	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
>>>   	fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
>>>   	format = rzg2l_csi2_code_to_fmt(fmt->code);
>>>   	v4l2_subdev_unlock_state(state);
>>>
>>> -	/*
>>> -	 * Calculate hsfreq in Mbps
>>> -	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
>>> -	 */
>>> -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
>>> -	do_div(mbps, csi2->lanes * 1000000);
>>> +	/* Read the link frequency from remote subdevice. */
>>> +	ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
>>> +				 csi2->lanes);
>>> +	if (ret < 0) {
>>> +		dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
>>> +			source->name);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	mbps = ret;
>>> +	do_div(mbps, 1000000);
>>>
>>>   	return mbps;
>>>   }
>>
>> I tested this series with an imx219 image sensor connected to the CSI-2
>> RX IP of RZ/G3E:
>>
>> Some notes:
>>
>>   - pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample
>>   - hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
>>
>> Then hsfreq should be:
> 
> The old code seems to call 'hsfreq' the per-lane bandwidth
> 
> -	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> 
> And not the per-lane frequency as the variable name and the commit message
> suggest
> 
>>
>>   - hsfreq = link_freq * 2
> 
> if that's the intention, due to CSI-2 DDR, then you're correct I
> think ?
> 
> Seeing that also Laurent has reviewed it, and Prabhakar tested it, I wonder
> if we all have missed that the original code didn't have a / 2
> 
> Dan, did you ever notice issues during your testing ?
> 
> Also, with the introduction of 15f0035bfd0a ("media: v4l: Support
> passing media pad argument to v4l2_get_link_freq()") it's probably now
> better to pass the source's pad to v4l2_get_link_freq() ?
> 
>>
>> Please correct me if I'm wrong.
>>
>> 
>> After applying this series. I'm getting the following issue testing the
>> imx219 sensor with SRGGB8_1X8 and SGRBG10_1X10 color format.
> 
> Does the error go away if you multiply the link_freq by 2 ?

Yes the error goes away on my side using:

mbps = ret * 2;

Tested with imx219 image sensor: SRGGB8_1X8 and SGRBG10_1X10 color format.

Thanks & Regards,
Tommaso

> 
> Thanks
>    j
> 
>>
>>
>> [  947.305876] rzg2l-cru 16000000.video: Invalid MB address 0xe8bf8300 (out of range)
>> [  947.305876] rzg2l-cru 16000000.video: Invalid MB address 0xe8bf8300 (out of range)
>> [  947.339165] rzg2l-cru 16000000.video: Invalid MB address 0xe8c9e900 (out of range)
>> [  947.339165] rzg2l-cru 16000000.video: Invalid MB address 0xe8c9e900 (out of range)
>>
>>
>> I'm suspecting that this could be related to this formula.
>> Let me know what do you think.
>>
>> Thanks in advance!
>>
>> Tested using:
>>
>> root@smarc-rzg3e:~# media-ctl -p
>> Media controller API version 6.15.0
>>
>> Media device information
>> ------------------------
>> driver          rzg2l_cru
>> model           renesas,r9a09g047-cru
>> serial
>> bus info        platform:16000000.video
>> hw revision     0x0
>> driver version  6.15.0
>>
>> Device topology
>> - entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
>>              type V4L2 subdev subtype Unknown flags 0
>>              device node name /dev/v4l-subdev0
>>          pad0: Sink
>>                  [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>>                  <- "imx219 0-0010":0 [ENABLED,IMMUTABLE]
>>          pad1: Source
>>                  [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>>                  -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]
>>
>> - entity 4: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
>>              type V4L2 subdev subtype Unknown flags 0
>>              device node name /dev/v4l-subdev1
>>          pad0: Sink
>>                  [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>>                  <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
>>          pad1: Source
>>                  [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>>                  -> "CRU output":0 [ENABLED,IMMUTABLE]
>>
>> - entity 7: imx219 0-0010 (1 pad, 1 link, 0 routes)
>>              type V4L2 subdev subtype Sensor flags 0
>>              device node name /dev/v4l-subdev2
>>          pad0: Source
>>                  [stream:0 fmt:SGRBG10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
>>                   crop.bounds:(8,8)/3280x2464
>>                   crop:(1008,760)/1280x960]
>>                  -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]
>>
>> - entity 17: CRU output (1 pad, 1 link)
>>               type Node subtype V4L flags 0
>>               device node name /dev/video0
>>          pad0: Sink
>>                  <- "cru-ip-16000000.video":1 [ENABLED,IMMUTABLE]
>>
>> # IMX219 TESTING SGRBG10_1X10
>> v4l2-ctl -c horizontal_flip=1 -d /dev/v4l-subdev2
>>
>> media-ctl -d /dev/media0 --set-v4l2 '"imx219 0-0010":0[fmt:SGRBG10_1X10/640x480]'
>> media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:SGRBG10_1X10/640x480]'
>> media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:SGRBG10_1X10/640x480]'
>>
>> v4l2-ctl -d0 --set-fmt-video pixelformat=CR10,width=640,height=480
>> v4l2-ctl -d0 --stream-mmap --stream-count=100
>>
>>
>> #  IMX219 TESTING SRGGB8_1X8
>> media-ctl -d /dev/media0 --set-v4l2 '"imx219 0-0010":0[fmt:SRGGB8_1X8/1920x1080]'
>> media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:SRGGB8_1X8/1920x1080]'
>> media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:SRGGB8_1X8/1920x1080]'
>>
>>
>> v4l2-ctl -d0 --set-fmt-video pixelformat=RGGB,width=1920,height=1080
>> v4l2-ctl -d0 --stream-mmap --stream-count=32
>>
>> Thanks & Regards,
>> Tommaso
>>
>>> --
>>> 2.34.1
>>>


