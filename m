Return-Path: <linux-media+bounces-52990-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOEUNnmxlGlbGgIAu9opvQ
	(envelope-from <linux-media+bounces-52990-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 19:20:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC814F00B
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 19:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94B003055E56
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 18:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE7036E49A;
	Tue, 17 Feb 2026 18:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ajuli93T"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD1B36E497
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 18:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771352398; cv=fail; b=ngejUJ9j6X2RG2bjVX8m750NLrL+wS2SC5pNEKlSazHIzUEK8URrZYa4YTXOUStQaCIc22JuH1DhTZ6/a2NAWkf31bwt0WShbglNl9g5AOho0twCGtNHzzh5O0C+TiKCxP19VfNAZCpi0BgXcazeKUc5tOndTnTxVW4d/y96wow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771352398; c=relaxed/simple;
	bh=WzJxv76f7TYcNy8IZaIjYu0XeVwDwolc3FlLj2Pg+Gw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uMLvHfhuOoz9INSorboHZCNTduQPDCMGnPFjKCeKlrUxF/VEIrhgeSTiStiIwqM4jzQCsAskFUVAfSyHhfK6+tU0cNbnKkjjBKU1H7J062RqdueWeP7f+gmEUC7IyD8slxryMAhjHE4HlmWy3d5zr2fQujSCGMCW5c/brNG3Txs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ajuli93T; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCTSn9OlPnTbUBeht/+g2z+ezMo/lmb4EaWZ5HDSnob22hy3OzkCT4VtevvWaz2uMp35R36Ezv7NWpIGBPNpgxQ5qaWnjeUUl31loKyGIYf/RbDWj0tnSSuYrjQG+heMcCj6D09nE4r6gZ4LwAkPK0tKLkZU6fpOqWImPMTPViwbEF+SKRcZ2GyzYo9EydTPwWDxOS1LmeYO23SpsgJJ2gTcmocx4HEUdqqqejOLizIfmNS8IL6ljkFdRTXmT6qBZlNekmHiG6oFUqtoAM+pjLHNSW1oNedOs4l0H9embO9J/VHBPqL9ZJDUQ3Xv8xi/4OS/rxHeQxzTOxCgntgm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBO+3FRYelIfC0e2ao9tyT6SFAWSMMmb5AlJdA9FM2o=;
 b=NisH6DZSCbOyS39i1VWrXu93UdBrDhI2dkZokm4gnVdSm20zXZyt3+oh2FO1S6xifvCvCG3VUVvj+Mc/4V0IQkSgR4NsYSWYO8FiapLx+C0uF/4+03IXv+3DIaAWGkEnXjnru/9pYFXNRXfb77oQ2YOvlHs06u85AQWTnt74Wcmbk/IjPhd6wkUS2syzPeeR0dFnl1K7mr+79QUZL2Ff3qTjZSAD6T0ZCncUZfKIQl2n7nQGaeb9eekV4F7Xmgx6LEaECdUiMO13XzGjAcmL7SRcM5JtjQpNJ7k0HxWXtARWmS+3Q4Po7RPdV+Ew71zLLu8QE5w4FVAjGlWspYXISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBO+3FRYelIfC0e2ao9tyT6SFAWSMMmb5AlJdA9FM2o=;
 b=ajuli93TP7ltFzjk0Eri9PLLtM2M5n/fj96jNvSJOUsMdoDuIM8HrnvnPqt/eHBb/5HpaQ5/LDyYZMmKm6OktqrRDwOc5WimzylJzawscYYNu78mX4xoaf85y8ntgYs1lN8f3ov9IQW3HOAXFcuEuMFg++Ikv4Xmw7/oO6my7j1TX/cEq0IjoNGaQ1JkI/iiGvzf+98v+ll11bF41I8uXdg6jv+/VG8VduUnfz/HXkCo1c4QvNfkzu55/xAJku3/2mFnkhmPzSZuw4Rmd6wHQOdeD5JKXF+Z4y1HiUqPxa9smVYGv/k0UkHNcQuSPqP2nhvzEA99jkPBnq/98h3wvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9231.eurprd04.prod.outlook.com (2603:10a6:102:2bb::10)
 by PAXPR04MB8925.eurprd04.prod.outlook.com (2603:10a6:102:20c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 18:19:52 +0000
Received: from PAXPR04MB9231.eurprd04.prod.outlook.com
 ([fe80::9f45:ec8b:279a:641b]) by PAXPR04MB9231.eurprd04.prod.outlook.com
 ([fe80::9f45:ec8b:279a:641b%5]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 18:19:52 +0000
Message-ID: <f99d2cad-5351-4b8c-8019-c9703d215918@nxp.com>
Date: Tue, 17 Feb 2026 20:24:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/64] media: uapi: Add generic CSI-2 raw pixelformats
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
 laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>,
 Kate Hsuan <hpa@redhat.com>, Alexander Shiyan
 <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-16-sakari.ailus@linux.intel.com>
 <41ad339a-c78c-4c16-922a-b23b6b79bdde@nxp.com>
 <aWY61FKxtnD6x7qI@kekkonen.localdomain>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <aWY61FKxtnD6x7qI@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AM8P251CA0022.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::27) To PAXPR04MB9231.eurprd04.prod.outlook.com
 (2603:10a6:102:2bb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9231:EE_|PAXPR04MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d17ca92-d8f2-4ebc-ff91-08de6e51245b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|366016|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RVpGV2tZNlNya1QrczlRMGdyUjJ4bUgxUklhZ2VwSkVtVFhra1pwRmJ1SmYr?=
 =?utf-8?B?S2ZVVFhFaThRUWlVazYyWkRENytaU2QxbTc5M3NCOXpCS2wrd1Z2REU3VHV6?=
 =?utf-8?B?T3FwR0JSVStqRnVPSC9CWEhUOGF3YytxTmdTeU43d25RdFlLNXlreDBVbExy?=
 =?utf-8?B?Qm5tNGhvcTBFbjFYck5GcWk2RDN4dGZGcnk2Y1pXa0RtN08wSm1pSndCMGow?=
 =?utf-8?B?enk3QjBEbGF1eVlKbk5LOXFTVkFxVmZDZEpwREV6V0REWldvQWY3OHNOWkUy?=
 =?utf-8?B?NEgzdXBoTmwzME05T3Bwczh6NEhHN2NtZ0o1RXV3SEtrSzdoWXhHWTg4ZmZ6?=
 =?utf-8?B?MGtLUWpHWURWenluSEFEelUrNkxEaGRldU01TkpxRVdQTWRSck95WlFxQTFt?=
 =?utf-8?B?WFdSLzVSOC9OTHRSMTArdHBQbEI1TnVEQnF0MlVvQmJYWlF1aXRxWWV2aUJs?=
 =?utf-8?B?UGJWZDQ1T1NkdU1WdUpqSk9Kdm9hVVFLTUhVZVBYMmdJbS9PY2FFeTA5bFNm?=
 =?utf-8?B?RWEzcWg4SWlqNEFRVTJUeDJIdkhYbnJtM09QQTYyQUdQQUtFdnVhRG1CUVJH?=
 =?utf-8?B?bWJRaE1oTWpMV2kzS2RnWGN3aDMwakd1UjQ3MmVXd2F0NDFVd25yRllLbDNj?=
 =?utf-8?B?WWdKaTNRcEhuUElvbDhoRU9Udm14WGhVTUh1QUJINzJQaVNRVXNJL3dHQTVU?=
 =?utf-8?B?NGNwamdlREZ5TTF1ZFNqdDhEcW1OSTB5bkFGL3FrNUR6aGx6Z05zM1FnVWJR?=
 =?utf-8?B?TkhDRTNkdVNCMUVVc0EwUklQellyeFRDUUpjSklUNElGcy9JUWJ5KzUxUzNR?=
 =?utf-8?B?N2Q3Wm5kQ1QvT1J4UUxVbGlKK254Mi91UmNkL0gxcnVMWCsxTTdFK0FKWEFw?=
 =?utf-8?B?UFB0RitDMlo4amt5YmFlSHJDUmE5MFpSTVVQeUU5OFJSN3RiQ3dZZlYrVzBJ?=
 =?utf-8?B?YUNrRU11WURKb1pNTXV0MXJpMWhrbmg2Wks0UTN6WUpPMzBqTDhKc0hlek1Z?=
 =?utf-8?B?a3R2cGpYZmtnT2ZjWkVBalZhamRaNTBLRUJzY2JlQUR2ZnJUbmwwSVQ0M045?=
 =?utf-8?B?T3dCRnp1UmxDUG5sZWVzaml5d0JCRzlqQW44UGN3U2JvalZjYUZVeFhZZEsx?=
 =?utf-8?B?YlYwY25Gd1B2YVFaS0NVQmpndkpYMGxuTkNSNENSRklRTUZPSjFlTTlkempI?=
 =?utf-8?B?UXhZN0d5K2pXMUcyYTQzclRPWGZPajAxdXpjVlk0NCt3Qm95c05iQVE1bDJX?=
 =?utf-8?B?U1BKOHQyKzMxMDk0Mmg1NHlLdkpCOU1HbThhellJVEd5VXlHWk1EUDNuQVJw?=
 =?utf-8?B?T2NTdXUrWmV1bStsK1ZpQTVVdHNHYnRtTUVzWjJnRC9mVG9Ldjl4UFROWEpF?=
 =?utf-8?B?ek9McldJeWJNZjl5ZU0vYlJ6V2d1UmFnR2ZXRU1xM3RqUUl2MnQ3ZEhvMjl5?=
 =?utf-8?B?ak9VQ0Zza1daTWxLTldBME5zR1gyd1Bjcnc3aTBqZThoclVzL3lscEtBMm9T?=
 =?utf-8?B?dk12UU9sc1p6ejM3ZzJvRGQ0aDdTVS93S3l6OVlmQ05YNTFqL1VTblluNXk3?=
 =?utf-8?B?bkQ5OGIzSWZUSkVFaWRBWkxkMGYvb3RlT2FJMVlRTDRpTm9oeVdMUUNjeDBw?=
 =?utf-8?B?UnpTdGYvUzVPNEZyOFpSM0FMdTF1RkxiY1pGa2NBeXlUR0FMUmFVbXJRRk5n?=
 =?utf-8?B?R0UyWWFrWXBIaDNlTlFrVkVIZS8zeXBzMUlqNHcvUmlLSlpocXdML0JFNmJ1?=
 =?utf-8?B?ZHlCOXJCdTFKSkNzZDcrQklmSGlhKzZyUk5NdUp2RnhjUFFxcTg1Q3paSXlt?=
 =?utf-8?B?VjkvREhPWWpjQ0xoNzN6TytGRm5Ib3JJbVBsVkxuYngrOVBpcjBOOEtkYVNh?=
 =?utf-8?B?WllvTytyS2ZyTVFjVlRVV0NiOVZmWUFDTFJ1U1ZQSjBaM0t4aDZuVjhrMTd1?=
 =?utf-8?B?anN5ais2Ujk3ZHgxa0Z2MG84Vml6WGNrNm53NDZEQVB4NGUvUEFtZVB1WlpD?=
 =?utf-8?B?VFVrcXhrcklLZmo1aHRHSEtvTjRaOXprR2dvRW1YNksvVEJUN1JiMmRZeDdX?=
 =?utf-8?B?VlNpQVhwaHRKQmkvVE53b2hnRkljYlQyYjFCVjRiYTZBak1OakU1aUxwTSs2?=
 =?utf-8?Q?f9LsWnxroW2Vlof2odJAD7R+W?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9231.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(366016)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dmFXd2lSa0MzbmN5V1NyaUFPUk85UDJkUVFLYmE2c1grNGs5UlNDTi9QUGZF?=
 =?utf-8?B?T2pkUDArL0RpZUp3aUtxa2VnRVFCYVc1TlFoeG1jNm9yVGtPMFhWY05YWEJn?=
 =?utf-8?B?NEJreU9XQ0RPbktXSUo1eFQyZ01tRXFhTFE1OXdpWkR6UG9qbXllNGxkZGdp?=
 =?utf-8?B?VFl1WU90MmQrekxHcjFCWHRsVWlXaXpiY2QyQXhZZWt6NGJlT3JSV3NmcndI?=
 =?utf-8?B?MThoWTRHZ0h1a1JZR3pTaGZXOURuWDJvWmpMVlVuQ3JvUVN0WEQ3UjFqTTk1?=
 =?utf-8?B?RjVGSWZoMVhqMUpTMzJWTG12Yk9wTVN2OWxhWXQ3Vm1oYksxVjQrUjhhYnNx?=
 =?utf-8?B?dDllWUp5QWZjWUVRV3ZZR3Q3MTB6Y1BLWlAwc3hDZ1BBUUp0V28xUkJEbmdX?=
 =?utf-8?B?Y3dIM2lRTm02UFJ3V3pIRC9xL214S0tMa29lZ3hpb0ExdmUyMkRtWkFSVG9w?=
 =?utf-8?B?ckE5TjMxTkxxWmtDSE44b05CM3pNZXIxZXptcTlFUjZseDFzVkVGL0EvNFZL?=
 =?utf-8?B?UUw3QnI3QUh0ZXB2N0o1dExDektleTZPTkRGaTVsL1pLa001WUdLWFlUUU41?=
 =?utf-8?B?SXkrYnVPMjJBOFQrQ0wwcUVGMldqMDErVS91bFRzYmtTNC9zTVRxZTc3dGVW?=
 =?utf-8?B?cFhTZGF3azBESnhzNk95VlZCVnlOSi9uc0lRZCtQQjZCRzhIbU1QcHJPd2xB?=
 =?utf-8?B?aVZ5eUI0aFlCSHptSmFNcmMyUG85ZHdFbWU3ZHFRdUZML2NUcTgvQit6aUl5?=
 =?utf-8?B?OU5tT2NEWTB1T25UaGFBVXZMaWNpSXJ2SjVBL1JuVkVoRVFNM1o0NmxIVDdK?=
 =?utf-8?B?UzVsU1hsNFlQb3VqRTU3bmMyZGxtTlQwOEFETGJxWlNkMlg1WDVLZk1DUjVX?=
 =?utf-8?B?dEMrOTNGTnF1M3RIbXR2S21FS3FLOVRNS285V0ZCVnZsSDVhZVFRbElxNHZ0?=
 =?utf-8?B?ZU5hQUoyZC9ueSs4MVlhOWZmTjlnU0UrN2xWNDdoOUNCMU4wWkR4MDBFRzl1?=
 =?utf-8?B?QWw0VW5lMUdNYmk5c2xnMWpzUWc1aG5zN0xIQWdJNEJzWjNSN0lPVDBqQlR0?=
 =?utf-8?B?NmxEajE3OXdYUm5jNWlvd1FRRzN2SzkvSjV2UWowZ2wwdmUzUWdwSDJQMkpF?=
 =?utf-8?B?eHhCZXlRMlJBTm9GOVJpcmlVOERsTVgyaGdhbHM1QVZsOFpEZ3lpWFRVMlZX?=
 =?utf-8?B?UmlZOEI5RDZoU3docGRpa1VmemdUTGFwcHc5YmdWVDJLVTI3Z3lCOUZ4Y2k4?=
 =?utf-8?B?RTRTOFZ6WHpoNXF4OUpYKzRkV3BzRzNPQzJTNWk0QUk4dXdnbE5XeEJZYW1V?=
 =?utf-8?B?VEVSbmxaMmtEenJkMlhNaXdxcjJ4V1o5Y2kvZXlkOWorQkZuN3lnUWpFcnB4?=
 =?utf-8?B?RjJZQ0cybkpEcmJEUDZpQnJ6K1RNT3NCclhYd0ZTY096MDJBaFB0ckJhSU0v?=
 =?utf-8?B?ejM2Qk9QcDFid0VmTE9JV3lwVXdXM0Y1VnJxNkxLYXZ0bjJCSFNzU3VqNkpz?=
 =?utf-8?B?NG1pRGs3R09oQnhLQVFhZVBIT0hBUXlwRnVPcFJ2aW1XbFNVSkZJeG1Ka2sx?=
 =?utf-8?B?QW1NWVAxbG04a0s3d3I4TCtZb05lK0srS0NlMnR6clF4R1VlUWh6MnZFMEpq?=
 =?utf-8?B?K3RGM3lOZE1ZTTdydDMvYTBmRlBXaDFKYkE0ODFUditHd1BwUE84cVhEeWNw?=
 =?utf-8?B?NVArUHN0N09vTTRPYm1xZmxYcmVMOFl4SkVIcVlRTnBUQ3dJemxUeUlENG4z?=
 =?utf-8?B?Y1d3R21ZdDFodzJDZmF1QzI4WkFxa0RNcDgvcDFFejVHSEF6SVdKZmg4ODZL?=
 =?utf-8?B?OHdXMzNucnJuTU5OVkg2eTh0UmVaa3krM1N1bmtPL2JjQko3L0dqSVhkYkpx?=
 =?utf-8?B?QzVKY09RdlcvN2lPR251aFZDSytxTnEwWERLS1QxKyt2K2k4TEdlblBtdTJi?=
 =?utf-8?B?b0ovdGo3K0VQQk5MMlc2cWg1K1kwZ1VSMDI0R0RnTWZnMk1WYVZDNFZHSGdw?=
 =?utf-8?B?RHlBZHdKeFQ0d1RvdlVJNVlyRkxXWHArVUZpNDdZZzRUZ0hqNWZlamYwTzdx?=
 =?utf-8?B?bW0ydzBSbUZZL3RSZzRWclJpL2VPYlYzMUtLcDF5SHJtK1owcWZ0M3hhTGZC?=
 =?utf-8?B?Tjc1NlpqUkkzaG5RemVBbzBNa3dneU1hSHJsLzc0YzhDV1U2aU9MWGMwT3hG?=
 =?utf-8?B?ZFcvVDJYT0lTSURUdDRpTk9VM3lkMWUwdys2bnQveFJKMGo1WG1oVlhXaFhr?=
 =?utf-8?B?bWN1SXo2YkpmSnlWMmZDYm9hWXQ3OGZyeE1iNncwcVdvMFpNS1l2bHNSdUZY?=
 =?utf-8?B?NmJQaWNXc1B5SE5QVWxacTNGbXkvdUs4MllwZWcrMno0Z1pYMm1Xdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d17ca92-d8f2-4ebc-ff91-08de6e51245b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9231.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 18:19:52.1461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tzp3CP1/sDqTmv05vNFwfAaOzqw1fstpT5D6FyAL4WOZyFCytAMfN9So0MWahgHw5NSOMbo+Iw40Ula9Ar+NRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8925
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
	TAGGED_FROM(0.00)[bounces-52990-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 07EC814F00B
X-Rspamd-Action: no action

Hi Sakari,

On 1/13/26 14:30, Sakari Ailus wrote:
> Hi Mirela,
>
> On Sat, Jul 12, 2025 at 08:08:15PM +0300, Mirela Rabulea wrote:
>> Hi Sakari,
>>
>> On 6/19/25 14:57, Sakari Ailus wrote:
>>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
>>>
>>>
>>> Add generic raw pixelformats for bit depths 8, 10, 12, 14, 16, 20, 24 and
>>> 28. These formats are CSI-2 packed, apart from the 8-, 16- and 24-bit
>>> formats.
>>>
>>> Signed-off-by: Sakari Ailus<sakari.ailus@linux.intel.com>
>>> ---
>>>    .../media/v4l/pixfmt-raw-generic.rst          | 398 ++++++++++++++++++
>>>    .../userspace-api/media/v4l/pixfmt.rst        |   1 +
>>>    include/uapi/linux/videodev2.h                |  10 +
>>>    3 files changed, 409 insertions(+)
>>>    create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
>>> new file mode 100644
>>> index 000000000000..8561233f5262
>>> --- /dev/null
>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
>>> @@ -0,0 +1,398 @@
>>> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
>>> +
>>> +************************************************************************************************************************************************************************************************************************************************************************************
>>> +V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_16 ('RAWG'), V4L2_PIX_FMT_RAW_CSI2_20 ('RACK'), V4L2_PIX_FMT_RAW_24 ('RAWO'), V4L2_PIX_FMT_RAW_CSI2_28 ('RACS')
>>> +************************************************************************************************************************************************************************************************************************************************************************************
>>> +
>>> +
>>> +Generic line-based image data formats
>> Looking at the generated documentation, this does not appear very nice:
>>
>> https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/userspace-api/media/v4l/pixfmt.html
>>
>> Instead of 2.7 V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10
>> ('RACA'), ....
>>
>> Would be nice to have "Generic line-based image data formats" instead, I
>> think that should be the title.
> Interesting idea. There will probably be (much?) less use for the non-raw
> formats though. I wonder what others think. It'd mean re-naming these
> macros effectively.
>
>>> +
>>> +
>>> +Description
>>> +===========
>>> +
>>> +These generic raw image data formats define the memory layout of the data
>>> +without defining the order of the pixels in the format or even the CFA (Colour
>>> +Filter Array) itself. These formats may only be used with a Media Controller
>>> +pipeline where the more specific format is reported by an :ref:`internal sink
>>> +pad <MEDIA-PAD-FL-INTERNAL>` of the source sub-device. See also :ref:`source
>>> +routes <subdev-routing>`.
>>> +
>>> +.. _v4l2-pix-fmt-raw-8:
>>> +
>>> +V4L2_PIX_FMT_RAW_8
>>> +------------------
>>> +
>>> +The V4L2_PIX_FMT_GENERIC_8 format is a plain 8-bit raw pixel data format. This
>>> +format is used on CSI-2 for 8 bits per :term:`Data Unit`.
>>> +
>>> +**Byte Order Of V4L2_PIX_FMT_RAW_8.**
>>> +Each cell is one byte. "P" denotes a pixel. + +.. tabularcolumns::
>>> |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}| + +.. flat-table:: Sample
>>> 4x2 Image Frame + :header-rows: 0 + :stub-columns: 0 + :widths: 12 8 8 8
>>> 8 + + * - start + 0: + - P\ :sub:`00` + - P\ :sub:`10` + - P\ :sub:`20`
>>> + - P\ :sub:`30` + * - start + 4: + - P\ :sub:`01` + - P\ :sub:`11` + -
>>> P\ :sub:`21` + - P\ :sub:`31` + +.. _v4l2-pix-fmt-raw-csi2-10: +
>>> +V4L2_PIX_FMT_RAW_CSI2_10 +------------------------ +
>>> +V4L2_PIX_FMT_RAW_CSI2_10 contains 10-bit packed image data, with four
>>> bytes +containing the top 8 bits of the pixels followed by lowest 2 bits
>>> of the pixels +packed into one byte. This format is typically used by
>>> CSI-2 receivers with +a source that transmits MEDIA_BUS_FMT_RAW_10 and
>>> the CSI-2 receiver writes the +received data to memory as-is. + +The
>>> packing of the data follows the MIPI CSI-2 specification. + +This format
>>> is little endian. + +**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_10.** +Each
>>> cell is one byte. "P" denotes a pixel.
>>> +
>>> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
>>> +
>>> +.. flat-table:: Sample 4x2 Image Frame
>>> +    :header-rows:  0
>>> +    :stub-columns: 0
>>> +    :widths: 12 8 8 8 8 8
>>> +
>>> +    * - start + 0:
>>> +      - P\ :sub:`00 bits 9--2`
>> These elements of the table do not show up nice, perhaps adjusting the
>> widths would improve the readability?
> Hmm. They seem fine here. Which browser are you using?
>
> That being said, there are issues with wider tables below. I'll try to
> improve this for v12.

I'm using firefox, looking at 
https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/userspace-api/media/v4l/pixfmt-raw-generic.html

I'll send you a picture with what I see.

Regards,

Mirela

>>> +      - P\ :sub:`10 bits 9--2`
>>> +      - P\ :sub:`20 bits 9--2`
>>> +      - P\ :sub:`30 bits 9--2`
>>> +      - P\ :sub:`00 bits 1--0` (bits 1--0)
>>> +        P\ :sub:`10 bits 1--0` (bits 3--2)
>> Is this intentional? It shows up as bits 1--0 and then again as bits 3--2. I
>> think this should not be on 2 rows, it's not readable. Same comments for the
>> remaining tables.
> I'm not sure how much we have control over how the browser decides to wrap
> this. Perhaps adding commas between elements could improve readability?
>
> --
> Kind regards,
>
> Sakari Ailus

