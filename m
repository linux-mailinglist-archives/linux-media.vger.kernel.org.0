Return-Path: <linux-media+bounces-36073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E849AEB182
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 10:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 930FF1C23C7F
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 08:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A4F23CF12;
	Fri, 27 Jun 2025 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="foATYwvB";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="s2e4lX2O"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C877F24167C;
	Fri, 27 Jun 2025 08:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751013704; cv=fail; b=u++QDZePiG/Zfj+4j/w8ClXEhS27guZtSauz+NPWOhx1gXYVV7R7Gx+cqa0kEZ+dCcTYrVKof3KMtwrsjzzt7tn4yLBZ5yfqbOlJYSff1B+LvV5aCZ6dZo8xD7xz1HIBx6UpLveNhKq4a3zTF02qhLXkPLDMEY3f5+1jpOvnsDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751013704; c=relaxed/simple;
	bh=1RIlrxM5WRa2iDoQKOJJNPs5gcGgd/dqxQovTkq9JkA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s/p+6g8yse5majFTEkcA0YmdykG2OdyWw6zoxkzRmxUKAqZbee5+FzH2ooQrbjd7bYEFptO2W019Y1BY8D2lJk3IAEuq89rOoBkmpIWy9KTcO1Vnv+WWekPqHELqtntCBI+rox56M3b5r5uznbo5K91fnpaSjKbD+pO5QUWsEX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=foATYwvB; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=s2e4lX2O; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 88879c0e533211f0b33aeb1e7f16c2b6-20250627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=1RIlrxM5WRa2iDoQKOJJNPs5gcGgd/dqxQovTkq9JkA=;
	b=foATYwvBXCMoJMiQ4liRaCO5baVYfNG4bCauOZ0rbInU5Z9LTUmRUIC6vIsIzWnsSWGPWX92DOH3D+YPFKGUt5BpDAdtybceAVjcPC10qn97cC1wrImTtxK6QYYtM300DjKk4fDiFPIUA65S8EJSqdSHxicWDi9BjhGaSZPlX/k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:6bda3d9e-d000-47fd-9874-5e98ff974175,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:81374482-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 88879c0e533211f0b33aeb1e7f16c2b6-20250627
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1590076663; Fri, 27 Jun 2025 16:41:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 16:41:32 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 27 Jun 2025 16:41:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BS+MImRGNDaH+gRjuPYF2SYj4ffLiKBnfGVjUbjOSFUhoH+/HaNXVG46NqVAfHcuy8AxDeAg/7iqHO/i2qg55IzuIUo6WnsszwV117fj/TldHUMQhqbZS20p+tXobVCl6/Uzh3Io7ph7olXyCGtBZrGAqjPk1tKdLUP9v9KiybUPH5UID5cUjepSg22yX2vhMcDN2k25on2th6Nt0mwHMFYIMCEe2Hir/+g20zcmjtitMmXbyOTd6qQjm/1VyzbaZfLK/HPrdFPc8IcDoeGeFtehRbKpn5AJotK6uMpJK7mWhwqoRotxujSWnu7JEwkvxTNLomrCt5bv69C36C21Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RIlrxM5WRa2iDoQKOJJNPs5gcGgd/dqxQovTkq9JkA=;
 b=moYXDfbKW++XRxcOtlktUAZ4pPcmN5tUoOznOmYUlG3KL4a6ubW81KKgEzX4MOWVLAe5o5+dwrVfAsCTHrGnWyxX1doiVlZfDaUJn7z9Q+ZHvQTBB4JkV2mesCOZshBadBHCATw9cgZrMZvQBmJE6uN3fXUcb4vJeS3SEImv+cJ0n0+UaxDE/bypXk8RRWiMlrxOoDBjhhFpnqJ9VUBTbai1jTzkr+CajVFdJRBcZTLwkLUxZt70KivnW5OfoOAtU27D/Q8+pGwjwfKpwRBH7QiLaHcXz3WKQKmhgRAnojgE87GKB1iF9J9DBAmSN3O6UVU2t2IK582SZ7yJNySowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RIlrxM5WRa2iDoQKOJJNPs5gcGgd/dqxQovTkq9JkA=;
 b=s2e4lX2OWwc75q01qWBJvJQKOtM+c09UKJcx5OyXZfG9iOxtwYgppUfos2V+59KQcwDXlbGnTmh9DOudhCSVYpvllxb/tDlVkkp7TCPwB9Bz9D58lkiDjc+DsyOwtlgMJ13lkzNq0UB7tGJ8PbiZVFbjRzrWZT1mhCPqltiHq/k=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SE2PPFF3776CC00.apcprd03.prod.outlook.com (2603:1096:108:1::4b1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Fri, 27 Jun
 2025 08:41:30 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 08:41:30 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
	<Xavier.Chang@mediatek.com>
Subject: Re: [PATCH v6 06/20] mailbox: mtk-cmdq: Add GCE hardware
 virtualization configuration
Thread-Topic: [PATCH v6 06/20] mailbox: mtk-cmdq: Add GCE hardware
 virtualization configuration
Thread-Index: AQHb0xuUP67g52RskEeq4qvL4HldtbQW2FWA
Date: Fri, 27 Jun 2025 08:41:30 +0000
Message-ID: <f12d0d954bea2b89d6f316db6b9bbfeea6b4db8e.camel@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
	 <20250601173355.1731140-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20250601173355.1731140-7-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SE2PPFF3776CC00:EE_
x-ms-office365-filtering-correlation-id: 0d7946dc-a3a1-47f0-18f3-08ddb55669ca
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VGhnOHh1MnNjRnhCOUwrRkhBc3RmWnJwQy9qWVRlRE1sVktPSzc4bEk2R3Qv?=
 =?utf-8?B?YmJRODE1eUordFFpdDVVY3RMNFc5VEx2TTQ3T082UWZNTVVMK1NIcXJlM1cv?=
 =?utf-8?B?NGdxeEJMNG5GNE14SWU0NWR3RzdFaExSQXVWWUp2b011RWtFZnluTDVPM0N3?=
 =?utf-8?B?dGVmaFRIM21wVnVXb3h6Y3ZXTHIvbGZHL1JIV1RCWFhlcWtRc2t1UXMzQlNS?=
 =?utf-8?B?L2c3emFMMEVpTmJtYVE2LzZsY0o4QVk3aWdMUDZERElaSXFIdFE2ekoxYnpU?=
 =?utf-8?B?a1JjaHJNQWVhZ3crRnNLcklXSDZpZ00yL00xeVRyM2lPd3A1YW42TklTZjE0?=
 =?utf-8?B?b1NYWm9ESVV5bXZkTkZjT1V5aGxaRjVUV0dzZkM2WUxxQVZQYlNSeWRRWkdY?=
 =?utf-8?B?SFdrTHFqOEErZVJ2VEdPa2tPM2pGV3luZERKRm9MdHhkS2M0UW1VVUQ3UHlw?=
 =?utf-8?B?bXF5aGR0REhhdU5xWE84QXRRWktvT2k0MmJoMEs2anVsN0pDbzhTS0svZ29G?=
 =?utf-8?B?YmtsTDVnUnpPdTJld00vYnQxYlU4YncyWXVtYkRsajdZV1BrR1JuSjE1UkVZ?=
 =?utf-8?B?UXp0a3pRUStreGdJZlpVeWRGTmxkL2dIaURoQmlhSkc3LzB3L1Rwa3NIUXF3?=
 =?utf-8?B?NEVMWGxJWW5WNVNNR0tkZU5kaDRsbHJhb1dnSGlzbDQyN2NvNkd3cEc0WVdk?=
 =?utf-8?B?YUhCZmV4clVVd1hudStmeGdRQTc2bkxRdlRMUlUwemIvMmxYYXpvK21sVDBw?=
 =?utf-8?B?SzlRREpHSTNmUDl0L1dNTllXNWdwNzZMWFVNMENhaXhYUloxVW5rZ2wxdFQ0?=
 =?utf-8?B?a24zenlCb2hFVUx3Z2traHJtTjlxL3lEY0EvTnZhdzU1Z3poSmNDSW5lZFVL?=
 =?utf-8?B?RlQxM3BnVndtTEQwQkJaQUg5RTJLMmpRUi9BWDBnSVo4MXdyNndOZDlCejBL?=
 =?utf-8?B?MDBpQm5iSkZwcnFMUG9vdGJqOHEyb25Ycms4bUM0ZFdmZElxNFFMUndHajBt?=
 =?utf-8?B?d0VyU2ZvRDhnTGE1NnZPMUc2eGxtZUVPckRmSlQ1a2l0QXlyU3lHclBCOEgx?=
 =?utf-8?B?TkpsUnU0NDEwVHh1TkdHYzd3N2ozazc0dHoyUXVXNkRjZitXdUtqT2UxRGdL?=
 =?utf-8?B?cEdCeFBqQytFYkNRY012djdKKzFweDJOSHQ2UFp1MkhjUVZmTGNkQVRQQUVu?=
 =?utf-8?B?bjJBczhEQlc2UUVNMitBZ0lLeXBsS2ZKSzFuTEFtNm9PQWlMTVkrTWpnSU9I?=
 =?utf-8?B?cWprcnE5RnFNZUd1dnFqM0c4ZlBNVTZ5djBBV0oxWXBZNEQyUXB3T0ZFSld5?=
 =?utf-8?B?R1d1WTltaHhVNVVqVUYrZWkwT1d6NFZ4Z2RxT29McmRqUFRhUHI5UlpDVWNs?=
 =?utf-8?B?VXhoMVBzYk9ucU5MOE80QkhTK0ZOK2hCVjdaR3NRRnUrU1lLd2IxaklpV2F1?=
 =?utf-8?B?VjFINjhHSUxxZHJuZDFTUjlPZHMwQWtjZHhNY2FSM294a1F3dDAvTmVuNkI4?=
 =?utf-8?B?RitCdVRPVisxY2Y2NUtzVkZxRFpLZ0k1bytPTk9pcmFPbXQzM3VIT2I4MC80?=
 =?utf-8?B?OWZQcVk1YVhyNzVFdm1OZml2MUlzZDVBeGE3aXRxT0JsNjBPbXIyQ2taaW5U?=
 =?utf-8?B?aGMwKzA5ZEhXYTFRK0x2QU9qdjZKVWdaNkVTc1YwQ1F2WUlNNk1LNS93VDVj?=
 =?utf-8?B?YnVUYXV5M1UvZUp0NitVRmtwdTJzM0oyREFzVXpHN3cvSVJ5MWRZVnBkSGsx?=
 =?utf-8?B?S1hJd0hMMCt6anRTS0hZeWpZVGdJTEZxaWcwNC9IZE9SSmlVU3JQMTJsVERR?=
 =?utf-8?B?N3ppZlV5TFBjVkwycnUxMTJTcFgzYXB1blRCZDNHM28zYlFqR08wK2c4NjEy?=
 =?utf-8?B?WGdnb1VEVmlCRmU0K2xUYkhuR0Q2NjZLUVNjcXZBZ0dyS1hGZTFTS2FLamt6?=
 =?utf-8?B?dFV5YmErNWR1RXE0ZVl2Mk5JQ0FZN3N2NW5pOUFmYkxEVlpFR1plbFhaZGpy?=
 =?utf-8?B?dTJZWXpiTlBnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3h5YzJjK0tJeHdZWmdoS01IdTlPMWtoMi8zYkRTMElNNW5TVFV3aUVsY3ZM?=
 =?utf-8?B?UzlYZnhVNXp2a0NsUnV0RTh0YzF0VXhuTk1jck40bklQMmZ2OEg5Qm9EZTRU?=
 =?utf-8?B?V2NCSXJRYTlzakJ5OUNLK1RIS3pka01IMzFXclJveDlxbnFkaHczTHBFTlNQ?=
 =?utf-8?B?TGpyc0FUd1E2SGpKWW9nMWIxNjBNRi9FTmpRa1MwUEVQbUVMV1czeWZHS0xX?=
 =?utf-8?B?RW92QnNqWmVmUjJiUVF3d2JPTkM3ZGtwc3ZMa3EzckV2REhCcHpreEpPNzdV?=
 =?utf-8?B?RVhURWtkRFlzWmFjTmRQRldWd3YyWlJUQUZVdHJMUVNKeFE5R2xNMVZwZXFq?=
 =?utf-8?B?MWJaTXg2S3REVFNaTnBwY1dVWmVkeWgwaFJFa1NyV1ZSemJmQmExbzlKZDFQ?=
 =?utf-8?B?UWxPNWhqTTFOc0NRNmE3djgrMndwM1lNS2p1RmxDUEQzM1VvS3VDcWlZSEZM?=
 =?utf-8?B?QWYvWU5ESE1zZmdOTVFXbllweE5sY1lkZm82ZTh1TkZweXVsbUZUbVF2WGJw?=
 =?utf-8?B?QkdEaXdHaHdrbzVwUU1WUU1iY1QxbDIvVjdRcktjRjBUaUZjMFp2d3dpVjJC?=
 =?utf-8?B?a1hUSzZhbS9Sai9LWWlRRlpzdlJmR1hyZFp2cFZ3Q2dFcGFpVUtqeFhJdWZD?=
 =?utf-8?B?ZkFIYlBBaFFPclo1RVRaUFl6Q2Q2T05OOXZTWmF4RjhXd0x1V1BGakZ0VCtB?=
 =?utf-8?B?R3hmKzhhSXFBUUNoclFPVWNzNi9venRqSEFqZ1QvaDM5Vml6VEJkeTRkVEh3?=
 =?utf-8?B?aGp1MURkUUU3dXFhV0ErcGp0UHVpM21Xd3JRbExPNkU2SEV2NkpweXZMY05j?=
 =?utf-8?B?RjhXWENVWXVoK1JQeGFnVkZHUUxLRisycWVCSEw0bHZPWlFIbm91UEZ4dGYw?=
 =?utf-8?B?WW1aRlNRQy92NnNFUHNReXZUR0R4L3ZhYWFZcVllMnk2ZjlEdlZVdzQvc2RK?=
 =?utf-8?B?TXVpNW0ydGNKM2ZzQ1pEdUZXa3VmaElSK053QytYOTVLQ0hQaFdRUjZWLy96?=
 =?utf-8?B?Wk5weU4xSFUybFdTK2RsRVRTKzU3T2pCV2plYk1NT3dDdndnVVZaQWtvZWJJ?=
 =?utf-8?B?UnZiQWxjYjlUc0FZbUd6TlliMVJSc01rSENGVEhEYnJPRlpKQS83bE4zRjda?=
 =?utf-8?B?ZjNwK2tTOHNGeUN5QnhRZlJSZlF0TjkxVUVpaUpHendnQ0VXMDhIUjZlTlp5?=
 =?utf-8?B?WGFsQWFqU1JWa0xSZUlvU1FTTWlxN3RhMUJUOU56Ly9Zc2d0VHIwOTVxN1hN?=
 =?utf-8?B?a3Axa2E3UVJIUVV2VG50ZjRKL3pFem5yTXl2dHVzSzJNeTR5NCtNSUVVQ2dn?=
 =?utf-8?B?dS9MaVk4a0xNVnZUOUM5aTVUN1N4dG4zcjR5WDgrcUJkL1YyZkx0KzRHZHlj?=
 =?utf-8?B?VTlVWC9Wc1IvRGhYcVNvdUZKcVB5L1QwdG1DSjEvTFVnalA5L0tudFdIQnRt?=
 =?utf-8?B?anhheUIrT1BSajNyZ2RDUGxJM2lhdFlUcW5yNEVlRTB1QXpQN254cGw3Ym9T?=
 =?utf-8?B?a3Zla2RLOHFHOGlVYzV1WUoxcEYrUDlDRFJsT0UwM0xaWVF6OE9WMEs1TWFs?=
 =?utf-8?B?MXpkUml0TVFQOHJPOUhjQy8vdUF2SzJ6QVcyNEROY2NRYVBCaU8yZE5mOXpS?=
 =?utf-8?B?NEZIK1hZdnFsa21HZS9aMlZjZ0dXTVpIU294UHVNNFR2OHErL2tNR2k5WFdI?=
 =?utf-8?B?MXlxaGo2SHEzNnhMYkVIWGJGM2RGMTBJbVVLdVdpTFN6QXZjOUJES0pJQlBq?=
 =?utf-8?B?elo5TE8vQVAzT2UvZ0owNzFoRWpsa1E3bnQwNEZPTDZaUlRWRUlpMTRPcktD?=
 =?utf-8?B?b0NpUVE3SGZ3bURtVEI1cHp0Z2s1M2dIOFJNZkhuVnY4bEZFVm9BVlk5M0lz?=
 =?utf-8?B?S0R6QW04UXQyaXE1bG1Mek5oWG1hUzl2M0RFdEV6cWpBYXNKNTRiL2VrcDEz?=
 =?utf-8?B?Tm5jUWVvWGZzN0kxNnBPR1ZRdVhYazRrR1BEOG5jUWtZYjQ4WlBGYThzcnVE?=
 =?utf-8?B?ekg3L0pEMWEzODRNdjBubjlEQlErNm5BMERLdmtCV2gwVUFEODFFdWNzNHBI?=
 =?utf-8?B?RS9adE5MMU05Zm00cVRNc2tiTmxoRlI0b2ZrdFNEc1JIN2ZXL0VPRkdMT0pv?=
 =?utf-8?Q?H+OtHCbKsibf602FhReBtMSC9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E64A5F7727AC544087CE5D882F360FDE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7946dc-a3a1-47f0-18f3-08ddb55669ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 08:41:30.2739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijx1x7YsEkySnMVnUFag6KvRcFcxoFf3HfDkI+/NalMJ2ooE0L+qVT2f5sO3x+Bv5YTN0XtnziTO4Z2C4gO8jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPFF3776CC00

T24gTW9uLCAyMDI1LTA2LTAyIGF0IDAxOjMxICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IFRoZSBHQ0UgaGFyZHdhcmUgdmlydHVhbGl6YXRpb24gY29uZmlndXJhdGlvbiBzdXBwb3J0cyB0
aGUgaXNvbGF0aW9uIG9mDQo+IEdDRSBoYXJkd2FyZSByZXNvdXJjZXMgYWNyb3NzIGRpZmZlcmVu
dCBPUyBlbnZpcm9ubWVudHMuIEVhY2ggT1MgaXMNCj4gdHJlYXRlZCBhcyBhIHZpcnR1YWwgbWFj
aGluZSAoVk0pIGZvciBHQ0UgcHVycG9zZXMuDQo+IFRoZXJlIGFyZSA2IFZNcyBhbmQgMSBob3N0
IFZNLiBUaGUgaG9zdCBWTSBoYXMgbWFpbiBjb250cm9sIG92ZXIgdGhlDQo+IEdDRSB2aXJ0dWFs
aXphdGlvbiBzZXR0aW5ncyBmb3IgYWxsIFZNcy4NCj4gDQo+IFRvIHByb3Blcmx5IGFjY2VzcyB0
aGUgR0NFIHRocmVhZCByZWdpc3RlcnMsIGl0IGlzIG5lY2Vzc2FyeSB0bw0KPiBjb25maWd1cmUg
YWNjZXNzIHBlcm1pc3Npb25zIGZvciBzcGVjaWZpYyBHQ0UgdGhyZWFkcyBhc3NpZ25lZCB0bw0K
PiBkaWZmZXJlbnQgVk1zLg0KPiBDdXJyZW50bHksIHNpbmNlIG9ubHkgdGhlIGhvc3QgVk0gaXMg
YmVpbmcgdXNlZCwgaXQgaXMgcmVxdWlyZWQgdG8NCj4gZW5hYmxlIGFjY2VzcyBwZXJtaXNzaW9u
cyBmb3IgYWxsIEdDRSB0aHJlYWRzIGZvciB0aGUgaG9zdCBWTS4NCj4gDQo+IFRoZXJlIGFyZSAy
IFZNIGNvbmZpZ3VyYXRpb25zOg0KPiAxLiBWTV9JRF9NQVANCj4gVGhlcmUgYXJlIDQgcmVnaXN0
ZXJzIHRvIGFsbG9jYXRlIDMyIEdDRSB0aHJlYWRzIGFjcm9zcyBkaWZmZXJlbnQgVk1zOg0KPiBW
TV9JRF9NQVAwIGZvciB0aHJlYWRzIDAtOSwgVk1fSURfTUFQMSBmb3IgdGhyZWFkcyAxMC0xOSwN
Cj4gVk1fSURfTUFQMiBmb3IgdGhyZWFkcyAyMC0yOSwgYW5kIFZNX0lEX01BUDMgZm9yIHRocmVh
ZHMgMzAtMzEuDQo+IEVhY2ggdGhyZWFkIGhhcyBhIDMtYml0IGNvbmZpZ3VyYXRpb24sIHdoZXJl
IHNldHRpbmcgYWxsIGJpdHMgdG8gMQ0KPiBjb25maWd1cmVzIHRoZSB0aHJlYWQgZm9yIHRoZSBo
b3N0IFZNLg0KPiANCj4gMi4gVk1fQ1BSX0dTSVpFDQo+IEl0IGlzIHVzZWQgdG8gYWxsb2NhdGUg
dGhlIENQUiBTUkFNIHNpemUgdG8gZWFjaCBWTS4gRWFjaCBWTSBoYXMgNC1iaXQNCj4gY29uZmln
dXJhdGlvbiwgd2hlcmUgc2V0dGluZyBiaXQgMC0zIHRvIGNvbmZpZ3VyZXMgdGhlIHNpemUgb2Yg
aG9zdCBWTS4NCj4gVGhpcyBzZXR0aW5nIG11c3QgYmUgY29uZmlndXJlZCBiZWZvcmUgdGhlIFZN
IGNvbmZpZ3VyYXRpb24gdG8gcHJldmVudA0KPiByZXNvdXJjZSBsZWFrYWdlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCg0KW3NuaXBdDQoNCj4gKw0KPiAgc3RhdGljIHZvaWQgY21kcV9nY3RsX3ZhbHVlX3RvZ2ds
ZShzdHJ1Y3QgY21kcSAqY21kcSwgYm9vbCBkZHJfZW5hYmxlKQ0KPiAgew0KPiAgCXUzMiB2YWwg
PSBjbWRxLT5wZGF0YS0+Y29udHJvbF9ieV9zdyA/IEdDRV9DVFJMX0JZX1NXIDogMDsNCj4gQEAg
LTE2Miw2ICsyMTEsNyBAQCBzdGF0aWMgdm9pZCBjbWRxX2luaXQoc3RydWN0IGNtZHEgKmNtZHEp
DQo+ICANCj4gIAlXQVJOX09OKGNsa19idWxrX2VuYWJsZShjbWRxLT5wZGF0YS0+Z2NlX251bSwg
Y21kcS0+Y2xvY2tzKSk7DQo+ICANCj4gKwljbWRxX3ZtX3RvZ2dsZShjbWRxLCB0cnVlKTsNCj4g
IAljbWRxX2djdGxfdmFsdWVfdG9nZ2xlKGNtZHEsIHRydWUpOw0KPiAgDQo+ICAJd3JpdGVsKENN
RFFfVEhSX0FDVElWRV9TTE9UX0NZQ0xFUywgY21kcS0+YmFzZSArIENNRFFfVEhSX1NMT1RfQ1lD
TEVTKTsNCj4gQEAgLTMzNSw2ICszODUsNyBAQCBzdGF0aWMgaW50IGNtZHFfcnVudGltZV9yZXN1
bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCWlmIChyZXQpDQo+ICAJCXJldHVybiByZXQ7DQo+
ICANCj4gKwljbWRxX3ZtX3RvZ2dsZShjbWRxLCB0cnVlKTsNCj4gIAljbWRxX2djdGxfdmFsdWVf
dG9nZ2xlKGNtZHEsIHRydWUpOw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiBAQCAtMzQ0LDYgKzM5
NSw3IEBAIHN0YXRpYyBpbnQgY21kcV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2
KQ0KPiAgCXN0cnVjdCBjbWRxICpjbWRxID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICANCj4g
IAljbWRxX2djdGxfdmFsdWVfdG9nZ2xlKGNtZHEsIGZhbHNlKTsNCj4gKwljbWRxX3ZtX3RvZ2ds
ZShjbWRxLCBmYWxzZSk7DQoNCldoeSB0dXJuIG9mZiBwZXJtaXNzaW9uIHdoZW4gc3VzcGVuZD8N
CldoeSBub3QgYWx3YXlzIHR1cm4gb24gcGVybWlzc2lvbj8NCg0KUmVnYXJkcywNCkNLDQoNCj4g
IAljbGtfYnVsa19kaXNhYmxlKGNtZHEtPnBkYXRhLT5nY2VfbnVtLCBjbWRxLT5jbG9ja3MpOw0K
PiAgCXJldHVybiAwOw0KPiAgfQ0KDQo=

