Return-Path: <linux-media+bounces-26776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 519CCA418A5
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C711D18991F7
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EE324A043;
	Mon, 24 Feb 2025 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Nr0vkXt9"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE15B24503F;
	Mon, 24 Feb 2025 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740388193; cv=fail; b=CRkwrOLUh4sf8aX4+uZ3YhPhyRhzFyW+wxKt0AqC4t80nQqz+AW/UElSLK3YF0HuDkLIkfn8KPOczxo3+HmASBZ1FsuHoheUOR83Tyq0fOvjY/zFuNG3u/RwCyprr31aPWP+o5Y3PSgG8S6325BEw52tMg/t9Joe0IJE965XkPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740388193; c=relaxed/simple;
	bh=P9mDnbgOLJR0kKpMAypXWIhIRGKR+tiEQS80f8G6KSA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WOus22nIc7805g/Wxu1xnE8hrsd0pzrMG+OR5vIvrOeoRi0UYkQkJNn1Y/xU+rD70FuakuOIFOgSCp5DZF9MeY030BMjl0yCQREVdCiRDznqdnfYZ1usZGfmO2aRHqqGJolyMskjxceH8LSPDGfBMMhT4ccosOhjQ183ypBaFx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Nr0vkXt9; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okhzNo7DCFtRQ0+8F+yfzy8JCziC005I06SicAl+U1szu8Hy8tc0MNcjidWpmJCxBzYg9JfwfCyE06iRbDGEpiZ9DG1jPmyohvu0eL04I/M+bJC6XdDv78W+bghh3ZPB0UZUsnsbo846fI3j9GcBR1FQYWpfu1vo0C+aeDQIT8qTfjckH5VRYadQRX1YqLaaO7aJjMPe6BqHDgRlZfthEgxkSQlIbazTo6o3KRj7kuUURZxth5569I/Nfa2C//SeBCpdZ2xs9qT5ej6xZRuVb2XEF7w84zfAdpxcOotSKpKvw9sN4PEbGlDyuI2ehEtDaLI/2Ue/wDoGMhvo+a+ezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9mDnbgOLJR0kKpMAypXWIhIRGKR+tiEQS80f8G6KSA=;
 b=mcf1alXDZWh0kA2Ady5c5TbbbkMBPPWqs3T7oXrsMyp7n8MDreQZnTcrHuPZJcK/0ZEIcL0HXtNqD3HCuVJLGdLUozMKfttkjyQZfHiR+1xXUc2eIw4yLEqDRBcPx028l2VclxUjR47Jc1J4dvW5isLokyFn3jHmsLaa52Jw55kDniq79htF+eB0tfFxkz8TlQYaFogKdzTsNvdYu71WBHZIJs4I9o6XViyaDOLu49ghCLrc3HrMBqgbsFvK6lPs+Qn5weObtK+LDXPUUJC72UOsAm+ntcp8sTVKI78C5rRDJjMjDQXLATpfOKAseWaOoEMvIy/Nqw8JIk2VXvdmsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9mDnbgOLJR0kKpMAypXWIhIRGKR+tiEQS80f8G6KSA=;
 b=Nr0vkXt9yNrFx97akk0k9o+D/BuZIYwCyDLhLXvVThplOfhCjLTz9bfn7b8YDtcOiUt7CpcxrNc0i2KQak+OGcu6jYtnsMSwSTs/Sq27YGwwBc+evZBRMuCtDUOoginnY2x/hF3T32q+0uW9BoI0+KHw5s0Ntasl70Vnim/DkLI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14802.jpnprd01.prod.outlook.com (2603:1096:405:252::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 09:09:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 09:09:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>
CC: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 01/18] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/V2H(P) SoC
Thread-Topic: [PATCH v2 01/18] media: dt-bindings: renesas,rzg2l-csi2:
 Document Renesas RZ/V2H(P) SoC
Thread-Index: AQHbhHkgGVsGV4K/wUCal4vaOTAKB7NVMw6AgAD5MwCAAAFKgIAAAPHQ
Date: Mon, 24 Feb 2025 09:09:40 +0000
Message-ID:
 <TY3PR01MB11346A3284A4D62BBB1CE291586C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-2-tommaso.merciai.xr@bp.renesas.com>
 <20250223180855.GD15078@pendragon.ideasonboard.com>
 <CAMuHMdU-H-6zLJAX06Zx+cu2vjCYvKghNAEw=55eu+sYqDoSgw@mail.gmail.com>
 <CAMuHMdV_hc2DCLzmHO8jNAsb9oy2MTvn-7Z-h+EwCU1gaH8ioA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV_hc2DCLzmHO8jNAsb9oy2MTvn-7Z-h+EwCU1gaH8ioA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14802:EE_
x-ms-office365-filtering-correlation-id: 9029f558-603e-483e-965a-08dd54b2f8a4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N1dxNnI5TTRUNllKZyt4cEp6bFEyK3ZxTkRtWmhIbkp0Z3BZN0c3WWJGVWlH?=
 =?utf-8?B?cFExR2JKaElXUU1wS3BudEZGNVJobStSZTEwU3YwVEZLOTFGZ1N6aGwrRThk?=
 =?utf-8?B?YkU5OGo4aWhYN0pjZzBwMlpKVUVwTDBaZHFpWE9OUzkzUENOS2R4em9GNERr?=
 =?utf-8?B?RlBMbTd5L3krS0RYLzhGWUdCQ2ZNOWVxQWJWZndmb3RWM2hvemM5WGlBNHpO?=
 =?utf-8?B?YVk2MFNPT2p1Mng4S1NvTzRndEUrMFFXWHZIMGNBd0orS01kRVhrM3pIMDBG?=
 =?utf-8?B?L0lvZ1dRTmQyTUUrdjZpK3FIV1VqWjNVaW4zWDJKSFE0SkZqMm5wVkJ3TDdM?=
 =?utf-8?B?V3lQQjRyY0xybmpESEFBZGhJbXdENkZ6Nnh5UURLQjhVdWxNUzhuRHNKa1By?=
 =?utf-8?B?YkcxK2FtTlBTM203RmRjNDVxN3lxQTBFN3NXQU1ZSFUzMEJDQ0hvWjl1YU5X?=
 =?utf-8?B?SnVHNGM0R1g2N2JxYU45aTlhYVhzZEdqUkNyMUNtQng1bFN6S3ExV0FPdXcz?=
 =?utf-8?B?K3BWU3dvS1ZIUlp1MC9weDRxelF4a0ZhVXVScWxEdUdwUFRvc0QzU284TGEr?=
 =?utf-8?B?V082SDR2WEhkQ2lNWFJub3dMSjNBdTJLd1UzRHEzYzVKZnlVR2Nncm9tc0pz?=
 =?utf-8?B?Nlg5TFBCL21Rd3o4Q1c0eldhNS9qNW9JYnlXaFZJZHJIZUFtS0FDRWdhN2I2?=
 =?utf-8?B?blJxUCtTbWQzRU5hYk81d1ZvQTVOd3V1cFdXeTRmbUx1ekVZYTF0b1ljc1FC?=
 =?utf-8?B?UHh1VFp0SzN4UnFWVXJvQ3h5Mkp0MEZVWkxUUnZlUGdBQktwMVB2WTd4Nkpv?=
 =?utf-8?B?a2JqSms4d3phTXNleElWa0Jybk5oeGpXQUxRd2FTMjhLV2JVa2NHUkFFMFB6?=
 =?utf-8?B?NzlhalViTXI3ekVHckFaRHBqSVJsc0RpaWJMMXFDa0ZsdncrVjR5cUJabFlF?=
 =?utf-8?B?aDRaNGsyN0UrNkdpUTgrMWVZY1BpbDJhR3VXcnJ0ZER5QWFDT01zTFhFdjFq?=
 =?utf-8?B?bSt6djl6dElyWm9SMUFGbTN4K2VTREQydXZsOW9ZaENKNWkzOHppcE1wbCti?=
 =?utf-8?B?TTlKN0VEVDZWTVFRQ0NEVXNXY0djK2EvSkdTdjJJMjFNOWtrTXpLZkkrUEpL?=
 =?utf-8?B?c3VDOVpjK1ZLV045QWRXZFordlRKbmZTYjN4bE9sakl1eGtyM1dyeUVkNFU4?=
 =?utf-8?B?cklOQXFWNEhETzQwbVJIUzd6NmdmZ0IzM3dweVhNUnQrV0ZiWHlNb3h3OVF6?=
 =?utf-8?B?S3Bvc1Zra0pwVXNXbnNNK2VHVDEzS1hxUHdUV2g0RHhnaU5oclEzVk1HbHpZ?=
 =?utf-8?B?VDl5T3k5aGFUUWEyaVdhYWhibDNLdkZaTEVXUFNrK2JoMzFoZm1QTkNZMnQ5?=
 =?utf-8?B?RzllcDU2a0JWREVURDFIUmhRcXFORHB3K1p6dTV0cHJaRVpET1RkSVlpZDNh?=
 =?utf-8?B?UnZ3UStSYy84NkFDeVNwM1VKY1ozZEhwVnRLM0dYbW9pNU9GQWNCUGhCemhL?=
 =?utf-8?B?UUJJMWFMTTkrOVJlSnFUZ0NIeW85WnBGQmRKZFZYQlZ1YlRsMFpBRCtqVnJO?=
 =?utf-8?B?eHgrK21ITzk1TEIrcFk1OWJVVG0zaVF1ano3TlhBbHVMMkZQbG5XUU1sa1VQ?=
 =?utf-8?B?RUp3akhPaFJSd2VySUZ1QVMzRDFPc0hYSWw1ZnBoQmRscWRHNnBkNXg5Q2Zm?=
 =?utf-8?B?VnRXSTJKanpLdUVRYnhUbVdmMGczR1B1cFFFMkZrVHNERDlhWUtHTzU1a3ZT?=
 =?utf-8?B?eEhSc2tRNjVpQlhSNnQ5WU5ETjM4cTA0ZXA1WktWRTc3T3NNRHlJUW9wVlls?=
 =?utf-8?B?RU5PNklWUWd1bURhQjhKNjlVSkZqNzdLbTl4WHZqYjRWeWhyK0xuVU1kUEQy?=
 =?utf-8?B?Zmp6bXc5UXI0aVdtTnlPY1FQbnV5Q3ZCQ3BPME41SWlTdnBYNVBqTHkraDJw?=
 =?utf-8?Q?FY7NWtdYfGhalYBcK775e/SQihDga/Su?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkY2TlpMUmhUdUJtdWNoV1JEaXhETXM1QXg2aW1JckVEZkdQU2l1NVc5M0NH?=
 =?utf-8?B?N3IrSzNRTHpBVzh5ZnBhVjh4eTM4T3M0cmtGOFdTVUFRNUpOQlVxb0dzNVdS?=
 =?utf-8?B?Rkh2RWFuTmJEcXQyZ25MRXJMMWw5SVVKdG9sL3ZMWDdjUmMzck1aV3RNOU1I?=
 =?utf-8?B?aHRlVkRMeVUrejdvT3I0YUhHWlAvL1ZqVkREeGtNU2kyQ3V1c2Q3VmZpN1hV?=
 =?utf-8?B?ejdGVXRRNjdBUVZMWlV4aDUzRko2emhqYkU0am5UOEFzMFFtY041TEI2QW9U?=
 =?utf-8?B?SWl2aXRBcjVsb1RBQi8wWG8yU2ptY1JXZS9IUlVjZGNTWGE0UnRRN1lNa0Yv?=
 =?utf-8?B?VWpNM0JMUDQvR2FucnVlOHo1d0dISzdlM1pjQkpnSGMrY2FhUXdqU3R2RGhV?=
 =?utf-8?B?Qm5xNEp2dEJJM0FYMi8xWndKZXRTVmQ2aXVaWkMrUWtVMGg5ak5xUlFIajhw?=
 =?utf-8?B?c0JiSDVxNHFRWWNHclBkSllTeFZYR0dWd2IvREl1NUNRS2w5SkVBd1NOc0JK?=
 =?utf-8?B?WWtkWUhid1ZuNjlzMW1sR2RtNWhFZTFWaE85dk56Qmx2TER0T1J6byt2NUN3?=
 =?utf-8?B?NmZqQmE2b0NnMTVFOVltdlplbmpjY2lmNXBDM25VVzhWcERCRS8zZFA0elJT?=
 =?utf-8?B?eW9scHdGUW1KMEF2cjlRV09VN3lRV3lhYzBFTGtFWWcrWnZVRnlJdFE0UUgx?=
 =?utf-8?B?eW84TDNmOVVQc0g1dmwvMlA3b1kwZk1DSmxYZk1YeEZ2RFlUUXprYTVCclYr?=
 =?utf-8?B?RG9qS3hZbXBmTm4wT3JsUWR4MDVBVXFSenlBcXdYTDRocGpvdWsyMUtEMkcz?=
 =?utf-8?B?V05OZVRZNFUrRXI0a0ZLQmlUL2oyVUpiVkJtbGd1YzBGa1JIV3o5ZWNmRXhl?=
 =?utf-8?B?K0lmdkNwcGFSRFJFdEhKYUtmRDhoUVVmdEtoV0pRUTZXZDFvemFMRXpSTzhj?=
 =?utf-8?B?L2lBV2hJT1BEWDgzeVRBdUxaZTRnSk41RnNoUkVzdU55R1FEb09qbmJqQXgr?=
 =?utf-8?B?VnJFRENRTGdiblVSNTh0K2I2YkJEemUwSG5JNFE5Vm5TbStxUXpKZmhzQVpW?=
 =?utf-8?B?djdoUjNZSHZ3N3pQR3VzZnhwN3djVVQ2Yi8vdWxpL1M3aTByVkt2cmNWeDFS?=
 =?utf-8?B?WHJzcWt6N3piSXBaZ3ZoMVJNeGc1b3R5L2VVR0EwZ3NnQ1lKblViaEZIU01R?=
 =?utf-8?B?em9UTDZ2eDd4aEd1UTJnSEhBdURNaGpkTWNSYWYvRHhrY3VPVTUvM0l4ZWJN?=
 =?utf-8?B?blZER1RHS2JyU250M0w2R2V4SmgxSmNZaWVjYzFmdXRZVktLQVBIYzVoazNk?=
 =?utf-8?B?aWxVUUtJbndDMkYrR0tDNDk1WEphakhmaElvOG5TTTBOUXZjREc1YVFqZm11?=
 =?utf-8?B?eXZaUjZRTEJiZUFqQ09uSUx2VmRTdDRwa2tVWmZDK3FBTldQaXlNRC9SMUU4?=
 =?utf-8?B?UFZvTnk1ckR0L2NTVmFjMlNNU1RWM2FldUNwYWVjQmdPMnV2SGMwSWFCeWtV?=
 =?utf-8?B?emthc2phYmpxUytvSFFqOWhHb0l6QVpWNnJGZUN1WkczVnVMQ0dIckE3ZzNx?=
 =?utf-8?B?QUhHTW1SUkRDdG5NRDhTTGtsVmZEL3RTbkNuOUkxQndiMWd6eWVrLzVtNlRr?=
 =?utf-8?B?UEhvd21RekJ0cVRCeC9pS1BvY1J1TXBsdWQvcG5kMjh0ZUF3OEd6NURRODRR?=
 =?utf-8?B?RW96OWJuUHJobFdHTXljZlZsL2N6Mm9YNUFua25xQWtXcVlKTDFnaTN4MmJp?=
 =?utf-8?B?RjNCQ0FnMTl6N2JZaFJoRllKemZqQUwzNGJUYjFkcVdTU0NCZElHWFBNSUhE?=
 =?utf-8?B?d00wbjA1VjFwZHdDOUh3QnppaE5MUERuMzE2R1pEVmtuWmVEWlJtRHE4TEpw?=
 =?utf-8?B?UVlMeUZPK1hobVZueFRobEVnSjNBMHJmaUlta2M2Q3ZUdUdsdWxuMkdKcFJS?=
 =?utf-8?B?bnhnaERsL0xYdVVHVUd0WWR2eFd0U201ZGxpbDFrODludEM5MzdrY3JEOE4x?=
 =?utf-8?B?UkRzTjVjSFRCY1F6RUpKRStBTFBVOTRPdTZXWVpEZjdHQ2Qxd2pxUDJ4T2lm?=
 =?utf-8?B?OEZKVGdMd3lLRHhFYkdlN0w1ckhUeWl1WnZRdndEM3NsVHdOSFpMNlM2QllN?=
 =?utf-8?B?MnpnbkFabUJRRS8zbjl2MnNhcEozd1dSeVhIOCtUSWs4T0RTS1lSRFpUWXNr?=
 =?utf-8?B?SFE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9029f558-603e-483e-965a-08dd54b2f8a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 09:09:40.8622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3MyIj7l0l87GeIioC3vozNWeoLiCU4FyK8x13RUnqsVmTsFehDASupZ6zVaXdtDqCB+IIAF+BuONLbSqjLyrIS4DyfJK8tkfRjPhTv9NUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14802

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjQgRmVicnVhcnkg
MjAyNSAwOTowNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAxLzE4XSBtZWRpYTogZHQtYmlu
ZGluZ3M6IHJlbmVzYXMscnpnMmwtY3NpMjogRG9jdW1lbnQgUmVuZXNhcyBSWi9WMkgoUCkgU29D
DQo+IA0KPiBPbiBNb24sIDI0IEZlYiAyMDI1IGF0IDEwOjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToNCj4gPiBPbiBTdW4sIDIzIEZlYiAyMDI1IGF0
IDE5OjA5LCBMYXVyZW50IFBpbmNoYXJ0DQo+ID4gPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4gd3JvdGU6DQo+ID4gPiBPbiBGcmksIEZlYiAyMSwgMjAyNSBhdCAwNDo1NToxNVBN
ICswMTAwLCBUb21tYXNvIE1lcmNpYWkgd3JvdGU6DQo+ID4gPiA+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4NCj4g
PiA+ID4gVGhlIE1JUEkgQ1NJLTIgYmxvY2sgb24gdGhlIFJlbmVzYXMgUlovVjJIKFApIFNvQyBp
cyBzaW1pbGFyIHRvDQo+ID4gPiA+IHRoZSBvbmUgZm91bmQgb24gdGhlIFJlbmVzYXMgUlovRzJM
IFNvQywgd2l0aCB0aGUgZm9sbG93aW5nIGRpZmZlcmVuY2VzOg0KPiA+ID4gPiAtIEEgZGlmZmVy
ZW50IEQtUEhZDQo+ID4gPiA+IC0gQWRkaXRpb25hbCByZWdpc3RlcnMgZm9yIHRoZSBNSVBJIENT
SS0yIGxpbmsNCj4gPiA+ID4gLSBPbmx5IHR3byBjbG9ja3MNCj4gPiA+ID4NCj4gPiA+ID4gQWRk
IGEgbmV3IGNvbXBhdGlibGUgc3RyaW5nLCBgcmVuZXNhcyxyOWEwOWcwNTctY3NpMmAsIGZvciB0
aGUNCj4gPiA+ID4gUlovVjJIKFApIFNvQy4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogTGFkIFByYWJoYWthcg0KPiA+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJl
bmVzYXMuY29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUb21tYXNvIE1lcmNpYWkgPHRvbW1h
c28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvcmVuZXNhcyxyemcybC1j
c2kyLnlhbWwNCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL3JlbmVzYXMscnpnMmwtY3NpMi55DQo+ID4gPiA+ICsrKyBhbWwNCj4gPg0KPiA+ID4g
PiBAQCAtNDgsNyArNTgsNyBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiAgICByZXNldHM6DQo+ID4g
PiA+ICAgICAgaXRlbXM6DQo+ID4gPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBDUlVfUFJFU0VU
TiByZXNldCB0ZXJtaW5hbA0KPiA+ID4gPiAtICAgICAgLSBkZXNjcmlwdGlvbjogQ1JVX0NNTl9S
U1RCIHJlc2V0IHRlcm1pbmFsDQo+ID4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBDUlVfQ01O
X1JTVEIgcmVzZXQgdGVybWluYWwgb3IgRC1QSFkgcmVzZXQNCj4gPiA+DQo+ID4gPiBJJ2QgbWVu
dGlvbiB3aGljaCBTb0NzIHRoZXNlIGFwcGx5IHRvOg0KPiA+ID4NCj4gPiA+ICAgICAgIC0gZGVz
Y3JpcHRpb246DQo+ID4gPiAgICAgICAgICAgQ1JVX0NNTl9SU1RCIHJlc2V0IHRlcm1pbmFsIChh
bGwgYnV0IFJaL1YySCkgb3IgRC1QSFkNCj4gPiA+IHJlc2V0IChSWi9WMkgpDQo+ID4NCj4gPiBO
b3RlIHRoYXQgUlovRzNFIHVzZXMgdGhlIHNhbWUgbmFtaW5nLCBzbyBiZSBwcmVwYXJlZCBmb3Ig
bW9yZSBjaHVybi4uLg0KPiA+DQo+ID4gSG93ZXZlciwgSSBhbSBjb25mdXNlZC4uLg0KPiA+DQo+
ID4gMS4gQWNjb3JkaW5nIHRvIFNlY3Rpb24gMzUuMy4xICJTdGFydGluZyBSZWNlcHRpb24gZm9y
IHRoZSBNSVBJIENTSS0yDQo+ID4gICAgSW5wdXQiIChSWi9HMkwgUmV2LiAxLjQ1KSBDUEdfUlNU
X0NSVS5DUlVfQ01OX1JTVEIgX2lzXyB0aGUNCj4gPiAgICBELVBIWSByZXNldC4NCj4gDQo+IFRo
aXMgaXMgc3RpbGwgdmFsaWQuDQo+IA0KPiA+IDIuIFRoZSBDUlUgaGFzIHRocmVlIChub3QgdHdv
KSByZXNldHMgb24gYWxsOg0KPiA+ICAgICAgLSBDUlVfUFJFU0VUTiwNCj4gPiAgICAgIC0gQ1JV
X0FSRVNFVE4sDQo+ID4gICAgICAtIENSVV9DTU5fUlNUQiAoUlovRzJMLCBSWi9WMkwsIGFuZCBS
Wi9HMlVMKSBvcg0KPiA+ICAgICAgICBDUlVfU19SRVNFVE4gKFJaL1YySCBhbmQgUlovRzNFKS4N
Cj4gDQo+IFNvcnJ5LCBJIG1pc3NlZCB0aGlzIGJpbmRpbmcgaXMgYWJvdXQgdGhlIENTSS0yLCBu
b3QgdGhlIENSVS4NCj4gU28gdGhlIHRoaXJkIGludGVycnVwdCBpcyByZWFsbHkgYWJvdXQgdGhl
IENTSS0yIFBIWS4NCg0KWW91IG1lYW4gdHlwbywgaW50ZXJydXB0LT5yZXNldD8/DQoNCkNoZWVy
cywNCkJpanUNCg==

