Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3C1D4D43A9
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 10:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240881AbiCJJoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 04:44:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232299AbiCJJoE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 04:44:04 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2128.outbound.protection.outlook.com [40.107.114.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190D469296;
        Thu, 10 Mar 2022 01:43:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4F14PORElnWvOHohgeZVMp22F0uKogWLKjW4Tsgu6FAzg1l/KPFTyNgkj9IKMOJkysWj0C3IbYaB0XJYcjf2xnDew3/PjdYhSoaE8zRs0qNmapOxyGEEiuJuFfi0viPVl5t0twQ7PzQC+S8tlOsmQBxlk+veZK78bTpNPzWJHF34cIFJ44Kju9djDWIgSm5xzgQjXU9++aBPfWELZVsDxlrrt+mIJp8xLQ4zyn+UT3Y6Yi0slyF0cMhtFtCTAdCpfvu8CPUY7NAkvU+8l5reXicsPEfA5UsMEY6t3aGjBd8Hv8x20j8eSxKDAUkPHcCZ6Gx+zzVr6kn7AgsJpaH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AO48nErBO/3hGaIeyomOoBNof1y/nrF9WgA0cHl8Gcc=;
 b=LppZT1GAGOtgdFrLegnJDTQuhfVdH/JxjQIxx4ruirZDmALF1jl0ne2LrNEDCBPagsgd6+Rfv91Xx+hPLc/fSPpCRZZV/je0VHq01083COuKzds6xl1H6UQBoJtTGWGkZvT1EApw3QaJSCC4WwrIOe1Xv+MNf7y2D1Grva5fKWJ8J29OGEikHl/ktxL2trRHudXD4dJogmH2c/oZVe15Kajycg9Z/JDrW0WZV7HfptJpDq2lk6Oj6ulJNamRf3gxwaOZWhffyXqoczrYsiZrXkIoo9nYDOA7OJDeH7vIvz6jdybvLetTN0T1DGsBW/oex5KS88nAJVxmEACjwUdVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AO48nErBO/3hGaIeyomOoBNof1y/nrF9WgA0cHl8Gcc=;
 b=eS/HL0hNdTnwaVisQt87ioHdmds/pkJZqHtkuaOf/Q+E/jVikFTdhYLqQSjITpNKVRduLrtHwMiqZoSg4huEsv+IH1qdS2IWnOGMObYHR4+TpJ88MJBfuG1qO4G/2JmWfqQ883dG3OS4EngQ11OcUmIqmRqCtdbfb70bnwG/hFw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSYPR01MB5510.jpnprd01.prod.outlook.com (2603:1096:604:83::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 09:43:01 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.023; Thu, 10 Mar 2022
 09:43:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/3] media: vsp1: Add support to deassert/assert reset
 line
Thread-Topic: [PATCH 2/3] media: vsp1: Add support to deassert/assert reset
 line
Thread-Index: AQHYM+4+hHNShJgjfE69KJ6rQ6wa56y4VFgAgAAI5LA=
Date:   Thu, 10 Mar 2022 09:43:00 +0000
Message-ID: <OS0PR01MB59222DFB15C997906317311C860B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220309194521.7028-1-biju.das.jz@bp.renesas.com>
         <20220309194521.7028-3-biju.das.jz@bp.renesas.com>
 <f78fdc3b9c97230311a022f79070ab78877ccd20.camel@pengutronix.de>
In-Reply-To: <f78fdc3b9c97230311a022f79070ab78877ccd20.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 285c4529-62c5-4f8f-f2cc-08da027a5dce
x-ms-traffictypediagnostic: OSYPR01MB5510:EE_
x-microsoft-antispam-prvs: <OSYPR01MB551065CFFCCA66BFBFD11545860B9@OSYPR01MB5510.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i7b+smU19vGMUQfv4Zs85VW5lwKKYaaOVbk8NtqN29QH3rwPfIKV8oWLaYzNGrV0txJHkjUh8FoaKefSSyNvrbZ0FxOnmuGym/T2E1i04NhhSvhvNFr8sK+xrFfL+/gskDi2z4njs+2tYVui9ZJiP4415Jl/T8HF1tDFTRnAMjoeIwlsHsZ6EbYAtJnxZH9MrZL80KvYiKKV/Msy+YsyT9KhQ69+3b6SXEnLBEKsCQa96ANAn83GQiHYxhWduFokfmq3L324jaBzr1xENKLjHIjf/xc6ucUecN19bJRSdaPg+jie4BaFkko2kfWhqxfPu/+V2YrdB7jWakGaddDoRNBOAuOD3F5clB1peATiW5alw8B+CvXbXkpnlnb2Qa0ao0sq2Lg8FZRzRUcb+lUFo3TLp+yXTtnn62aQSGHYCVmZmSIOboDtfElwGVnw5C9ifYVR8mJolOno4TXuNJDsivGaTLevSpZyvE6qJieYPDHZtv7p2/Vv6YyLbXJJCWSDSS27koa+AclNtQ7Y8uU3RGTtmmRYjXgJ5Drm1t1VIhiVbMdxL3IM5wbhO4F5IhahQFRHF3r8Lbr51d3/JCWsD4EWCnyswjHvl8RfZomp6XZyp2QZWkrrO4Y9J6V0WW/MoB4aEUJ/W9ZBjUzN2K0PFkZu3VNESRJiHv+CIzk2YTCZaQFIC347EvereKOz48LpJdNmIk8pPnbg3ihhvU184w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(6506007)(2906002)(86362001)(26005)(110136005)(7696005)(508600001)(76116006)(316002)(4326008)(55016003)(64756008)(66556008)(8936002)(66446008)(66476007)(71200400001)(52536014)(5660300002)(38100700002)(38070700005)(8676002)(33656002)(66946007)(122000001)(107886003)(186003)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2xTRkZkSGZCWEYyL0JWdzNXTlBNbHptWVRUVUFjeWVGN3RuaDNqNC90YXZT?=
 =?utf-8?B?dGZRZ3M2WkJ5SWRXZW1YWkh3Ykt3aTM1aEdUdWFvVTFBRXIrM2pwMm95MklH?=
 =?utf-8?B?R0p0UVN4MlVnL01YcWVpVXVoMTVKdWEwYUVxQ1Bxa29YYVMyb09QRlM3dmtP?=
 =?utf-8?B?eHRRai9vYTRTVkZhTnFxcTBvSDdGZ1B0MVZvODM0OUVHMDBEeURhQm4vbGh4?=
 =?utf-8?B?dk8wbjBYSmU3RFQxOG1jZFRMenU3a2l3RDdpSGZXMzZhZ1ozYTRUc3duVFp0?=
 =?utf-8?B?eFhrWlN0Y0U3bk12U0lBQnhwa0xFQXl0d0ZhK3Q0U1Z0elhPYmtKUG5kUE1k?=
 =?utf-8?B?Q0RJUllsRXFqZVN1WDZmNDI4WHNabmdvYjZvWlVKa2liU3dESE4rdyt0OVNM?=
 =?utf-8?B?Z2M3MFhzTHdBTzNrL3lTalpmbWI2bG1PSzdaVUlQVzNENTJjWG5kUlQ4Q1Av?=
 =?utf-8?B?RHdyVTRDQmYvdHN2a01tWG1Na0NuM3VNMDMzQlZPZ1Q2MUE3U1lOTHNNRHVG?=
 =?utf-8?B?L1FUR3hxUDZhcGNqSVNxWHBDTnJNSEZORTR0VTFLdm45S21DYllzSUR0Undq?=
 =?utf-8?B?SmR1OHEzLzM2R0dURHJpakdhcnJJa2JGbklSYU14RjlHS3FONUg1ai9zSHlN?=
 =?utf-8?B?WTFZS0lEQXIyMjJVR015YVFBdG1IMWhFWFhZNjkyeUY3ZzFlNXZxNFlobFlQ?=
 =?utf-8?B?eHVoNGJQMWJlKzVjd1NXTFhZK05uczkzK2RabEJiTElnZ04yNjFwNjh3bDIv?=
 =?utf-8?B?cG5uOTNZWldtSnlUazBselRzTCtlUVF0Ymw4WU9VbURRNUFlTmYrZWZwMlNj?=
 =?utf-8?B?OVE3VnczcGliVlJSdlJac0NpVjNoMDJhMTdCcktVYjBmbTdxMkhKR0xEalVF?=
 =?utf-8?B?WVd3L1pJZGU5MS81ZXJ3YUZnMjJVamdzZkZiUEVMWnZKdXlOT1NOVU1hNHh0?=
 =?utf-8?B?VmdHbjlObGJLeStIeHVyaFpZSHJPTXRKbTBpdU1Vcy82SFgvT0FhRGswY1Z4?=
 =?utf-8?B?ZHBBczFwR2RUK0lyME9vb3A5eGRQTTNNMVRYaVl1Y1huUE1GMDVicDE2VWR6?=
 =?utf-8?B?NkVQK2U0dVhCM2ltdFVrSllsSlRleHFzSExaQ0c2SldqNGpXbjVZd3Q0a3d4?=
 =?utf-8?B?YWNlWTcwOWZUaDI2NDRxb1VJNUh2SDdSdnBiNWdtT0ZMR251VFdwV0lDM2Nv?=
 =?utf-8?B?dDZvZXJxSW5kSkhma3VDMFZOVG5GZkZndWptdmd2TzBjRWtJdUk0VXNpSjJz?=
 =?utf-8?B?YmRCdXlSZE9UN1pUZ3YwRGRycDB5dkFZcUhBQU1DbUVFM1AwR2FNdzF2UFJW?=
 =?utf-8?B?bWRsZTJwQ0RIeGlwYkNzWnl5V3R4aGZ1blFCYXNucEVIOWMweHJHd1RNQlRV?=
 =?utf-8?B?RDhrOVNCWC9oOHNPaUtWRkdEajljRk03MlRxOXRIZTB6d2lIbGd5SkpsRXJn?=
 =?utf-8?B?SHFsbytyN1FQellicGJJd0RVUXM3VS9jUTllUWZEb0lRWWNnZUdEVThtaURz?=
 =?utf-8?B?N3FHakJQVDI1R3hreG9MMHBRVWl0am1pOGJmbDlTT3NzQjhmSlVVdjNjckpW?=
 =?utf-8?B?eWdEZ1ZZOUQ0UFRXNjRHY0JvR1k3QldkL1ROTXQzM2xyTzg2cmVHOUljMnVv?=
 =?utf-8?B?c0FSdUVqQmZ2WitVdmNxd0xMbmZBSkJsUGFWUTJYZy9KU0l3czZ1dXRXejVX?=
 =?utf-8?B?WUNEZDQvK1hydHdtVHpKQS9Id3BNK2pVNHIyZ0o1bURCcEY2dGhZM09LWDVn?=
 =?utf-8?B?M3UrZTlVMWkxV05KaUw2cTNldFlkOVIyODBwVkFiSW9uUFg4ZHB6UHZ1NXNa?=
 =?utf-8?B?ZFpoZDZwRmw1WlVLQVFCYmNtVnRkZzNrdVpIc2dXaHRoeUJMa0svQ0JCVlF5?=
 =?utf-8?B?aEt6K2taQ1RDOUloMG5PWWVSMDhQWTRNZUhhU0NaVkJvUWwzR0o2ajNFNTlF?=
 =?utf-8?B?UCtLZHEzZTZ3NVlxeE54R01FdFhpa05IRFBZZE4yQkY3Z1g1dEpuelIzN0VB?=
 =?utf-8?B?amVnWnpWMXp2cVhYeXB6OHNtWFVIeXNkeTRucFhDTGJoRm1MWEFiMWxjLzht?=
 =?utf-8?B?b1VYcGQ3bFdnVW0xK05YYTJXQUQxQzlRMElFVjdWQ29sWlk1eDNiMGJYaG0y?=
 =?utf-8?B?ZCtoWmNMTjJBaXdjZEdTZHBWa3Q1WHFUZS9lTWZuaDhhSFQ0VjBoU3cyamtj?=
 =?utf-8?B?KzJpWDdDcHR0aTNWOTc4cDQ5U3AzTTVxbFUxUm9wRk5ma3FmMzN5MkNCRDZy?=
 =?utf-8?B?emxSY2JyaDExSitQTXhRYitleTd3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 285c4529-62c5-4f8f-f2cc-08da027a5dce
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 09:43:00.8518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SD4su3ZfYi8j61T2+o/8ZbWTGEWshAGVZwujGt1rfnCp2iNfCYRm1csk//nDQxHq/sb6Sqf37Doyekyh5uJ1aysmtvrLa3E4FakhsFR9J3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5510
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUGhpbGlwcCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAyLzNdIG1lZGlhOiB2c3AxOiBBZGQgc3VwcG9ydCB0byBkZWFzc2VydC9hc3NlcnQg
cmVzZXQNCj4gbGluZQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1pLCAyMDIyLTAzLTA5IGF0
IDE5OjQ1ICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gWy4uLl0NCj4gPiBAQCAtNTY5LDcgKzU3
MCwxOSBAQCBzdGF0aWMgdm9pZCB2c3AxX21hc2tfYWxsX2ludGVycnVwdHMoc3RydWN0DQo+ID4g
dnNwMV9kZXZpY2UgKnZzcDEpDQo+ID4gwqAgKi8NCj4gPiDCoGludCB2c3AxX2RldmljZV9nZXQo
c3RydWN0IHZzcDFfZGV2aWNlICp2c3AxKQ0KPiA+IMKgew0KPiA+IC3CoMKgwqDCoMKgwqDCoHJl
dHVybiBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KHZzcDEtPmRldik7DQo+ID4gK8KgwqDCoMKg
wqDCoMKgaW50IHJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQodnNwMS0+cnN0Yyk7DQo+ID4g
Kw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQgPCAwKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBnb3RvIGVycjsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0g
cG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCh2c3AxLT5kZXYpOw0KPiA+ICvCoMKgwqDCoMKgwqDC
oGlmIChyZXQgPCAwKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVy
cjsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+ID4gK2VycjoNCj4gPiAr
wqDCoMKgwqDCoMKgwqByZXNldF9jb250cm9sX2Fzc2VydCh2c3AxLT5yc3RjKTsNCj4gPiArwqDC
oMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiA+IMKgfQ0KPiA+DQo+ID4gwqAvKg0KPiA+IEBAIC01
ODEsNiArNTk0LDcgQEAgaW50IHZzcDFfZGV2aWNlX2dldChzdHJ1Y3QgdnNwMV9kZXZpY2UgKnZz
cDEpDQo+ID4gwqB2b2lkIHZzcDFfZGV2aWNlX3B1dChzdHJ1Y3QgdnNwMV9kZXZpY2UgKnZzcDEp
DQo+ID4gwqB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHBtX3J1bnRpbWVfcHV0X3N5bmModnNwMS0+
ZGV2KTsNCj4gPiArwqDCoMKgwqDCoMKgwqByZXNldF9jb250cm9sX2Fzc2VydCh2c3AxLT5yc3Rj
KTsNCj4gDQo+IE5vdyB0aGUgY29tbWVudCBhYm92ZSBkb2Vzbid0IGZpdCBhbnltb3JlLCBzaW5j
ZSByZXNldF9jb250cm9sX2Fzc2VydCBpcw0KPiBub3QgcmVmZXJlbmNlIGNvdW50ZWQgaW4gY2Fz
ZSB2c3AxLT5yc3RjIGhhcyBleGNsdXNpdmUgY29udHJvbDoNCg0KVGhhbmtzIGZvciBwb2ludGlu
ZyBvdXQuIEkgd2lsbCBzZW5kIHYyIHdpdGggc2hhcmVkIHJlc2V0IGluc3RlYWQgb2YgZXhjbHVz
aXZlDQpjb250cm9sIHRvIG1hdGNoIHdpdGggdGhlIGNvbW1lbnQgYWJvdmUuDQoNCk1vcmVvdmVy
IGZvciBuZXh0IHBhdGNoLCB3ZSBuZWVkIHRvIHVzZSBzaGFyZWQgcmVzZXQgYXMgcmVzZXQgbGlu
ZSBpcyBzaGFyZWQNCndpdGggRFUgTW9kdWxlLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IC8q
DQo+ICAqIHZzcDFfZGV2aWNlX3B1dCAtIFJlbGVhc2UgdGhlIFZTUDEgZGV2aWNlDQo+ICAqDQo+
ICAqIERlY3JlbWVudCB0aGUgVlNQMSByZWZlcmVuY2UgY291bnQgYW5kIGNsZWFudXAgdGhlIGRl
dmljZSBpZiB0aGUgbGFzdA0KPiAgKiByZWZlcmVuY2UgaXMgcmVsZWFzZWQuDQo+ICAqLw0KPiAN
Cj4gcmVnYXJkcw0KPiBQaGlsaXBwDQo=
