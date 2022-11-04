Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7228C6194EE
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 11:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbiKDK5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 06:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbiKDK52 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 06:57:28 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963042BB3E
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667559444; x=1699095444;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SdZ5aVwwHM0U5leYjDK4bkFKi/UstfGwXRfmBFlaSag=;
  b=0pnp6QorveVaEzLBHUDD2SYYcfviLnLJQYJsgGlTKsG8Hf0XYUnVPVJ9
   YNKRVa4jbJMmhoTIlQqVHSKOnBj2SOvwKTMyafe7f7NHLugqP4Qzb72Rs
   GcbzX7Mcum21BNXoJaaU0HC6Vgp/knjsihZslZNbovTVepbfLi/tp6Muw
   mSdFTYCQiIcYS1fbCId5ws5RNlywgCgtCa2ML26X0iCAhxlHKFJRB3xSD
   fV+d7L+6ZpYx5AYGZn5P3ZN0J9Fh5xZ517Fcjk/+ejKqeja8AZSwnYDkX
   Lt5rwrUmh9wI1J+aYfxeYOD4iNMEHItN6dY+v8FQ0h5QQCUiCIlHbO1jX
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="181940173"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Nov 2022 03:57:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 4 Nov 2022 03:57:21 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 4 Nov 2022 03:57:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ko9UO6/H7y7JXCJiMOVhS4QQLL6bDJP4DTvgJQjT8fmoJ86t4mu8huNaBkfrvC7Cy2q7/m9TYTb5OD+264eDV9kdjAoCTlH2iBZaGMJhfG52SaS1fc2m/wit9jwB24PrZVU2wvD9lcdYIhTP3NeMDnhydL02PhvZrkJx3ymcs7395S6uVX5VOFa6qPNMx67DEDa0m444hEGf5BIjl6MprS+kuWKhZay+ieFWngTRPlnt2lCOaYRrM8D3x261Ta/g7oUg/hNZYS1uBz/U9MsRd82mom0x+5zLgw3ybe1OiJP7cIXKnWA3LLFKozmuPqVoS+b0ac4SomWPiXzmvgGhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdZ5aVwwHM0U5leYjDK4bkFKi/UstfGwXRfmBFlaSag=;
 b=NcvD6eIucu5Y6jI97FyaFbQ1kD0BzQS4BsjuiNURbJts9Jr2EKpIjo9QIMfkaUKX47DelMNiiameFvJqfpfkjH+KX50XZZwp9WSHaba24IWv3G8J5+x9I7hlc50SfhO/DtAeVZ9nn7psugqhEm7V6qqCHlF+qIdb29zWUCMB0dZkOQDbGpwx8f+qJFUoEPHNY3+3IGwweUc5/X4m6Cddee07JMEpMEZv/gmWKxD+x88mvFsogQmEEsNZayZEejUEYpSseVxR3AC++KuibK0b5yIl8ACbEfPpZTnrh8WYjZh/dqqMGHg7oRe/kL0ZRboCAioeziRDzQtRS9D2W6xErQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdZ5aVwwHM0U5leYjDK4bkFKi/UstfGwXRfmBFlaSag=;
 b=Bo2AZT7iQZtPMI5Sioy3TlxARAre9ktaAuuwLIbYSSPC6ystG57dpm8x9CpTdWEvcCMkKFFZmpkwSHzKUOXbdK1TKZVEnL2p5GSbZUfQXq9UoNb0RxILSUiVo7+RzOKLMLtHO4u/NW3DlbBCi2GYsdL7pvtR0IEiZIRTXD/0mRo=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by SN7PR11MB6826.namprd11.prod.outlook.com (2603:10b6:806:2a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 4 Nov
 2022 10:57:16 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::eace:4192:3f5e:e0cb]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::eace:4192:3f5e:e0cb%6]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 10:57:15 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil-cisco@xs4all.nl>, <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>
Subject: Re: [PATCH 0/2] vb2: add (un)prepare_streaming vb2_queue ops
Thread-Topic: [PATCH 0/2] vb2: add (un)prepare_streaming vb2_queue ops
Thread-Index: AQHYhhrsFrmjCubcI0ixdixz59oiJq1bLQsAgAAErwCAAAIPAIDUJK+AgAATt4A=
Date:   Fri, 4 Nov 2022 10:57:15 +0000
Message-ID: <d99826cb-e903-1c60-ec20-860a8d9baa50@microchip.com>
References: <20220622093145.927377-1-hverkuil-cisco@xs4all.nl>
 <YrLkbMZYb/Jpdidv@pendragon.ideasonboard.com>
 <cda824da-723e-66eb-3773-883502a34fd1@xs4all.nl>
 <YrLqFKJT2JxIX3e3@pendragon.ideasonboard.com>
 <27bba2c9-d542-a517-dc11-50d2fe9b51ea@xs4all.nl>
In-Reply-To: <27bba2c9-d542-a517-dc11-50d2fe9b51ea@xs4all.nl>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5384:EE_|SN7PR11MB6826:EE_
x-ms-office365-filtering-correlation-id: 5b0c6cc5-d8f1-4e76-c9f0-08dabe5355d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rJQZixK7YV5MMnWflrCDTweJjqRHhEh3iZPGcgJFeZMK28pJOxM2EcRL8JSEHPZ2+PRamt//ms6Ay/GTuTBtye/IIbYRmk4k9klb65LPF9FPF08q8i0l8zKNRd0yn5TdyPE8H9I35UtIYp7nfqnxBnueRFo3eUZu/xsNdprU9ANEaT8h4Tj752WfJILa7SEeG+GyjO0ZHwrlAd3/7lBe3muMjdhHAHv4OnoHi/OjTDXpKGnOcXqWm3hiInFGFmtPqc8UB6as+rT1IleT8oCXNGuwEzKtHePKDAQFmeBOB7N2tdMp73+1RR8OgJj18S+leGX+GwUfyLE65IkkPuHPdcMzMk0MWzDp7Cj2kLl8PHrFDuETh4qzqhdJV3DS67tCN1ZJ7qgS9ny1D5oql026OpuT2VjQgXpGY02Kk2EGiHZHNHxqSPYF/05WAC3CEu8l3lx8YKYFSepFepTMBON2c0j44JckP86m/QWvCAp5eqkjgQjBEPUj4bkcBEBGwWUDBHldil/0aUKgGGVSUj/TYXIZuv9bjrpqDlKI6cgN5L3GaKJ+hmdul1eDxXfmtk+GMpBeYepGmRVLoIBzzx+5f2ijvlPxLR8MUWXpfS1QOAedy7kyVB9Ufn8eINTlc/JsFTsQKSoszOo4vJeDVXUGfgl1sf/3soxnuhGTRpUgqAf3WF1R3OjyvAAGHrjCWxkO0dYofw8ZEhgpZNZCyYpDiWf9NPqG7KgCXwITGasuecv8nqfy0e59m/88aS5T2jc/mHPH42NXUEFM0MIqSsahFJwxcoo+Yw2WGc7HwNXb+GUhG/As8Spc3yV4y8J24eanMR50L8khCoY8NF27g2i845yNGrX/5cQmTKFvdcnw4Lc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5384.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199015)(31686004)(38070700005)(966005)(36756003)(110136005)(86362001)(31696002)(2906002)(66446008)(83380400001)(8676002)(186003)(38100700002)(122000001)(64756008)(26005)(6512007)(53546011)(2616005)(66476007)(66946007)(6506007)(478600001)(41300700001)(66556008)(76116006)(4326008)(316002)(71200400001)(8936002)(5660300002)(6486002)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWszejlsVjBVbEJHY1BrL3JEYzNnT281eG4rYWpScDQzS0dSeHB5TWZmNWVR?=
 =?utf-8?B?cFhwSFExYmV5QUtLTFliR1VoYzZUclpYU3V1MUgySUQzZU9RUHlUVEdmK0Fh?=
 =?utf-8?B?b1NsRVl1ZnNwR21GblZ5V29HdHpKU0VsODNiVHNFdEJzNHVxbGRnUGVNZ3hy?=
 =?utf-8?B?c2N0NnB1WDg0Q2dqSENPTXUzSmJUemtyZkJGY09aTWRRNWJma0ZJeFVRMTZz?=
 =?utf-8?B?K3h4QW5wTVRaTGxDOUtzL3VqY2lRWmxUZjhzTnRoek5rbHB1Y25xcnlHa25w?=
 =?utf-8?B?anhGZStEZUVNZ0pxczRoRnBmRHlJdklZQ3NwajRlQUIzeDdvNXdtWXFZdVNF?=
 =?utf-8?B?cmx5R0ROM2lISk5JUG1QZjVJNWpXc2VUeUUxTUFwdG01Qit2MmdDMjRUMXdj?=
 =?utf-8?B?RGZ3K0FwRW9tdVRTTE56VzBrWTRSREhTaklJN1FtV2s5QldscEVJVW85M09L?=
 =?utf-8?B?enROOG5ndVZCK0hnZVJRazVOUUJlY3kraFphVGJXRXBRVlRjUTlUMXM2U2ht?=
 =?utf-8?B?RHQyOUdjQnRSaFpuSXhHM3M5V1kzcEJJaGJVZzRXYUhtUzZ0ZXVEc05OYks3?=
 =?utf-8?B?MjVFUlNUL2NEakJ0UU1vSGZQYmJFVUhmdXVnQTVBODJvTnZFZHgxSzZROEU0?=
 =?utf-8?B?MTEvSHphamxveXl5SmpyeU14QTEyS1RKKzdtdXlrTlkxWnEzUVFYS0h2VC92?=
 =?utf-8?B?QnJNaWpvT0pHS1JaVFNHM0htTWdicWlaMW1ML1RnbkxGZm1HSkYyVjA5QUVQ?=
 =?utf-8?B?SFF5MSsrd1BuMjZ2a0hXSHB3VlVJM3RTVUM0c0E2TDdsOXFNM0ZxUDA4OFBE?=
 =?utf-8?B?R3M5V1BTM3FJdE8rdzRrUjA2aUpYTWt2VDlLaGVyMGtZc01RbStUMG9DLzZ0?=
 =?utf-8?B?Wjl4N0lGNkNDcFZZTHczRm1mMlFpeUFqQ2d1TlZYVGlXYytOUzdmd1BzNlZn?=
 =?utf-8?B?elNzSmZnY2lTRlo5b1FKa1V5ZzVweDNreG50UHVza0c3bXNaMTFJYkZSR09p?=
 =?utf-8?B?ZlFCQVI2ZXRtbmV2QVlodnNZQkNuSXFMbEl2V0pwL3RFSVJsN051RXV5eC9L?=
 =?utf-8?B?Wmkwa2xya1hhOXVaQVd5S3VZMU50S2VOaTJEZ1A4TlhOREJBWWlmYkVpMnUv?=
 =?utf-8?B?MkQvZ2FZNXZOcEVQUnFWTEJnTndTU0U4MUpVTk9sRy9sQVJyK2VwbHNsckVl?=
 =?utf-8?B?MW13Q2ZoM2JIY0N0T0JoZGRFUGRJVHdPUTg4dWdCQ1IxUzJVdTZYaWt2Um5D?=
 =?utf-8?B?SUNHR3ByWC9YekE2ekowOTBaTmJLVUxHdzkzM2dDMVV6eDN4U3duSFd3dlg5?=
 =?utf-8?B?c0FFL0RQWUYxczhsbmc4b1k5d3Qrbm9ScWk0bjhtallCTGh0RkV3aklyOXgz?=
 =?utf-8?B?bWdwN09XQTJnaTNZZStHUGlubFRGNXhKNzRMYXNxR1hsUzZUS0FtOXNKLzVE?=
 =?utf-8?B?ZTRESWdoOU1rUFBhLzdkQ0VhbkV6MDE0aFBpMythOUw2NGZLZU41MlpaY1FX?=
 =?utf-8?B?aUUwb0UvdDdtVjFTWXdScnVIZEZkK2VSWEFsVmZuOTBpT251N253QjNKcU9Q?=
 =?utf-8?B?V0RLQXRwTm5BM3V1OEpTUEp2MmpiNU81ViszQmVPdUNyTy9oN1JvQnNYeUhU?=
 =?utf-8?B?cDZZTGhkVDlpb3hZRVoyMWlSTnppOEpkbWJWbzdmZDBqYVl6Rjg5SVdEa3NT?=
 =?utf-8?B?NWJ1dzMxRDcrZmsraVdaS29BRkVsd09HSERWS1B3NXJ1SUxnSTBreWtTditq?=
 =?utf-8?B?L2tZV0FJVWhud2xUNDNlWkplc3E4dFNldDdndWsvQThoV3BMc2NRZjZhcGNZ?=
 =?utf-8?B?YXMweTFCTlMrdGhMV2V0Q1BRakkzNzhLdzJSUWptYWpramloL1JDanN0NkpZ?=
 =?utf-8?B?T24rSDc1WTJvN2hWTlJEdldtN0ZlNTltTFVpM0FmT1JVcjVobGNKSERsR1Yw?=
 =?utf-8?B?MHNDTWtjNE11UVl2VGhTQzgvYWM4ZFNiVzdGMVhXSGovSW9nd0hYWlk1R29L?=
 =?utf-8?B?Vk4wZW9KcmNuMGpjQUNwaUVkVjFqOHZCczRVbFI2UGM3a1plT2VheFo2cmU2?=
 =?utf-8?B?WXRsenlUOU5KKzZ5clNwMHc0U3pmaytNTTQ4em1LU1UyeTZLVHpmei9sZDFP?=
 =?utf-8?Q?a0/A29vpRt/bg6euMXnN+I5Xo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D43704923386744B42F6B53B3EADA29@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0c6cc5-d8f1-4e76-c9f0-08dabe5355d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 10:57:15.7932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DQvS7utawbMxQkCvpsYtPozwYJTZ4tp+a5z4p9sAv9G6EbY/tbcnoZV6DoVoK5Ehhw3h59tWEHi943jL4Yw7hqAblMaUwM7ioizUEZYe0/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6826
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTEvNC8yMiAxMTo0NiwgSGFucyBWZXJrdWlsIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIExhdXJlbnQsDQo+IA0KPiBPbiAyMi8wNi8yMDIy
IDEyOjA4LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPj4gSGkgSGFucywNCj4+DQo+PiBPbiBX
ZWQsIEp1biAyMiwgMjAyMiBhdCAxMjowMDo1OFBNICswMjAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6
DQo+Pj4gT24gMjIvMDYvMjAyMiAxMTo0NCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4+Pj4g
T24gV2VkLCBKdW4gMjIsIDIwMjIgYXQgMTE6MzE6NDNBTSArMDIwMCwgSGFucyBWZXJrdWlsIHdy
b3RlOg0KPj4+Pj4gQWRkIHN1cHBvcnQgZm9yIHR3byBuZXcgKHVuKXByZXBhcmVfc3RyZWFtaW5n
IHF1ZXVlIG9wcyB0aGF0IGFyZSBjYWxsZWQNCj4+Pj4+IHdoZW4gdGhlIHVzZXIgY2FsbHMgVklE
SU9DX1NUUkVBTU9OIGFuZCBTVFJFQU1PRkYgKG9yIGNsb3NlcyB0aGUgZmgpLg0KPj4+Pj4NCj4+
Pj4+IFRoaXMgZ2l2ZXMgZHJpdmVycyBhIGNhbGxiYWNrIHRvIHZhbGlkYXRlIHRoZSB2aWRlbyBw
aXBlbGluZSBhbmQgY2xhaW0NCj4+Pj4+IG9yIHJlbGVhc2Ugc3RyZWFtaW5nIHJlc291cmNlcyBh
dCB0aGUgdGltZSB0aGF0IHVzZXJzcGFjZSBpbmRpY2F0ZXMNCj4+Pj4+IHRoYXQgaXQgd2FudHMg
dG8gc3RhcnQgc3RyZWFtaW5nIChWSURJT0NfU1RSRUFNT04pIHJhdGhlciB0aGFuIHdoZW4NCj4+
Pj4+IHRoZSBhY3R1YWwgRE1BIGVuZ2luZSBraWNrcyBpbiAodGhlIHN0YXJ0X3N0cmVhbWluZyBj
YWxsYmFjaykuIFRoaXMNCj4+Pj4+IGlzIHJlbGV2YW50IGZvciBkcml2ZXJzIHRoYXQgbmVlZHMg
YSBtaW5pbXVtIG9mIFggYnVmZmVycyBiZWZvcmUgdGhlDQo+Pj4+PiBETUEgY2FuIHN0YXJ0LiBU
aGUgYWN0dWFsIHBpcGVsaW5lIHZhbGlkYXRpb24gbmVlZHMgdG8gaGFwcGVuIHNvb25lcg0KPj4+
Pj4gdG8gYXZvaWQgdW5uZWNlc3NhcnkgZXJyb3JzIGF0IFZJRElPQ19RQlVGIHRpbWUuDQo+Pj4+
Pg0KPj4+Pj4gQXMgYSBib251cyB0aGlzIGFsbG93cyB1cyB0byBtb3ZlIHRoZSBob3JyaWJsZSBj
YWxsIHRvDQo+Pj4+PiB2NGxfdmIycV9lbmFibGVfbWVkaWFfc291cmNlKCkgaW4gdmIyX2NvcmVf
c3RyZWFtb24oKSB0byB0aGUgYXUwODI4DQo+Pj4+PiBkcml2ZXIgKGN1cnJlbnRseSB0aGUgb25s
eSBkcml2ZXIgdGhhdCB1c2VzIHRoaXMgZmVhdHVyZSkuDQo+Pj4+DQo+Pj4+IENhbiB3ZSBkcm9w
IHRoZSBob3JyaWJsZSAuZW5hYmxlX3NvdXJjZSgpIGZyb20gbWVkaWFfZGV2aWNlIHRvbyA/IDot
KQ0KPj4+DQo+Pj4gVGhlIHNlY29uZCBwYXRjaCBoZWxwcyBhIGJpdCB3aXRoIHRoYXQsIGF0IGxl
YXN0IGl0J3Mgb3V0IG9mIHZiMi4NCj4+Pg0KPj4+Pg0KPj4+Pj4gVGhhdCBjYWxsIG5ldmVyIGJl
bG9uZ2VkIGluIHZiMiwgYnV0IGl0IGhhZCB0aGUgc2FtZSBwdXJwb3NlIGFzIHRoZQ0KPj4+Pj4g
bmV3IHByZXBhcmVfc3RyZWFtaW5nIG9wOiB2YWxpZGF0ZSB0aGUgcGlwZWxpbmUuDQo+Pj4+Pg0K
Pj4+Pj4gVGhpcyBpcyBhIGZvbGxvdy11cCBmcm9tIG15IHByZXZpb3VzIFJGQ3YyOg0KPj4+Pj4N
Cj4+Pj4+IGh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Byb2plY3QvbGludXgtbWVkaWEv
cGF0Y2gvYmE0YmNhMTQtNDg4Zi05NGVhLTQ4ZDktZTczNDMxMDNjNWFhQHhzNGFsbC5ubC8NCj4+
Pj4+DQo+Pj4+PiBJIHdvdWxkIGxpa2UgdG8gZ2V0IGNvbnNlbnN1cyBmb3IgdGhpcyBzZXJpZXMu
DQo+Pj4+DQo+Pj4+IEkgZG9uJ3QgbGlrZSBpdCBtdWNoLiB2YjIgaXMgYWxyZWFkeSBkb2luZyB0
b28gbXVjaCBpbiBteSBvcGluaW9uLA0KPj4+PiBncm93aW5nIGl0IGlzbid0IHRoZSByaWdodCB3
YXkgdG8gZml4IGl0Lg0KPj4+DQo+Pj4gV2UgZGlzYWdyZWUgb24gdGhhdCA6LSkNCj4+DQo+PiBJ
IGxpa2UgcG9saXRlIGFuZCBjb25zdHJ1Y3RpdmUgZGlzYWdyZWVtZW50cywgdGhleSBoZWxwIG1v
dmluZyBmb3J3YXJkDQo+PiA6LSkNCj4+DQo+Pj4+IEknbSBzdGlsbCB3b3JraW5nIG9uIGEgbmV3
IHZlcnNpb24gb2YgdGhlIFY0TDIgc3RyZWFtcyBzZXJpZXMgdGhhdCBtYXkNCj4+Pj4gY29uZmxp
Y3Qgd2l0aCB0aGlzLCBJJ2QgcHJvcG9zZSBkaXNjdXNzaW5nIHRoZSB0d28gdG9nZXRoZXIuDQo+
Pj4NCj4+PiBXaGF0IGlzIHRoZSBFVEEgZm9yIHRoYXQ/IEkgZG9uJ3QgbWluZCB3YWl0aW5nIGEg
ZmV3IG1vbnRocywgYnV0IGlmIGl0DQo+Pj4gdGFrZXMgYSBsb3QgbG9uZ2VyLCB0aGVuIEknZCBy
YXRoZXIgbWVyZ2UgdGhpcyBmaXJzdCBzbyBFdWdlbiBjYW4gdXNlIGl0DQo+Pj4gaW4gaGlzIGF0
bWVsIE1DIHN1cHBvcnQuIEl0J3MgYSBrZXJuZWwgQVBJLCBzbyBpdCBjYW4gYWx3YXlzIGJlIGNo
YW5nZWQNCj4+PiBvciByZW1vdmVkIGxhdGVyLg0KPj4NCj4+IEkgaGF2ZSBhIGZldyBvdGhlciB0
aGluZ3MgdG8gY29tcGxldGUgZmlyc3QsIGFuIGRJIHBsYW4gdG8gcmVzdW1lIHRoZQ0KPj4gd29y
ayBpbiB0aGUgZmlyc3QgaGFsZiBvZiBKdWx5LCB0byBwb3N0IGEgdjEyIGJlZm9yZSB0aGUgZW5k
IG9mIHRoZQ0KPj4gbW9udGguDQo+IA0KPiBMb29raW5nIGF0IHRoZSBsYXRlc3QgdjE1IHNlcmll
cyB0aGVyZSBhcmUgbm8gY29uZmxpY3RzIHdpdGggdGhpcyBwYXRjaC4NCj4gDQo+IEV1Z2VuIHBv
c3RlZCBhIHYxMSBvZiBoaXMgImF0bWVsLWlzYzogZHJpdmVyIHJlZGVzaWduIiBzZXJpZXMsIGFu
ZCB3YW50cw0KPiB0byB1c2UgdGhpcyBmdW5jdGlvbmFsaXR5Lg0KPiANCj4gSSB0aGluayB3aXRo
IHRoaXMgY2hhbmdlIGl0IGlzIGFsc28gcG9zc2libGUgdG8gcmVtb3ZlIHRoZSBlbmFibGVfc291
cmNlDQo+IGNhbGxiYWNrIGZyb20gdGhlIG1jLiBJIGNhbiB0cnkgdG8gcG9zdCBhIHYyIHRoYXQg
ZG9lcyB0aGlzLCBpZiB0aGF0J3MNCj4gd2hhdCBpdCB0YWtlcyB0byBjb252aW5jZSB5b3UgOi0p
DQoNCkhlbGxvLA0KDQpUaGUgSVNDIGRyaXZlciBsb29rcyBtb3JlIGNsZWFuIHdpdGggdGhlc2Ug
b3BzLg0KSSBkb24ndCBrbm93IGhvdyBtdWNoIGl0IG1hdHRlcnMgdGhvdWdoLg0KSXQncyBub3Qg
YSBiaWcgaW1wcm92ZW1lbnQsIHJhdGhlciBzbWFsbCwgYnV0IGl0IGxvb2tzIGNsZWFuZXIuDQoN
ClRoYW5rcywNCkV1Z2VuDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiAgICAgICAgICBIYW5zDQo+
IA0KPj4NCj4+Pj4+IEhhbnMgVmVya3VpbCAoMik6DQo+Pj4+PiAgICB2YjI6IGFkZCAodW4pcHJl
cGFyZV9zdHJlYW1pbmcgcXVldWUgb3BzDQo+Pj4+PiAgICB2YjIvYXUwODI4OiBtb3ZlIHRoZSB2
NGxfdmIycV9lbmFibGVfbWVkaWFfc291cmNlIHRvIHRoZSBhdTA4MjggZHJpdmVyDQo+Pj4+Pg0K
Pj4+Pj4gICAuLi4vbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi92aWRlb2J1ZjItY29yZS5jICAgfCAy
NiArKysrKysrKysrKysrKy0tLS0tDQo+Pj4+PiAgIGRyaXZlcnMvbWVkaWEvdXNiL2F1MDgyOC9h
dTA4MjgtdmJpLmMgICAgICAgICB8ICAyICsrDQo+Pj4+PiAgIGRyaXZlcnMvbWVkaWEvdXNiL2F1
MDgyOC9hdTA4MjgtdmlkZW8uYyAgICAgICB8ICAxICsNCj4+Pj4+ICAgaW5jbHVkZS9tZWRpYS92
aWRlb2J1ZjItY29yZS5oICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKw0KPj4+Pj4gICA0
IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPiAN
Cg0K
