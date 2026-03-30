Return-Path: <linux-media+bounces-57533-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKm0BXjlyWlj3QUAu9opvQ
	(envelope-from <linux-media+bounces-57533-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 04:52:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66734354E75
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 04:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3637C303A5F4
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 02:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347A639023F;
	Mon, 30 Mar 2026 02:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="twpqltbb";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ikCbhY7e"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0442E2EEE;
	Mon, 30 Mar 2026 02:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774838972; cv=fail; b=mQJ9xZy4EeyVeY2acIUNNGOzp3NTrCt1/R1taGcpOKFiSRGQYPrtrsTAi7OTTd/UZ3+hg4HCkPGzIhjCgdTBi5sXiPt4ki56ymI+fJX4P/wcaH2qBQGIerM37Kx9rUxKt07bXW/+ybQjcMVwE0t0IuX5llPHnolnwywQ2seZzNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774838972; c=relaxed/simple;
	bh=7XCWz/NOIEOO+XjJOHEEubUYW+UWDUHr3yPIJ1S1dLY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZdJN5KfyFzER6pIxGvoTHbydbYKbefCxNl/vItYxTEovs10utwb1aOYYUQTXI4Ag24kJwo8lFGh4llMUsdj9pEQd+nvoY5MsIAhAlWCW5tg+k7Le3ANIPl7jr21Tr+pbPoYmN/O/iE2WEBKmbyCL16qJ6Py8kJCIlQ9ziDPo984=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=twpqltbb; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ikCbhY7e; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0add3e5a2be311f19a16598d5ca7f8ec-20260330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7XCWz/NOIEOO+XjJOHEEubUYW+UWDUHr3yPIJ1S1dLY=;
	b=twpqltbb3hL+Ex89ETCXHm9uYm0VyQ5wtU97F7sxWFbQyHaD7AWStB0mF9cX5QJB1Z/gNZ/i5CMdaaNXc8RwDbt+eDbxGtzNKhjM0s0N7B8RimghCskib6xVH7WEosI9jqXjRWDL2KLueAVWLtWEM71XIliL+z74TRWNtb+2OSg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:3a2ad822-ec3a-41a3-982e-0c93d599ad08,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:ea1746d5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0add3e5a2be311f19a16598d5ca7f8ec-20260330
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1987274484; Mon, 30 Mar 2026 10:49:16 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 30 Mar 2026 10:49:15 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 30 Mar 2026 10:49:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSlYJVylTnWyxUvM4rpAUgTa0g49ZFQlqKhBzDQVIjA0xjqcupolIoj7S6tzyZIMVN+ZyhnqnUuEJ7QrVfeuh6dPrgiWO7+9z23jDssJxKUULGSQqjT7UzdlD3kRbT9p7BKj4i7/oB63O9inUWit5r7lKxkYu5WI8Ru5ekvv6jWDroo2OUVqX86zeQ2A0F55xy3RuxLCvc4G91dCg9zCa7uNn5CL7RTFrE5eYkh/3bzid1izWzsZ9TRWRJOqqYQepSj/MkX8Hc+RjP5x+O9nlyEyCpZBpVw4yexoV+VBqDsJlFh3ARC5rJgQEpNvhyfwh7DeAarALANRmGgQCF0GEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XCWz/NOIEOO+XjJOHEEubUYW+UWDUHr3yPIJ1S1dLY=;
 b=fHf68DkXCuhF/XFC890h6Qb/zXWS7OBjcKzX+AGWDICF5C0xIAGfcXzESXmN5Av/A2P3MEA+2WgFovD/pY2K2F8OSImHOOVX4CJDH0mJ0EfzcmXwzWyJ67LEMz04/sfdAbRSAC63fQtenAUVWvpFIM36hWLAKx2uMEmrSWnb/HiWraUNmgd541saIbkMgpyS/baSOVq6xR17KQPZbVKswooXC0A6/jOlTwdg6JVcVHtFRhup9H4wMZSstmIR/ygnbwX9FPoWXTN17VmtOoM3kQYuPGxCxzGsH8wy1pOP6d0y8zYYMIQ2n995hrRTNnvdGAni4c9D2VSebzbpxbX/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XCWz/NOIEOO+XjJOHEEubUYW+UWDUHr3yPIJ1S1dLY=;
 b=ikCbhY7ekFLQqvTEwA8yo4DK02Xadtl4rIHde8XLimrFKQHsOoDf0UZ+W0e6uqJUzFCOjdn2wL3+4WFqMjJPlMJB8MU+sJrAqi1/lUbgwaDrss3BJwhbmhrcuqP9xLIlpF6xS25huIFAumzU1T8FNm007fJ5YjkxoJFidyfHjRI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB8800.apcprd03.prod.outlook.com (2603:1096:820:142::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.27; Mon, 30 Mar
 2026 02:48:44 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 02:49:11 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 3/3] mailbox: mtk-cmdq: Remove unsued
 cmdq_get_shift_pa()
Thread-Topic: [PATCH v2 3/3] mailbox: mtk-cmdq: Remove unsued
 cmdq_get_shift_pa()
Thread-Index: AQHcvAymKsTGwV8sQ0GKshmdt2PLm7XFsxkAgAC0XwA=
Date: Mon, 30 Mar 2026 02:49:11 +0000
Message-ID: <e6d566b9ca357e47914b9f620f692c45175ef5fc.camel@mediatek.com>
References: <20260325040457.2113120-1-jason-jh.lin@mediatek.com>
	 <20260325040457.2113120-4-jason-jh.lin@mediatek.com>
	 <CABb+yY2cjMskJeXsn8+hZj2DcFs05yabHbSaGT5XSi0fn45zCQ@mail.gmail.com>
In-Reply-To: <CABb+yY2cjMskJeXsn8+hZj2DcFs05yabHbSaGT5XSi0fn45zCQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB8800:EE_
x-ms-office365-filtering-correlation-id: 30dd6a7a-c6cb-4b45-5aa2-08de8e06ec13
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 4AnTDL2bSY3adGVP1Reh0iU6/wiGeG+76F9NbyE6iivYcd7mkwGwY0rgYePKwTRf/Zl21EJ31pYmO0bfy0vpFhLcxM+p+bvU0eONYwBSlGNTy2Jlb6NH6J4UtIu7RlHlI7RQKDtXEVjIPVcxuMvMJg6iB4lI22jBs81tFftaEL8BBUcisub+NCVa8UbLjyvJ96rH4Z/OrZbIBliHBKwFdXDVsnqzEWGQFUU3gf9mr+w6sfoBjnV8G5eHu2BLh1q88uwY1l34vTeird9j33J0ORC+khx7AbXwV9T8A3BdIMqR2h4R0vf8wquSqzZUfk0FN6k3jxFX1x7gBgKA2cyB0vuWdtOyUJ2jQhFctoUb+rYvoYx6sFfqeHFeaGQsjjb9yTMgu7FXU8eLSW0TQes5L63M7GnYCDT71e9biGs50D42SLJBlKXIYVFmB7M+Trfr2GiImkxnfEVOABVG+6BZLRF+3dKcma5F/yCi/VuGNyydkQaCXMBBXRkq3nrfCMKmbGs90f4AbRQIKvB84W4NhG0o8yreD9sSQjUy8poRh5bd6NJjxrxvNFZuVIIAQLrGEJS+3OLOHtjPK4ZZrTWHN5627nX+/O/zAdnFlZy8EtdRw6NYBCR5ntWROlEn7M+ob5AMSLnXJSwmHjBIAOt8oHc4l25EJg0CIHv5flvncvSRp6b63K+wGQS5Bt/BN8NVJFPuc1Su2710DZdpuL8ixpOk5EBEjBA06aW8Vzg7syJgLuGv6InS6S1OKsRJoVbZfvEdRyg4DZpQFDd2vQnBUS80rNqAZuIqKDfmSY8On58=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MktVc0FybDFBK1hRRXZjaWlQcFBXcGJMYXVBSFNTQjlOd2tXK3NheTVVb2xV?=
 =?utf-8?B?Wm5sZlFiblhxMW9oZldTbjdyVjNsWlduL05FNlRVRnZ1SDhjNUpkRERSOXlG?=
 =?utf-8?B?SVg0d0dueFRPckhlMGVWaXpneTZOcmVmaU04Z0h1TmQ0bHdEcFJFOTZUQUl3?=
 =?utf-8?B?TVhPNzRsejdZdzY2RThlT01WVVovK0c5Zm9sei9KcE1VN25rNzBnNHZVMU1H?=
 =?utf-8?B?VDlrWnBzUWVZSklSWHJMeUlUR013VXVNUHVKbXg3UUZnWkt5Nzdmam44UTNO?=
 =?utf-8?B?Y0daMVRoS1Z5QkhwVS95ZFlvbk43MkFhRnRDdXZYaSt0bUkvSGtnSVg5Z0dF?=
 =?utf-8?B?dUY1by9mNE92ZVNBaU1oQ1cxNzBNbXEvVjVsSjMybndPRngwTldtVHB0VHp6?=
 =?utf-8?B?RnVQN0ZHSm1pc2RPNTZzVHRKRjNHYkVLd0RDR24veTExR3pvcUVRelRrU0k5?=
 =?utf-8?B?MmFBaFVqd3IwcXlhbE84dlY1K3pjVVBYZWJoYmpXNVAzUXF2RDZQbzJFazA2?=
 =?utf-8?B?emwwMFFOalRUUGpiNjBLVEhUMWcvRm9pbzlZTmpvY2g1aFdoOTVBZzREMHM0?=
 =?utf-8?B?VmxNOUdkMTFqN2xDblRlY0Y1UnNXYmNWMDloMThwTjQrb1FqdXNoNU5KR2xG?=
 =?utf-8?B?UjNXckN5UkpoSG9Xb2ZPYU91Yk9FYTcydVNBWmJJR1p3UVVUanExSTNPRG80?=
 =?utf-8?B?TnNqWkNQREJTSmZhWjBpOFlkb3ZTWTlsa1FiM3RicTEvcHJOR1NDbHdTUDcr?=
 =?utf-8?B?dXdsWFdiWTdZT0IreFpSaVJnSWVQOWdLQmwrTTdaWUZDaEhFeGljOGwzSDlo?=
 =?utf-8?B?alliV2JxdzhETTM1V2RBUnFPeG5NZWNXQi9nUUFLVG5RTjhmZWlYSk4wbmdE?=
 =?utf-8?B?bE1pN25BYStEcHozRGdyV2s0QkNSYmVIcmY4d0dya3cwY1ZmcWY1KzcwKzhy?=
 =?utf-8?B?T0tMUFFFSEdvaXQ4S0pJOGovdm9KZTA2SkZqRG1BcklBNFppcGg0Z0NJQnFu?=
 =?utf-8?B?Z0ZXMVZtVkhocUIyYjh5V2xyV1JLa01mNTRwV2tCZmY2TGo4aENTTWoxNito?=
 =?utf-8?B?dzJwTGswaFFpYnlLME9RT25qTFVwRmNHSzBmVU1ySkcrS215UnFvMzg2Z1Uz?=
 =?utf-8?B?cG1pVk1wN04vbk94UlZxNXNCNkNZSHZTT1EvZkVLKzB5YmdpdDM0a2ZaV2dU?=
 =?utf-8?B?SThkeGNqQ0dsQzRXOWlISWZjRjdkRGd5TUdWNE0zZkxVQ2RkUE9kTXllR0Rk?=
 =?utf-8?B?NUdLUndMMWlNWDc0ZWhCUWRoUFpUWkFhSU1rakhVaUcvNkFaMXllc0wwVGpY?=
 =?utf-8?B?R1FRWUU2WTZWK1hjYUV4N3Y4Zm50bW14dGpPNFBJWG1OcVBDV2tHdThuT2Jh?=
 =?utf-8?B?V1V3VnZIb0lINktsQW9KQTlqRE9FMUFaeUx0L3BWNk44QWpBb1FoSlZjeTZn?=
 =?utf-8?B?VlZTN2FZTTRtKzdFZFhpZmozVWJNbkpDT2V6MStISUZoUitydzR3YVNUYkoz?=
 =?utf-8?B?QnE1SVNyWDRVWEVmV1FOb1ozdmdkNHlpOFNydUNJZ085VHMreUEvSGxUZXAw?=
 =?utf-8?B?Q3ZpZk10eE9OekYrNVdaNm80WE5rcHhRZk5XaWY4WUN1S2FHTXQwdU12NThq?=
 =?utf-8?B?eFVEaDhZQXc2V1BUK003cHkveGJYdUN4aWh1QkxRNnJXeHJmWFFIdTFBcFFC?=
 =?utf-8?B?RVU4ZHdtUExmSVE3QXo4RndTbmVoNUVtWXFOajNVZ2QxWUtwL1YySUdKZ3BY?=
 =?utf-8?B?WjEyZnhMWmVrOVdhd2EvNy9mZVYvMDNvbVFXWGRraWRHUzVCNktvN2oxb0x6?=
 =?utf-8?B?TXlRZk1uMU9ONzVtREtQTE5ST3BkUmZSRG1ZNGJOTVUweVZsNEQrWGsyeWlr?=
 =?utf-8?B?cUVlUDRjaFdyWTVWZmJxdHhIMjdaNDZLYWZQNEZHTmpLVGR0R1BTNnV0VGVN?=
 =?utf-8?B?SlZDd2s5UGNmODROckFVRzZucS94UWVheWN3OHp3OGVUVnV2WTZwckVrWGVE?=
 =?utf-8?B?alVUc0FiSExoWDhmK2g1TTBiaUdqa0RMSkpxUzEydmk0Q292YzAvUlkxa1hr?=
 =?utf-8?B?WTlQRlRoUVJzRTlwRGdrV3NHSFJ4dzUzcmVjd1dVWjE0RWJzK0hVYUszeERV?=
 =?utf-8?B?UDh6aGdUUkJGeEdwMjIwM0p2bHVON0YzckVjc3NuanhkM2FnRDlJam5GQnF3?=
 =?utf-8?B?WXdhaTFEdnFCOTU1TU1GM2h1SXJvejZYL0l5YVAzOE1hSFlWRnRmNTN6QWVz?=
 =?utf-8?B?QmVpaFhRZDJEZ0xzcUFtVnUweEZqZEo2QnlINC92aTkvdTUvbXZKeHZxblpX?=
 =?utf-8?B?V2M5VkExRmIxcmlwZnYyVENRTDVWZXZscXNRSTY3emhwdVhabkRTRTc1aGt5?=
 =?utf-8?Q?sCTr0btpOB+pUbrM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9996E1EF22ABA4991DACE5DAA044F9B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fl1dRkXQbnY1fGGMWj33NSkHAU7PpQ+3vsT9gem0C829tePYKLswG68ze7LT6PLT1zf4bcNUE4YWCPib6e1enBDgnndaxPTDSKYCDZZRHrsyt5XMBC2SewOX6bthYvxzNUzHd5AOnz5rjy2Ra76NZxyzNQCvtmkUSXG1a+bywMcTmOkA7JvCpqLBImtS3aSjaM2quUlRW7WQD4CewMUzxMOLaoWivd2KUdJdfr/G2ab9BFi9KLj6kgRiMPji1XVZ4oT2E6SeRbT/CSP9xDmdq5cnAYwkHzBhpF1cURf7RbHwSiJr88Lyzxcdua+ynRad845wACxw65VMpfTrAZSifw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30dd6a7a-c6cb-4b45-5aa2-08de8e06ec13
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 02:49:11.4690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Co4al9qUg4cGaOTQM2q+3henIolhrL0A2hzEyUInJSSel4RWQ1U/87SQh917FbcFONkuOjX48MJQd3XCmu23qA+Jt71tMzPUtfENG+ukXTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8800
X-MTK: N
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,mediatek.com,kernel.org,ndufresne.ca,lists.infradead.org,lists.freedesktop.org,chromium.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57533-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,collabora.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:dkim,mediatek.com:email,mediatek.com:mid,collabora.com:email,mediateko365.onmicrosoft.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Jason-JH.Lin@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 66734354E75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU3VuLCAyMDI2LTAzLTI5IGF0IDExOjAzIC0wNTAwLCBKYXNzaSBCcmFyIHdyb3RlOg0KPiAN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4NCj4gDQo+IA0KPiBPbiBUdWUsIE1hciAyNCwgMjAyNiBhdCAxMTowNeKAr1BNIEphc29u
LUpIIExpbg0KPiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4g
U2luY2UgdGhlIG1haWxib3ggZHJpdmVyIGRhdGEgY2FuIGJlIG9idGFpbmVkIHVzaW5nDQo+ID4g
Y21kcV9nZXRfbWJveF9wcml2KCkNCj4gPiBhbmQgYWxsIENNRFEgdXNlcnMgaGF2ZSB0cmFuc2l0
aW9uZWQgdG8gY21kcV9nZXRfbWJveF9wcml2KCksDQo+ID4gY21kcV9nZXRfc2hpZnRfcGEoKSBj
YW4gYmUgcmVtb3ZlZC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSCBMaW4gPGph
c29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vDQo+ID4gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bT4NCj4gPiAtLS0NCg0KW3NuaXBdDQoNCj4gSSB0aGluayB0aGUgc2ltcGxlc3Qgd291bGQgYmUg
dG8gdGFrZSB0aGlzIHdpdGggdGhlIG90aGVyIHR3bw0KPiBwcmVkZWNlc3NvciBwYXRjaGVzLg0K
PiBBY2tlZC1ieTogSmFzc2kgQnJhciA8amFzc2lzaW5naGJyYXJAZ21haWwuY29tPg0KPiANClRo
YW5rIHlvdSBKYXNzaSENCg0KDQoNCkhpIEFuZ2VsbywNCg0KQ291bGQgeW91IHBsZWFzZSB0YWtl
IHRoaXMgd2l0aCB0aGlzIHNlcmllcz8NCg0KW1NlcmllcyBWMiAzLzRdIFJlbW92ZSBzaGlmdF9w
YSBmcm9tIENNRFEganVtcCBmdW5jdGlvbnMNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDMyNTA0MDIzOS4yMTEyNTE3LTEtamFzb24tamgubGluQG1lZGlhdGVrLmNvbS8NCg0KVGhh
bmtzIQ0KDQpSZWdhcmRzLA0KSmFzb24tSkggTGluDQo=

