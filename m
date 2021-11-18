Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61EAA45555F
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 08:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243678AbhKRHTW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 02:19:22 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:36406 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243336AbhKRHTV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 02:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637219781; x=1668755781;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jiq2QVGM6iJMRjHvbni6lyvNtKybZl2w5//hsTEBKps=;
  b=yAZf/nGxdBCJq1xrnaJoc3CDzLEv7YhoArgJcQf1WXOP6ma+TcbTg885
   yLzev+uzf8silfnz1GWx4bFmTcaBsytjQpimlVDn5UZplX/oYWAUi4b2V
   d05/zle/Gq3isfG1tgLhyBTpLyzkAjRIrBCxMWznzIhLFkzLGMj1zDVS6
   eJoYy9GnoJLIqFIRaCC8cuOrfOwBnoNi7XyaceS5c2b78UETY30gxT6Dd
   B+adxwwnQ0M2dG6I282Ia9F518HLuUm1w7it+PLV9bhY/m27HLHcEEIu4
   d6jhroL21u/MMNIGfVNNzEeZsuzpsWd3KFZ56rJnErD/miapqm6ipZKoZ
   Q==;
IronPort-SDR: Uqm8H/XlVpfSzqcyrf3Ua1uuFkwvwMCAjO1FCqKRtuIekrheAR6dEoDCPomx27eAstYt4z//aR
 FxZhcU7pOHM8GJEbIVyWzMMXoS8lNNZ8FX9/fzscRYC1K3E38Dknll2j7qZUTfUhrO8SDYUkY7
 S406jqYmQqXwsH+HdGd9u2HVZMWYp8q6yF6mxhMRd33SKxbHrPIQIZFZBg8JzMiblr/p/L1kAO
 hlro56r7ADYLAMcVIs+AaDcVkOx/kP0R4k2xTa3QuFEwlxK5/td3qIHal/NTX2rahZgAeXRZ9u
 UXFjXGEIQhRtBQDq5WABMvEt
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; 
   d="scan'208";a="76836989"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2021 00:16:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Nov 2021 00:16:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Thu, 18 Nov 2021 00:16:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3XMXA1ODQWCYUJDNA5lk8n92PK8vV9zrYBir+FeXLi2clFsmWLFBiAiHXC4ulHCw6L+GjUIzY8wKod+MaoFzBM7Om4MFgXQdnUM2oY7fizJ7S1GJvYOKH1TBCeBZUVZYSORKFuao9GMGoLDlV6tvZCcp8AUc1PZFvSoIqEKrDMUYGueh0dtizaj8gmE8yueVmtw9MZ7m/PG0YPLx4TM2D7/bLfh4c5X+Lf3smaH+uQdXdWjvlUpiQb/1kwlajL6pIyi6BcBhH7YgnExFi6Vwdp5RcpVkMAUn+SiC8+rVSF/EZqld3/6HJU6EPJicxdX/UFe97GKYskmjAaWFmoHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiq2QVGM6iJMRjHvbni6lyvNtKybZl2w5//hsTEBKps=;
 b=N9ZRzHPAbDvtM2euy4FumrglyYDPUryHvvMDroyDkt3REDbysLOSl0aoUdPCX8Lr1weW/DoyYZn9l0tMsf/IsHGsEYzDCdextV7E7ipE6XNzgvN8/Yi3kFXolSXks7kNjQD1wPYGMxvw5x8ooBcN6BSTfFgjEIUMsx8A7FLjEyLQPHVevBoZO7ArlEiTVcPJS/oVsAJtF1l7eb9hi2osPVskhp3eIicJDGDCRHp6RDuTydFfXhsUgWTMhrUszbgSOozbhIpKlE5xAlPc9BWzQurLfPmIjOXNX7IAKHD5yHywX8CDBYhzQ+YOq/CjTwglTltXKpnrsRFs6s4qd+3y0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiq2QVGM6iJMRjHvbni6lyvNtKybZl2w5//hsTEBKps=;
 b=ikVdbKRmP9yikDg3c8lWTIsChYTZ+vXFXK1B7f0XSm9nt9ucbwd/mZZ6jWPWeC93ufEHQA27T5PSHTZalXsCRwI16U9spPnWAUI9UYaTT0w148nQH6MOoE4b3G4bWlxeNQRn3Vq4GBk5pAYAeO8fevMSjotEEcmxHqUbU3h0tCk=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN6PR11MB1444.namprd11.prod.outlook.com (2603:10b6:405:a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 07:16:16 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21%7]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 07:16:16 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <sakari.ailus@linux.intel.com>
CC:     <leonl@leopardimaging.com>, <linux-media@vger.kernel.org>,
        <skomatineni@nvidia.com>, <luca@lucaceresoli.net>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: imx274: fix s_frame_interval runtime resume
 not requested
Thread-Topic: [PATCH] media: i2c: imx274: fix s_frame_interval runtime resume
 not requested
Thread-Index: AQHX28l/Wm/VajvbQEOJ1wHtmH/bJKwH5ACAgAALfICAAEYMAIAAqz2A
Date:   Thu, 18 Nov 2021 07:16:16 +0000
Message-ID: <17380c4a-1ab9-6bb1-a574-2e9ba7065aa6@microchip.com>
References: <20211117154009.261787-1-eugen.hristev@microchip.com>
 <YZUptcn1isWQuCdq@paasikivi.fi.intel.com>
 <97fbf01c-6cfb-7ab9-f045-383a1e4053c2@microchip.com>
 <YZVuGrkKTrvQC/Qm@paasikivi.fi.intel.com>
In-Reply-To: <YZVuGrkKTrvQC/Qm@paasikivi.fi.intel.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6801bf4d-5f64-428a-c28e-08d9aa634f84
x-ms-traffictypediagnostic: BN6PR11MB1444:
x-microsoft-antispam-prvs: <BN6PR11MB1444EB05CA8D80D10F3C39A4E89B9@BN6PR11MB1444.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hjAb13/KVCmN6+WQa2MqmsDlJnaXeWEX9N3vOWitfGZywHu3Ixt3J4moNPjkweaQJYvyBJqqr3Q9P0w+jLPJLvdVZD1aaHUanBC2s6MA+wW2tONOBo6VUoSOmlXQQQq1ULLLiAp6u81ZCF9w6plMqiqW855K16ZUGnB6MkVx7Idc2FvrrOvL2RBa5vML4HdpUnDZXqZ3KRar+5WxIv8tcEM1OWMxIdwb73s8UpR4B7YBzFEWAtoAPOoXR4Bqsr4W4iI3H4s+TXU2xXh08/ND+wbBJzamk1Qzw4NyWxnBaTsq0SzGbitPPUK40YkCuaz77E+Am60ucKRPICNC/COk+H8tQE99JlixnWPYJG2rE3QZJMGR0TsrcS+svi2b9fH01+Jqcf53CxDMa/Q8fumK/UJifcZATx9J90K0mJOJbEbe7u57SdTaWPBy1O1UaQJo4g0twtfU4njUFIMNgY8xU8wFssGotCEkATuNX9u+t8G4N1JOq9pnC5Zg97vMbjKcuZbmV4/8YSLeI0eT1CkpiCAsXGnmwStuKtaCgewo8skLpEk3Fz7JifqTRdnpJMEaYdnyIt31+4Nb1+RGUbmxg1SlHYWbnGe0OkdlMPTUARHkoMr/zsNF+x830M16Hps7v0FDEjB4Zkkj7TzCU4JiTMxnwLXHOapDKAu53E8bjgjBzhU+8qEt17XhSMHXY64HHfAdDH20eXKmT56+KlwsTjVFTXGBsAIUPNKY9VEcWLOyz0CZtWzLiS5ztZywIM0Oa++Hs3PhLYKRZlZnwhqQcg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8936002)(122000001)(6486002)(26005)(316002)(6916009)(83380400001)(53546011)(6506007)(86362001)(31696002)(91956017)(2616005)(66946007)(64756008)(66556008)(66476007)(38070700005)(66446008)(2906002)(186003)(6512007)(5660300002)(71200400001)(4326008)(31686004)(38100700002)(8676002)(54906003)(76116006)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHRWS3VYVEVmS241YVJPd0pLRXNCNVUreVRydm1VSnlRR0xQTjNuRXVOdmFH?=
 =?utf-8?B?aHF2WWF2Zno0YTNSdTE3b2xCWWRpSmhkZDlMMkcyRnVONjVHQ0hLWEZjMW5x?=
 =?utf-8?B?QVc0WXZQUUxWSmZYbU85R0NTdzl3WmpYeXJyL2xOeW4vb1ZNTlJ5SWFxdFNp?=
 =?utf-8?B?b3B0MitLQ3hCdDM2c2pXTnZEMEpDVm9zOXRDL056c1EwMjc4WTJFL3NxUDFn?=
 =?utf-8?B?TjExc2tXUXpTYUJ2Z3dSTEVTTmo1bjFJZXZzL0l4ZnFTZGVEV21DOXo5d0VD?=
 =?utf-8?B?VHRBc1hKZkVMRFJBbVhQcVNKeHZrWVFJc0RYQ2RTWExrMWN1R2dCSUhJdWlj?=
 =?utf-8?B?bTRRcjc1V2RaZ0p5c0ZONmVjejRtKzBUK24yUzkrSlRJUndyUFV6WkQrQXJO?=
 =?utf-8?B?UUNORGZmMWtyd0x0QWRPeHpJKzFsNkdtcnQwTVlmb3c2WDNTQUhoNXFCV2VI?=
 =?utf-8?B?OVdMWDFMY1B5elpPS01uUHBDNlgwWm5wdW11REpGUHJrOTBrYmI1YkRPMUxM?=
 =?utf-8?B?anpEZTkzaWE2bWF4ZXo5aTl5SC9MSEswT3lYRWdTcjZzb0lwUCtWTjNtWDhw?=
 =?utf-8?B?ZUNFb3pzZi9ZZFZCalBXUkZEbnNUaGcybDFtOFU0MEdnbXZGdkhuVEZtclRw?=
 =?utf-8?B?RGtXOXdRU0RVdkZPQ004VXUyT1ByM245ZmRxUFJybEtwYWtzV2RxTUhGd1d0?=
 =?utf-8?B?K2Vxd1VwVlB2Z1poZFhBdEhPa1lJdGplSmMwRXptdW1TRDdTd0Q0czRYRXkr?=
 =?utf-8?B?d0xyWDJVcm5PdUJ1SGVuWkM1cU0zTGgxc25nNWtrNFRpS1lpZnFlSjViVXEy?=
 =?utf-8?B?d3NCTUNJbW9lZzNUVnloMURhckpmQ3VoWDk1d093REVKWElKTWQ5R3JLdkY1?=
 =?utf-8?B?K214Z0JiRzhkc3Q4ekVyeStVU0IwQjREZ1BxUkJVQlh0OHFESFM3cnBJUVNq?=
 =?utf-8?B?R1Jwc2ZiT1F0ZE1kYWtqaUdKcGtKNjl6V0xsNXR2NzhsNmFNelI2MVdNSTdX?=
 =?utf-8?B?aVFkNW5FeHQvZEtGVTdsQUFPY2JRV2IwZnhIN3Q0djY2ZXMyd3FWd2JCaFAx?=
 =?utf-8?B?OWx5dkYxL252b3hGaFBwNHZVSGY5YXJGRkkxR01iNmVFVWhJWEx6UXIrVTZ3?=
 =?utf-8?B?MXBpWWcwV1IrTnY2VkFmd3ZuOXNHb2VoNzVidDQ2a0JIZFV4SURsbnhCWEVF?=
 =?utf-8?B?Z3lHbE1saWdoNWh2Z3poTzNVNDllaytiMUI0WTBRM0FLdWZKcFhSRCtpSmxB?=
 =?utf-8?B?dnlCSE1yQXNxZ2x6RlpFVzRYMlZoUHJ6czRQZG04RHByWVFuN3JUdDFneVpQ?=
 =?utf-8?B?VGtqL3R6dG9MZ0VpMUZPMTJaQWZOMm5UWXFLZXNaVHhiOTRtZXk0RHhmTGd5?=
 =?utf-8?B?SnFNM0E0dlR6eWhqK3VrLy9IM2wwTmRsc2VZcEdkYklrdWVxaGNscDJhRWZI?=
 =?utf-8?B?NHhvZDdIY2FUb3hLWDJSYURMM1QzejEwRWNaS0ZmV2syU3VLNE9UOEJWMjR1?=
 =?utf-8?B?OWdSZE9OYkhtdUZ2YXZtMjFiRytodVpMME9NVTMrWnFWcHBLUVB0WkNaUFdY?=
 =?utf-8?B?ZFpjSXdoWUd1Yll3cVVsR2p5L0VsVVhxTU1uUGxzeWxIbDFXR3lhb3pQOUhw?=
 =?utf-8?B?ZHo2L1pIdG8rYUNBOW5vZVJaLzhkNmFMODZWYW5mb1BYMHBNb1RGR1VIb2x2?=
 =?utf-8?B?YTdUT0RmSHdjZnJTekFHZkpYVEQwNU50RUFJc212SEYzUXBhTEZyOEhSV0VV?=
 =?utf-8?B?WmErRmlxZ3RvZTgxRDZCZnhublhhZUtEV0xkU0ZaOGsrcHl3bGxCU2V4NTVJ?=
 =?utf-8?B?TmNyNTJ6RVJHM1ZsQlRRdncvV1BpREs2SnJrTHhjZmlGWC90RENZQ0lDWllj?=
 =?utf-8?B?QzR3TXF4d0NIeWhxR1MxaHVMTkhBbGFmOFo1R3RTb205YklaRHNyN2hEVDUx?=
 =?utf-8?B?eUxXQ0NFQ1JNblQ4UG56MEhRL3U5T01zaExNZENHbU9wWFJKWTB3dUZ5WHVS?=
 =?utf-8?B?ajRjWUhqMlhWS3FpT0YyYVVSVm5lQXV2TDhtYmF4ZWl1ZWQ0WWdUdFNYRGJK?=
 =?utf-8?B?ZGVRWUdYS2hiYjVYeGhYSW9GQ0gyVHVpOEZvMURBUkRtQVcyVVRCQUhrU3p2?=
 =?utf-8?B?VjhDRk5xMUhHUnROTGExVS9kZDUyMDF4eXA0QUJ6OTVLU29xNHVTSUZYYUFO?=
 =?utf-8?B?RDVSZjhpL2hiK3F1ajIvQ2lBRU01RWR0dWsvZ1V6ckdtNVF1QWI3QVhhdXhs?=
 =?utf-8?B?Nzk2MjRWQmtNY3M1aE90OEtrOVVnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B01274A047DE694A9584E44E5C500DE1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6801bf4d-5f64-428a-c28e-08d9aa634f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 07:16:16.1175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 005kmrTYXDrzKfx5sjv5oSM0FY36Grw3+zpT5E9ijvwi5DPVO+tMCQipbZjJkQAIZ69civIKIlcRcktxkLSmve/MCDpN/TI3OPI6+BLNpps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1444
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTEvMTcvMjEgMTE6MDMgUE0sIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gSGkgRXVnZW4sDQo+
IA0KPiBPbiBXZWQsIE5vdiAxNywgMjAyMSBhdCAwNDo1Mjo0MFBNICswMDAwLCBFdWdlbi5Icmlz
dGV2QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAxMS8xNy8yMSA2OjExIFBNLCBTYWthcmkg
QWlsdXMgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4N
Cj4+PiBIaSBFdWdlbiwNCj4+Pg0KPj4+IE9uIFdlZCwgTm92IDE3LCAyMDIxIGF0IDA1OjQwOjA5
UE0gKzAyMDAsIEV1Z2VuIEhyaXN0ZXYgd3JvdGU6DQo+Pj4+IHBtX3J1bnRpbWVfcmVzdW1lX2Fu
ZF9nZXQgc2hvdWxkIGJlIGNhbGxlZCB3aGVuIHRoZSBzX2ZyYW1lX2ludGVydmFsDQo+Pj4+IGlz
IGNhbGxlZC4NCj4+Pj4NCj4+Pj4gVGhlIGRyaXZlciB3aWxsIHRyeSB0byBhY2Nlc3MgZGV2aWNl
IHJlZ2lzdGVycyB0byBjb25maWd1cmUgVk1BWCwgY29hcnNlDQo+Pj4+IHRpbWUgYW5kIGV4cG9z
dXJlLg0KPj4+Pg0KPj4+PiBDdXJyZW50bHkgaWYgdGhlIHJ1bnRpbWUgaXMgbm90IHJlc3VtZWQs
IHRoaXMgZmFpbHM6DQo+Pj4+ICAgICMgbWVkaWEtY3RsIC1kIC9kZXYvbWVkaWEwIC0tc2V0LXY0
bDIgJyJJTVgyNzQgMS0wMDFhIjowW2ZtdDpTUkdHQjEwXzFYMTAvMzg0MHgyDQo+Pj4+IDE2MEAx
LzEwXScNCj4+Pj4NCj4+Pj4gSU1YMjc0IDEtMDAxYTogaW14Mjc0X2Jpbm5pbmdfZ29vZG5lc3M6
IGFzayAzODQweDIxNjAsIHNpemUgMzg0MHgyMTYwLCBnb29kbmVzcyAwDQo+Pj4+IElNWDI3NCAx
LTAwMWE6IGlteDI3NF9iaW5uaW5nX2dvb2RuZXNzOiBhc2sgMzg0MHgyMTYwLCBzaXplIDE5MjB4
MTA4MCwgZ29vZG5lc3MgLTMwMDANCj4+Pj4gSU1YMjc0IDEtMDAxYTogaW14Mjc0X2Jpbm5pbmdf
Z29vZG5lc3M6IGFzayAzODQweDIxNjAsIHNpemUgMTI4MHg3MjAsIGdvb2RuZXNzIC00MDAwDQo+
Pj4+IElNWDI3NCAxLTAwMWE6IGlteDI3NF9iaW5uaW5nX2dvb2RuZXNzOiBhc2sgMzg0MHgyMTYw
LCBzaXplIDEyODB4NTQwLCBnb29kbmVzcyAtNDE4MA0KPj4+PiBJTVgyNzQgMS0wMDFhOiBfX2lt
eDI3NF9jaGFuZ2VfY29tcG9zZTogc2VsZWN0ZWQgMXgxIGJpbm5pbmcNCj4+Pj4gSU1YMjc0IDEt
MDAxYTogaW14Mjc0X3NldF9mcmFtZV9pbnRlcnZhbDogaW5wdXQgZnJhbWUgaW50ZXJ2YWwgPSAx
IC8gMTANCj4+Pj4gSU1YMjc0IDEtMDAxYTogaW14Mjc0X3JlYWRfbWJyZWcgOiBhZGRyIDB4MzAw
ZSwgdmFsPTB4MSAoMiBieXRlcykNCj4+Pj4gSU1YMjc0IDEtMDAxYTogaW14Mjc0X3NldF9mcmFt
ZV9pbnRlcnZhbCA6IHJlZ2lzdGVyIFNWUiA9IDENCj4+Pj4gSU1YMjc0IDEtMDAxYTogaW14Mjc0
X3JlYWRfbWJyZWcgOiBhZGRyIDB4MzBmNiwgdmFsPTB4NmE4ICgyIGJ5dGVzKQ0KPj4+PiBJTVgy
NzQgMS0wMDFhOiBpbXgyNzRfc2V0X2ZyYW1lX2ludGVydmFsIDogcmVnaXN0ZXIgSE1BWCA9IDE3
MDQNCj4+Pj4gSU1YMjc0IDEtMDAxYTogaW14Mjc0X3NldF9mcmFtZV9sZW5ndGggOiBpbnB1dCBs
ZW5ndGggPSAyMTEyDQo+Pj4+IElNWDI3NCAxLTAwMWE6IGlteDI3NF93cml0ZV9tYnJlZyA6IGky
YyBidWxrIHdyaXRlIGZhaWxlZCwgMzBmOCA9IDg4NCAoMyBieXRlcykNCj4+Pj4gSU1YMjc0IDEt
MDAxYTogaW14Mjc0X3NldF9mcmFtZV9sZW5ndGggZXJyb3IgPSAtMTIxDQo+Pj4+IElNWDI3NCAx
LTAwMWE6IGlteDI3NF9zZXRfZnJhbWVfaW50ZXJ2YWwgZXJyb3IgPSAtMTIxDQo+Pj4+IFVuYWJs
ZSB0byBzZXR1cCBmb3JtYXRzOiBSZW1vdGUgSS9PIGVycm9yICgxMjEpDQo+Pj4+DQo+Pj4+IFRo
ZSBkZXZpY2UgaXMgbm90IHJlc3VtZWQgdGh1cyB0aGUgcmVtb3RlIEkvTyBlcnJvci4NCj4+Pj4N
Cj4+Pj4gU2V0dGluZyB0aGUgZnJhbWUgaW50ZXJ2YWwgd29ya3MgYXQgc3RyZWFtaW5nIHRpbWUs
IGJlY2F1c2UNCj4+Pj4gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCBpcyBjYWxsZWQgYXQgc19z
dHJlYW0gdGltZSBiZWZvcmUgc2Vuc29yIHNldHVwLg0KPj4+PiBUaGUgZmFpbHVyZSBoYXBwZW5z
IHdoZW4gb25seSB0aGUgc19mcmFtZV9pbnRlcnZhbCBpcyBjYWxsZWQgc2VwYXJhdGVseQ0KPj4+
PiBpbmRlcGVuZGVudGx5IG9uIHN0cmVhbWluZyB0aW1lLg0KPj4+Pg0KPj4+PiBGaXhlczogYWQ5
N2JjMzc0MjZjICgibWVkaWE6IGkyYzogaW14Mjc0OiBBZGQgSU1YMjc0IHBvd2VyIG9uIGFuZCBv
ZmYgc2VxdWVuY2UiDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhy
aXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICAgIGRyaXZlcnMvbWVkaWEvaTJj
L2lteDI3NC5jIHwgNSArKysrKw0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9pbXgyNzQuYyBi
L2RyaXZlcnMvbWVkaWEvaTJjL2lteDI3NC5jDQo+Pj4+IGluZGV4IGU4OWVmMzVhNzFjNS4uNmU2
M2ZkY2M1ZTQ2IDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9pbXgyNzQuYw0K
Pj4+PiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9pbXgyNzQuYw0KPj4+PiBAQCAtMTQyMCw2ICsx
NDIwLDEwIEBAIHN0YXRpYyBpbnQgaW14Mjc0X3NfZnJhbWVfaW50ZXJ2YWwoc3RydWN0IHY0bDJf
c3ViZGV2ICpzZCwNCj4+Pj4gICAgICAgICBpbnQgbWluLCBtYXgsIGRlZjsNCj4+Pj4gICAgICAg
ICBpbnQgcmV0Ow0KPj4+Pg0KPj4+PiArICAgICByZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRf
Z2V0KCZpbXgyNzQtPmNsaWVudC0+ZGV2KTsNCj4+Pj4gKyAgICAgaWYgKHJldCA8IDApDQo+Pj4+
ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+Pj4gKw0KPj4+PiAgICAgICAgIG11dGV4X2xv
Y2soJmlteDI3NC0+bG9jayk7DQo+Pj4+ICAgICAgICAgcmV0ID0gaW14Mjc0X3NldF9mcmFtZV9p
bnRlcnZhbChpbXgyNzQsIGZpLT5pbnRlcnZhbCk7DQo+Pj4+DQo+Pj4+IEBAIC0xNDUxLDYgKzE0
NTUsNyBAQCBzdGF0aWMgaW50IGlteDI3NF9zX2ZyYW1lX2ludGVydmFsKHN0cnVjdCB2NGwyX3N1
YmRldiAqc2QsDQo+Pj4+DQo+Pj4+ICAgIHVubG9jazoNCj4+Pj4gICAgICAgICBtdXRleF91bmxv
Y2soJmlteDI3NC0+bG9jayk7DQo+Pj4+ICsgICAgIHBtX3J1bnRpbWVfcHV0KCZpbXgyNzQtPmNs
aWVudC0+ZGV2KTsNCj4+Pj4NCj4+Pj4gICAgICAgICByZXR1cm4gcmV0Ow0KPj4+PiAgICB9DQo+
Pj4NCj4+PiBJZiB0aGUgZGV2aWNlIGlzIHBvd2VyZWQgb2ZmIGluIHRoZSBlbmQsIGNvdWxkIHlv
dSBpbnN0ZWFkIG5vdCBwb3dlciBpdCBvbg0KPj4+IGluIHRoZSBmaXJzdCBwbGFjZT8gSS5lLiBz
ZWUgaG93IHRoaXMgd29ya3MgZm9yIHRoZSBzX2N0cmwoKSBjYWxsYmFjay4NCj4+DQo+Pg0KPj4g
SGkgU2FrYXJpLA0KPj4NCj4+IEkgdHJpZWQgdGhpcyBpbml0aWFsbHksIGFzIGluIHNfY3RybCwN
Cj4+DQo+PiAgICAgICAgICAgaWYgKCFwbV9ydW50aW1lX2dldF9pZl9pbl91c2UoJmlteDI3NC0+
Y2xpZW50LT5kZXYpKQ0KPj4NCj4+ICAgICAgICAgICAgICAgICAgIHJldHVybiAwOw0KPj4NCj4+
DQo+PiBIb3dldmVyLCBpZiB0aGUgZGV2aWNlIGlzIHBvd2VyZWQgb2ZmLCB0aGUgc19mcmFtZV9p
bnRlcnZhbCBkb2VzIG5vdCBkbw0KPj4gYW55dGhpbmcgKHJldHVybiAwKSwgYW5kIHRoZSBmcmFt
ZSBpbnRlcnZhbCBpcyBub3QgY2hhbmdlZC4gTm90IGV2ZW4gdGhlDQo+PiBpbnRlcm5hbCBzdHJ1
Y3R1cmUgZnJhbWVfaW50ZXJ2YWwgaXMgdXBkYXRlZCAoYXMgdGhpcyBpcyB1cGRhdGVkIGFmdGVy
DQo+PiBjb25maWd1cmluZyB0aGUgYWN0dWFsIGRldmljZSkuDQo+PiBBbmQgaW4gY29uc2VxdWVu
Y2UgbWVkaWEtY3RsIC1wIHdpbGwgc3RpbGwgcHJpbnQgdGhlIG9sZCBmcmFtZSBpbnRlcnZhbC4N
Cj4+DQo+PiBTbyBlaXRoZXIgd2UgcG93ZXIgb24gdGhlIGRldmljZSB0byBzZXQgZXZlcnl0aGlu
Zywgb3IsIHRoaW5ncyBoYXZlIHRvDQo+PiBiZSBzZXQgaW4gdGhlIHNvZnR3YXJlIHN0cnVjdCBh
bmQgd3JpdHRlbiBvbmNlIHN0cmVhbWluZyBzdGFydHMuDQo+PiBJIGFtIGluIGZhdm9yIG9mIHRo
ZSBmaXJzdCBvcHRpb24gKGhlbmNlIHRoZSBwYXRjaCksIHRvIGF2b2lkIGhhdmluZw0KPj4gY29u
ZmlndXJhdGlvbiB0aGF0IHdhcyByZXF1ZXN0ZWQgYnV0IG5vdCB3cml0dGVuIHRvIHRoZSBkZXZp
Y2UgaXRzZWxmLg0KPj4gVGhlIHNlY29uZCBvcHRpb24gd291bGQgcmVxdWlyZSBzb21lIHJld29y
ayB0byBtb3ZlIHRoZSBzb2Z0d2FyZSBwYXJ0DQo+PiBiZWZvcmUgdGhlIGhhcmR3YXJlIHBhcnQs
IGFuZCB0byBhc3N1bWUgdGhhdCB0aGUgaGFyZHdhcmUgcGFydCBuZXZlcg0KPj4gZmFpbHMgaW4g
Ym91bmRzIG9yIGJ5IG90aGVyIHJlYXNvbiAob3IgdGhlIHNvZnR3YXJlIHBhcnQgd291bGQgYmUg
bm8NCj4+IGxvbmdlciBjb25zaXN0ZW50KQ0KPj4NCj4+IFdoYXQgZG8geW91IHRoaW5rID8NCj4g
DQo+IFNlZW1zIHJlYXNvbmFibGUsIGJ1dCB0aGUgZHJpdmVyIGlzIGhhcmRseSBkb2luZyB0aGlz
IGluIGFuIGV4ZW1wbGFyeSB3YXkuDQo+IFN0aWxsIHRoZSByZXdvcmsgbWlnaHQgbm90IHdvcnRo
IHRoZSBzbWFsbCBnYWluLiBJJ2xsIHRha2UgdGhpcyBvbmUgdGhlbi4NCg0KDQpPa2F5LCB0aGFu
ayB5b3UuDQpJIG5vdGljZWQgdGhhdCB0aGUgZml4ZXMgdGFnIGluIHRoZSBjb21taXQgbWVzc2Fn
ZSBtaXNzZXMgdGhlIGxhc3QgDQpjbG9zaW5nIGJyYWNrZXQgJyknIC4gTWlnaHQgYnJlYWsgYXV0
b21hdGVkIGNoZWNrZXJzIGFuZCBzaG91dCBvdXQgYSANCndhcm5pbmcuIE1heWJlIGl0J3MgcG9z
c2libGUgdG8gYW1lbmQgaXQgPw0KDQpUaGFua3MgYWdhaW4sDQpFdWdlbg0KDQo+IA0KPiAtLQ0K
PiBLaW5kIHJlZ2FyZHMsDQo+IA0KPiBTYWthcmkgQWlsdXMNCj4gDQoNCg==
