Return-Path: <linux-media+bounces-13764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A67F90FA23
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 02:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A0C51F22116
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 00:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE00EBE;
	Thu, 20 Jun 2024 00:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Cw6rDz8W"
X-Original-To: linux-media@vger.kernel.org
Received: from KOR01-SE1-obe.outbound.protection.outlook.com (mail-eopbgr810102.outbound.protection.outlook.com [40.107.81.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4847F8;
	Thu, 20 Jun 2024 00:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.81.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718842290; cv=fail; b=fwt6Q9l10+pUXhHsz088iUQJr0iqVMhdQHxfKGSsoqiGL1DQxcUUPfxqJfMCYaNAI3iTubNToBAp+Dt1qfcWBn1MiF6vkz5xrq+KR0Dnxg74WtdohFwhkldbg9PVtSUt2+HqYOGc9BcZ1YxA7XtJIV1Xilg4l4Mtuy0HLMT0ugA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718842290; c=relaxed/simple;
	bh=KcGpYLop/ZHHv1RTS0Up6j0KfrvqlhSuUI1JH+CoXnU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mZhq3R2DAFXXxxfSg7GglPCVDWIqeKQCxIo0zgaxGl4Tx+lXOCYuNOqlFiC2+zwq6Y0PrF5AVlxp5EjunkTqoxlHs137uDbtf6WZ3T1A2/+1Uwo78MOga3V6rxWt1s2nHxJ6KMktz2dkdRa9Gf7w73ZpVkZvd/E3i9CkljTgHCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Cw6rDz8W; arc=fail smtp.client-ip=40.107.81.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOqclhIMxK7wf5WkmUFhxzpFG1qpAiuV8MNrD29rQQcL4vewb4oBZH8fk7SXD1JV/+aTasM+xRi7BhpzCsFEOXoCN1M61wXwyA7nepk5p1AMbLsQyt8AxqKzMu0I3nOzK5oXyyoKh4CzDGnJ3Ns3XTT3Ol4qZBfiblf5+NwJtZvxEr93Cf40Xg572cSBf1rBxiDaL047heG0H1cruy8zEep7ToqIBQvFLogbRx30Akh3/unMMCo2I5PBJKi636OSxu7VCuLTtVXVQ2v69tInmFwlnGFmP6Lz8DP4m6rqVfz6+6xP+q1WxurO8Phb59ewTCqzm3cSmMJ6hwVMiBYI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcGpYLop/ZHHv1RTS0Up6j0KfrvqlhSuUI1JH+CoXnU=;
 b=DnP2e3TpVolEk3Wz1b7UT1bZroDeotb4fmUybR7z+2pC+SowkNCYDAy0gAJvWgWsav4yLbwavzveTWE4LC2eVt/sT6Py9tAUqopemPDk2/BsYoZuMZgBO9BP/I7uppwSrukc25H1HOuZz8epkiBVD5W+yrNp/SEL1QLFeY0rZxUEoxdHePn1P0YHqkFMr7SCBSiU6qrEgyvpUwHKY2twSm5DZ25CBSThx1XfEV4du5pKbzeSh6qm+oGhY00mfppUMg+n2zQ/79G2cXfsgee8QOQ4sudkzoJWchxhIWyNX0hVIWZhGx8p3/lKYnnJnZWgMZmYZRwnFTHs5cd0XUh6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcGpYLop/ZHHv1RTS0Up6j0KfrvqlhSuUI1JH+CoXnU=;
 b=Cw6rDz8Wete7SdjIgeiBSDx5XRbP3gF8cBK1hEGM7HtTCx+hNcyVE50fcxkctL+WbkwSb7IjvW+9KuFe7YOv+YIk52cBcSAUZtrzrYx/gEEZ4kHUXQoBA3T4WvEHGhVljAjFmpUEaiSWXRiBFDWADb+g0mxTz+InRU86UZQ2o8c=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PUYP216MB2786.KORP216.PROD.OUTLOOK.COM (2603:1096:301:159::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.21; Thu, 20 Jun 2024 00:11:24 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 00:11:24 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Devarsh Thakkar <devarsht@ti.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"b-brnich@ti.com" <b-brnich@ti.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>
Subject: RE: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Topic: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Index: AQHawKPhLOcR91s1hkK9DSaFUGSwxrHPD/CAgAC0SbCAAATQUA==
Date: Thu, 20 Jun 2024 00:11:24 +0000
Message-ID:
 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|PUYP216MB2786:EE_
x-ms-office365-filtering-correlation-id: 09d50c22-0500-4e26-ced5-08dc90bd85c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|376011|366013|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?U3VvVERUOTZSMm9ITlB6MExJbUhZK1RqbmRtVkdJeWdNTVI2eW95bG13SHBn?=
 =?utf-8?B?VlhRWHYrRmdVa0Z2U0ROZWVUYmtwQUJtUjBGNkNnc1g2UndxazdNMGV1UkNS?=
 =?utf-8?B?bithQkxMbEIwWExOeVBUTno0anBoK1owQUppaTJ1NWlTUk9QYmlGMlZLclg2?=
 =?utf-8?B?dTNkN1RxMmJBNkVFN1RaWkNJVndVTTRsRjNob1NXNStFU1liNVNEcTY0Q2wz?=
 =?utf-8?B?SVpPbnFxYVoxTmpQMTdYTlIwZ3NBQ1VmSzBEWGhTcjNsY1RRclJJMjdjdStz?=
 =?utf-8?B?eFJ2ajU0cmNWd0lEb0IwR01McTUxSWYrb2VrMW9vbDhjeHAvd2FyaytreHJx?=
 =?utf-8?B?dHhRVUFFalpVUnJnYkZMRGNYZ3Qvb1g0dVBscVFsS3JPNjVJNnI0SWFVLzUy?=
 =?utf-8?B?blBGRERLazNhTXlDUmdPeGpBdFEzNCtzZjRTSVhrSTEwN3RycytDQnJ5MTBP?=
 =?utf-8?B?UThvNVNLbHBMc1VwMU5yRUtEbTBaSTdxZi9GaDZzWmw5K3V0Tm9ScGx6am9W?=
 =?utf-8?B?OXdqaFQzSm9wLzl0R0NWd1RWTEhXYTlsdmhYSEZQYkdEOGJmUDNvRjgzYlhM?=
 =?utf-8?B?ZkpUOGZnbVUreG00SUFzNUtYMU5RMjA2dzZ2TGI5enI1TnczOGJ1OU9mOVJT?=
 =?utf-8?B?MjNudFBheWpGdTg0OFh0Q1VodEtuVmN1NGRWUDhnaGJ0azd0MUdIRWJXczd4?=
 =?utf-8?B?NzBqQWdoUU5JT21OakRHNXRDMDJ5TUJRUGc0L0NHVjh2MjJPQzYveEQvQXg4?=
 =?utf-8?B?SnE0T0c2T0xkaE4rWDVHS2VmdGJsbFIzUXVRZlJPL2pYL05HeFhnUVpDeTFy?=
 =?utf-8?B?cGZ1RjRscnJZWUJoM2xzU3dqSVFRMk94ZzdzRU1YcGdob2pjcDlvSHkyYVl1?=
 =?utf-8?B?Mk9yb01ySDQrY0lJMEExU2szNlRORGRLYjRnRTZtTkM4akJqTEh4MTBkK0M0?=
 =?utf-8?B?bmFRbWh3NFFCU1ZzTWU0WVlBMkVxemFJVUNLNDRGN3FFc1RCMTZHM3RWdzRh?=
 =?utf-8?B?VXFXaVQ1RW9ERHVOc0VIZCtjRTVwdWtLOFFtcVkzZUNiVXhIZE5VdWdiT0tj?=
 =?utf-8?B?dFVXNUYydnNYT3FoUUtLR01pVm5QSW1IOXJlOUhCYVFySXY5YVFLRHdVM1kx?=
 =?utf-8?B?RFVXeXNLVDNHazZ6R1RIMkkyZ2F4RkYzTi82M1dqSW5UQzZRYkliTllpYVpo?=
 =?utf-8?B?ek83RXRwVWZmYlJzaUhPbEdYeXR5a2hteHR5OU9nbU1NNFVENmJNUmcxM2hP?=
 =?utf-8?B?RURpT2JkK1FzaUUzVEUvUEkrZ0RvMTFRSzNZalpDU1hxcVpWbkhXanErYVBq?=
 =?utf-8?B?dEFvS0hZeU5QSmFteFRMTnFmRmFGSGNBaE9TbkpvM3NVMUovZjFyMW8vQmtj?=
 =?utf-8?B?dG96bGRsMEs4MngrMUtMVWZ2VzAxZE80NEhIejRRTG9UVXFjVTd3RDh1TjRV?=
 =?utf-8?B?Zm15c0h4cGFQNzEza0JGOGx3L3NQU3NFU2w2MkdpcEI4elgwdmRFeStWL0Ey?=
 =?utf-8?B?NElPTXdpc280ejNmSTY2K2cyU1ZmOHBiMSs4K1BCcHk0UDdEd1E0UzB0K3F5?=
 =?utf-8?B?OC9RWjdWdW85c3VleFRWcm1BaTM2OWdBN2ZWNWt3QWpIUzRPQ0w0bmRPZHVn?=
 =?utf-8?B?dHFVa2dQa1dFdThmVGI5M3pKWlVlL052QWlWMjdNY01BRHFJUFBFTG5oRG5t?=
 =?utf-8?B?eGFYU3V5V1pKS3g3N1FnbjhyQVVSd3dXUEJnK0F3RlpocVBYeERMVzMranRO?=
 =?utf-8?B?c3JTVlhERW9MWGJMbTBCSkpBMi9kUWxNck82NUh2b2JrUFB4MFpHeGZ3czVw?=
 =?utf-8?Q?3QcXSaI9IrDOkQ4W36TYNv8Otw4/kuPuqV+t0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUFNMzlYLzBncTQ4b0E2RnkvbE1zeUg5QUJtN1djRlBPVHpSSDlTUkRpeTIz?=
 =?utf-8?B?d1YzeHFWb2lNb1VETjJlczJTU2pGaDQ4ZE1UZkh4YnVkd0FOSVlYaWVhQXZm?=
 =?utf-8?B?NE1HdU9nUEI3YW84RERFeWNpS2U0WjhYQURnc3oveWJEaUpncXFZMXZBYkda?=
 =?utf-8?B?akl0WUcvL0EwZEJ2bWZtUE13SnRBUXowRXVSZGRSRWpZWVFKbzNqOGRsVzJI?=
 =?utf-8?B?Wmw1M0s5T2tReUUyTStIaXB2MHdDZ2N5WG5NNHVkRm15cDRUdldGM3VXTzU1?=
 =?utf-8?B?VTE4a1VMeUkvczZBZVcycGJqbmN1MlRxbnZNYXhyWGpNRkIrNnpyK1N4ZjlQ?=
 =?utf-8?B?ZVlDRSs2N01xWnRJTTdnRHIrWnZ2NHFpU2c5dGxjN3dRa2hacVdXeGxCcnJ0?=
 =?utf-8?B?SGc0c2wwWUlCS3hVTytxR2kyMVVkUWFiUEU4OHc3aUtWZHF1Y3kvL3lPQU5n?=
 =?utf-8?B?Q2hvdFpXNjFHenN4d3VTeVJJQVU4UkU3MXVMMVNLUkNUMStaYUMyYkQyb0hR?=
 =?utf-8?B?RHVGWVkwQ2RYV2o2WFh0UFNzVisxZmE1UVkvaUVobytRVDBoSytkM01UYlhz?=
 =?utf-8?B?Q3p6M3hRV1gzME9XL2k5WDB0Z3AvMG5tSWNoTTlCQVZKYnAxWjQ2R3FEWWk4?=
 =?utf-8?B?cE1kMmltcmlkL1ZJMXZtMnhrZDR4QjR2MnZYbGY2SFFuMW80UGJGTTM4OU5t?=
 =?utf-8?B?ZzQ4K1RpakhBMG1xUXNkZFRRWDVzeDk3SDRHazZzVmFUdHhnR3hGTzdnNUI1?=
 =?utf-8?B?WmxNMkpwVTEyekJmWmZCcXl5SzFySnoweUNZaDJhTTdwUXhBUUtzckY2RXZ5?=
 =?utf-8?B?ZVJFRUlTa1FTSjlaOEhvdGd0RmlqOS9iQUNEQ2lKUlhJbnlrZHVYQVJydzND?=
 =?utf-8?B?UlFUL2VtYXJ0bjlkckYza1d1OG16dVpPR1BaZ1BQR0hTRWxWNFNHaVFrVmlr?=
 =?utf-8?B?RzVyVlpOL1VSTlF1eEJnS0VpazdRaWw5SnFXUnNHeEZuVmJMMDVndWxUeVE0?=
 =?utf-8?B?ZHRlc1VJMTNmUXZyQTFDZExSeEZJdU1oVy8vWUtVbkptL2JuY0syVmxsbVYr?=
 =?utf-8?B?akY1Z1VCcitYeDEyeTc2TVRKVHlWMXEvYXNralNBLzBpNjRrOGdzSDhlOUl1?=
 =?utf-8?B?R29XWnBYVUpCQUtPODlxZnR0VkdUYXcrMnZJRUh5cUI2aDBhVlpjWnZOVEx0?=
 =?utf-8?B?THRuZXJ2M2tMWmZHZUpCY0V4R3ZYV3J6VDduR1FvVi8weExnOFVCUzJaYXBF?=
 =?utf-8?B?cXFyZ2VnU2NSRE1FK0lCSDlXU1JWTFFTdHBIRkdieGhVenhLR3pFNEJTbnY5?=
 =?utf-8?B?WDdIcEpQY2tSbzh4dWM3RVZJSHFPSkl6ckJncHBHRHpvTmg3NXo3OGVibGhr?=
 =?utf-8?B?TEY4S0psUEx3eWNneS8wcytGRVJJUFpiSmdGUC9jcGF1WkpSOVBiSmp5cVc1?=
 =?utf-8?B?cldEbStFSTQzMytzMnNkQWlhb3htMGNzY0FDRUx0REdVcHhFb2s4Y3ptT1Ur?=
 =?utf-8?B?dEdsUFg4VUhLdGgwdy9zeXUwYjZhT05Ddk5GVEJ6c1ZZUUh2WnpsczBaNXJ5?=
 =?utf-8?B?T1MwTFAza1pRM1MyT0ZMeVdET0kyaWxva2NEbEtycTMxZzhWeGxqQmZuejJP?=
 =?utf-8?B?ek1oWlZQbWVScWUyeGdZUVRHbllUazF2YXN5d2R6MnpDaUJ4aFpYSGk3V041?=
 =?utf-8?B?eGtrQ1ZyMng4WnpXQTFwMjRlYTE2THRtRVBsajdMOEs3a1Y3VXdGQnZHemdX?=
 =?utf-8?B?U0srVmIvSmJhMFFMdGVlbDMrSXhmS0Q1N3NKK2h6WHhXRjRlYlI4U2JqVlpo?=
 =?utf-8?B?bnF5dWlPcjBaei90L2Z6TWpEdWthcjVQZU5XNlovZFIyWDRBM05GTk0wM3gy?=
 =?utf-8?B?WkRIcURXMEVZQUlnYTZ5eUE2NFM2WFVaYnNXNkZ2U0Jad1ZoNWlRdTl6Z1l4?=
 =?utf-8?B?NHZBNVcxU09kSUM0cE8vZlNLM2RPY0FvYStWajJMNENzWDJRamZ3UHNOVmdt?=
 =?utf-8?B?RzBvUDhiRVkxdm1ZUWgzSHJreFA3UCt4ODFKR3pFb1VRMk16UmpETFRPZ0hM?=
 =?utf-8?B?LzZTTmJodVZjOGlOZEZibGRqN1N6OTNMRXdhZlFqUHFVblV3M3dFT0RLaGY4?=
 =?utf-8?B?Y21XWFg2REJGckF3UTF3WEtEN3djMXdCeEdGM2Y0N2hhb0NCTGI4MW9udG5Y?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d50c22-0500-4e26-ced5-08dc90bd85c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 00:11:24.6811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +VJbswOZVNs8K+G4JWzQ7f+0hTYUeeIeRkq2s8kyajAYkq8BbEuDuYllgAgHiQ+a4Lr/CWhfqAX3emb5LfaY6psyxk+wfjZoMDWpnUiSNr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2786

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogamFja3Nvbi5sZWUNCj4g
U2VudDogVGh1cnNkYXksIEp1bmUgMjAsIDIwMjQgODo1NyBBTQ0KPiBUbzogRGV2YXJzaCBUaGFr
a2FyIDxkZXZhcnNodEB0aS5jb20+OyBtY2hlaGFiQGtlcm5lbC5vcmc7DQo+IG5pY29sYXNAbmR1
ZnJlc25lLmNhOyBzZWJhc3RpYW4uZnJpY2tlQGNvbGxhYm9yYS5jb20NCj4gQ2M6IGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gaHZl
cmt1aWxAeHM0YWxsLm5sOyBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+OyBs
YWZsZXkua2ltDQo+IDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItYnJuaWNoQHRpLmNv
bTsgTmljb2xhcyBEdWZyZXNuZQ0KPiA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPg0K
PiBTdWJqZWN0OiBSRTogW1JFU0VORCBQQVRDSCB2NiAyLzRdIG1lZGlhOiBjaGlwcy1tZWRpYTog
d2F2ZTU6IFN1cHBvcnQgcnVudGltZQ0KPiBzdXNwZW5kL3Jlc3VtZQ0KPiANCj4gSGkgRGV2YXJz
aA0KPiANCj4gSWYgdGhlcmUgaXMgbm8gZmVlZGluZyBiaXRzdHJlYW1zIGR1cmluZyBlbmNvZGlu
ZyBhbmQgZGVjb2RpbmcgZnJhbWVzLCB0aGVuDQo+IGRyaXZlcidzIHN0YXR1cyBpcyBzd2l0Y2hl
ZCB0byBzdXNwZW5kZWQgYXV0b21hdGljYWxseSBieSBhdXRvc3VzcGVuZC4NCj4gQW5kIGlmIHdl
IGRvbuKAmXQgdXNlIGF1dG9zdXNwZW5kLCBpdCBpcyB2ZXJ5IGRpZmZpY3VsdCBmb3IgdXMgdG8g
Y2F0Y2ggaWYNCj4gdGhlcmUgaXMgZmVlZGluZyBvciBub3Qgd2hpbGUgd29ya2luZyBhIHBpcGVs
aW5lLg0KPiBTbyBpdCBpcyB2ZXJ5IGVmZmljaWVudCBmb3IgbWFuYWdpbmcgcG93ZXIgc3RhdHVz
Lg0KPiANCj4gSWYgdGhlIGRlbGF5IGlzIHZlcnkgZ3JlYXQgdmFsdWUsIHdlIGNhbiBhZGp1c3Qg
aXQuDQo+IA0KPiBUaGFua3MNCj4gSmFja3Nvbg0KPiANCg0KT25lIG1vcmUgdGhpbmcsIA0KDQpX
aGVuIGFuIGluc3RhbmNlIGlzIGNsb3NlZCBvciBzdGFydGVkLCB3ZSBhcmUgY3VycmVudGx5IHB1
dHRpbmcgYSBwb3dlciBzdGF0dXMgdG8gc3VzcGVuZCBvciByZXN1bWVkIGltbWVkaWF0ZWx5Lg0K
VGhlIGF1dG9zcGVuZCBmZWF0dXJlIGlzIGJlaW5nIG9ubHkgdXNlZCB3aGVuIHRoZXJlIGlzIG5v
IGZlZWRpbmcgd2hpbGUgd29ya2luZyBhIHBpcGVsaW5lLg0KSSBkb27igJl0IHRoaW5rIHRoZSBk
ZWxheSBpcyB2ZXJ5IGdyZWF0IHZhbHVlLg0KDQpUaGFua3MNCg0KDQo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBEZXZhcnNoIFRoYWtrYXIgPGRldmFyc2h0QHRpLmNv
bT4NCj4gPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTksIDIwMjQgMTA6MDAgUE0NCj4gPiBUbzog
amFja3Nvbi5sZWUgPGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT47IG1jaGVoYWJAa2VybmVs
Lm9yZzsNCj4gPiBuaWNvbGFzQG5kdWZyZXNuZS5jYTsgc2ViYXN0aWFuLmZyaWNrZUBjb2xsYWJv
cmEuY29tDQo+ID4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsNCj4gPiBodmVya3VpbEB4czRhbGwubmw7IE5hcyBDaHVuZyA8bmFz
LmNodW5nQGNoaXBzbm1lZGlhLmNvbT47IGxhZmxleS5raW0NCj4gPiA8bGFmbGV5LmtpbUBjaGlw
c25tZWRpYS5jb20+OyBiLWJybmljaEB0aS5jb207IE5pY29sYXMgRHVmcmVzbmUNCj4gPiA8bmlj
b2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUkVTRU5EIFBB
VENIIHY2IDIvNF0gbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU3VwcG9ydA0KPiA+IHJ1bnRp
bWUgc3VzcGVuZC9yZXN1bWUNCj4gPg0KPiA+IEhpIEphY2tzb24sDQo+ID4NCj4gPiBUaGFua3Mg
Zm9yIHRoZSBwYXRjaC4NCj4gPiBPbiAxNy8wNi8yNCAxNjoxOCwgSmFja3Nvbi5sZWUgd3JvdGU6
DQo+ID4gPiBGcm9tOiAiamFja3Nvbi5sZWUiIDxqYWNrc29uLmxlZUBjaGlwc25tZWRpYS5jb20+
DQo+ID4gPg0KPiA+ID4gQWRkIHN1cHBvcnQgZm9yIHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUgaW4g
dGhlIGVuY29kZXIgYW5kIGRlY29kZXIuDQo+ID4gPiBUaGlzIGlzIGFjaGlldmVkIGJ5IHNhdmlu
ZyB0aGUgVlBVIHN0YXRlIGFuZCBwb3dlcmluZyBpdCBvZmYgd2hpbGUNCj4gPiA+IHRoZSBWUFUN
Cj4gPiBpZGxlLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphY2tzb24ubGVlIDxqYWNr
c29uLmxlZUBjaGlwc25tZWRpYS5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOYXMgQ2h1bmcg
PG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTogTmljb2xhcyBE
dWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPg0KPiA+DQo+ID4gWy4uXQ0K
PiA+ID4gIHN0YXRpYyBpbnQgd2F2ZTVfdnB1X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpICB7DQo+ID4gPiAgCWludCByZXQ7DQo+ID4gPiBAQCAtMjY4LDYgKzMwMSwxMiBAQCBz
dGF0aWMgaW50IHdhdmU1X3ZwdV9wcm9iZShzdHJ1Y3QNCj4gPiA+IHBsYXRmb3JtX2RldmljZQ0K
PiA+ICpwZGV2KQ0KPiA+ID4gIAkJIChtYXRjaF9kYXRhLT5mbGFncyAmIFdBVkU1X0lTX0RFQykg
PyAiJ0RFQ09ERSciIDogIiIpOw0KPiA+ID4gIAlkZXZfaW5mbygmcGRldi0+ZGV2LCAiUHJvZHVj
dCBDb2RlOiAgICAgIDB4JXhcbiIsIGRldi0+cHJvZHVjdF9jb2RlKTsNCj4gPiA+ICAJZGV2X2lu
Zm8oJnBkZXYtPmRldiwgIkZpcm13YXJlIFJldmlzaW9uOiAldVxuIiwgZndfcmV2aXNpb24pOw0K
PiA+ID4gKw0KPiA+ID4gKwlwbV9ydW50aW1lX3NldF9hdXRvc3VzcGVuZF9kZWxheSgmcGRldi0+
ZGV2LCA1MDAwKTsNCj4gPg0KPiA+IFdoeSBhcmUgd2UgcHV0dGluZyA1cyBkZWxheSBmb3IgYXV0
b3N1c3BlbmQgPyBXaXRob3V0IHVzaW5nDQo+ID4gYXV0by1zdXNwZW5kIGRlbGF5IHRvbywgd2Ug
Y2FuIGRpcmVjdGx5IGdvIHRvIHN1c3BlbmRlZCBzdGF0ZSB3aGVuDQo+ID4gbGFzdCBpbnN0YW5j
ZSBpcyBjbG9zZWQgYW5kIHJlc3VtZSBiYWNrIHdoZW4gZmlyc3QgaW5zdGFuY2UgaXMgb3Blbi4N
Cj4gPg0KPiA+IEkgZG9uJ3QgdGhpbmsgaGF2aW5nIGFuIGF1dG9zdXNwZW5kIGRlbGF5IChlc3Bl
Y2lhbGx5IG9mIDVzKSBib2Rlcw0KPiA+IHdlbGwgd2l0aCBsb3cgcG93ZXItY2VudHJpYyBkZXZp
Y2VzIHN1Y2ggYXMgQU02MkEgd2hlcmUgd2Ugd291bGQNCj4gPiBwcmVmZXIgdG8gZ28gdG8gc3Vz
cGVuZCBzdGF0ZSBhcyBzb29uIGFzIHBvc3NpYmxlIHdoZW4gdGhlIGxhc3QgaW5zdGFuY2UgaXMN
Cj4gY2xvc2VkLg0KPiA+DQo+ID4gQWxzbyBhcG9sb2dpZXMgZm9yIHRoZSBkZWxheSBpbiByZXZp
ZXcsIHRoaXMgZGlkbid0IGNhdWdodCBteSBleWUNCj4gPiBlYXJsaWVyIGFzIGNvbW1pdCBtZXNz
YWdlIGRpZCBub3QgbWVudGlvbiBpdCBlaXRoZXIuDQo+ID4NCj4gPiBSZWdhcmRzDQo+ID4gRGV2
YXJzaA0K

