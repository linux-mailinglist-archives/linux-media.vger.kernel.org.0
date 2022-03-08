Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4A64D1902
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 14:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347144AbiCHNTP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 08:19:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347191AbiCHNTL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 08:19:11 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9852DAB3
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 05:18:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvusHqIF4P/Ud11S+W9v2AqMF+mlA0t7c+u88rtANh64Vu216SUgdA47qM8tCv8+BlXT2G5sr5CbcoOr7iCZt7bLavk9W8ee6fI1Th1tNKs2bu0KhnKAWa/X12fs94HWcSA4xNuIFmSgLeCwOTSQcRMIyx87kceCIGFvPRIbp96Lw0VxcLB/rYePNotNaHAp3wJC6MQJQ8qhSkWhfzRandMR6yGPTVdDusk1/R7N9App5fsROqdrxljNAworINxFz22EfD6yuJ5KbNyjuhPVI72yfdW74EP4ByB+NAnny22sCh6og0cImeQpx3yAjgCdWGDppGi455of5t0LH4RB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5l7BPo3K3c+SlSRIlXCNoxNcAwwGXnCKg8EQxRkqEsE=;
 b=ayGCRVac0B+dyZfyk2uhLTy/Ihg9ryomyb59ckT27al37YWs797g1n0ObRt1weyZ481vUJ2wwRoJVPyydJT6XXmJmfG76QuJxB7T4kvL6JPPTC5tA/uRbrY323JzpiFfGnDB3Rt6B4UH3EcTOvhlI3BRFPJR/TXZ43MtWQ4iiVKhLZpa0wLeILQgiR4FFtPIzaShSNniD/P26I+xd7ZXjvMWZ32GWNr2phjR7w9BFw/IwTbZtiwRHH4PKG8rjZZ5ANcytuqkXtvBRG4G29f7cqo/RttWBTZysZRfb4d681UiZZHCD0UAV60QanE+nZ+ppC7X40ffj173hTx2nHPqPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5l7BPo3K3c+SlSRIlXCNoxNcAwwGXnCKg8EQxRkqEsE=;
 b=Yw84Q9RgQ5N1/t95lnjRIS5LcXA+YeRuVTSugMZCQ6Ea9vWfwyi+9NZDnv/bRWr1c7/nl/2Yqms35WqYLHY6aXNRSz0BeK+4jDVw0Vs4UEyf3QP/Xm4FHY5U9GqLQUlcyCB67pOQCUIX5Cy6NUJTvO2WqBFEDHA9AlQ1O4tA6ns=
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 (2603:10a6:800:52::15) by AM0PR0402MB3635.eurprd04.prod.outlook.com
 (2603:10a6:208:a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 13:18:06 +0000
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::a1ae:e74c:cadb:efb8]) by VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::a1ae:e74c:cadb:efb8%12]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 13:18:05 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [EXT] Re: [bug report] media: imx-jpeg: Add V4L2 driver for i.MX8
 JPEG Encoder/Decoder
Thread-Topic: [EXT] Re: [bug report] media: imx-jpeg: Add V4L2 driver for
 i.MX8 JPEG Encoder/Decoder
Thread-Index: AQHYL9+uUOewrpnC1UyjV1LU41+xwqyzsBWAgAHOD4A=
Date:   Tue, 8 Mar 2022 13:18:05 +0000
Message-ID: <a19c0d918d75ebefe95a1d5b786b0048041b0794.camel@nxp.com>
References: <20220301124208.GA27743@kili>
         <922460bc6047e1c033ccff1af77cc07c49af2585.camel@nxp.com>
         <20220307094419.GA3315@kadam>
In-Reply-To: <20220307094419.GA3315@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 671aa97f-8f3c-4295-1f1c-08da010614fd
x-ms-traffictypediagnostic: AM0PR0402MB3635:EE_
x-microsoft-antispam-prvs: <AM0PR0402MB36354D25ACEAA6DB23504A478F099@AM0PR0402MB3635.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w7kK7El4ObFuZQ2A5kt8o6BM1A88hcgLB3HVQSuO6BfQtL72GCRRX8oSi/27DrDGwJwTs+IolFpsDIfnzuau1289n+VT3WqjBgBFYfK7fr2oyt3NvLPa67bcTMsLLirf2nptiOL1NqLuMleFgctSlZlmb4jYMmQaO5J7eXKI55yqFxujungfyI9xv7rUGNt3t8MDoYH8PELs1kaMkzMBJn7d/tnV7DaqRg0SVTOK88xuk4O2nkPvfkfJm6lSJtwiGTb61sGfR8qj9vKJ+mcHTNVsTt4IhxJOBvZY6TFY26Pzw9qNnOslgRWBYdgBr0q7DV/qKpgmmydxEK8SjJfrFZ/p3gCUqa8dIfFhN7ROGpIWmhi7vYoucWXdWRfvBItpwutppwHOzfU2bmWqvrtZ22QopCK/g1tp2Bq0bPgPUY90faRr3W3eOGZ+tCUXHa04VdNr5C3awhiKQRhu1IMDjr5vspsnrGvndICXF7bQZ/1EgyRnxHJ6KNfgbpYVKuDO+kezj3oH9WK9/DKyj4QizW2f725WAJnWx08R2rOUR9HAVctDRmvB+dI0YIRce0Wdg5O8RAkXT+9WX66PfeBy9yShBhjfpulW94EihitbVqjtc1noLex1K6myRuYIUz/HNJitVRDssx8fAmPpkxqcgOZjZrcy5hpB7U7QziNzASl654hFtIN3qx3aSQh16MoQLyqw3ys7TFaRkXmr6PNolQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2495.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(76116006)(66946007)(66556008)(122000001)(86362001)(8676002)(2616005)(38100700002)(4326008)(71200400001)(498600001)(2906002)(66476007)(66446008)(6486002)(36756003)(83380400001)(6916009)(6506007)(8936002)(6512007)(64756008)(44832011)(38070700005)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0ZjaGJXS2w4TXMvNHBLVmVjdkphdXBXQ3lZUSt6VmtTdENSd3N3UWRwWThG?=
 =?utf-8?B?QzlEQjFsb1dKUjR1ajlJTkRXMG1JajQ0OUtZS1BiSnlaa1hxUmg1SUtaUzVs?=
 =?utf-8?B?SGxKWDFxTXZEbnZUZHF4ZGIyUzlzQUFoNXQ3djZPSUlJTmt5Y2p1Mnd2OU5J?=
 =?utf-8?B?aURHL2dqK25FOGhMQUdzTVNvWlhOU3RqazhSQWFoZUc4US9UbFJmTS9tbjNJ?=
 =?utf-8?B?RytmRUlRbFdWM0VaWnFoN0oyUU1qSGJoT0tuVkhDbGdtUmtrZnYxMVZpSW1Y?=
 =?utf-8?B?QzI1Ym0vckdFTXlMclA5SkErU1lWbmxZZFFVQzJITTdVS3hFZXFiVmcxa092?=
 =?utf-8?B?dGhzaVF4ei9xcVI0aVRXTVUxbWtMY1Zuakljc0JMZVhSU1pMQUFpK3ZyOEs1?=
 =?utf-8?B?T0VieFZoZENCK2oyZ0NjK0tGQndXWjRPS0lvVy9LQWRleDVxYWoxcCtXRStM?=
 =?utf-8?B?OWRiemxwL0t1TkFlOTZJSTdIOE42akEydHIzU1BxdDlaeFlFS0dUekgzVHdB?=
 =?utf-8?B?UnR4L3o2bm1NbTJ4R1ZtbHJoZk43elB5ckN3eWRnMnpLYmxIa3FWbkdwajQx?=
 =?utf-8?B?UGUwcGtKa1RDTWwzNWcrVWdrc3lRalRzMXM2WVVJWjFOVkZqeFpWV2dKdi9U?=
 =?utf-8?B?akNJbkVuWElqcXlMREcweENlblhTQXZPS2sreCtvNjhIcm1qbHc5Z25hVTlU?=
 =?utf-8?B?K3ZaUm56aUYvTVNocVA1d0dCSStlcGxCWGRqQ3ZOOWFDSW1tS1dGY3ZjK3dI?=
 =?utf-8?B?M1Z5Y2w0bktVd25uMUdmMUhoN29sWitJb1k5WmxwZzRyY0h2NFdSbjJTTXlW?=
 =?utf-8?B?clR6bHlBcWhoT0VaWU12RGM1MzF0dWcvcjZHWXJoUmlrUlpsa2RKVFhjVXhG?=
 =?utf-8?B?QjMrakZxMXEvaGxDdXFOTUliajlIcHJFZ2djaklLamFDRVBnYzlLTlh0Um9z?=
 =?utf-8?B?bVc5bmQ3SCtZRmhTTXFicnA3UWpmL3BhbGw1bFQ1WUV0M21Pak9FOHQvWEhX?=
 =?utf-8?B?a3BwSnhodjVOWWs4R0xlY3RHMGlXeWNpekpvTElzNndtSnU4MHhpYS9DbmVi?=
 =?utf-8?B?MitQRjZOSEpaS2UySVpEUFJPWXJZc2cyWkFIbEt0TTlmdnZmN2JYWGFJWmxE?=
 =?utf-8?B?SDcvbHo3S1ZQUWpUVU4yWkRHUnp6RDV6T29pQVc5bVRKaGZ0bFp2Rk5HZmg4?=
 =?utf-8?B?M0Rxa0J5dG9IdzNsSVFQZVpVZi9lMkJiWlIrMHJZQ1RyUU00eEJtZHEySmJa?=
 =?utf-8?B?eER4VFBXdU8rOWoybjRIbFlyWVhpUTVPRjJPNDVCQXBlZkdJL1lOanlKNFdh?=
 =?utf-8?B?Tmh4QXpESHBObU4xWDQ3cWdpLzU5REpkQ3EvTlliK2VqRHJSbDZPUHo0RENx?=
 =?utf-8?B?ZnZnTkRRRUJlc3dBM0RzMk1CNFNKdXowQ1RybTF2Slp5eWtXS2FJN1lud3VL?=
 =?utf-8?B?WVR2ZEdpNWZwS0dNZ2MxcTYyY2dhMklMY2g3ZGYzbmZzWU9JTi9EWGJ5a1p4?=
 =?utf-8?B?bHpMaFdCSmEzRUxWeTJXVG1teVk1MytqQVh1K0VSQWJBc2FiSVVPemNlb243?=
 =?utf-8?B?L09hYVljdFZOSGczZnNtYlJ2Qkp5ZlI1aUxtZStmajAxZFRNNW15VTMwNDhX?=
 =?utf-8?B?TjVKNXlQUU1ETUZRcWdTTjllZ29yOE8waG1Jc1puQnV1Y2JoRDZyU09yMHlP?=
 =?utf-8?B?b1o3WTBQeXJxRmxBMmg1NGhzazVpM29xSnByUXUxK2N5SmlMZ3lobWtuSUVk?=
 =?utf-8?B?QWQwK1hZbFdDODR2SEVDdzVxc0ovb0J2U0RmUk5wbFhvb211M2c0aGlwWTlr?=
 =?utf-8?B?YWMvcjk0d0ZWU1ptZTlKcXhSWFVUbUdDV0dZd1BRTmhHOU5xYTVMbFVqeVBu?=
 =?utf-8?B?bWRPL0tiZ1QwTjVNWFd4cnVJbE9hVlhGYzRvWjQ3MWlmUmx6dDY3L3p6NkR6?=
 =?utf-8?B?NDI4K3NVL3Jic0p0SlRFNEcvUDlFeExFSFBFNlhpdmkySFIwSE1SYlJ6K25V?=
 =?utf-8?B?OG5lL0d0dlppQnM3TE1URVNvbWpNZDA5RVk1WUV1ck9QVTNaUzBZbFJZOEhK?=
 =?utf-8?B?OXlpWXhjOWdsZ1dFVm9tdkZicXRKVks5ZjZXRVVSbGNPNk1mQWY0NTQ4Z3dr?=
 =?utf-8?B?OXcva2tBK1d1NVUwNi9qSVk2SE1EZENGZjR6Ry82NGVSTmhvV0xscUQ3NU9X?=
 =?utf-8?Q?I1T73iM8LOW8JfyyNUEL+dE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89E40E3C90722B4193AC5C70B724C576@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2495.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671aa97f-8f3c-4295-1f1c-08da010614fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 13:18:05.8817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dLTsUlwUIq8sTuhtx0rp22A9NqJCrNvEy/BPMUEj9ScYbMeBk5JvBub3JXT2f524LfhRszryhxe08xaJjF/FgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3635
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRGFuLA0KDQpPbiBNb24sIDIwMjItMDMtMDcgYXQgMTI6NDQgKzAzMDAsIERhbiBDYXJwZW50
ZXIgd3JvdGU6DQo+IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gT24gRnJpLCBNYXIgMDQsIDIw
MjIgYXQgMDM6NTE6MTZQTSArMDAwMCwgTWlyZWxhIFJhYnVsZWEgd3JvdGU6DQo+ID4gSGksDQo+
ID4gDQo+ID4gT24gVHVlLCAyMDIyLTAzLTAxIGF0IDE1OjQyICswMzAwLCBEYW4gQ2FycGVudGVy
IHdyb3RlOg0KPiA+ID4gSGVsbG8gTWlyZWxhIFJhYnVsZWEsDQo+ID4gPiANCj4gPiA+IFRoZSBw
YXRjaCAyZGIxNmM2ZWQ3MmM6ICJtZWRpYTogaW14LWpwZWc6IEFkZCBWNEwyIGRyaXZlciBmb3IN
Cj4gPiA+IGkuTVg4DQo+ID4gPiBKUEVHIEVuY29kZXIvRGVjb2RlciIgZnJvbSBNYXIgMTEsIDIw
MjEsIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcNCj4gPiA+IFNtYXRjaCBzdGF0aWMgY2hlY2tlciB3
YXJuaW5nOg0KPiA+ID4gDQo+ID4gPiAgICAgICAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vaW14
LWpwZWcvbXhjLWpwZWcuYzoxMDcwDQo+ID4gPiBteGNfanBlZ19xdWV1ZV9zZXR1cCgpDQo+ID4g
PiAgICAgICAgIHdhcm46IHBvdGVudGlhbCB1c2VyIGNvbnRyb2xsZWQgaXRlcmF0b3IgJ2knIChh
cnJheSBzaXplDQo+ID4gPiAyIHZzDQo+ID4gPiA3KQ0KPiA+ID4gDQo+ID4gPiBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL2lteC1qcGVnL214Yy1qcGVnLmMNCj4gPiA+ICAgICAxMDUzIHN0YXRpYyBp
bnQgbXhjX2pwZWdfcXVldWVfc2V0dXAoc3RydWN0IHZiMl9xdWV1ZSAqcSwNCj4gPiA+ICAgICAx
MDU0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpuYnVmZmVy
cywNCj4gPiA+ICAgICAxMDU1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50ICpucGxhbmVzLA0KPiA+ID4gICAgIDEwNTYgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgc2l6ZXNbXSwNCj4gPiA+ICAgICAxMDU3ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZQ0KPiA+ID4gKmFsbG9jX2N0eHNbXSkN
Cj4gPiA+ICAgICAxMDU4IHsNCj4gPiA+ICAgICAxMDU5ICAgICAgICAgc3RydWN0IG14Y19qcGVn
X2N0eCAqY3R4ID0gdmIyX2dldF9kcnZfcHJpdihxKTsNCj4gPiA+ICAgICAxMDYwICAgICAgICAg
c3RydWN0IG14Y19qcGVnX3FfZGF0YSAqcV9kYXRhID0gTlVMTDsNCj4gPiA+ICAgICAxMDYxICAg
ICAgICAgaW50IGk7DQo+ID4gPiAgICAgMTA2Mg0KPiA+ID4gICAgIDEwNjMgICAgICAgICBxX2Rh
dGEgPSBteGNfanBlZ19nZXRfcV9kYXRhKGN0eCwgcS0+dHlwZSk7DQo+ID4gPiAgICAgMTA2NCAg
ICAgICAgIGlmICghcV9kYXRhKQ0KPiA+ID4gICAgIDEwNjUgICAgICAgICAgICAgICAgIHJldHVy
biAtRUlOVkFMOw0KPiA+ID4gICAgIDEwNjYNCj4gPiA+ICAgICAxMDY3ICAgICAgICAgLyogSGFu
ZGxlIENSRUFURV9CVUZTIHNpdHVhdGlvbiAtICpucGxhbmVzICE9IDANCj4gPiA+ICovDQo+ID4g
PiAgICAgMTA2OCAgICAgICAgIGlmICgqbnBsYW5lcykgew0KPiA+ID4gICAgIDEwNjkgICAgICAg
ICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCAqbnBsYW5lczsgaSsrKSB7DQo+ID4gPiAtLT4gMTA3
MCAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoc2l6ZXNbaV0gPCBxX2RhdGEtDQo+ID4gPiA+
c2l6ZWltYWdlW2ldKQ0KPiA+ID4gDQo+ID4gPiBTbWF0Y2ggdGhpbmtzICIqbnBsYW5lcyIgaXMg
Y29udHJvbGxlZCBieSB0aGUgdXNlciBpbg0KPiA+ID4gdmIyX2NyZWF0ZV9idWZzKCkNCj4gPiA+
IGFuZCBpdCBjYW4gYmUgdXAgdG8gVklERU9fTUFYX1BMQU5FUyg4KS4gIE1lYW53aGlsZSB0aGUg
cV9kYXRhLQ0KPiA+ID4gPiBzaXplaW1hZ2VbXQ0KPiA+ID4gYXJyYXkgb25seSBoYXMgTVhDX0pQ
RUdfTUFYX1BMQU5FUygyKSBlbGVtZW50cyBzbyB0aGlzIGxvb2tzIHRvDQo+ID4gPiBiZSBhbg0K
PiA+ID4gb3V0IG9mIGJvdW5kcyBhY2Nlc3MuDQo+ID4gDQo+ID4gVGhhbmtzIGZvciBwb2ludGlu
ZyB0aGlzIG91dC4gSSB0cmllZCB0byBydW4gc21hdGNoIChmb3IgdGhlIGZpcnN0DQo+ID4gdGlt
ZSksIGFuZCBJIGRvIG5vdCBnZXQgdGhpcyB3YXJuaW5nIHJlcG9ydGVkLiBJJ20gd29uZGVyaW5n
IHdoYXQNCj4gPiBhbSBJDQo+ID4gbWlzc2luZz8NCj4gPiANCj4gPiBtaXJlbGFAZnNyLXViMTY2
NC0xMzQ6L3dvcmtzc2QvbGludXgtbmV4dCQNCj4gPiAvd29ya3NzZC9zbWF0Y2gvc21hdGNoX3Nj
cmlwdHMva2NoZWNrZXIgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9pbXgtDQo+ID4ganBlZy8NCj4g
PiAgIENIRUNLICAgc2NyaXB0cy9tb2QvZW1wdHkuYw0KPiA+ICAgQ0FMTCAgICBzY3JpcHRzL2No
ZWNrc3lzY2FsbHMuc2gNCj4gPiAgIENBTEwgICAgc2NyaXB0cy9hdG9taWMvY2hlY2stYXRvbWlj
cy5zaA0KPiA+ICAgQ0hFQ0sgICBhcmNoL2FybTY0L2tlcm5lbC92ZHNvL3ZnZXR0aW1lb2ZkYXku
Yw0KPiA+ICAgQ0hFQ0sgICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2lteC1qcGVnL214Yy1qcGVn
LWh3LmMNCj4gPiAgIENDIFtNXSAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9pbXgtanBlZy9teGMt
anBlZy5vDQo+ID4gICBDSEVDSyAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vaW14LWpwZWcvbXhj
LWpwZWcuYw0KPiA+ICAgTEQgW01dICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2lteC1qcGVnL214
Yy1qcGVnLWVuY2RlYy5vDQo+ID4gbWlyZWxhQGZzci11YjE2NjQtMTM0Oi93b3Jrc3NkL2xpbnV4
LW5leHQkDQo+ID4gDQo+ID4gSSBjYW4gaW5kdWNlIHNvbWUgZXJyb3JzIGluIHRoZSBzb3VyY2Ug
Y29kZSwgYW5kIHRoZW4gSSBhbHNvIHNlZQ0KPiA+IENIRUNLDQo+ID4gZXJyb3JzLg0KPiA+IA0K
PiA+IEkgaGF2ZSBidWlsdCB0aGUga2VybmVsIGRhdGFiYXNlIHdpdGgNCj4gPiBzbWF0Y2gvc21h
dGNoX3NjcmlwdHMvYnVpbGRfa2VybmVsX2RhdGEuc2ggYmVmb3JlIHJ1bmluZyBrY2hlY2tlci4N
Cj4gPiANCj4gDQo+IE9oLCBzb3JyeS4gIFRoaXMgY2hlY2sgaGFzbid0IGJlZW4gcHVibGlzaGVk
IHlldCBpdCdzIHNvbWV0aGluZyBJJ3ZlDQo+IGp1c3Qgc3RhcnRlZCB3b3JraW5nIG9uLiAgSWYg
dGhlIGNoZWNrZXIgaXMgd3JvbmcganVzdCBpZ25vcmUgaXQsIGJ1dA0KPiBjb3VsZCB5b3UgZ2l2
ZSBtZSBhIGhpbnQgc28gSSBjYW4gaW1wcm92ZSB0aGUgY2hlY2s/DQoNClRoZSBjaGVjayBpcyBn
b29kLCBJIHNlbnQgYSBwYXRjaC4gSSBzZWUgc29tZSBkcml2ZXJzIGRvIGhhbmRsZSBiZXR0ZXIN
CnRoZSAqbnBsYW5lcyBzaXR1YXRpb24gaW4gcXVldWVfc2V0dXAuIE90aGVycyB3aWxsIGZhaWwg
dGhlIGNoZWNrDQooZXhhbXBsZTpkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRr
X3Zjb2RlY19kZWMuYykNCg0KVGhhbmtzLA0KTWlyZWxhDQoNCj4gDQo+IHJlZ2FyZHMsDQo+IGRh
biBjYXJwZW50ZXINCj4gDQo=
