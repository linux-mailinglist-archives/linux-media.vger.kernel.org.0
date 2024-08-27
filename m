Return-Path: <linux-media+bounces-16863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C9795FF54
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 04:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6EE71C21B88
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 02:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBB41758E;
	Tue, 27 Aug 2024 02:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MRe8ijd1";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="QUY/Gx6J"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36F21854;
	Tue, 27 Aug 2024 02:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724727016; cv=fail; b=lllewU3jgV+gLdjcdz63YZu2iOA+G9ZPGccwVVSi3mAlvFjETfSxKkcJD6SAXN70Hi4pu6hSIHc5JA0sg18EnWh3vnwacF6uWtTXpHa/E8qz2Wa9zJ2dfOlD1hzfIevU3Yw1Aj5noypHfYuVpRt4pHHjvj90//Agvw7oKqggzoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724727016; c=relaxed/simple;
	bh=yE9NuTXrsNFlcMqZNhJIiag2TGMFl+PYJX/PLJtwSX4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Whzts2wvO9d+VRLkASXseMsmuShBiKjS/V6z0jECQ8FVYfGNq7mFvd2d2eG6zscNhzjWj5ceMDCNejZ3dTYoPgVP7LhwgjmBJmi3Jtn93G29z+xd04bMdmeQtjxyVOgkmjw5UfhUfp8zwJoH3CWLLVmjl21gHGI3KBUTr7s4XiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=MRe8ijd1; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=QUY/Gx6J; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 105fd226641f11ef8b96093e013ec31c-20240827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=yE9NuTXrsNFlcMqZNhJIiag2TGMFl+PYJX/PLJtwSX4=;
	b=MRe8ijd1+eaIxm9iG8sh1p2LmErmOi50fWUzJa3MClRipgXT84jQXvoPwiHCq9IhR40FgV7r7ykSAzCkDV8cbf4JkeXWL6DwXnHvX7Yih/8lFALwXsJH1Gmg0sP/YVW7/HpddF3sS2o4UI3wgPGxk9Bun3bp8vg/jf1JRXJG0aI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:fc355f8a-b1ec-4ad7-983b-3ac25000c987,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:926efabe-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 105fd226641f11ef8b96093e013ec31c-20240827
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1088690118; Tue, 27 Aug 2024 10:50:05 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 27 Aug 2024 10:50:05 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 27 Aug 2024 10:50:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnJZCMpaRvYW6LehgtYjAafj+ABAn90clIbxUdy+cMuDGGg4ScQ5PKXuodoXBEe1sN2Rmho4phTIVk29fC5x06HRcV7hAOx0B0Ww2iTqgYv/iTTVBj5O0rl/bRj7H4tNkIwmwa046FG6zXtMCzD7oXE9SVfpWH2bI1P5Xf3cAnrzH/mRhLUsB0gZd3DOUnNGklZ5D80+9SFuUz5JSvj+jdJs8kWtFZjM0+w9ZidYZ3uO+2mGNEStTyHPBccDFKDiuaqUb4iYgr8HqxiHdDvbfkT7DxtPjGurE9Bx5UXLyerxvXAZZM0rBlzyEY2GyEf0ha/UsgVu4lPVHnM7jyE59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yE9NuTXrsNFlcMqZNhJIiag2TGMFl+PYJX/PLJtwSX4=;
 b=O375CwDPj2leg3Uq1tIloFgmQNumKmWpwkBjGgup8rdnE+yDlsGBLGBFP4B/nl10sEc1YnFEdiH97BxfRACabL5Cr3LLPnusQ2xZIqxWu+PiTKhsjtxDrKRv/G4e38OV4/oATnS4r6j7ZArb/o18MdJygrH4HL8kYwJiy9xNmNKH6vzva7mpvpBbbBvW3mSly7o1seABoDR6/vbP6gTlj0HxZVEXD0N7eAN/XKo6eu6DXSVuELHUyeC6Xb3ViL2opO9xKn+Qna6GHbm+zcqnAXRS0OBYbHW/q7Y/LFlgqQ6KUqVjhAWH7VrAohOLiu3lIOUM70IP32ymTQih8C+kuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yE9NuTXrsNFlcMqZNhJIiag2TGMFl+PYJX/PLJtwSX4=;
 b=QUY/Gx6JL0YW12q0IUEsvithLVt/wyU82MZXPk1ECAusxJYwJPojuvTVgfH9ztLFrS5G44aLN7qv73Oa6LbTy+ENssmmIGAlBy/UWagD7OiuryUqVeY0iGQh/dVLTOfuJEEC3R4rBW7fVs2693Pml61qWTNBpf1TTQeS7j9FwmA=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by TYZPR03MB6621.apcprd03.prod.outlook.com (2603:1096:400:1fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 02:50:03 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%2]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 02:50:03 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
	<stevecho@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>
Subject: Re: [PATCH v4 5/7] media: mediatek: vcodec: store source vb2 buffer
Thread-Topic: [PATCH v4 5/7] media: mediatek: vcodec: store source vb2 buffer
Thread-Index: AQHa6KNsTL0yMkDZeEKKhDD2usCvFbI0/F8AgAWJ+gA=
Date: Tue, 27 Aug 2024 02:50:03 +0000
Message-ID: <9f6d7408e78fe74bb96983004f9ee00a2467e95d.camel@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
	 <20240807082444.21280-6-yunfei.dong@mediatek.com>
	 <20240823141454.vvtbkkj5qm4pmpfr@basti-XPS-13-9310>
In-Reply-To: <20240823141454.vvtbkkj5qm4pmpfr@basti-XPS-13-9310>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|TYZPR03MB6621:EE_
x-ms-office365-filtering-correlation-id: ce0c6889-f96c-4e89-b6ed-08dcc642f35e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Unkwa3JubWFBb3pGN3lRaXV0T2xiK3dQd1lIa2RIYlpFUi93S01PcG5KWHZ4?=
 =?utf-8?B?L1VFSnoxTThqNWx6bFh3T3VxdlNhdFZvRzI0L2thL2pPc2ZFU0NGd205anNx?=
 =?utf-8?B?ZUtMRWxjOUREYTgyMWRHbDJ4cUcrNDVocTRwM3dwZ1RaSXUxWlozbi9aT1ZP?=
 =?utf-8?B?R1RDWWtlMmE1c1RyYWQ3OTExSHdBTURvamoxNHFYTTQ1SEJuTmQyVkprV21x?=
 =?utf-8?B?RVNnR2ljM1B0RktKaXVTaXhZK0RPTy8yY2s5YjZ1R3dQUEE5WVQxYm9NNzQv?=
 =?utf-8?B?SWd4eTZpYjg2SXRvWWpHdXJvd0hBQU9iWi9jdUNvNk9jQ1ZFd1FxTS82bTh4?=
 =?utf-8?B?NTVaaXozZmFBYTdDaHVUakZzVGIwa3pSaTRocDJ1VzJ4RVhabEdSL1BVTEE1?=
 =?utf-8?B?UXlwYTQ1MmlBNktxbnJ6U0NJdElPdlQrTjRsbXhNclhyK2t3bWtYZTBnekUv?=
 =?utf-8?B?UWRoU2YxczdNcml0MDF5d20zdW5TaVU5M3Y3bTFUWWx6TEg1R2dkYytLZTAy?=
 =?utf-8?B?bDREUjkyc3N2NnpkVE5pNlYvaGMxWUQ1MU9JWGtvRlRNMDE0Tjk1dVQ0ZWY3?=
 =?utf-8?B?NHNpUW1IZFNPNStZbGZSOXB0aGhpbU1tNmlZNW5PM1NtVmNkR2JPbmFGOGtC?=
 =?utf-8?B?WEpjWWZjSVNwWEk1SHJFTm1xZXlPNGZFT0VLRk9HMENVRjNSVGFVZUFiMGZL?=
 =?utf-8?B?WEFMMHRWbm1QdTE1NmlRdTdkeGt0NUp3SE9FNGdYL2k3MUp0M0ZjbUoySndL?=
 =?utf-8?B?dHp2eWVZRnBwRnhYZXhwdFlYM0pqMHlVQWdRQ3F3VHpjUGZQOEZicWRJRndK?=
 =?utf-8?B?ZFZKbUJWdkR0dFJ4am1WTDJKd0h1bkVnTWJmOVlmU2szZU9aTkR6L3czdHZ2?=
 =?utf-8?B?Q1hxeEpjcnFxT2lLUUU2SUdramlyV0RzU25MMTZTYU5VVDJVOUw2R1JaUFJN?=
 =?utf-8?B?Q1pQd2NqdGlseW5XWVVZeEZiNWZ3Uis4eTVpTXhEaXZobUpTS1dzcHduTjRX?=
 =?utf-8?B?UUVwRUduTmtFeGs5UVhrblFvTjQxVGpRU3h4S2IyYlQ3SjlITnFhNzNEalNO?=
 =?utf-8?B?U1AzYzhGVFNibkNOTXNBcUN0SmF2d2cxRWc3RTZaeWJESys4M3lFZE1UenE3?=
 =?utf-8?B?d1VTSFhyaG5WNFFUZnQzL1hyRVl5VmRCaVdkaklQYU9XZll2alhqNjlkb1A0?=
 =?utf-8?B?dUhXY3VsdzV2K1ZqeG1Cb0dvaUx3N0x3dk84aTVYaFRHYk90R2I5cEU4a2hU?=
 =?utf-8?B?TGJDM2MvNjc0Y09mRU1sWnNTUW4rOEpVQWUzei9NTUU5R1FRZGlQeWtuL1hG?=
 =?utf-8?B?V0hURHlVeUY0dXNDRDdJL0szVUpoTktMbzE2Um4wWnFJQVlob3ZZZVUrcGEy?=
 =?utf-8?B?bmNUWFV3enh0b0dBSy85TDQ2eWMzRGd0b21Yc1RMcU9PZjZJT0hwRElRUGxZ?=
 =?utf-8?B?amZRT3BLOHdRbzZyREYvL3JkVm9ReHhGWk5tRWNwTXpHR0pKcTZxd3N5Q2I5?=
 =?utf-8?B?N3lTaEluNzkvR0tROWR6TkJETW00NjIxRmErTzNWTTVmS3pBcU5vWnlEVGRn?=
 =?utf-8?B?MkVaZExmcnYwTFZPVGtXQkV0bjNiSit3bGtITUVPZVpTTTlodk5wSCtLenpR?=
 =?utf-8?B?RS8zeVlkUXFWa2d0WXE0M01mcW84ei9id200WGtZbytrODB2SG9oVGNpTkZj?=
 =?utf-8?B?UUgzTXpoVVh1cHZyR2R6RSsvbmJFalZmSmttOFdmTkhCbDdkdEZUN3hCMysx?=
 =?utf-8?B?SXBmQlhrdWE1ZkJLZS80UWJZdEpqazdOdWFWbDB2MXh1NmJpVjN2bjhXYVRH?=
 =?utf-8?B?Rktsc3p1V3gyVHI1dThyMlpLcGduZ243OFF6NXRIbUNwckdzeHFnMkRUUDNi?=
 =?utf-8?B?d1BMLzJQZm5EVjZPZmJUa241Rm1HVElaejFXVzg4YTJkeGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR03MB8697.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3BDL1N3dy9RY0RyMlp4c2VvaFVFaHJNODhab0ZMbkl2NFlTdWhOZU1zUWMr?=
 =?utf-8?B?UFk4Vnlwdm9wTllCMGsrd2tGcm5xN2JiVUFOVTFpWjBTbjdMU1VjNGpiVklD?=
 =?utf-8?B?L3ZleUlUNWV2bGYvQ0lEVi9RV3ZnWjk3SEt5QktzMnJiRXhFMDR4NEFWdzdr?=
 =?utf-8?B?elNZWjlhQU5mUFRNdjVaU2Jiem9ZejhBZGtuZU1sUy83MEhVeEJBTUZtd0po?=
 =?utf-8?B?STZ0NXBlM2RPN3ZCdVF3RVBXS3VOcHp0L1JOVmo0aEU2TnppK1BLYjhxYU1I?=
 =?utf-8?B?V1oycHZZYi82WEkycVhTb2pRdTRTTk5VcXBKVXEzbnNNc1Q4MFhJbTJ5aVdk?=
 =?utf-8?B?R1l4aTI3MXppb25jVWNDellGVUdhNmRTWmcrRTJ3amJ5SlNtS3k0T1dmTGpl?=
 =?utf-8?B?MXU3SktYdHBKaUtFNE1Bbm1CQU5HZWFRWkZXTzZSOFpCRysrNlhwU3hXdW81?=
 =?utf-8?B?QWUwdDMvTFlkT3ZJNEowbVV4RGFYbUJPUTNYS3VkT2t6SE0reVM1RU9OT3lq?=
 =?utf-8?B?Tkp1a2tyTkhYckdCcVAvb2d3Mnowa2pPUGd2YXVycjdxVmc3ZHB0S2liM29N?=
 =?utf-8?B?aURhMWRlTmhXUFFaMFhhaWt6VEpwYXlWNFk5aFZLaFZNbm9qK2hvS3dkQXcx?=
 =?utf-8?B?dWQrNTVtdWlZMGNvRFdnK1Y2L0Q2QWw0WnBkY3V2cVkzTmtPOEJ4UWdVcFBX?=
 =?utf-8?B?K012Y3pKZkZoWHhTY0hDMnc3UlROWlJ5QUhYNzZpMThhRUw0MEhnMnl0bmo1?=
 =?utf-8?B?L2tTT3VsV0VwOENNNURtNUVwYlF3SXBVbWVKTkZ3YzZ1WGsyKzlmMVArV3E0?=
 =?utf-8?B?TTVSc3hsblZTaXJHSC9xY3lrRHIvaFJNbEhFNXp2YklJRTRaaGpHR2JtUVRK?=
 =?utf-8?B?YTdxRWVpQ0VxNnFoSmVNMUJxcGFtcDJvZFA3VEcyR0pBTjFzUlpDMWVvSE9Z?=
 =?utf-8?B?a0poQ29halk1ZzkydkQ5UGZwbDlySG82NVRaN1IzOWJZaUdpcXF5VVEwVlpD?=
 =?utf-8?B?dk5QRWYzL1AydWRONWFkVUNnQml2MUFhQkI5YkxnNFVLMlgzQTZwRlZnM2Yw?=
 =?utf-8?B?eDlnRFU5dmZybXVUSW03V1FxMXFyMHppYTdQSjlFT1VXSStJMEg1L0I5c2g2?=
 =?utf-8?B?bmVVM2RRMlpPQWRQU3FvTmdoZ2FvS0xNNDZpZ0NwMSsrUFBuczBwYmx5NUtW?=
 =?utf-8?B?UUJXM2pIUmpVZGg3bWphOGtpbUtvM1FUT2pvL1dYMjVkUEhhR0xKUkN5UnpX?=
 =?utf-8?B?d0FxYnpvOElWQVdRRGNwQWZxcUJua1hQZHk3SU9Ma01DbXNlZUMyQm1TS0xR?=
 =?utf-8?B?NkZMRVpUREtsOEFWQ3gyOUh6YVVFejZmeWhhVm8xS3NEdzhHdGlpUExOMTl2?=
 =?utf-8?B?THo3azdnUnFkT0had1Z2Rjk1aXdES05Rb3ROa2EvMGJtaXlwelFqaXlUL2Jz?=
 =?utf-8?B?WWlac09Qb0ZpUHdFK05mM2M2QlhzdHJHMTQwb1drRkVYZDFwclh4cjkzb2tS?=
 =?utf-8?B?bHF5WWhmU2N4czZVeWlwTUF0UE1JN1ZkZkdaQkI3MWwwbG9adnJrOHdoZFE4?=
 =?utf-8?B?NlJTeUM2UUphcWtzSFF0Vk5TaWNWaWxUckU2b0ErYlA4OWhsQ2I0UU9IUnBF?=
 =?utf-8?B?dThlUXpHaDNCUDNZUnY5R2ZCUklBOGZmZEFzZUFEUXJXR0xOd3VnRjVhQ2Ny?=
 =?utf-8?B?akhBWS9DS0o3SDBlMW5oMXFLd2ZtTy9YYzVzOWlQdGhOcHNyYWEwajM0NjQ2?=
 =?utf-8?B?YnNqQVlPQ1ZFNzRIV09JRXI2Y25RdUtGbUNFV1UxQVhoMkxaZGVuUjQxM1dy?=
 =?utf-8?B?eDdicncwbC9NMzRMc3I1QzhXd3Q5bUVDbUE5Z3JkQ0Q1TDFubzRaRmkzVWdR?=
 =?utf-8?B?Szd0TSsxbEFRNEtTRmYyVE8vdDJDTEg5OFlaODYxeEVDSWc3TSt6TlUzQzNF?=
 =?utf-8?B?Q2VvZTVnZDNXalR0aU5LeXM4eEpxYjgzeHBhWFAvSXR6QlJ3M014VG1XanRJ?=
 =?utf-8?B?aVo4R2VVZHh1Y05QSmNvUmkrTnhZTUM2ZG5ZQ3g0NVNQcnN2UVV1dStJNTFw?=
 =?utf-8?B?akgrODVhRUtJTTVjcTAyeWtwNEc2aWo0bWxMTE1WQkd4alBGYXNXYkxGK0R2?=
 =?utf-8?B?eERUdytaRzN5bkp5Z1ZrVzZuMW9rTStyb1FNL2ZacEs0QWJwMnp5VC9lNldr?=
 =?utf-8?B?Snc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B95A53277D751A49828F2B6EB4DD7EA9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0c6889-f96c-4e89-b6ed-08dcc642f35e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 02:50:03.2363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Y3nvnWAA5hoe7dGsDNqFM73xILbDjoLhwSJzh8lGG4iCnuAkqRHgKXsSk7kZFsXZ1sTSKjb/McKmjMeSghfX1/XnJgWm+ayu9/COzPBr2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6621
X-MTK: N

SGkgU2ViYXN0aWFuLA0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCk9uIEZyaSwgMjAy
NC0wOC0yMyBhdCAxNjoxNCArMDIwMCwgU2ViYXN0aWFuIEZyaWNrZSB3cm90ZToNCj4gSGV5IFl1
bmZlaSwNCj4gDQo+IE9uIDA3LjA4LjIwMjQgMTY6MjQsIFl1bmZlaSBEb25nIHdyb3RlOg0KPiA+
IFN0b3JlIHRoZSBjdXJyZW50IHZiMiBidWZmZXIgd2hlbiBsYXQgbmVlZCB0byBkZWNvZGUgYWdh
aW4uDQo+ID4gVGhlbiBsYXQgd29yayBjYW4gZ2V0IHRoZSBzYW1lIHZiMiBidWZmZXIgZGlyZWN0
bHkgbmV4dCB0aW1lLg0KPiANCj4gSSB3b3VsZCByZXdvcmQgdGhpcyB3aXRoOg0KPiANCj4gU3Rv
cmUgdGhlIGN1cnJlbnQgc291cmNlIGJ1ZmZlciBpbiB0aGUgc3BlY2lmaWMgZGF0YSBmb3IgdGhl
IElDLiBXaGVuDQo+IHRoZSBMQVQgbmVlZHMgdG8gcmV0cnkgYSBkZWNvZGUgaXQgY2FuIHBpY2sg
dGhhdCBidWZmZXIgZGlyZWN0bHkuDQo+IA0KPiAtLS0NCj4gDQo+IEFkZGl0aW9uYWxseSwgdGhp
cyBpcyBub3QgYSBnb29kIGNvbW1pdCBkZXNjcmlwdGlvbiBhcyB5b3UganVzdCBzYXkNCj4gd2hh
dA0KPiB5b3UgZG8sIGJ1dCB5b3UgZG9uJ3Qgc2F5IFdIWSB0aGlzIG5lZWRzIHRvIGhhcHBlbiwg
d2h5IGlzIGl0DQo+IG5lY2Vzc2FyeT8NCj4gV2hhdCBkb2VzIGl0IGltcHJvdmUsIGlzIHRoaXMg
YSBwcmVwYXJhdGlvbiBwYXRjaCBmb3IgYW5vdGhlciwgYSBmaXgNCj4gZm9yDQo+IHNvbWV0aGlu
ZyBvciBhbiBpbXByb3ZlbWVudCBvZiBwZXJmb3JtYW5jZT8NCj4gDQo+IA0KPiBtb3JlIGJlbG93
Li4uDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmZlaSBEb25nIDx5dW5mZWkuZG9u
Z0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gLi4uL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVy
L210a192Y29kZWNfZGVjX2Rydi5oICAgICAgfCAgMiArKw0KPiA+IC4uLi92Y29kZWMvZGVjb2Rl
ci9tdGtfdmNvZGVjX2RlY19zdGF0ZWxlc3MuYyAgICAgICAgIHwgMTENCj4gPiArKysrKysrKy0t
LQ0KPiA+IDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2Rydg0KPiA+IC5oDQo+ID4gYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVj
X2Rydg0KPiA+IC5oDQo+ID4gaW5kZXggMWZhYmU4YzViN2E0Li4wODE3YmU3M2Y4ZTAgMTAwNjQ0
DQo+ID4gLS0tDQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9k
ZWNvZGVyL210a192Y29kZWNfZGVjX2Rydg0KPiA+IC5oDQo+ID4gKysrDQo+ID4gYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2Ry
dg0KPiA+IC5oDQo+ID4gQEAgLTE1NSw2ICsxNTUsNyBAQCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNf
cGRhdGEgew0KPiA+ICAqIEBsYXN0X2RlY29kZWRfcGljaW5mbzogcGljIGluZm9ybWF0aW9uIGdl
dCBmcm9tIGxhdGVzdCBkZWNvZGUNCj4gPiAgKiBAZW1wdHlfZmx1c2hfYnVmOiBhIGZha2Ugc2l6
ZS0wIGNhcHR1cmUgYnVmZmVyIHRoYXQgaW5kaWNhdGVzDQo+ID4gZmx1c2guIFVzZWQNCj4gPiAg
KgkJICAgICBmb3Igc3RhdGVmdWwgZGVjb2Rlci4NCj4gPiArICogQGxhc3RfdmIyX3Y0bDJfc3Jj
OiB0aGUgYmFja3VwIG9mIGN1cnJlbnQgc291cmNlIGJ1ZmZlci4NCj4gDQo+IEkgdGhpbmsgbGFz
dCBpcyBjb25mdXNpbmcgaW4gdGhpcyBjb250ZXh0IGVzcGVjaWFsbHkgYXMgdGhlcmUgaXMgZm9y
DQo+IGV4YW1wbGUgaW4gdGhlIG0ybV9jdHg6DQo+ICAgKiBAbGFzdF9zcmNfYnVmOiBpbmRpY2F0
ZSB0aGUgbGFzdCBzb3VyY2UgYnVmZmVyIGZvciBkcmFpbmluZw0KPiAgICogQG5leHRfYnVmX2xh
c3Q6IG5leHQgY2FwdHVyZSBxdWV1ZCBidWZmZXIgd2lsbCBiZSB0YWdnZWQgYXMgbGFzdA0KPiBv
cjoNCj4gICAqIHY0bDJfbTJtX2xhc3RfYnVmKCkgLSByZXR1cm4gbGFzdCBidWZmZXIgZnJvbSB0
aGUgbGlzdCBvZiByZWFkeQ0KPiBidWZmZXJzDQo+IA0KPiBJIHRoaW5rIGEgYmV0dGVyIG5hbWUg
d291bGQgYmU6DQo+IA0KPiAgICogQGN1cl9zcmNfYnVmOiBjdXJyZW50IHNvdXJjZSBidWZmZXIg
d2l0aCB0aGUgYml0c3RyZWFtIGRhdGEgZm9yDQo+IHRoZSBsYXRlc3QgZGVjb2RlDQo+IA0KPiA+
ICAqIEBpc19mbHVzaGluZzogc2V0IHRvIHRydWUgaWYgZmx1c2hpbmcgaXMgaW4gcHJvZ3Jlc3Mu
DQo+ID4gICoNCj4gPiAgKiBAY3VycmVudF9jb2RlYzogY3VycmVudCBzZXQgaW5wdXQgY29kZWMs
IGluIFY0TDIgcGl4ZWwgZm9ybWF0DQo+ID4gQEAgLTIwMSw2ICsyMDIsNyBAQCBzdHJ1Y3QgbXRr
X3Zjb2RlY19kZWNfY3R4IHsNCj4gPiAJc3RydWN0IHdvcmtfc3RydWN0IGRlY29kZV93b3JrOw0K
PiA+IAlzdHJ1Y3QgdmRlY19waWNfaW5mbyBsYXN0X2RlY29kZWRfcGljaW5mbzsNCj4gPiAJc3Ry
dWN0IHY0bDJfbTJtX2J1ZmZlciBlbXB0eV9mbHVzaF9idWY7DQo+ID4gKwlzdHJ1Y3QgdmIyX3Y0
bDJfYnVmZmVyICpsYXN0X3ZiMl92NGwyX3NyYzsNCj4gDQo+IExpa2V3aXNlIGhlcmU6DQo+IA0K
PiBzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICpjdXJfc3JjX2J1ZjsNCj4gDQo+ID4gCWJvb2wgaXNf
Zmx1c2hpbmc7DQo+ID4gDQo+ID4gCXUzMiBjdXJyZW50X2NvZGVjOw0KPiA+IGRpZmYgLS1naXQN
Cj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRr
X3Zjb2RlY19kZWNfc3RhDQo+ID4gdGVsZXNzLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhDQo+ID4gdGVsZXNz
LmMNCj4gPiBpbmRleCAyYTdlNGZlMjRlZDMuLjhhYTM3OTg3MmRkYyAxMDA2NDQNCj4gPiAtLS0N
Cj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRr
X3Zjb2RlY19kZWNfc3RhDQo+ID4gdGVsZXNzLmMNCj4gPiArKysNCj4gPiBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhDQo+
ID4gdGVsZXNzLmMNCj4gPiBAQCAtMzIwLDcgKzMyMCw3IEBAIHN0YXRpYyB2b2lkIG10a192ZGVj
X3dvcmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3QNCj4gPiAqd29yaykNCj4gPiAJc3RydWN0IG10a192
Y29kZWNfZGVjX2N0eCAqY3R4ID0NCj4gPiAJCWNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgbXRr
X3Zjb2RlY19kZWNfY3R4LA0KPiA+IGRlY29kZV93b3JrKTsNCj4gPiAJc3RydWN0IG10a192Y29k
ZWNfZGVjX2RldiAqZGV2ID0gY3R4LT5kZXY7DQo+ID4gLQlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVy
ICp2YjJfdjRsMl9zcmM7DQo+ID4gKwlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICp2YjJfdjRsMl9z
cmMgPSBjdHgtPmxhc3RfdmIyX3Y0bDJfc3JjOw0KPiANCj4gQW5kIGhlcmU6DQo+IA0KPiBzdHJ1
Y3QgdmIyX3Y0bDJfYnVmZmVyICp2YjJfdjRsMl9zcmMgPSBjdHgtPmN1cl9zcmNfYnVmOw0KPiAN
Cj4gPiAJc3RydWN0IHZiMl9idWZmZXIgKnZiMl9zcmM7DQo+ID4gCXN0cnVjdCBtdGtfdmNvZGVj
X21lbSAqYnNfc3JjOw0KPiA+IAlzdHJ1Y3QgbXRrX3ZpZGVvX2RlY19idWYgKmRlY19idWZfc3Jj
Ow0KPiA+IEBAIC0zMjksNyArMzI5LDcgQEAgc3RhdGljIHZvaWQgbXRrX3ZkZWNfd29ya2VyKHN0
cnVjdCB3b3JrX3N0cnVjdA0KPiA+ICp3b3JrKQ0KPiA+IAlib29sIHJlc19jaGcgPSBmYWxzZTsN
Cj4gPiAJaW50IHJldDsNCj4gPiANCj4gPiAtCXZiMl92NGwyX3NyYyA9IHY0bDJfbTJtX25leHRf
c3JjX2J1ZihjdHgtPm0ybV9jdHgpOw0KPiA+ICsJdmIyX3Y0bDJfc3JjID0gdmIyX3Y0bDJfc3Jj
ID8gdmIyX3Y0bDJfc3JjIDoNCj4gPiB2NGwyX20ybV9uZXh0X3NyY19idWYoY3R4LT5tMm1fY3R4
KTsNCj4gDQo+IFBsZWFzZSBhZGQgYSBjb21tZW50IGFib3ZlIHRoaXMgbGluZSB0aGF0IGV4cGxh
aW5zIHdoeSB0aGlzIHNlYXJjaA0KPiBjYW4NCj4gYmUgbWFkZSwgZXhwbGFpbmluZyB3aHkgdGhp
cyBidWZmZXIgaXMgc3RpbGwgdmFsaWQgaW4gdGhpcyBjYWxsIGFuZA0KPiB3aGVuDQo+IHdlIHBp
Y2sgdGhlIG5leHQgc291cmNlIGJ1ZmZlci4NCj4gDQoNCkFzIHRoZSBjb21taXQgd3JvdGUsIGlm
IHRoZSBkcml2ZXIgbmVlZCB0byBkZWNvZGVyIGFnYWluLCBuZWVkIHRvIHVzZQ0KdGhlIGxhc3Qg
cmVtb3ZlIHNvdXJjZSBidWZmZXIgdG8gZGVjb2RlIGFnYWluLCBub3QgdG8gZ2V0IG9uZSBuZXcu
DQoNClJlZ2FyZHMsDQpZdW5mZWkgRG9uZw0KPiBSZWdhcmRzLA0KPiBTZWJhc3RpYW4gRnJpY2tl
DQo+IA0KPiA+IAlpZiAoIXZiMl92NGwyX3NyYykgew0KPiA+IAkJdjRsMl9tMm1fam9iX2Zpbmlz
aChkZXYtPm0ybV9kZXZfZGVjLCBjdHgtPm0ybV9jdHgpOw0KPiA+IAkJbXRrX3Y0bDJfdmRlY19k
YmcoMSwgY3R4LCAiWyVkXSBubyBhdmFpbGFibGUgc291cmNlDQo+ID4gYnVmZmVyIiwgY3R4LT5p
ZCk7DQo+ID4gQEAgLTM4Myw4ICszODMsMTMgQEAgc3RhdGljIHZvaWQgbXRrX3ZkZWNfd29ya2Vy
KHN0cnVjdCB3b3JrX3N0cnVjdA0KPiA+ICp3b3JrKQ0KPiA+IAkJCXY0bDJfY3RybF9yZXF1ZXN0
X2NvbXBsZXRlKHNyY19idWZfcmVxLCAmY3R4LQ0KPiA+ID5jdHJsX2hkbCk7DQo+ID4gCQl2NGwy
X20ybV9idWZfZG9uZV9hbmRfam9iX2ZpbmlzaChkZXYtPm0ybV9kZXZfZGVjLCBjdHgtDQo+ID4g
Pm0ybV9jdHgsIHN0YXRlKTsNCj4gPiAJfSBlbHNlIHsNCj4gPiAtCQlpZiAocmV0ICE9IC1FQUdB
SU4pDQo+ID4gKwkJaWYgKHJldCAhPSAtRUFHQUlOKSB7DQo+ID4gCQkJdjRsMl9tMm1fc3JjX2J1
Zl9yZW1vdmUoY3R4LT5tMm1fY3R4KTsNCj4gPiArCQkJY3R4LT5sYXN0X3ZiMl92NGwyX3NyYyA9
IE5VTEw7DQo+ID4gKwkJfSBlbHNlIHsNCj4gPiArCQkJY3R4LT5sYXN0X3ZiMl92NGwyX3NyYyA9
IHZiMl92NGwyX3NyYzsNCj4gPiArCQl9DQo+ID4gKw0KPiA+IAkJdjRsMl9tMm1fam9iX2Zpbmlz
aChkZXYtPm0ybV9kZXZfZGVjLCBjdHgtPm0ybV9jdHgpOw0KPiA+IAl9DQo+ID4gfQ0KPiA+IC0t
IA0KPiA+IDIuNDYuMA0KPiA+IA0KPiA+IA0KPiANCj4gDQo=

