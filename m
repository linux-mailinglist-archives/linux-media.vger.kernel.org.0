Return-Path: <linux-media+bounces-21922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC889D7B6E
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 07:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19799162EBD
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 06:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE4616EB54;
	Mon, 25 Nov 2024 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kZjCEe9K";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ieZrDK4a"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC03364D6;
	Mon, 25 Nov 2024 06:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732514754; cv=fail; b=GDC7hwZdhDA+pCsa2RYN0V1nchoJvCu6mtX0NgSa+nXW+8QwVsJnVWIqQ+LmmS6C/LEd+n7b3fLALvRH99z4ZJjWznl4DzH3cSCodE7E+WetImxgWuYIXwN/t23M7L2mtqQgy898OEyU0BzrEs3gGhj6GW5iSQOPFTQ1rhBBElA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732514754; c=relaxed/simple;
	bh=ihMgkAslNWSyzMcd4eEpUJ3Pn0Qi2cDVGD737HfklE8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q3fVzdc7hwx6ENPACcBzAGCcjX1pRnDgRLScfv5LZdb77rr7ddLb+ATRFh/7E/p1ihQARouYYeBc23f/EW9UimGSVwRaZ9Wys1gf71oMNA8mHnhYLuw3YZayC56jKl1GsBU82jC6Y6StPTl26Tua1o9Y6SUmjLzRbJGJntQLu0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kZjCEe9K; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ieZrDK4a; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4fc5e174aaf311efbd192953cf12861f-20241125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ihMgkAslNWSyzMcd4eEpUJ3Pn0Qi2cDVGD737HfklE8=;
	b=kZjCEe9KYUVOIBXBEK3sWhgKWNL1xSuAmYPEmyoWLYXkJjB7K0sHfrTgD4gcEAV4ZVKwO/jmVyYYSTrtLUHInjeqe9wjTxr3ilVxKwKdy+tnIAWEIY8f8ZpQkdyIQzr6XiG3D1rr4DG/2w+LZnBHanjOOruE146g3vRx3X/L4+o=;
X-CID-CACHE: Type:Local,Time:202411251354+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:95046da8-bf5a-496c-896e-da1cb3c57b69,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:07507223-634f-4016-85ba-2d63e55c9400,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 4fc5e174aaf311efbd192953cf12861f-20241125
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1889176035; Mon, 25 Nov 2024 14:05:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Nov 2024 14:05:45 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Nov 2024 14:05:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqHa80sM2TD0jNCEvJzcNktJa9bYkR5BL8yTTtndb8OmepRHV8Ew6aOJ+zPTrGmTXw9hYV6O+X63YgTa3/ABE0MJli5D7I79eVmapvj70DAF8FP9UcgJ1TnjUoS47N6h7Aq7KWdqIQ18yX32gVsipdPB70eOZ0WvLUV3MOcxBH1WoIoICv2MjmK5sznka+fS81wH2FlfgjazbClQDRr8SRcsE3InXtRH0JR5KnJC/Dvx8Nq3yGs6NlAJ3jldOr3XyDiABgpPIpg3VuAWbwaODH1Foq6JCkI5oJQc5/m0Xg+WAs65bw7QUF7Nyw/Zweo8XuKvalB1Acj6KGS/vMB+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihMgkAslNWSyzMcd4eEpUJ3Pn0Qi2cDVGD737HfklE8=;
 b=n3IdCczSzcRMWMuX5DtMFckKxhyfO5c6VB7d7c+ZQbKZG8kOiMHJntsFpF+9kVfLJW6ALS5ILU3Mfvh7xlyCrbct9+jsMEnvtOh3ArlIUBA9z3T/y59Uvej6WXVSe5u6w70WJclDMOrJNZiEMSLwP1ZVLPWh7O6UDMMNtqWvsq0LVsErQIQZgfyGLygpGRe1SjHw9PYIoqzglor+pp324LA6UnCt/9MZbhshosgfZQZswIPaBY+G7N4eSnMhZMtJ7p9mvE4cGQqfnwpQ/BjwyMk7OYXCIpwbMftw6eA8peip3C5C8pRFBoqg6aFd3nu5u8GifGokmRA8PqCoXdhcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihMgkAslNWSyzMcd4eEpUJ3Pn0Qi2cDVGD737HfklE8=;
 b=ieZrDK4alCBXTbN49ZyOn7yjoFbVg9vTvamO/U5skE3wh6T9yOSDkONhBL8OMdu3w/qH4iIKy+dtOcNWmD8OLq374p+nOB0DocfxBjaomuEFchYEZWhj6gQfMCYLc4yHkvM7SBkQtJ7z2yQQEL4kVnZvyjlcyxlJ92nraIZLG/o=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7422.apcprd03.prod.outlook.com (2603:1096:990:1a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 06:05:41 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 06:05:41 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	Julien Stephan <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLHiDWA
Date: Mon, 25 Nov 2024 06:05:41 +0000
Message-ID: <ad0b36163eb220cbcc20579ee0cedc9c90bf7941.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
In-Reply-To: <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7422:EE_
x-ms-office365-filtering-correlation-id: 2a5d275f-2091-4aec-68b2-08dd0d173144
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MW9IeUtsdGx1ZEZjRTQvblc4OFNaYnRhTEJ0bllQYzcxL3VreWxoMmRFbWRp?=
 =?utf-8?B?eEZONmlIS1FkY0Y4cHkvYzJRejNaK2hzSmFjbnIxQUR1dTcvdUpTU1M2Rnk3?=
 =?utf-8?B?QmxXdzdUTThjTjNOVVE2LzFPQUwzN2JKc25QajJvamZORlEzUkpJaEswQ0pK?=
 =?utf-8?B?aC9LaE1KOFlUbmRLaVhnNU5RaFlablArLzZBRnNTYzFabmxYb2xjSDJ6REl1?=
 =?utf-8?B?NGVueGZSZEt5TnZpY3Z2YUM3S1VyWVpld3ZVNHpzWnpTTk5Rc2J5TzFTQ0Zt?=
 =?utf-8?B?WjFGdXU5dFZZbXhFZTRnQUphUTdXdWJzMFlNVmdVUEtWQ0p1cUtjU1FzYjVF?=
 =?utf-8?B?R1NUOFIvVGdsVmVmWWVtSGRrQ3ZDaTVCS2lHQVVZRUg4VmE1U2Nvem5GdGFK?=
 =?utf-8?B?WlZqQllYTExWZ0RUbUhaQlNzSHFCR1BWNS9aOC9PUnJmMjM3b1BrVXZGYk9n?=
 =?utf-8?B?eHpLdDBQNW9jUDhrYzJkUWFiU1ppSmdpNHlob2tyMnFiK2VKMWNFV1BDdk5U?=
 =?utf-8?B?VmRvSmlVM0dQVnkrMWhYcHV0bERnQVk4bEdyaXAxbXpCbExYdFB0akM2WXY5?=
 =?utf-8?B?YzBPNTJ6V01vRlUvdXVHbnRRVmw3RmNWWm9QVVdoeU5JdXVXVU0xM1QxYnB3?=
 =?utf-8?B?M3RQT2pmTWY5V2lMeld6djl0OVdMSHNySWwycGVYK3pHbDVnNXlya3Brdnpr?=
 =?utf-8?B?TzMwekVKcGM0dkxaNU9TanB6RTRIM1J5SmVCMkp6MWo4bjM0VzN3c0o5blZi?=
 =?utf-8?B?ZmZtb2ZWbklaUDJhZkEzcjUwa0dCbXk3ai9QM3ozSkhFMGVJS2JCTEFhUnF1?=
 =?utf-8?B?TTVFaEo5VXArZE9Fd01zYjNPalZYZWpDVVdoejhSZzdrTzNhbWN1UnJ6TVE1?=
 =?utf-8?B?c1VaTmRoVGs0ZEhybnVCME83OWZ5d3hHU3ZoYnVQQ0dMSy9ST0NBV2t6Rzcy?=
 =?utf-8?B?YXQ0NHcreEF3czBXdjRBNzJ0OGxVU0JvS25xVEhxbjROSFlqbENKYW56ME9U?=
 =?utf-8?B?SWxaUERnZ1NwVkVpTFF4TllEK1FGZ3NlV1BnQnliYUpidjRMek0vQ003NzhF?=
 =?utf-8?B?Sk5xQzVuWk12SWlRVjlVSUg0a0k4TTBUT1NhNk9kV21VdFEzV1R1M3RzSjU3?=
 =?utf-8?B?RHBidlNzSHJDTUhXQVJxVjRWM2ZnSGFSTUpLZHp4NjdHTzQ4K2xDdXNKTW1C?=
 =?utf-8?B?N1lOLzQyUGFYZXE5clFmQXo3clhZcjFucE5aUm1STG1ZbC90aHZWbEozMVJE?=
 =?utf-8?B?U2VFRE9HdVFWenlKN21kWEhCSzIzQnhFYmt2d0NUU0pDcVBDN25NenBIeEtl?=
 =?utf-8?B?QjdwMkdON29hNVhRUWl5NGJ2NWZLSWVoN0N0VDk3VndLam5GbFRXOXI0aHhk?=
 =?utf-8?B?bDlFTzA2VVJTRm1BcHdrRDhmTmo3b25lV1poTlVCd1l3UHVZUFlia3YxV1Zo?=
 =?utf-8?B?cFgyQUV4MGpHOWZvWFNMVmNRTVRsbEJyd09VSlk4cWJrMmhMUit0RXcwTzVp?=
 =?utf-8?B?S0U2SWZrSUZOUzVRMTZhU0tvUzZmYXlrbnlaa2k1c2F6U2JhZnFNb2tRYi8z?=
 =?utf-8?B?Zyt0V3RGOWJ3Slc3WTBMb0NFUWZJaUtENnNhbjAzMzg4VFpLeExSL1pOVTRm?=
 =?utf-8?B?R0h2K1h3OVpCSlJJQ2ZxWUlNZ0pTQTZRbkRXNjlBeHVLakRnOUJja20vbDhN?=
 =?utf-8?B?YWtjV2xwVTBWTWQ3STBhSU9IMW8xcTlKWkxFejJHNDlwdE5vL3VTU09TTzZY?=
 =?utf-8?B?VEpOZWpveGw3Y3p3OWN1V2F2K0s0bEtoV3hjMU9QUlZVWVA4dVcyNnJlaWtj?=
 =?utf-8?B?czlZZDBxTGxzMzJWMUJCS2c2a0tnQXJoSkQycjdKbk12VFR3NzNkSnU0QUFs?=
 =?utf-8?B?TFZEMVVlek0vWkdKaWlXaFBmTExOMUVOUnBjN3Q2L0tRdXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0VoS1JYZUpER09rb2VOZ1A2MStTTVMyZ1ZBRnNKSnVzZ3A0V0hFN1RiblE0?=
 =?utf-8?B?SXBLUXJCUDlaTVZDQXRCdUhuZUlxMHVXU3Y0RXZBZHVYajdqSlJrbHJkMnQx?=
 =?utf-8?B?Z1lBTVdBd2ZKV0dPd2xONnJnV3ZrT1hxdzQzUStvRXFFbWNCMVlpQ05CcnBQ?=
 =?utf-8?B?MGJPL1d3M2REK085TDh5Yk8wd3FOZGtSZjBaNXR4clVNMmJUam5yVXpwajNi?=
 =?utf-8?B?Z3JpVnNFVStOT1NSM29SM3BPVmU2VFJ4NS82eDlXZUFrRWNYUUVDQStBN1VC?=
 =?utf-8?B?dkZkK2QrclJqZnAyaFVUb0c2UGFBQ0ZzZ0FGK3V6K0FNdUpXdll4cFJmVUF3?=
 =?utf-8?B?bytUOVB0OWVTcUdBN2hyVGdZOS90cmpwMGEwc3d6QXRja0txQnVzSm9tclJD?=
 =?utf-8?B?SEtLaTZLaG9ERW04UU1TSUlkMk5sZ2F1VEw0bWQ4YW1kT2ExL3U4QjB1eFIv?=
 =?utf-8?B?KzRRWjVkQy96RzZLZFZ2Z01WaU45QlJiMVh0Rks3QjE4MnlrSGRySVdyenNi?=
 =?utf-8?B?U2VrVXNuYWNSZHJDb1lTeEl5cU9QMEcwMmxiTTBsank0TDBGYlpnMkw3ZHNy?=
 =?utf-8?B?bWdBRHFGZVppcXZNTVlmM0UrQms0eENNN3pHSGZtYnVKMHVkc1M2TUxyWWVt?=
 =?utf-8?B?UXlNSVVtK0NJZytzZFdEUW9QQllndlh5QjdOc2x2clNrOWdHcmV3dW9xaEdk?=
 =?utf-8?B?ODVReDV5ZXIxVjM5bDVLbUhoclBEcWZxa3NtR3I3S0RsMGRzNDd2UUJzU0Y3?=
 =?utf-8?B?VEFweDVWdkJGNmdpWDZ4ckIybmFpdjFvdU1RaXZLVU0zRGZvRmdrUHhiQWJM?=
 =?utf-8?B?eUVJMGlMKys3bzZ4NXZXSERGbXZZckRSSzU4Y2VCOGxLeGRTd2svZm1WNytt?=
 =?utf-8?B?OXEzYlF5Z3hsdkFPUmVwNnBNcFZiWUJURjRSRXlEaHVFeVR2NUFzU2FlWmVm?=
 =?utf-8?B?TFpDNlhNZjdDMlE3SlVSYnhCazVXc0RtdkwwZTZPUnMvQVdyU2xyN3hITmVw?=
 =?utf-8?B?Z3p4OEtTU1FwYTJyUyt4cnRMc2hKSHFycTZWenRjYmU1QnVqODhabG5GZXE2?=
 =?utf-8?B?b0RVbzNyNFMvenRzRUY3MldHR1J3UDFaczZGM0hlQmR2Z2ZlN3R4dzBKcHhx?=
 =?utf-8?B?UHA3U1pIcWJ0T3lpclJnZ0tZT0R0ejN3eWZHUUlVaERMa2FZcWttcUUwRjQv?=
 =?utf-8?B?OU11ajU0bmJoZzdNUS9qa0JBZkFEbWUzY2lmckZmZW1xSXFBNysxbkNoamtB?=
 =?utf-8?B?cDJWN1I4dUtUU1RHTEZJTEZtNlkwNlpDT2RLaU5BVE02ZzNWTWhBVllUVkZ5?=
 =?utf-8?B?RkwzTHpvZzVCc2p1eTVxY2pERFRTV1BtckErM3JUbitheTUxM2ZiSkRkVVVP?=
 =?utf-8?B?ZnREYlg5K3l5bnJlNmhZWENHSnRSZUVWbVZjUmVZNGViZDJwNWtkMFhaRzh5?=
 =?utf-8?B?RFVlYzNLcFNya2JLYkFlSTg5aXhxa1FxcEcwbHlBdmg2Y20zYkxIdkgrRGRq?=
 =?utf-8?B?TWhWcm4ra2VPaWJ5b1dBTWo0MndJWmd3TXh0TXhOak1sdWRQTUx4OFBETm9u?=
 =?utf-8?B?SkpXRjlNSnhSNkFMSDdIVnVGVEx4VG9vVXlQYjJBWXZCaGZKZkc1bkZPZEZo?=
 =?utf-8?B?SmRRa3kxdjFObTU2Mm9IK2E2RHNzZkwreC9FbHo3bWhzalBCQVNKQmtvTEpZ?=
 =?utf-8?B?c1QwWk1wSEMxeG81aVc5MDhKMHVJYWdTQ0xqZUZHK3FuaTcxMHFSMTNBdFA1?=
 =?utf-8?B?bWZaRGFYek9VUXN6SENZRUFRcXJCdnVsMnBuUXd3V2pjZU9EaGFvMC9tc011?=
 =?utf-8?B?SkpyTzlTM3k0ZTJidzc2WG5qLzdiL25Mb3VES01ZZXlwREVDZ3JReWhydmQx?=
 =?utf-8?B?V3lCc3Z3UzhIQXkzVU85ZE55bkhxblpCYTM5QW9zVjRPTFpiYmxNQ3h0SDJW?=
 =?utf-8?B?bUZiei9PWDhBc1QxbTFFNzd2SlUrOVVjYk03L0drblZvbFpBSVpiV3MrRWJ1?=
 =?utf-8?B?YmtjVWNML2dPOG53V1RReHNjVmxyOUpxSFJ2eUhNUGlFZThzNW1Oa0NiRzBB?=
 =?utf-8?B?NVZRZnN4NWg1T1VFaExySm1EdGtqbFBhL2loS3ZVRWxRSThsOGlneW93RXRv?=
 =?utf-8?Q?FlQY7Es8goAALPgLA2lo7JKcn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <092F378A32723C40A3CFA0CE562276A1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5d275f-2091-4aec-68b2-08dd0d173144
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 06:05:41.8365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +qiKTKkBjIpIPoOQaeUjDtWwnvsUx/ux3Gm9pF9bc4eNM7BQtBrPoY5zBatLShquGdjuDJylZiGD7OUeyyZN+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7422

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTExLTIxIGF0IDA5OjUzICswMTAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
ZW5AYmF5bGlicmUuY29tPg0KPiANCj4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5
cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gY29taW5nIGZyb20gdGhlIFNF
TklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4gcHJv
Y2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1AuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+
DQo+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBF
bGRlciA8cGF1bC5lbGRlckBpZGVhc29uYm9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGlycXJldHVybl90IGlzcF9p
cnFfY2Ftc3YzMChpbnQgaXJxLCB2b2lkICpkYXRhKQ0KPiArew0KPiArICAgICAgIHN0cnVjdCBt
dGtfY2FtX2RldiAqY2FtX2RldiA9IChzdHJ1Y3QgbXRrX2NhbV9kZXYgKilkYXRhOw0KPiArICAg
ICAgIHN0cnVjdCBtdGtfY2FtX2Rldl9idWZmZXIgKmJ1ZjsNCj4gKyAgICAgICB1bnNpZ25lZCBp
bnQgaXJxX3N0YXR1czsNCj4gKw0KPiArICAgICAgIHNwaW5fbG9jaygmY2FtX2Rldi0+YnVmX2xp
c3RfbG9jayk7DQoNCnNwaW5fbG9jayByZWdpb24gc2hvdWxkIGJlIGFzIHNtYWxsIGFzIHBvc3Np
YmxlLg0KTW92ZSB0byB3aGVyZSB5b3Ugc3RhcnQgdG8gYWNjZXNzIGJ1Zl9saXN0Lg0KDQo+ICsN
Cj4gKyAgICAgICBpcnFfc3RhdHVzID0gbXRrX2NhbXN2MzBfcmVhZChjYW1fZGV2LCBDQU1TVl9J
TlRfU1RBVFVTKTsNCj4gKw0KPiArICAgICAgIGlmIChpcnFfc3RhdHVzICYgSU5UX1NUX01BU0tf
Q0FNU1ZfRVJSKQ0KPiArICAgICAgICAgICAgICAgZGV2X2VycihjYW1fZGV2LT5kZXYsICJpcnEg
ZXJyb3IgMHglbHhcbiIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlycV9zdGF0dXMgJiBJ
TlRfU1RfTUFTS19DQU1TVl9FUlIpOw0KPiArDQo+ICsgICAgICAgLyogRGUtcXVldWUgZnJhbWUg
Ki8NCj4gKyAgICAgICBpZiAoaXJxX3N0YXR1cyAmIENBTVNWX0lSUV9QQVNTMV9ET04pIHsNCj4g
KyAgICAgICAgICAgICAgIGNhbV9kZXYtPnNlcXVlbmNlKys7DQo+ICsNCj4gKyAgICAgICAgICAg
ICAgIGJ1ZiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmY2FtX2Rldi0+YnVmX2xpc3QsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG10
a19jYW1fZGV2X2J1ZmZlciwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsaXN0KTsNCj4gKyAgICAgICAgICAgICAgIGlmIChidWYpIHsNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgYnVmLT52NGwyX2J1Zi5zZXF1ZW5jZSA9IGNhbV9kZXYtPnNlcXVl
bmNlOw0KPiArICAgICAgICAgICAgICAgICAgICAgICBidWYtPnY0bDJfYnVmLnZiMl9idWYudGlt
ZXN0YW1wID0NCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdGltZV9nZXRfbnMo
KTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdmIyX2J1ZmZlcl9kb25lKCZidWYtPnY0bDJf
YnVmLnZiMl9idWYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBW
QjJfQlVGX1NUQVRFX0RPTkUpOw0KDQpUaGVzZSBqb2JzIGNvdWxkIGJlIGRvbmUgYWZ0ZXIgYnVm
ZmVyIGlzIGRlbGV0ZWQgZnJvbSBsaXN0LCBhbmQgbW92ZSB0aGVzZSBqb2JzIG91dCBvZiB0aGlz
IHNwaW5fbG9jayByZWdpb24uDQp2YjJfYnVmZmVyX2RvbmUoKSBsb29rcyBsaWtlIGRvZXMgbWFu
eSB0aGluZ3MuIFNvIGl0J3Mgd29ydGggdG8gbW92ZSB2YjJfYnVmZmVyX2RvbmUoKSBvdXQgb2Yg
dGhpcyBzcGluX2xvY2sgcmVnaW9uLg0KDQpzcGluX2xvY2soKTsNCg0KcHJvY2Vzc2VkX2J1ZiA9
IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgpOw0KaWYgKHByb2Nlc3NlZF9idWYpDQoJbGlzdF9k
ZWwoJnByb2Nlc3NlZF9idWYtPmxpc3QpOw0KDQpzcGluX3VubG9jaygpOw0KDQppZiAocHJvY2Vz
c2VkX2J1Zikgew0KCS4uLg0KCXZiMl9idWZmZXJfZG9uZSgpOw0KfQ0KDQpSZWdhcmRzLA0KQ0sN
Cg0KPiArICAgICAgICAgICAgICAgICAgICAgICBsaXN0X2RlbCgmYnVmLT5saXN0KTsNCj4gKyAg
ICAgICAgICAgICAgIH0NCj4gKw0KPiArICAgICAgICAgICAgICAgYnVmID0gbGlzdF9maXJzdF9l
bnRyeV9vcl9udWxsKCZjYW1fZGV2LT5idWZfbGlzdCwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX2NhbV9kZXZfYnVmZmVyLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpc3QpOw0KPiAr
ICAgICAgICAgICAgICAgaWYgKGJ1ZikNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbXRrX2Nh
bXN2MzBfdXBkYXRlX2J1ZmZlcnNfYWRkKGNhbV9kZXYsIGJ1Zik7DQo+ICsgICAgICAgfQ0KPiAr
DQo+ICsgICAgICAgc3Bpbl91bmxvY2soJmNhbV9kZXYtPmJ1Zl9saXN0X2xvY2spOw0KPiArDQo+
ICsgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOw0KPiArfQ0KPiArDQoNCj4gDQo=

