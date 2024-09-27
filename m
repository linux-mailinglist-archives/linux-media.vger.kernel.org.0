Return-Path: <linux-media+bounces-18698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB809885C1
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 14:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E8E11C224A8
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183B318C932;
	Fri, 27 Sep 2024 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HiLYOI+R"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D389918C923
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 12:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441788; cv=fail; b=dZneVLRvnXOvEQZVyYIJuBTI8mK8aiB+MrKVRpd433/aJc2bGkofe2o1ICG6UbGaYWEf3XrnUEo6FUHNr9gMA0hzT24ZDOryruoqzr/Re9RRLLN1VXhwCZZTskmnLjMhOZ8NPsej9U1HJrmcr9IYDry3cSTXZW/lN0IvlouBkbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441788; c=relaxed/simple;
	bh=1MLy+eJWSiUTHHjNSAuzEiUTVs7GM7jKwGlA6fSn7Mk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g6yIbnHuNVG6thu2HRY9XhNch8MFBzFE8CmJgrfoIwVPhXAfWSoiAqDz+IzeJs3ej4Y3DYQ5z3r9KObwzZ3PDDgu1kcZSM7e9epwSf4Bsi0xn4Bq39u9Xi7XyHOPqBG4Ep0+lYP1W5dJy272oGMrvmYC5vA5iWgE4zKb2hx9VXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HiLYOI+R; arc=fail smtp.client-ip=52.101.229.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xytEbo1CPztSVxXB1t9CQ4Hnf/Qe6pImQ8Psoz1tRbBH8WToYqS/OM1dEX0H8JMCRbG/TLqFP+mfSsZNUV+4gwK1JK3I/lRffyFFlnTuZqv053DR4OabYs8E7OXMwd6zw0DqbU5ZQgMMY+LGJUeN7zOQnFwdPou41YMh1Gpkmz6tTtQXA/I2lJr2wF1GCwGG+wG3ougWXUD6LEe/UjdgdqpGqJAUuo0GX5ja/yCRKHJ0J1PBtuctRDkBsw2zLkSNSLsaJfNfklMst81cwYpsOvE7ZoqqMbjtzfZ4/1QzbYnmBZK5TtZFDJ0FRk0rieXWYrtHlNm61qWmD++YhDDMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MLy+eJWSiUTHHjNSAuzEiUTVs7GM7jKwGlA6fSn7Mk=;
 b=ZeIhKJthp3aimmsLJ7bR5gGzUciEJmLwH0gb6Pxz5Hf8aIE7rbEFNz/HMLx+Pj7oalPFPe6lq6Z3viSBIGvlKxdvcYzUgvteslObwx2NeItCpYM7ou/pYagcVHKy+2nUeXBWtbHHuu7SBvtIHNkNkPmdoaljGlON70rDBwkof+IoW/g3H9DE3TRbt0zmfoearDna0zLB2D31smOjqIBZDfPlO9/P731Seo2GWS1lzf718nPbEcpfsQbDy+mtlWY0JcmY+LsDZBtNVy1MjlnlgRkRqaO/QrO9+UkvgmastnnkqHIR61s19hnWvNZx228I0zKpBGbZAMgkazPfDtFdsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MLy+eJWSiUTHHjNSAuzEiUTVs7GM7jKwGlA6fSn7Mk=;
 b=HiLYOI+RIgM6W+hYAPPxPp7jK8GQAaAwOO5Sj+fw2+Oc+gNq1KgUwpyWDIQ6JX6wZ/kKikiPDqGl8o6lTB5AZJnoCTpjcfDbYuUTkJbFpVqsQ/DqLupcHDTZ+DyTUb9FqOuyjNT4NphGWVKMcdyFMoTMMcbkINNDeBUGZjO9duo=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by TY1PR01MB10898.jpnprd01.prod.outlook.com (2603:1096:400:323::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Fri, 27 Sep
 2024 12:56:21 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10%5]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 12:56:21 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>
CC: Daniel Scally <dan.scally@ideasonboard.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>
Subject: RE: [PATCH 4/4] media: platform: rzg2l-cru: Add support for
 RAW10/12/14 data
Thread-Topic: [PATCH 4/4] media: platform: rzg2l-cru: Add support for
 RAW10/12/14 data
Thread-Index: AQHbC1pz0CUtG87WQkiGPqRZ/EP6FLJnA0OAgAAIYICABJZksA==
Date: Fri, 27 Sep 2024 12:56:21 +0000
Message-ID:
 <OSZPR01MB70192337E9D58B6CE95049D2AA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-5-dan.scally@ideasonboard.com>
 <k6nxxivka2abylkncwrvukra5xr3wambnroop5wxe6dyg3gkci@au6kxu6oigkp>
 <20240924145101.GG20255@pendragon.ideasonboard.com>
In-Reply-To: <20240924145101.GG20255@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7019:EE_|TY1PR01MB10898:EE_
x-ms-office365-filtering-correlation-id: 8ecae199-672a-4582-729b-08dcdef3c91a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?am96MkVXUXdhUnpLeVFCZDNOenMxd3pmNVRXclNZcFI1SDk0bkFPWkRhY0ZW?=
 =?utf-8?B?MDhQMXgyMW8xTDgzQ0V5TC8xUTRWcXRhdGZ1dC82dkFuZW9aOGp3eHo0QWZ0?=
 =?utf-8?B?TWkzZnMrUldRbk9xVFNjV3gxd3pvZlYzWWFkRFhqVlY3WmV0M3VmNEpXS3cz?=
 =?utf-8?B?c2k5bnpFT0xUd1dHd0xsUnBPb0M2aFl1L3Y3TXQ3ZVlHNXJiWG9XazU4cTVE?=
 =?utf-8?B?OUN5dEhLc05LL3lzV2JNK2FDUjF4bjVuZ2todW1QSTJDZi9ZMkcwbXRZVndP?=
 =?utf-8?B?UEpPUHlOcmxKc1JqS0g4aDRYQm1yY1lEaXE0MzFvbDRVWHdLZ29meHRBOHJt?=
 =?utf-8?B?bDNnbGxkNU95MnlBbGtqSzRUbjk0U3Q3a3BoSlpJUmxDRDZIMTllRXVoeVFh?=
 =?utf-8?B?Q2hVbGszQWk4cVFjSWp4a2Y5clphOVJzU1ovSXVNY0JpMDNjWVdDdnlleFA5?=
 =?utf-8?B?S3V5MDNSRTk2MTAwYXFIOFZSRXg2VkU0RWVnWHJ5YUhtbXVvaGZhTlAweXYy?=
 =?utf-8?B?VUN1NHNDdWZCRE9qejJCRHpIWmVYNmUxR3A4bTJCT1lwai9MdzBrTkd5SXFx?=
 =?utf-8?B?Y3BoWk94bE40bDFlZk1wTUhPL3VxMUIxTjlQWGJiZ3ViVnBvSFJuTVllYTVw?=
 =?utf-8?B?ZkhIb2hXdnVETy9URG5nVnZURlFqb1VncmkxSlJQV3E5Nm42WFVGS0JvTjc5?=
 =?utf-8?B?TWN4eWdIWDAyMnBmRk1BalJobTdMUy9CdFRyR0NobDFPbHl1dWVvaWFyd0ZI?=
 =?utf-8?B?aGNFanlSZ1pIN1hsYzBEcmZ5WGNqalJXaGlZOUpBOERkdGtpRW5SK3lTdEdV?=
 =?utf-8?B?dkpidDZ1K0hDZkc5MkZoWUxhb09IQ29HL2cvb1JlNUJmWExodnV5SXRBS0Ev?=
 =?utf-8?B?a2FEQzduSHdJVzd4Zmk0TnlHS1R0blljdnFvWjNwTzNpNjNzMDdOV2JHVmZm?=
 =?utf-8?B?YkJKcEYzaDRIdnl6Mk1zZytUS01RYUw0ZjhiUG1Tam5raW03V2N6L0JhbjM5?=
 =?utf-8?B?L0Irbzh2bVZsTjlzVmlKR2RpSGNXR0VkZy82SDFPWmRzUDRCV1cvTU5DUG5S?=
 =?utf-8?B?RTQrb2ptV0NabkhPazFxd3BWd1JzemUzNmRJVFJaWi9sVDVpbjhXVldEQ2Fy?=
 =?utf-8?B?T3NId3paVlhjNi9wQUNGQzFzT0tncHd2bHVqOFhrK2dDYzdDQXpMVC8yQjJp?=
 =?utf-8?B?SVR1V09wMU5nSGIrNGNCMVIxWkREWmdTZ3ZPcFlObmQ5SUJoTHVwdktqQUNP?=
 =?utf-8?B?L2ZZaTJSKzNQSlREQUN5YzB3dnJoU3k3akhtbktUblcxZjExUCt2am5GYjVO?=
 =?utf-8?B?dGpRS0EwOFY2YWVyK3NDeWhLY0dhY1VicFBVK053L0toK2VkZU1iR0pvN0RP?=
 =?utf-8?B?OVViMlVtK0tjUkJ2bUNJejZ5T3BPRUVCMGV2NlZBTkRjcXNsTFRVdUlFUmhv?=
 =?utf-8?B?WUNRY1NYVmwvbWpKSzVuTXBaMzZ4MVpXbHlqc1JxRVBLbEt5aUN1ekpEMmlm?=
 =?utf-8?B?R0M5Si9XblhvejVzaGFDSmtpUERNMnAzZ0Y1Rmh0am8xZnlVSDdjeTc2VVBT?=
 =?utf-8?B?MW9sdTRUNWp2SFhRQUpPR2VXTldmNXhaRUdmMU9kUWtHZU0xdGduNDVNZVVl?=
 =?utf-8?B?YTFpM0hHZ3M3aUVBWXNQR2htWSswMENEc1VtMC9OSmlBMTU1YW93MkVnODBF?=
 =?utf-8?B?VE9vVDRIalhmRDEwd0VYVS81aUI0eWxYSGZOUkljZmkzOXFHSUZGSFBZSVhw?=
 =?utf-8?B?Q2tkRE9rRW5hL2N2cHdTSWVnYURIUEgyTlVIN2dUNkxxMXdaZTU0TDNGdFJZ?=
 =?utf-8?B?bkRZNzV3YTNPYUlKNVVlUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGx3T0dsVDh0dzFXeEFWeHgwMnIraW95OTVxM1kvcWwyclpxWU5TcC80K1dK?=
 =?utf-8?B?N09lQkh4RHNZQldOTkU5TXVyL3Myd2EzZk9nemQ5VnBkclVlTzNKemZIQ1Ey?=
 =?utf-8?B?djg3eTFNdm02RUxFNDF2S1EwakZ5dVh3VUhlSEVkdXFPRnAzWWlvY1l4dTlM?=
 =?utf-8?B?d3BrSllWeG8yU05oSjJmQ1RoMzN3OUxYVUlTSUU0YldNTnhkUnpOZ2REY2tt?=
 =?utf-8?B?Kzc0NVNaN3MzTS94bUxLWmNXd0pNc0ZrWlFGbEtTVjJ5cTYwblFHQnJYU28x?=
 =?utf-8?B?MGdGLzhiVmJFVTMwdmRpeFJzOENncUpNTFAvUS9kOGdGWDl2Z0hrTzNFNXI4?=
 =?utf-8?B?RmFocG5kOVFvNW1zNk1lc0RlSE9samJ0RU5wU1F5Y1g4aFNTdmY1STZLSHZv?=
 =?utf-8?B?cGk5cFEwSkYydDFFL0ZOWEc2dlBqazJJVUd6cllVeHJYdGZtbEFlNlhZRnda?=
 =?utf-8?B?Yk9WWk9ZWlYvRVNzU3kzMXQva2pYMjkwb1BRU3E1b0grWVUxK0cyaSthcEVp?=
 =?utf-8?B?MG90Um9nWG95c1BHd1BKaFN1ZERlcVRhanlOcTRHc09PemxCUkRiNmc4Y3cx?=
 =?utf-8?B?cy84aXp1cDdRam5ZeXlKVW5rWS9UTndaR1dWMGFTNkNhQjlybXZLam1PakpM?=
 =?utf-8?B?dUJmQlZoTnByc3poaVJrNm9XVE5idEVsM3h5NCtTWWRDL1pJVEtMbU11aUpx?=
 =?utf-8?B?Y2FURythNmFZK0dic0h0MG9mYzNBSndVN0ZZTWZMT3hyc0FKRE5YeXpHS1dw?=
 =?utf-8?B?VnZ6cWk2YXBwWFJXd1NabHgzaGdsRFFQWXJBUHZKYjAwaXoxalpQandiSitR?=
 =?utf-8?B?OFNtMkdBN3hkWDdHSGxFai8rUFNNNkZ0UWs1WVcrN1VMbVViQlphd2tjMmkr?=
 =?utf-8?B?NG03Z0NjcE8zUmVwcGVPNE5uNXFTeVBwRlFpZkhxUFBRd3p2eWIyb3MwNy9w?=
 =?utf-8?B?cXNBTXJLc3hZVWdQWjFWUkoxR1IxQkkzelQ1UHNmZFFBSi9VZW9zTjNaSW5Y?=
 =?utf-8?B?VWg4MFhIUDhTdENQZHNoNHZ1UXRDYVEzeVhLcHdpT2Nud0hlWXBVUXJUTGxY?=
 =?utf-8?B?RXJOTk5oTzhxR3JhbHlVSFBQNHE5c3hQa2ttYXlEdE9mU2g2c0lQZFdRZm5F?=
 =?utf-8?B?TWtSSVQ2WXJFVi9ES1djOXhKbTlraWxQTzFGV05tV1JZcVZHdXRPZHFGOEVJ?=
 =?utf-8?B?eGNaeUZPTDJSTWNFTmk2TjlEdHFzc3RFdEppdXRJdkx5eWxqam9kYktyVXVY?=
 =?utf-8?B?MEhxMUUyODFBYmxhMFl3TmtmU08ySWpOOHFlcm1JZm43K1RTZ1lkSllzSW56?=
 =?utf-8?B?VDBMRnNLVHVRTG5RMU5EakFSdzFSWmVMR0hWV3E2eFUyb3ZQZjdVMlB3UU5O?=
 =?utf-8?B?Z0JEdFJzMVgwVXc0bnhMa2RnRnRCS2YwSGlhaHowREcxaS9xaGpMWWJBTkVB?=
 =?utf-8?B?VlIrK1ZTVzhOMHJ4UEo4Y1lWeC9OMUtrNHBpYit2N3U4ZlF6RE5yc1dpQ2Z4?=
 =?utf-8?B?ZllzTHJ2MldqbHM1NzVxQWlrS2RaRzdReVI3VER0NHFTejQvd3d2TERSY0Zo?=
 =?utf-8?B?a2pWWUw2VEYyWkQ5dzl1b21HSkttaGFOOGdmN0tJbFoxNDdTREVyQzZaOEgy?=
 =?utf-8?B?Q1BWbnAwNTlsYTRaZGJtQzVyeFlWZzlGYWJtUjZESFp4M2hWSExwTVhqWGRt?=
 =?utf-8?B?d3JONWtkR2tPbHF4ckdXOEI4Uk5WdFZIYklOWEllMkQyZDJ5TjNHbkVqUy9Y?=
 =?utf-8?B?Y1M5QnY1cFVlWUx2cnlqQ0JKRVVUNDhBWmhUZ1RnclVIQnBJVFZYQ2dwUE1z?=
 =?utf-8?B?WHp5VHpmb2NwTUJNN1JaWGZNb3BSZHJWNE9ZWnNweXlxUTlKTHRWVVRDVC9S?=
 =?utf-8?B?RmhEQ1BRYmwvQWd0YzVYWXM4REo3K1lRdTY3QnBZbkdkc0FETjFVMTRGTDlt?=
 =?utf-8?B?dktudU5ZcExBRFpJUVpDMjZNM2E5MWZRNXh5QzZGVmlYRllFTWlkRnRNdUha?=
 =?utf-8?B?Y2NaRmpDYUQzai8xUzhuemNycC9tQ1gwbVpYVUpWUmZwdUJuODFsaU5NOUhC?=
 =?utf-8?B?UjdmY0tMTlR0elg2R2krR3IyRmRRWnpPNFFTT3BXZXpGOTJoVWh2TjV3Nnpr?=
 =?utf-8?B?akFiTXl6ckRseWlSN0VHNHZ6R29ieGNJL3poVGNxRUw5dWtOVE5LbllVRU53?=
 =?utf-8?Q?9eD6jqa9C5zhywA69lndrME=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecae199-672a-4582-729b-08dcdef3c91a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 12:56:21.1515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OwZFyriRupx7mfO70mGvaWSFDNdnPEu9NQ+IngWHR784Oy3dT8/9CCWdxlFbSwDFuZVgbr+EVWJdb+YUHf1fhKyJoCO0GwXv6pRt7xoVPZ6e3ih3tPtbDtfF+ZDyNzDd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10898

SGksDQoNCj4gT24gVHVlLCBTZXAgMjQsIDIwMjQgYXQgMDQ6MjE6MDNQTSArMDIwMCwgSmFjb3Bv
IE1vbmRpIHdyb3RlOg0KPiA+IEhpIERhbg0KPiA+DQo+ID4gT24gRnJpLCBTZXAgMjAsIDIwMjQg
YXQgMDE6NDE6MTVQTSBHTVQsIERhbmllbCBTY2FsbHkgd3JvdGU6DQo+ID4gPiBGcm9tOiBEYW5p
ZWwgU2NhbGx5IDxkYW4uc2NhbGx5K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+DQo+
ID4gPiBBZGQgc3VwcG9ydCB0byB0aGUgcnpnMmwtY3J1IGRyaXZlciB0byBjYXB0dXJlIDEwLzEy
LzE0IGJpdCBiYXllcg0KPiA+ID4gZGF0YSBhbmQgb3V0cHV0IGl0IGludG8gdGhlIENSVSdzIDY0
LWJpdCBwYWNrZWQgcGl4ZWwgZm9ybWF0Lg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBTY2FsbHkgPGRhbi5zY2FsbHkrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiA+DQo+
ID4gTWF5YmUgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGZvciBzb21lIHByZXZpb3VzIHNlcmllcywg
YnV0IEkgc2VlDQo+ID4gcnpnMmxfY3J1X2NzaTJfc2V0dXAoKSBwcm9ncmFtbWluZyBJQ25NQyB3
aXRoIHRoZSBVc2VyRGVmaW5lZCBkYXRhDQo+ID4gdHlwZSA/DQo+IA0KPiBUaGUgZnVuY3Rpb24g
c2hvdWxkIHVzZSByemcybF9jcnVfaXBfZm9ybWF0LmRhdGF0eXBlIDw8IDE2ICh3aXRoIGFuDQo+
IGFwcHJvcHJpYXRlIHJlZ2lzdGVyIG1hY3JvKS4gSSB0aGluayBJJ3ZlIGNvbW1lbnRlZCBvbiB0
aGF0IGluIGEgcHJldmlvdXMNCj4gQ1JVIHBhdGNoIHNlcmllcyBmcm9tIFByYWJoYWthciwgYnV0
IEkgZG9uJ3QgcmVjYWxsIGlmIHRoZSBjb21tZW50IGhhcw0KPiBiZWVuIGFkZHJlc3NlZCB5ZXQu
DQo+IA0KVGhlIGNvbW1lbnRzIGhhcyBiZWVuIGFkZHJlc3NlZCBpbiBwYXRjaCBbMF0odGhlIHNl
cmllcyBuZWVkcyB0byBiZSByZXZpZXdlZCkuDQoNClswXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNDA5MTAxNzUzNTcuMjI5MDc1LTktcHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJw
LnJlbmVzYXMuY29tLw0KDQpDaGVlcnMsDQpQcmFiaGFrYXINCg==

