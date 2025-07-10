Return-Path: <linux-media+bounces-37262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BB9AFFB43
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59E241C83568
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 07:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062FD28936F;
	Thu, 10 Jul 2025 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tVPFk7Q0";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="tVeaHgPo"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF361DFFC;
	Thu, 10 Jul 2025 07:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752133584; cv=fail; b=c38HZN7dQ8pUGU2vaNSo8LW9ceZ0jvG5novzuANEdktdElOpchSsrFuJdxvXIxJ18Gd3pzzthAxMRSeJ8Lv41+WNVTQfCCm4Qfw30nKOC5DQBZGuBae9bG62Pe+J0b+ZjBtFAyZrY2jyNNlWKBK6hCh0n5cJ+m/4wYRxJczyRjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752133584; c=relaxed/simple;
	bh=GFg3NvROr3rUCkKTDKjb12k20H1OlpOqEm+g7+IHjk4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=imhR3u9//Fw2qJQTON3MvyzUIqc24aCtOdrc6YuvyC5+kfZzmvKUE3D+nVafkvgYpxH+5QIrFaiTYm2ernmsYIWgF5GncLje0qdyEx/7TvGlSeaNe8S9wN0PWc80PbMu4sza6WibBA5v2aIzMzrxPEz8Rf4p6L0nv5LlufAACTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tVPFk7Q0; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=tVeaHgPo; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f2004bde5d6111f0b1510d84776b8c0b-20250710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=GFg3NvROr3rUCkKTDKjb12k20H1OlpOqEm+g7+IHjk4=;
	b=tVPFk7Q0IeEuRQyjDgzcf5h4HLq8/75WHImLVJ/99xHRmZrUxDiNqibFZtr0r0tzAharQO5p5O7wj+0miAZTr6Gqesk1N8f82/OoYjZtbZf/oYnyL3BrUGBuSSrGs3gUQ3oTQ4Xybi71loV62aQ2bhtmaaTiPMXZhNgxI60tqW0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:f48d2102-8366-405b-941c-2de48e0e99e4,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:07d5b749-3902-4ad6-a511-6378a8132fbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f2004bde5d6111f0b1510d84776b8c0b-20250710
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1763543682; Thu, 10 Jul 2025 15:46:10 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Jul 2025 15:46:07 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Jul 2025 15:46:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAwfuiWSbLgIAkolH229o8t2x1gKMNgub4VfoqBTYorOvAMeivfk+L2ycRmpTt95i/gZ9Iux8dQVyCmynxdgXTvX8NbHM/QAaYTRxfVijdsdwdDdH5jrUseTj8p4XBIpaChf1Wyv3vMVr2AEbebu2dJZsxmzdjHIq3NwnabLAV7/cRm47Zm+iBugYP/It+AYpdeifxeS9LM2IKHAdbjLsSRFXRRj2ipJFYsedYmqnTM1BQ1b904+HGLvOT/TGzjgnDFF/2iCdDeyFgN+ul2sk2l+71xWt7qUsi8zBX8zDbhom55RQc/jVza8sHJbjRC7zQj4mXcDeFQ32fyjgZY8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFg3NvROr3rUCkKTDKjb12k20H1OlpOqEm+g7+IHjk4=;
 b=JKJWs0FVM8qF83K3hHAqt4afQ5BXq0V1khS583Q/25qmqvYSj3OgqXNXi+CGhSmI86/aizbUnWd9XU2pb4QBWnWQsY+OuK3RFfCx8n/AV9QLfKSKHKyUzDOXEbTLenJjmVzHhyWXQKNCM1/83BCQ/PmrA7gqPS4IGu+zYvYBS5DyDpzxs0+73HtUnHLhEbQ96s9xaNJO0jtBgW4ztFZC24ummQ/ZC/ruVXCyq24OLkSnsXhtBW+8fYTAoikpZ6k+J3ywG8WkKxXkhDyiiBZigH9/Bn/HltQQ8ai8uXRoVHMRV8DChahdt/d+adbPLFbsvWvV3J9SvYagIxzLyeu+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFg3NvROr3rUCkKTDKjb12k20H1OlpOqEm+g7+IHjk4=;
 b=tVeaHgPo16PNHF6810SO9gX1Oye+cr6hrTLdtoFvJcBpwQjD7VwGM35y666wIug6T3s8tpP1E8ZP6nQsXQC5fyp4ZqNAFCM7+qdpkpofSW261FQgnAy4J0xm/w1GztoxM281o3uiENX+eU5OFCYI+jqfB5XCf9fRkkShTQ1W1Rc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8090.apcprd03.prod.outlook.com (2603:1096:400:45a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 07:46:07 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 07:46:06 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?U2hhbmd5YW8gTGluICjmnpfkuIrloK8p?=
	<Shangyao.Lin@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 08/13] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Topic: [PATCH v2 08/13] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Index: AQHb7uEEtESJ2rXZZ0e/O1qQFiOcQbQq/5+A
Date: Thu, 10 Jul 2025 07:46:06 +0000
Message-ID: <600de87b908be63c2a5064837e4e9684d703527c.camel@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
	 <20250707013154.4055874-9-shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-9-shangyao.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8090:EE_
x-ms-office365-filtering-correlation-id: c12e404b-b9e9-45ec-1f8a-08ddbf85d438
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OFJtNHdKdEd5WFUvZzVhYzU3YXk4OVNuUllGSU9HZXJYTnJaWjJoKzVTRHhj?=
 =?utf-8?B?Z1k3MktXS0d5MzRsejlwSUdOeFRBQUxUMGNjWGtkeTRBa0ZnandOaVM2M05p?=
 =?utf-8?B?K2F1MVE3QVQ5SzQ5SytGSHFqNi9Tb3VpWEZnaXpWT21vZmNMUUFyd0NnM1lO?=
 =?utf-8?B?OTF5ZVErTzl4M3R0ZUxOcS9udWZYRHRnRzNlNDBzcWJYU2s2eUJUMVl0b3g3?=
 =?utf-8?B?S0ZuL1ZTSUtIaFJqRzNkUmkxSkIrTXprdXpJQ1V6TmNsMDE4ZmRZMXcwOXN5?=
 =?utf-8?B?aFVIZEhMVUkzdkpmZ0tmVUhiYjN3bGdRV01TSHBxRlhMZWpVTEpEN2xtK3Uz?=
 =?utf-8?B?UnZUUk94aU80TDZ3WFpQY1ZpajJOK3ptZGZTUWZLYzRSa3ZRa2kzTFBpVTJq?=
 =?utf-8?B?YzgvOWJKdktpb09kSk0yNDlBR2w3dXlpeVRLdGs1N3RBUkhjMW4vWk5KVjYy?=
 =?utf-8?B?RzRaY0E3NUJaZFlidDB4a3REMzhIZzRBaXcyUkVENW9kb0tUdllKWUNoeWVo?=
 =?utf-8?B?THJoZENHU2dxamRYcUVmeExtdFNOaUJOK2d0bmtvQjBpL0J6SjFlVjkvNkt2?=
 =?utf-8?B?cXhPQkJSdk53WGpHZC9mQWN1YkVES0x1OEVNZU9hSmRXUmEwT0IxRVRBOTI0?=
 =?utf-8?B?eUVpbk53R2hJQ0QrOHR3QitQRkVWdU5GQmpGYWtPQXpCbGh2d1BGVSthbWxz?=
 =?utf-8?B?V3ZvQXUwM0g0TThqYUd4bnljM2xJaThMcitqeXNYWVIrQ0FjYkhUV2hKNlBi?=
 =?utf-8?B?K3VTWnh5alFwSTRIVnkraVlhZDkrdkdrQ1J1QkljZU10clJNU1RIM05PQVVz?=
 =?utf-8?B?OHhBTzZuUXloWVZoS2UyOXp6VXZBek1aVEdIZDR2VFI5S3FGYUhVZVNYQ1Yy?=
 =?utf-8?B?RnBiN2F0MlFCamFmbUg3eTNnS2U0cVdqRXZWWmg3endveDVHTXNmVnN4MERZ?=
 =?utf-8?B?bHZWMXFQTEdHcUNXb04yUnBuL2ZnS29FVkcxck82N2hJRmpkaVZjU1lkZnF0?=
 =?utf-8?B?MDNBdkZ6OVdhS0k5UFBEUGpyZitsN1ZwNE5SbWpXazQ0QXN2bUdWT0NtYito?=
 =?utf-8?B?eXJCT3RrRGRrTm5Cb25POFVJRzBBREJKNWFHbDlTUUZPUmhKdU1Ha2N0RzdX?=
 =?utf-8?B?V0tuWVpiWVJRUXNFaWpxbzNqVDZsdVhtRlMzaDZjdkt6TDdoeXMyTWdERGdT?=
 =?utf-8?B?bFlHczVFTkVaV2hSNHU4bUlqQVcwR2paUWx4S1lUajFmSXJ1Zms0UGZyV1Rj?=
 =?utf-8?B?NkNqSjcwNGR6RWdzdXp5ZFNpMGhpcFd0MWJZTW9LT0ZhS3pacy9MaU1HUzBH?=
 =?utf-8?B?dzJpbG9NV2w4blNIUk9YTG5IMEFHLzZ3MW1wWmVaWmQzbGg3UDYwYk9zRlRj?=
 =?utf-8?B?N3FzTUxlUkh6a3R5Mm5qb2d6UXZ0L3dSR0EvV2NCa1h6WERzbDlUOXpFS25U?=
 =?utf-8?B?aS9UMDlPMGxCRlhrUWIxMzJsUkFkbUFaUkYySkROa0tDVUlreVYyM2xHOFc4?=
 =?utf-8?B?eXIzaTNSK0FGVGUvY3lhRmxjelVlc0dtVlZvN2hCMmZNbnRpMnFYMFU0N2Vs?=
 =?utf-8?B?cXlRRDAvMklhRDA4NkNpRGw4WWh2bGcyamswM0lrQVJGckFFWTF2UnNJellZ?=
 =?utf-8?B?SlR5RDdScWl5NnE0QUdvL1ViYythTlFjWXhWRkxPcnBLeDJHOVV4bk9RbE1m?=
 =?utf-8?B?NmJEaFRSc3hkVUloWmZEaUliREVWRjE5MU94dUxZQzl3dkgrSGlPQjJQeFBD?=
 =?utf-8?B?NTYxYUVpNXlENDZleExNQW85ZGI0ZVZVYzVRUGNFRVhhOGNzdUk5Ykg0cjdE?=
 =?utf-8?B?aUNyN2g5Q1ZlQVJWWXhBYXVqUnRZMDlYeWYvWFN4Q25XUXdDRitaNW9JcVpH?=
 =?utf-8?B?K1N1VHByVDlHWGV6blhOREJKY09NZmRaa0o0dDlzZDJYWlVZdTcwcEp6NUN0?=
 =?utf-8?B?eE9kb0UveXFTbm03OStKckhqL2EzWVkzTlJTMk8vdkkyc2k5VzZqdGhKb0VH?=
 =?utf-8?B?bzRTRm15OU5BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEdQbDR5RzN4WUhld205UlExRTZ0ZTVocWVFNUo1MWdpYVNHWE9qSGtVYkp5?=
 =?utf-8?B?NWFKRUN1Z0xYVkYySElFclNYd2E5b2ROWUt1Rnh2aDRnK0ZkbnZ0bDNSbWlS?=
 =?utf-8?B?YVJtUnEzRCs0VzlEbXROWFJkTTBuVzM4K0tEUzFCMHhBZUYyYW5ydWI4N2Ja?=
 =?utf-8?B?Mkw5c1dvZ2NXZkhMTGFTRVpZZU5LNURKaWlHVVgwNjdlUGdyZmlodVg4alky?=
 =?utf-8?B?eUpjMGVqOG01R3pGeU5EZktFT0hLT2hEOGc1czcxOUlncU92R1cvY2IvQUpy?=
 =?utf-8?B?ZVlsSkhzRFNYUm94Y0lXWXV4TTM4Zks1Ujlzc2syRGRabHpIbjcyMkxaK0Zs?=
 =?utf-8?B?TFBVeVljMTBQSUxYQ1R4blNSSm81WlFiNkVacjBDWDY5UDZzdndwOHhqalI2?=
 =?utf-8?B?aEIrakhKOFM3VUcrcVc5SndvOTBEMVdhOTlSMnFOOWNuRVJRZStzTlhwcHpo?=
 =?utf-8?B?UTA0ZGFhOHZkMFNCZmRxc0pyV2c2cmdJOWp1K0RXYUZGa2kxbDNwMi82R052?=
 =?utf-8?B?SXQxUWg2d3dybGxWN3VWaXpGREQ5OHZWaFlqOHU3czQ1Ym9veXhJQVBHVDY4?=
 =?utf-8?B?MEY4ZHVOU1VITGdGZjZXcTZ6VS9aQ3l6K1lINnNVUjBnZWt0RENCQkpCSVUr?=
 =?utf-8?B?NFYrTHZZdEVuMDBGN2MwcTZmYzZoQzNaTkFMLzdEbUwvMzlFTmJqalJocjNO?=
 =?utf-8?B?QkNVN0pUaFNVcXNaSDNEZERkR01nb1lIbmdLZ0JHR0xZbGN4SjN5QjFzdU1l?=
 =?utf-8?B?Y2x2K2lmODhmb0gwWEpmTktBMS85aUkyNldBMGU1a01ycEpHamxOOTdScTlB?=
 =?utf-8?B?b29HTnhHSGF4Qk5MUXoweHBpVE5qMEJEeE03RVp1RU5aSGx2MVlBd090dk1W?=
 =?utf-8?B?dGZYY2JIK1ZIbGp2RTIyeHY1cVlQQnBiaW9tWVQ0MkdGMyt5aVk4Mm9xUEND?=
 =?utf-8?B?aWhpVVU1SUpWNVI0Z0VTUTBFV1RoMU1GWHNhUnpXQWlZTC9YYXJUWHYzZThs?=
 =?utf-8?B?UnFnV1U0UXRHQU5aVnJ2ejRKREl4NSsxelgrQVUrZkhIVHU2cmNiTmpEQS95?=
 =?utf-8?B?OUJ4Ykx4M3Rpc2FjeXJkMHduNThCQ0Q2c1pNMXY0YzVqSU5tcmVKOW95STlR?=
 =?utf-8?B?RW5KYjdSK0pCSFpPallJbGkrQ3FvNjNtaWw0eDZsUXlxQUUvK1RiMjI3amVT?=
 =?utf-8?B?YVU5VDRkS01oUGZCRGFDNnFSaU1kN3F1SnRaTEd1UFdkdGVPb0l3RW5tVzFD?=
 =?utf-8?B?T3pwZUlQRGxRRG9Qc1BTSDFiVVlidWk5S0hxczJNeGpSZHZpTW5Rb05rb0VZ?=
 =?utf-8?B?cUh2aWl0Rkh2d1RYcjV3RmtUaUVHQkJlZEFSZmtKcUIzc3dPb2lwOUVCWWlK?=
 =?utf-8?B?UXE2YXRsMW8vNGNrb0NKNWNZZFlJd2lja1JuSHcxcmhYZ0tGTXVUUzhmNXhZ?=
 =?utf-8?B?MVl3TE1QdkFDT09kenBLaDk0eVlrV1I4YlhZVW15SU9lekd1S1JFWU1EYWJP?=
 =?utf-8?B?ZFBXTVNoM0NyMXBhUG9UeUZoTmRhRWpFOHRZRE5sUXJqQWZBclpaY211ZTZB?=
 =?utf-8?B?QzVhTURMd1ZabkNiS0FRU25CTERWYXcvaXkrQWl4dEdHYzVLMGdocDV1SHpC?=
 =?utf-8?B?aGpBVzlFYkRuU016RWhRaStTR3hpSkdZY0o5bWR5cnV2OGlCSFY2c1YxS2N5?=
 =?utf-8?B?THNzMGRjVFlML3lPejVZaUVNR1BTZmxJd2lVVGFhU095WmNIZlViRy9laXJt?=
 =?utf-8?B?RHFITTFFQ1FBNjJ1dFNUcnJMRU9McWhNdHkyT2FubDF1cEJyb1RtU0x4alRU?=
 =?utf-8?B?WkpZb0NPOHE1VE0xeHN0dmdSMzdMOWhOVXVWRHdZMVNrR0h0S0g2dWVIdTN1?=
 =?utf-8?B?UUxDSmxtSXhTbzlmTFI4NU9rZlROY3RlS21HUXIyVUYxdy9aV0NmNDBjbTI0?=
 =?utf-8?B?N1p1TWxzNlhoQVBwQ1F0UnBUOUtQNkRpRFZGbytMeEtHendJWW1ieTRmTmlB?=
 =?utf-8?B?QXdSaENpUktaZWQxVWZGZm9QSVpON3RsZUVTaVRZcFA0eHZNS3ZpMUhqVjRv?=
 =?utf-8?B?d1Y0dHJSbFM3Q0RtdXVIQ1VLWWplV3I2QnhBa0locHh1WUlHeVhXOFExKzE4?=
 =?utf-8?Q?Z5L9kSW5+IOEjiLodaKuBHZ9U?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <657322223EF44C41BA379C0B4B07B13B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c12e404b-b9e9-45ec-1f8a-08ddbf85d438
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 07:46:06.7884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +wPwfH9L3I77gX5P8nzVpx1aUuogn9VgNfZAVH7ZuQY63Jcdt1AmvCav2wQccu7xj1Cx/vN74CyF1FEotvleAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8090

T24gTW9uLCAyMDI1LTA3LTA3IGF0IDA5OjMxICswODAwLCBzaGFuZ3lhbyBsaW4gd3JvdGU6DQo+
IEZyb206ICJzaGFuZ3lhby5saW4iIDxzaGFuZ3lhby5saW5AbWVkaWF0ZWsuY29tPg0KPiANCj4g
SW50cm9kdWNlcyB0aGUgdG9wIG1lZGlhIGRldmljZSBkcml2ZXIgZm9yIHRoZSBNZWRpYVRlayBJ
U1A3WCBDQU1TWVMuIFRoZSBkcml2ZXIgbWFpbnRhaW5zIHRoZSBjYW1lcmEgc3lzdGVtLCBpbmNs
dWRpbmcgc3ViLWRldmljZSBtYW5hZ2VtZW50LCBETUEgb3BlcmF0aW9ucywgYW5kIGludGVncmF0
aW9uIHdpdGggdGhlIFY0TDIgZnJhbWV3b3JrLiBJdCBoYW5kbGVzIHJlcXVlc3Qgc3RyZWFtIGRh
dGEsIGJ1ZmZlciBtYW5hZ2VtZW50LCBNZWRpYVRlay1zcGVjaWZpYyBmZWF0dXJlcywgcGlwZWxp
bmUgbWFuYWdlbWVudCwgc3RyZWFtaW5nIGNvbnRyb2wsIGFuZCBlcnJvciBoYW5kbGluZyBtZWNo
YW5pc21zLiBBZGRpdGlvbmFsbHksIGl0IGFnZ3JlZ2F0ZXMgc3ViLWRyaXZlcnMgZm9yIHRoZSBj
YW1lcmEgaW50ZXJmYWNlLCByYXcsIGFuZCB5dXYgcGlwZWxpbmVzLg0KPiANCj4gLS0tDQoNCltz
bmlwXQ0KDQo+ICtzdHJ1Y3QgbXRrX2NhbV9jdHggKm10a19jYW1fc3RhcnRfY3R4KHN0cnVjdCBt
dGtfY2FtX2RldmljZSAqY2FtLA0KPiArCQkJCSAgICAgIHN0cnVjdCBtdGtfY2FtX3ZpZGVvX2Rl
dmljZSAqbm9kZSkNCj4gK3sNCj4gKwlzdHJ1Y3QgbXRrX2NhbV9jdHggKmN0eCA9IG5vZGUtPmN0
eDsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ICsJc3RydWN0IHY0bDJfc3ViZGV2ICoqdGFy
Z2V0X3NkOw0KPiArCWludCByZXQsIGksIGlzX2ZpcnN0X2N0eDsNCj4gKwlzdHJ1Y3QgbWVkaWFf
ZW50aXR5ICplbnRpdHkgPSAmbm9kZS0+dmRldi5lbnRpdHk7DQo+ICsJc3RydWN0IG1lZGlhX2dy
YXBoIGdyYXBoOw0KPiArDQo+ICsJZGV2X2luZm8oY2FtLT5kZXYsICIlczpjdHgoJWQpOiB0cmln
Z2VyZWQgYnkgJXNcbiIsDQo+ICsJCSBfX2Z1bmNfXywgY3R4LT5zdHJlYW1faWQsIGVudGl0eS0+
bmFtZSk7DQo+ICsNCj4gKwlhdG9taWNfc2V0KCZjdHgtPmVucXVldWVkX2ZyYW1lX3NlcV9ubywg
MCk7DQo+ICsJY3R4LT5jb21wb3NlZF9mcmFtZV9zZXFfbm8gPSAwOw0KPiArCWN0eC0+ZGVxdWV1
ZWRfZnJhbWVfc2VxX25vID0gMDsNCj4gKwlhdG9taWNfc2V0KCZjdHgtPnJ1bm5pbmdfc19kYXRh
X2NudCwgMCk7DQo+ICsJaW5pdF9jb21wbGV0aW9uKCZjdHgtPnNlc3Npb25fY29tcGxldGUpOw0K
PiArDQo+ICsJaXNfZmlyc3RfY3R4ID0gIWNhbS0+Y29tcG9zZXJfY250Ow0KPiArCWlmIChpc19m
aXJzdF9jdHgpIHsNCj4gKwkJc3Bpbl9sb2NrKCZjYW0tPmRtYV9wcm9jZXNzaW5nX2xvY2spOw0K
PiArCQljYW0tPmRtYV9wcm9jZXNzaW5nX2NvdW50ID0gMDsNCj4gKwkJc3Bpbl91bmxvY2soJmNh
bS0+ZG1hX3Byb2Nlc3NpbmdfbG9jayk7DQo+ICsJCXNwaW5fbG9jaygmY2FtLT5ydW5uaW5nX2pv
Yl9sb2NrKTsNCj4gKwkJY2FtLT5ydW5uaW5nX2pvYl9jb3VudCA9IDA7DQo+ICsJCXNwaW5fdW5s
b2NrKCZjYW0tPnJ1bm5pbmdfam9iX2xvY2spOw0KPiArDQo+ICsJCWRldl9pbmZvKGNhbS0+ZGV2
LCAiJXM6IHBvd2VyIG9uIGNhbXN5c1xuIiwgX19mdW5jX18pOw0KPiArCQlyZXQgPSBwbV9ydW50
aW1lX3Jlc3VtZV9hbmRfZ2V0KGNhbS0+ZGV2KTsNCj4gKwkJaWYgKHJldCA8IDApIHsNCj4gKwkJ
CWRldl9pbmZvKGNhbS0+ZGV2LCAiJXM6IHBvd2VyIG9uIGNhbXN5cyBmYWlsZWRcbiIsDQo+ICsJ
CQkJIF9fZnVuY19fKTsNCj4gKwkJCXJldHVybiBOVUxMOw0KPiArCQl9DQo+ICsNCj4gKwkJcmV0
ID0gaXNwX2NvbXBvc2VyX2luaXQoY2FtKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCWdvdG8gZmFp
bF9zaHV0ZG93bjsNCj4gKwl9DQo+ICsJY2FtLT5jb21wb3Nlcl9jbnQrKzsNCj4gKwlpZiAoaXNf
eXV2X25vZGUobm9kZS0+ZGVzYy5pZCkpDQo+ICsJCWRldiA9IGNhbS0+cmF3Lnl1dnNbMF07DQo+
ICsJZWxzZQ0KPiArCQlkZXYgPSBjYW0tPnJhdy5kZXZzWzBdOw0KPiArDQo+ICsJcmV0ID0gbXRr
X2NhbV93b3JraW5nX2J1Zl9wb29sX2luaXQoY3R4LCBkZXYpOw0KPiArCWlmIChyZXQpIHsNCj4g
KwkJZGV2X2luZm8oY2FtLT5kZXYsICJmYWlsZWQgdG8gcmVzZXJ2ZSBETUEgbWVtb3J5OiVkXG4i
LCByZXQpOw0KPiArCQlnb3RvIGZhaWxfdW5pbml0X2NvbXBvc2VyOw0KPiArCX0NCj4gKw0KPiAr
CWt0aHJlYWRfaW5pdF93b3JrZXIoJmN0eC0+c2Vuc29yX3dvcmtlcik7DQoNCllvdSBkb2VzIG5v
dCBkbyBhbnl0aGluZyB0byBzZW5zb3Jfd29ya2VyLCBzbyBpdCdzIHVzZWRsZXNzLg0KRHJvcCBp
dC4NCg0KPiArCWN0eC0+c2Vuc29yX3dvcmtlcl90YXNrID0ga3RocmVhZF9ydW4oa3RocmVhZF93
b3JrZXJfZm4sDQo+ICsJCQkJCSAgICAgICZjdHgtPnNlbnNvcl93b3JrZXIsDQo+ICsJCQkJCSAg
ICAgICJzZW5zb3Jfd29ya2VyLSVkIiwNCj4gKwkJCQkJICAgICAgY3R4LT5zdHJlYW1faWQpOw0K
PiArCWlmIChJU19FUlIoY3R4LT5zZW5zb3Jfd29ya2VyX3Rhc2spKSB7DQo+ICsJCWRldl9pbmZv
KGNhbS0+ZGV2LA0KPiArCQkJICIlczpjdHgoJWQpOiBjb3VsZCBub3QgY3JlYXRlIHNlbnNvcl93
b3JrZXJfdGFza1xuIiwNCj4gKwkJCSBfX2Z1bmNfXywgY3R4LT5zdHJlYW1faWQpOw0KPiArCQln
b3RvIGZhaWxfcmVsZWFzZV9idWZmZXJfcG9vbDsNCj4gKwl9DQo+ICsNCj4gKwlzY2hlZF9zZXRf
ZmlmbyhjdHgtPnNlbnNvcl93b3JrZXJfdGFzayk7DQo+ICsNCj4gKwljdHgtPmNvbXBvc2VyX3dx
ID0gYWxsb2Nfb3JkZXJlZF93b3JrcXVldWUoZGV2X25hbWUoY2FtLT5kZXYpLA0KPiArCQkJCQkJ
ICAgV1FfSElHSFBSSSB8IFdRX0ZSRUVaQUJMRSk7DQo+ICsJaWYgKCFjdHgtPmNvbXBvc2VyX3dx
KSB7DQo+ICsJCWRldl9pbmZvKGNhbS0+ZGV2LCAiZmFpbGVkIHRvIGFsbG9jIGNvbXBvc2VyIHdv
cmtxdWV1ZVxuIik7DQo+ICsJCWdvdG8gZmFpbF91bmluaXRfc2Vuc29yX3dvcmtlcl90YXNrOw0K
PiArCX0NCj4gKw0KPiArCWN0eC0+ZnJhbWVfZG9uZV93cSA9IGFsbG9jX29yZGVyZWRfd29ya3F1
ZXVlKGRldl9uYW1lKGNhbS0+ZGV2KSwNCj4gKwkJCQkJCSAgICAgV1FfSElHSFBSSSB8IFdRX0ZS
RUVaQUJMRSk7DQo+ICsJaWYgKCFjdHgtPmZyYW1lX2RvbmVfd3EpIHsNCj4gKwkJZGV2X2luZm8o
Y2FtLT5kZXYsICJmYWlsZWQgdG8gYWxsb2MgZnJhbWVfZG9uZSB3b3JrcXVldWVcbiIpOw0KPiAr
CQlnb3RvIGZhaWxfdW5pbml0X2NvbXBvc2VyX3dxOw0KPiArCX0NCj4gKw0KPiArCXJldCA9IG1l
ZGlhX3BpcGVsaW5lX3N0YXJ0KCZlbnRpdHktPnBhZHNbMF0sICZjdHgtPnBpcGVsaW5lKTsNCj4g
KwlpZiAocmV0KSB7DQo+ICsJCWRldl93YXJuKGNhbS0+ZGV2LA0KPiArCQkJICIlczpwaXBlKCVk
KTpmYWlsZWQgaW4gbWVkaWFfcGlwZWxpbmVfc3RhcnQ6JWRcbiIsDQo+ICsJCQkgX19mdW5jX18s
IG5vZGUtPnVpZC5waXBlX2lkLCByZXQpOw0KPiArCQlnb3RvIGZhaWxfdW5pbml0X2ZyYW1lX2Rv
bmVfd3E7DQo+ICsJfQ0KPiArDQo+ICsJLyogdHJhdmVyc2UgdG8gdXBkYXRlIHVzZWQgc3ViZGV2
cyAmIG51bWJlciBvZiBub2RlcyAqLw0KPiArCWkgPSAwOw0KPiArCXJldCA9IG1lZGlhX2dyYXBo
X3dhbGtfaW5pdCgmZ3JhcGgsIGVudGl0eS0+Z3JhcGhfb2JqLm1kZXYpOw0KPiArCWlmIChyZXQp
DQo+ICsJCWdvdG8gZmFpbF9zdG9wX3BpcGVsaW5lOw0KPiArDQo+ICsJbWVkaWFfZ3JhcGhfd2Fs
a19zdGFydCgmZ3JhcGgsIGVudGl0eSk7DQo+ICsJd2hpbGUgKChlbnRpdHkgPSBtZWRpYV9ncmFw
aF93YWxrX25leHQoJmdyYXBoKSkpIHsNCj4gKwkJZGV2X2RiZyhjYW0tPmRldiwgImxpbmtlZCBl
bnRpdHkgJXNcbiIsIGVudGl0eS0+bmFtZSk7DQo+ICsNCj4gKwkJdGFyZ2V0X3NkID0gTlVMTDsN
Cj4gKw0KPiArCQlzd2l0Y2ggKGVudGl0eS0+ZnVuY3Rpb24pIHsNCj4gKwkJY2FzZSBNRURJQV9F
TlRfRl9JT19WNEw6DQo+ICsJCQljdHgtPmVuYWJsZWRfbm9kZV9jbnQrKzsNCj4gKwkJCWJyZWFr
Ow0KPiArCQljYXNlIE1FRElBX0VOVF9GX1BST0NfVklERU9fUElYRUxfRk9STUFUVEVSOiAvKiBw
aXBlbGluZSAqLw0KPiArCQkJaWYgKGkgPj0gTUFYX1BJUEVTX1BFUl9TVFJFQU0pDQo+ICsJCQkJ
Z290byBmYWlsX3N0b3BfcGlwZWxpbmU7DQo+ICsJCQl0YXJnZXRfc2QgPSBjdHgtPnBpcGVfc3Vi
ZGV2cyArIGk7DQo+ICsJCQlpKys7DQo+ICsJCQlicmVhazsNCj4gKwkJY2FzZSBNRURJQV9FTlRf
Rl9WSURfSUZfQlJJREdFOiAvKiBzZW5pbmYgKi8NCj4gKwkJCXRhcmdldF9zZCA9ICZjdHgtPnNl
bmluZjsNCj4gKwkJCWJyZWFrOw0KPiArCQljYXNlIE1FRElBX0VOVF9GX0NBTV9TRU5TT1I6DQo+
ICsJCQl0YXJnZXRfc2QgPSAmY3R4LT5zZW5zb3I7DQoNCkluIHRoaXMgc2VyaWVzLCBubyBlbnRp
dHkncyBmdW5jdGlvbiBpcyBNRURJQV9FTlRfRl9DQU1fU0VOU09SLA0Kc28gY3R4LT5zZW5zb3Ig
aXMgYWx3YXlzIE5VTEwuDQpEcm9wIGl0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArCQkJYnJlYWs7
DQo+ICsJCWRlZmF1bHQ6DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArDQo+ICsJCWlmICghdGFy
Z2V0X3NkKQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJaWYgKCp0YXJnZXRfc2QpIHsNCj4g
KwkJCWRldl9pbmZvKGNhbS0+ZGV2LCAiZHVwbGljYXRlZCBzdWJkZXZzISEhXG4iKTsNCj4gKwkJ
CWdvdG8gZmFpbF90cmF2ZXJzZV9zdWJkZXY7DQo+ICsJCX0NCj4gKw0KPiArCQlpZiAoaXNfbWVk
aWFfZW50aXR5X3Y0bDJfc3ViZGV2KGVudGl0eSkpDQo+ICsJCQkqdGFyZ2V0X3NkID0gbWVkaWFf
ZW50aXR5X3RvX3Y0bDJfc3ViZGV2KGVudGl0eSk7DQo+ICsJfQ0KPiArCW1lZGlhX2dyYXBoX3dh
bGtfY2xlYW51cCgmZ3JhcGgpOw0KPiArDQo+ICsJcmV0dXJuIGN0eDsNCj4gKw0KPiArZmFpbF90
cmF2ZXJzZV9zdWJkZXY6DQo+ICsJbWVkaWFfZ3JhcGhfd2Fsa19jbGVhbnVwKCZncmFwaCk7DQo+
ICtmYWlsX3N0b3BfcGlwZWxpbmU6DQo+ICsJbWVkaWFfcGlwZWxpbmVfc3RvcCgmZW50aXR5LT5w
YWRzWzBdKTsNCj4gK2ZhaWxfdW5pbml0X2ZyYW1lX2RvbmVfd3E6DQo+ICsJZGVzdHJveV93b3Jr
cXVldWUoY3R4LT5mcmFtZV9kb25lX3dxKTsNCj4gK2ZhaWxfdW5pbml0X2NvbXBvc2VyX3dxOg0K
PiArCWRlc3Ryb3lfd29ya3F1ZXVlKGN0eC0+Y29tcG9zZXJfd3EpOw0KPiArZmFpbF91bmluaXRf
c2Vuc29yX3dvcmtlcl90YXNrOg0KPiArCWt0aHJlYWRfc3RvcChjdHgtPnNlbnNvcl93b3JrZXJf
dGFzayk7DQo+ICsJY3R4LT5zZW5zb3Jfd29ya2VyX3Rhc2sgPSBOVUxMOw0KPiArZmFpbF9yZWxl
YXNlX2J1ZmZlcl9wb29sOg0KPiArCW10a19jYW1fd29ya2luZ19idWZfcG9vbF9yZWxlYXNlKGN0
eCwgZGV2KTsNCj4gK2ZhaWxfdW5pbml0X2NvbXBvc2VyOg0KPiArCWlzcF9jb21wb3Nlcl91bmlu
aXQoY2FtKTsNCj4gKwljYW0tPmNvbXBvc2VyX2NudC0tOw0KPiArZmFpbF9zaHV0ZG93bjoNCj4g
KwlpZiAoaXNfZmlyc3RfY3R4KQ0KPiArCQlycHJvY19zaHV0ZG93bihjYW0tPnJwcm9jX2hhbmRs
ZSk7DQo+ICsNCj4gKwlyZXR1cm4gTlVMTDsNCj4gK30NCj4gKw0KDQo=

