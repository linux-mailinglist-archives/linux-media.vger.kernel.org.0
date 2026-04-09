Return-Path: <linux-media+bounces-58304-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D7UK/xC12ksMAgAu9opvQ
	(envelope-from <linux-media+bounces-58304-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 08:11:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B5B3C6785
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 08:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3C5E3033D1C
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 06:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2161530C63B;
	Thu,  9 Apr 2026 06:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="S5TiXX18";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="A1LDqNt7"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359C1304BCB;
	Thu,  9 Apr 2026 06:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775715034; cv=fail; b=l8F4xTuvAk0iM0r7uEsKDDmyZeRBhuiboPsHrH+fM+F5pUZFILmJefpN/f0sLOI6RF3yp04JfZkeSIDziyqIENMsjCPrWUmccGEfTHuFisbrVXlwisJaAJ/oT0dg0prB553A9TBjVF8nJwd9MTj6r6kXp3YXtMVdxkU7CeyY85I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775715034; c=relaxed/simple;
	bh=dnKsbz2UCrF7mTIUS+nNs0u6zQ52lOZmNXHA3WiyFQQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qNHKYf1AjWkxQ03knVzcXXk+HQ8ieWOFr6OMkEbz96jvWlF19zYSCCuNVhEGgeetmAg4trOh7b4gLXXJwbkIhgP+a20ZF+8HqgvGA0oinGLthDmJ6+DNuVbCMSlEcqk6EdRaUOiGfAPHt1L820SgKnIL9Iyh4qSl8uVmMnSVNVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=S5TiXX18; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=A1LDqNt7; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cd27e6aa33da11f1ae70033691e9ac7d-20260409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=dnKsbz2UCrF7mTIUS+nNs0u6zQ52lOZmNXHA3WiyFQQ=;
	b=S5TiXX18N8Yk3PrCas6nff6V+OIpCE9YiGkdNbzAnjofBXm4IQRW9kn9wliPoNcAup6o8UNJr7tATs81iTswudgjsEaMBJnTwwXf9BeIVZfF1HbUYuDqmRypIsALLE1Ee7BPxSJZWke5EirIDA/91CBr5lzzddphJSiDEEyk4kI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:fb3a566c-c4b7-4a0d-82b5-7d425da8e02b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:3402bb94-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cd27e6aa33da11f1ae70033691e9ac7d-20260409
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1193208633; Thu, 09 Apr 2026 14:10:26 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Apr 2026 14:10:25 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Apr 2026 14:10:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTuQ7m83yhri245SUfSjHyVPkCkxWuV2q13xYLLE7QCVlK6cxDql0lG79iseRQfCLpLoWHQNt266MyBLjrjh0mu77Cgd/MsOzuZOXqjhn6h5lLzDs8tOxZN6u2dZUVx5izpcWw4WO4aLpLwT8UdVrTHSejiBtaWth7a+FTXmT5zAXUwt0j3r74ECvyz/Rh5iy8PR6hFJCPDl7wKTCX3Aa71GTGNPga7d++G3XFJirXrl7z2a/WxkqeT9NlmmpbL5znIbjRCrxFOCz2H5LBEgmxAolhuk2HDAbDGs1d2prZpxSubfoH9MzyM6Z2iJPURQi6fiqi2N0gI1gecNfdf6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnKsbz2UCrF7mTIUS+nNs0u6zQ52lOZmNXHA3WiyFQQ=;
 b=prhEfXBAvRBnaNE+CWJzkH1fzD4E+S1uwKN7cRz2J9LeNhZSBerZ4c0W227UJnp3y3dylobd2gUkpl5X2jvv6RlMKjNzASpvvn6yjTntTIwt8Sy7yUdD8eiFhut/vQvtbkEzYkl9dlBAvCSwVdmBL8Xts+H6I60CXa+q4AeQj8zrrMrUSr1cD7IKgto8ieI2uptezAfziee+PGSDMFpd/fA7UA65OJBiiGfIHXKE7q2RBgaQ4Z/QJfO4C0z8H8fnwMVtDqL6+HIwvga78xSOvdaDyJ+FeeOFeIw28yqGJxX2nvqEsEwLdYERfhewKQvUlLK4G0FRaq7QfB0T25UCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnKsbz2UCrF7mTIUS+nNs0u6zQ52lOZmNXHA3WiyFQQ=;
 b=A1LDqNt77RUcYgIIy1dyb+tWerOzOBC2JDK0VKvrKOJaN81DNWL750hdGpXxc7/jjGMMeSELD30x5OuifZm98mgjdoYRCcvGGL/2VfaEqZAR9yiIgeGWeyeIPif/qz8iKSsmK2AnIgt0PlDjOZXkWRHCMskpA5RnnCgN2+dy9qg=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB8680.apcprd03.prod.outlook.com (2603:1096:101:233::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 06:10:13 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9769.020; Thu, 9 Apr 2026
 06:10:13 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>
CC: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/5] Migrate soc, drm-mediatek, mdp3 to new CMDQ APIs
 (series 2/4)
Thread-Topic: [PATCH v2 0/5] Migrate soc, drm-mediatek, mdp3 to new CMDQ APIs
 (series 2/4)
Thread-Index: AQHcvAvSBds8WfTaQE+zC56UdJjNk7XVss6AgACkJwA=
Date: Thu, 9 Apr 2026 06:10:13 +0000
Message-ID: <653f9ce91c42398211b065ddf8e7fd970296df3a.camel@mediatek.com>
References: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
	 <cd1de04076917d65ccd7dd91d9392af7977a4906.camel@ndufresne.ca>
In-Reply-To: <cd1de04076917d65ccd7dd91d9392af7977a4906.camel@ndufresne.ca>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB8680:EE_
x-ms-office365-filtering-correlation-id: ed7de357-acc1-4bde-fc83-08de95fea9a8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: eBRsahw0jSZylYqs2r9nDntMgUNDHIxNZlYG6KRCkqd3q7d4WPByv98IM8+JTN5IJOkyI2zNUs3iWhI64Rmx4lZgt3dXLY4FfP3s/mEDfNlMSklB7bMOgsQHh3V6oLCGJ8cQqZjuZunnn+JxC+0Z1rt21aZSHTdT1sZBFsmBrDN59YHRe9oN8M4/jLRmkLK/+mz+lYqarpcxwC/bSKzYl7EFLqtlQxNr5vjuZ959qRg7K9zQuCTExOqUFZgxzWts/D3jJTTqIsqbt3LJ5zZzjOac1kZtRcVMf8OjMK6vhmNLjH0zEXjjEiJgEGpyBD10sk1WwrxpWPjoXHGpt7gD+avpTk403mfIlmoSfvmYbhxohXJ7c7QxVOSyBTHZe2uOG135XlejCHLUrXmBPrdyDlT+saUl9S3t1wvfQYA6Ft3V+oOhXfIVKWoz0QOSS2TD1Hl3+a0hDEXVGg4BFzKJnjXs8p+xov04wQVX0ntsttrnlX0q/3W+JbcYWzFFZslhtoiKotnTKYUiPvqsfUQYQ7I63MQBautkNyeOgdXiGY0CU+zC5LRZqozWoUsTeBI2lDtUrPxBjxVjNBO4moSEF4eV299FX3OgOsZQeu2GiQXjEBYMQJNGuFWJ6PauKl0ghOjUMgbmpA6COo3uvpakGD78yGvB2Sx/wZ5Qq70t1QteoUZc9febFI0QrboSvizzzwJzdy0rhbFFxpFkRpUSzF7CU3QMPuK5GK1YWdxznZkMcNOakuxy0q2tE376Kv2zm3DxaNb06341KYI6mmwieBQcoCdmtdaj32/v1CM2yVw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmlHZUdzbC9lU1pHalZxWC9jOVNoQjZ5QzY4bVkwdSsrbVQrbFd4czhid0lm?=
 =?utf-8?B?Y2I1S3BsRHRLOUMwWGRHMXpmT0w2TzZqTEo1RkpkZGNrY2R3VWdBY1ZITUdN?=
 =?utf-8?B?VmRvdTkwQU9oOXFpQUpoTXliNDhXckhtNlRSbG1Saklha053NEVQQ0FLMGhU?=
 =?utf-8?B?dkF3azR4MmcwUFJoU2p5Mklrc3hMM0J2UHZIYVBua3QwR3JzcG5teGpwUkg2?=
 =?utf-8?B?THNqUUZIWklqSmtObWtqTCtkYzhDaUNkRnM5eDRsR0xEL2o2c0RsVzVCNFg4?=
 =?utf-8?B?VWp5aTdBR040Y2ptcXRuUldid1ArTmtRaVRzTkQ4YzBjQVFhT0JKSXFvaWdu?=
 =?utf-8?B?RW5MNnZoNjRsMmxmaWxURkV0MERjcHU4TGcvenpNeUFadU16NHVlMDhqZnZT?=
 =?utf-8?B?YTNGVHRraENQZGlHVTRXUnN6YWM3TE0zUk1RUXRVNHdnSjBvei9VT3UweDM2?=
 =?utf-8?B?UERVZnJvcHlOeU9JZkExT3pYUjVZeEV4b2k3eFFtNDJSdHo4bnJlRUhWeXhS?=
 =?utf-8?B?MDBHZXp0OVBnKzNLQUFSOU5pbEIrWEovODhhemZ4OGZ0d3pOdUpuaVlzSXBL?=
 =?utf-8?B?Y2xQU2NtdXFIbEFCQVhwN2tJaXJOMTd3WTR6amF6VU1sNUg5VUlENUNLK0ZW?=
 =?utf-8?B?RnRYaVkyd3E5WjhwV0pnbTNaa0ozQ3AzdU9NelJ4WnN2aWdWUHF0Tm9jZ3RN?=
 =?utf-8?B?eGZpUWVmTjFaRG9aaXJ0d1hOV1d0MWp4QnZ4bXBpSHlmRHdHUnJwV1lFVXpL?=
 =?utf-8?B?YWc3ZVl6ZDVNQktmMis4USszMElEME1LL2xCNldRQVBsck4wZldsQk84SEZU?=
 =?utf-8?B?OFZFbmJIcExVdU4rRmVobEx1ck04S0szVGM0TnB1R1B6cURndmUrNCt0WXBU?=
 =?utf-8?B?TFFvaTBoZzVCS0N1dUVuVlhwSDhOemV4RFZLaXBKVDRhK0IrOXZEMUlDRVBR?=
 =?utf-8?B?WUFHNXpsK3hNWWNEbDh6aVREVkMrbmJuWkx0dC8rVndQQ01ETWI1bTAyQnhN?=
 =?utf-8?B?TTRRclJIYUNpdys4UFFHeUtXdHZWb2QzWFcvaVR4QklvRGxEY1FaY29zc0Rs?=
 =?utf-8?B?RzZFUkswcWpnWkpDK2dxS29WYkZsU3ZRY0x1OWxJWVRDVGN6K0kxd3lPTXdH?=
 =?utf-8?B?a2lIUzdndnRXN1dpK0YrWjQwKzgvcVd3a0NwSTU5Wm9QNzNDUEorRlVCdVl4?=
 =?utf-8?B?MlBYcUJiaDkzZUd2Qm85T3l4aTdXU09rWUhhWEZCOXpzaXFvamgrWWQvWVZr?=
 =?utf-8?B?bG1KNDlXRUpHQndzbUplR3oxbGpGRVE2L1ZjS2JjWUdwaU1DRnJJc2c1dGla?=
 =?utf-8?B?SjdLNjNvdUdveGdjSDQrMjk4MHFURFMzWDFWcG0zTFdvemk0Sy9JOEEwVFY5?=
 =?utf-8?B?N3hZQXhhZTA0cHBEcEVQL2F3VU93b1ZxUWZadml0UHN1VGhGZ2U5VzZCU0VU?=
 =?utf-8?B?WWJPZG9UR0ErcURqalRSbWgydkc4U0h1a0FXRW1YNlcyQVdJZXVPSVBkbk5l?=
 =?utf-8?B?THVMNDQxUStOeU9VVmh4UUlUbDhjeUwxengwd3p5Uk5UWUlKLyt2TlQzeG4y?=
 =?utf-8?B?RGVWZzRHNkhGeVhaTFNDUU0rdUx0SklFYThQSkwzTFlNRHNZb1VnVkMweU9q?=
 =?utf-8?B?S3pkNGtqYjlYdGlqV2wvUzJqMXlwc3AydUZubGdWRFFpblJpd2VVNy9PU2My?=
 =?utf-8?B?Y005MXM2UUtDZWJZK01sRlBEeWZlNEU2VUhjbWtkd2p6NGZlMUtkNDEram40?=
 =?utf-8?B?WWZMK0d1V0FRS3N4R2VGeTJudTVTRk5qWkJtR092WFU0NlI4c25qRm5NMDFL?=
 =?utf-8?B?eGlBUjIvRnFKZWVqNFd2ajJhQmxuTGRzK0F1YkVPOGlGNC92MTR6bXhDc2tp?=
 =?utf-8?B?bFg5Q1NFQ1h1Zkd1ZHdnZ3N0MnQrSTJxa01LNnhBdzFHZVh1TmhRRzZ4VWdq?=
 =?utf-8?B?WS93ZHNNYmRZUUpwL0JTS25KY3F6ZFJ3NTEzeXZPZU9XdU9XUWk2Sks0VkE2?=
 =?utf-8?B?MWhRbEdQWkpmVmxOZjMrT2FCekhmOWNTTHhYcDE1eTVBQjJBMjA0UnhOem5j?=
 =?utf-8?B?dkx6eUdEaGpTUVZSeUdLVDNGVk82aEhReXM3U0s1SnFCWXk2eEhhaE5jZDBy?=
 =?utf-8?B?dDl0SUN5SXFMWCtCUTJhZWlpZ3dkWVhVL3FKRFBzNkR1dUxQa1d1ZGlaSnN3?=
 =?utf-8?B?c3psNVZnZEhYTW1QUXZ1dzJIU0owbHBTeVpqVmdTL1E1b1JqZUx1Y1I0eEdy?=
 =?utf-8?B?c1MzWmtpV3c0OUVlc09FUUwrVWU1cTBaU3NmOFZnSDRCWUJJTW9hay9aWG56?=
 =?utf-8?B?UU9XbzdmdHlzM0o0ZTk1REl3U1plZk9udjNqSHVWc21udTFhZzR1N3pIY3Fu?=
 =?utf-8?Q?hXWpADFHZHQjbDGs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E980F61B88466749B8C343E6121F7F6A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sX2rP2Jp+Wn7IMPpyVmx/aAPHa6Mfxw+VCRGqsC/66S75U8MoQUXbgQgqeP/kYKpS9Wva+M9PkDKGldOU223LAM1VFYsgEQ+bTzwC4bsPolGvRdJnf4hPPsNFq1+VPoJupvX803LrRzktkiaOcMReVK3Hr9vQctNDYdFPjWOgktHrWrorMdFar0RFRmsyD9p5OlA9Iq09MCkPwccXxEqTBdBLynjJc7UerVAGtJK5X5Zed3SwShhMwWTTGcKHXnFmLOkeLWJB4aXL+Zj/4bYLtlEbKhQIbJNXLEmXM2kxNlImH9o0h5EaRt8j9Eazn7S/dELkNF6eYY9wOxlLcq95Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7de357-acc1-4bde-fc83-08de95fea9a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 06:10:13.3282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0D3A6pJmwLRrP97K7/RJTg4LaVx7xQyNaTE66oe9pp98Z7Il99i3yJAw8NahJjEEtF22X9fQ4+1OO5mGvlOGLewCPNLLi17sTmnQ+z/RVmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8680
X-MTK: N
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[gmail.com,mediatek.com,vger.kernel.org,lists.freedesktop.org,chromium.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-58304-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,collabora.com,ndufresne.ca];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Jason-JH.Lin@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A9B5B3C6785
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTmljb2xhcywNCg0KPiA+IMKgIG1lZGlhOiBwbGF0Zm9ybTogbXRrLW1kcDM6IFJlZmFjdG9y
IENNRFEgd3JpdGVzIGZvciBDTURRIEFQSQ0KPiA+IGNoYW5nZQ0KU2luY2UgdGhpcyBwYXRjaCBp
cyBhbHJlYWR5IGFwcGxpZWQ6DQpzb2M6IG1lZGlhdGVrOiBtdGstY21kcTogRXh0ZW5kIGNtZHFf
cGt0X3dyaXRlIEFQSSBmb3IgU29DcyB3aXRob3V0DQpzdWJzeXMgSUQNCmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21t
aXQvP2lkPTQwZGM1YmJhZDYzYjVmNjBkZDJlNjlhMzJkZWYxYTI2NzNjYmEwOWUNCg0KWW91IGNh
biBhcHBseSB0aGlzIG1kcDMgcGF0Y2ggdG8gbWVkaWEgdHJlZSBub3cuDQoNCi0tLQ0KDQo+ID4g
wqAgbWVkaWE6IHBsYXRmb3JtOiBtdGstbWRwMzogQ2hhbmdlIGNtZHFfcGt0X2p1bXBfcmVsKCkg
dG8NCj4gPiDCoMKgwqAgY21kcV9wa3RfanVtcF9yZWxfdGVtcCgpDQpUaGlzIG1kcDMgcGF0Y2gg
bmVlZCB0byBiZSBhcHBsaWVkIHdpdGggdGhpcyBzb2MgcGF0Y2ggaW4gdGhpcyBzZXJpZXM6DQpb
djIsMi81XSBzb2M6IG1lZGlhdGVrOiBtdGstY21kcTogQWRkIGNtZHFfcGt0X2p1bXBfcmVsX3Rl
bXAoKSBmb3INCnJlbW92aW5nIHNoaWZ0X3BhDQoNCllvdSBuZWVkIHRvIHdhaXQgZm9yIHRoZSBz
b2M6IHBhdGNoZWQgbGFuZGVkLg0KDQpUaGFua3MNCkphc29uLUpIIExpbg0KDQo+IENhbiB0aGUg
dHdvIGxhc3QgYmUgYXBwbGllZCB0byB0aGUgbWVkaWEgdHJlZSBhbG9uZSB3aXRob3V0IGJyZWFr
aW5nDQo+IGFueXRoaW5nID8NCj4gT3RoZXJ3aXNlIEkgd2lsbCBuZWVkIHRvIHdhaXQgZm9yIHRo
ZSBzb2M6IHBhdGNoZXMgdG8gaGF2ZSBsYW5kZWQuDQo+IA0KPiBOaWNvbGFzDQo+IA0K

