Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2EA93A27AE
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 11:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhFJJGL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 05:06:11 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:54283 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhFJJGK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 05:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1623315854; x=1654851854;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rM7oXFMFwhJs0VGqdkXiV+MGAT1Jc7Z/xbOwBOWHPTg=;
  b=LxAqXEduNjwu4uuDHOE3M5iiNSDl9NvzyoFC4Nl8h1q0gQZ4JMU/k8Aa
   ozsNhW7exaR3x6r2YhoGUt/dlUCYjDHD0uKG5aJUfMZ0RpLWD8JjEugGN
   luK9jJIhxOnqSafUoRuSLpKPOBDcRPVsdKNvodwGIdGdRVWNnVGvxqpa4
   Gj+ga6mqOd2c6kyiOnvar6JPjfZ50TLKwI8agNgO185OyyhBlpbBNAKHK
   8aaiFF9tKEUi0SeMHGcnT4BYJRC67hEyiQihb4juaq7KhrAMqDyNSNB2o
   4H87IXB2p/azV8mkVYaZ3nMorBppYCwZAqjWYgtQ9tV32HWR0MpgP5gNO
   g==;
IronPort-SDR: NkzmMN0NN6C1z39KpZoYVBB7l/6uJG9UrYuE6xky6VzyJdxicdoY5fe50Kh73mjh9uv5DXF8dq
 8Tkik4peBi/OjV0PMtEVYlcgSFVoKyW3Ao6Q5hXOWZSbQ/UOkDBuXdwcyg5fjK62t8oTupO6Zs
 tXDsb1sO9aeC7N5PAmvWJmv3hpXCoHiH8lOFgE2ZWx5ZuG/YRStfTfQtE4evjymUtQNFF/U+5N
 7HI3M1ceJi6qXLy8nXt3lM28gyLqzq4NNmv4S5SBMYPHijCyMELybw/otTfA88y8muFFjaT3Q/
 4KY=
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="124776339"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jun 2021 02:04:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 10 Jun 2021 02:04:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Thu, 10 Jun 2021 02:04:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwJ2bTU40cIyBDh88z1n+Cucnkdfhlv38SPL/IwM7itKl+RzsWtpXgCt2HdPzK19UFZtiZGMjDuLlt/Kr5DKhE5w4Qc1BqdIwpRVmqxIwHczurqV2Dd2YtC8HpeFgo9Rh7gLXb6BmTtjlU8buSIV1nbwP3ppBM2rlSF1zzOxO7LKI0HXCLCJNhPw4c9mqvMQMG0+pNaKntRCqZxWDZAELddirS2xGBALBPvYE80GWkBRePVM0PmUBsdZmyx3vtR2dRF7e9yNi9waV/GPISIfTDWG3BPQTz+OoGQg/Pn+bMuzuHFbQodAsWIRaLu3czeooOCy6xz8upLABV2HV1BJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rM7oXFMFwhJs0VGqdkXiV+MGAT1Jc7Z/xbOwBOWHPTg=;
 b=DAYtou20oWFIiyNUaBNG7R8TDm2NmaYKz+nzbG5jCRioeMCR8oCgX3H8PnSk3QQWPKDF9JYtitlZ1RMqcQEmw70tJ3FbDCqVfna7zTJdo0TsJCORk3YrZNaCEdSxUoyzSo9MFgReSWzpAHV0ONGZ8vd9TneQzyqyAw33dZRJf37ETHqJlnbT/sGryXsylrL5ZjT/ZgrlTMuU5Nh8ORJnNmSpp3Mreyow445uwEiE/C5HUnYvkwRNIH3cNYlrjoBvFs8WoYDPUvD9lc7B7DZx94EQ7ruTGJCNnNIIT+IxPdtwT15VJ03+siKV9HVemp+tJ2zn+VGOToVgpsms72yzgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rM7oXFMFwhJs0VGqdkXiV+MGAT1Jc7Z/xbOwBOWHPTg=;
 b=Yj3jMdP1scQYeFk3Q0hRwC2AwhyVQdv7oMYWLoYZleXg7zH6cgqY/CQ8h4qwjFPA/H8D/CxKMNrQQDhenyp6W1FuH6P09p9vWwadEoTunzPvns6dcVgAl2Gt74uFzMmuh5+w2toMl1NXgpaWYPGq/QoYiX9PiS1r62GNOFGOcdg=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN7PR11MB2737.namprd11.prod.outlook.com (2603:10b6:406:b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 09:04:07 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::1de9:8da4:2f63:fc9d]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::1de9:8da4:2f63:fc9d%4]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 09:04:07 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <Jonathan.Cameron@Huawei.com>, <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
        <mchehab@kernel.org>, <Nicolas.Ferre@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 08/25] media: atmel: properly get pm_runtime
Thread-Topic: [PATCH 08/25] media: atmel: properly get pm_runtime
Thread-Index: AQHXQZL+MGs0ijyAgUSZwiGLPkSbCarUy5mAgDhgXQA=
Date:   Thu, 10 Jun 2021 09:04:07 +0000
Message-ID: <cd524923-93f0-e15c-816f-595a80184206@microchip.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
 <975645970144b6c8401ab9bd1243619978a868a9.1620207353.git.mchehab+huawei@kernel.org>
 <20210505130835.000006b7@Huawei.com>
In-Reply-To: <20210505130835.000006b7@Huawei.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: Huawei.com; dkim=none (message not signed)
 header.d=none;Huawei.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [188.25.124.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9579b883-fbf5-45f7-44d2-08d92beeb40b
x-ms-traffictypediagnostic: BN7PR11MB2737:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR11MB2737D37B07E84FDE5A6F7646E8359@BN7PR11MB2737.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /b/dvO23WwgPOQhux8Jbmbat50jvY7LyyU1s9pAIS8/9EHnVu/ohPpirL8TxJJzXQpzBwk6FBS+Zu6QwF103/S0HG+x9yC5cj9YYhSUIAbl1yIxBE3Ho67ixDtpdqJp49QOdrecKsx261Eq/Nhggf9vlU9bhzv6ysRtCVih6WwfkR0CK5O7UFPL9fYwReTaCXnoJTvDOPG5n4lNLB8hZe7XQBKSVIG0hGjJp4w+rfmo5JCXqhQDdhtBE43DAHNKGDqIfLLoagdxtDs+8Hynx9rCH2KCldUzfN+Ci0RF0zp3W0XU0cU6JskIHjgc9taMqL6N3ps34foxjeztoNVQeLOCmxazJguinqUkym7rmMZIX7ocl1igkGHkkcLimfLBi953qzr9t/LoM5hneF9C6K4LFXXHpkunpVIflfRUbiSapZhofihIccyZU1nmT8fygRkjFA1FiM0PxFkXkS5Kjm250nNL1UtBIcJbRH/0B5+ugHEED99o2piL9WAVQCNsumOh+NeX0swRWCRxtn/X0O1v1zaghuUMcPI6IyPPwIL+Rm3N5TFUCPuQWMoXCqB2T+XB5rBVsxpoxPmu0frKMZSF6DLM+USYWqFiWUDx8C+bCRGYJMgC4hUKop5jNHZZ6RqsZq4hvrw6fN9rTUluvTuQXLmCUEVfJ2l/txNr9oJtG/uJ5MEoUKA3/sGQTniVT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(39860400002)(376002)(396003)(478600001)(8676002)(2906002)(71200400001)(110136005)(316002)(54906003)(107886003)(76116006)(8936002)(91956017)(186003)(31696002)(26005)(66446008)(2616005)(66946007)(53546011)(5660300002)(66556008)(6506007)(64756008)(66476007)(6486002)(86362001)(36756003)(6512007)(122000001)(31686004)(4326008)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXVNUGVwb3dBRXFTWTM3S0k2MjNRSUtzT2xxREdoOURmcm91WUVoTXJybG05?=
 =?utf-8?B?d3plcThrbUx0YjduWWxadndZSEMxODJ3YllzT2U0cGhGbUZCZFQ1ejhsTmU4?=
 =?utf-8?B?K05UbmVmcGQ4NHdIMVBwcml1NnRjMmxqdnI0Wnh2aXlqcXltbHh4OUZ1b3Jq?=
 =?utf-8?B?TkNPNWhYeUU2Z0gwSDlINEtRSkd4V3JueUZUVlkxbWZ3YmhiMXlRYktGYVV3?=
 =?utf-8?B?VGc3RG8yUnI5ZWNwVVFFeE4vMlBPTi9wT0xrbTJhSDB0eTlFeGhjczd4RWxp?=
 =?utf-8?B?V25vRHB3MGw1S0Fja2JWa0M3TWUyVnpMS2NpMHVGRWZVdDBOMU90cTV6M25H?=
 =?utf-8?B?OW5TenJTelduM3B3VDVwYk5hUFlQRU91ZHd4U2VNVUttd052Q2hiN3NlYVV4?=
 =?utf-8?B?UUhrRGxHRGthcFBXNTBNbjF1elZCNkE1QjlFQlBtMThwT05GZmFyRE90STcy?=
 =?utf-8?B?RlFCNFQybzIwQVlBeDh5YWVqeVlScTFQTkdZVWRQaExhWWpHTDFiWjE5bTlz?=
 =?utf-8?B?czVZTzhkU3FvZVNCYVE0SjJkNnVxcFNMQXpGcEJQM0R0T1ppb0RuRmJzam5H?=
 =?utf-8?B?d29YYm5RUTdqSTNyWnJlcmN3ek9obUs0YjBJeUd5RjFLV3dTOTV3WDAreUFS?=
 =?utf-8?B?aVpXY2pmS3c3RjJLeXdBM1N5UUFzblBmVXBuWG5NUEpWbS9tK21kS1ArMXpX?=
 =?utf-8?B?dHVvVktWWDE2VHhKeVplYm1TeEVwbDdnMVBtNytCVHYxNDVrNnRvSlRXTDdh?=
 =?utf-8?B?bE9mS0NHSHY4OXZTUURPcDFrV0drRThZTHZXaG9lYWg2SW5BdjdMOXBmZVN4?=
 =?utf-8?B?TXpxVnpWUVhjbEpDSmtZMjJLUjNkSkJQd0k5aTFJNXVvOWVDQ2FzWHh2amww?=
 =?utf-8?B?MWpLRzlVQkJWb241b2g2NUxSVVc2c2pkeFdHdnl3SUJZSExWZVRZNEFVQ0xJ?=
 =?utf-8?B?U1B2UktPL1pZaGp6MWpyZ0FIYXlXb1FHUXoxc3p6aGNUR1I5YkcrMm8rUkx1?=
 =?utf-8?B?NXdTRGNQVGg3TTFSd1h3Qk5VVGpZY1RQM3dlb3RMaEpNQzMxTVdJMS85RlBT?=
 =?utf-8?B?WjB2MzJxVjZReXdjak1SbHRCbEgwcXN4VnVMZVFQRGtJRnB0SDdzTXNWaUs5?=
 =?utf-8?B?a1huNnN6ZXJ0ZmVDWnlLa2hTTm9XWDM2YUE4ZUFQVENRc1lrcWJpMkZwWVR2?=
 =?utf-8?B?TFJzM3Fjc2tSbTNMcThhZm53cUlDRWdkYlZwc0xnT2QweWgzTVV0dXZxeG0r?=
 =?utf-8?B?anlIOUFPMGN6bk8vOVJwTEYxSnJDaHdHOHA0N3EzWG56SjUxbDFqc25HS1Q2?=
 =?utf-8?B?Yno5VFcrVzNROXV0aENUOVhJVEdBc2FrTjRIK1RhRXBLYnRla1RFM2ROcEVw?=
 =?utf-8?B?Y0NXV1dvYVRnM00xOGM0M1hzR3grdGlaUFpiWm9iTWwzUEdwWUt0dFVKRkZ1?=
 =?utf-8?B?cGhzUnJETVdNbUFqSzdUS1Bjc3o1OTJwWCsvREpQR0VXNlZ0WjBrcDN1UzBk?=
 =?utf-8?B?SFpiUzZCc25VUnRDdzBCTFdXV1dzUFZFMVkzNkVNZ1FESEx3Qm84ODhOQ09S?=
 =?utf-8?B?RXJTYkxNUFlTYmlkMnhHWVJrOVpxUkZwMDF5elhNRjlpQUVaV1VtWGs0ZEdI?=
 =?utf-8?B?L2VKQitSSHFsSWRINkNjM2UzSjJUY21xcE5lUGFnVkw1a29rTlFMN1FWdUl4?=
 =?utf-8?B?VjVxNG96YUpjYTZnelJUSG5sb0xwZ1BKc1B1Y1BraTFDS0ZXNHp3eWdXajU5?=
 =?utf-8?Q?yvbrDMSNyHCzlp7Bes=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBFEE77C75AB5B48B2CBE4AFFBC0744E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9579b883-fbf5-45f7-44d2-08d92beeb40b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 09:04:07.1249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OisXy+pu2h8poUiHk3mNbTaXzFuuxBjf1s6gUrGYp6Tl24KfqftKAqVzfEu9LFno5GYaH65E9jG9M4VQU8f8C0+AyePuAIrDLYSlz+H/p+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2737
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gNS81LzIxIDM6MDggUE0sIEpvbmF0aGFuIENhbWVyb24gd3JvdGU6DQo+IE9uIFdlZCwgNSBN
YXkgMjAyMSAxMTo0MTo1OCArMDIwMA0KPiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIr
aHVhd2VpQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4+IFRoZXJlIGFyZSBzZXZlcmFsIGlzc3Vl
cyBpbiB0aGUgd2F5IHRoZSBhdG1lbCBkcml2ZXIgaGFuZGxlcw0KPj4gcG1fcnVudGltZV9nZXRf
c3luYygpOg0KPj4NCj4+IC0gaXQgZG9lc24ndCBjaGVjayByZXR1cm4gY29kZXM7DQo+PiAtIGl0
IGRvZXNuJ3QgcHJvcGVybHkgZGVjcmVtZW50IHRoZSB1c2FnZV9jb3VudCBvbiBhbGwgcGxhY2Vz
Ow0KPj4gLSBpdCBzdGFydHMgc3RyZWFtaW5nIGV2ZW4gaWYgcG1fcnVudGltZV9nZXRfc3luYygp
IGZhaWxzLg0KPj4gLSB3aGlsZSBpdCB0cmllcyB0byBnZXQgcG1fcnVudGltZSBhdCB0aGUgY2xv
Y2sgZW5hYmxlIGxvZ2ljLA0KPj4gICAgaXQgZG9lc24ndCBjaGVjayBpZiB0aGUgb3BlcmF0aW9u
IHdhcyBzdWNlZWRlZC4NCj4+DQo+PiBSZXBsYWNlIGFsbCBvY2N1cnJlbmNlcyBvZiBpdCB0byB1
c2UgdGhlIG5ldyBrQVBJOg0KPj4gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpLCB3aGljaCBl
bnN1cmVzIHRoYXQsIGlmIHRoZQ0KPj4gcmV0dXJuIGNvZGUgaXMgbm90IG5lZ2F0aXZlLCB0aGUg
dXNhZ2VfY291bnQgd2FzIGluY3JlbWVudGVkLg0KPj4NCj4+IFdpdGggdGhhdCwgYWRkIGFkZGl0
aW9uYWwgY2hlY2tzIHdoZW4gdGhpcyBpcyBjYWxsZWQsIGluIG9yZGVyDQo+PiB0byBlbnN1cmUg
dGhhdCBlcnJvcnMgd2lsbCBiZSBwcm9wZXJseSBhZGRyZXNzZWQuDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK2h1YXdlaUBrZXJuZWwub3JnPg0K
PiANCj4gSGkgTWF1cm8sIEkgZG9uJ3Qga25vdyBtZWRpYSBlbm91Z2ggdG8ga25vdyB3aGF0IGlz
IHRoZSByaWdodCBhbnN3ZXINCj4gYnV0IGluIHNvbWUgb2YgdGhpcyBzZXJpZXMsIGEgZmFpbHVy
ZSBpbg0KPiBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgbGVhZHMgdG8gYSBidW5jaCBvZiBi
dWZmZXIgY2xlYW51cA0KPiAocGF0Y2ggMjIgYmVpbmcgYW4gZXhhbXBsZSkgYW5kIGluIG90aGVy
cyByZXR1cm4gaGFwcGVucyB3aXRob3V0IGRvaW5nDQo+IHRoYXQgY2xlYW51cC4NCj4gDQo+IEl0
IG1pZ2h0IGJlIGJvdGggYXJlIHNhZmUsIG9yIEknbSBtaXNzaW5nIHNvbWV0aGluZyBlbHNlLCBi
dXQgSSdtDQo+IGNlcnRhaW5seSBub3QgY29uZmlkZW50IGVub3VnaCB0byBnaXZlIGFueSB0YWdz
IG9uIHRoaXMgb25lIGFzIGEgcmVzdWx0DQo+IG9mIHRoYXQgbWlzbWF0Y2guDQo+IA0KPj4gLS0t
DQo+PiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNjLWJhc2UuYyB8IDMw
ICsrKysrKysrKysrKysrLS0tLS0NCj4+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9h
dG1lbC1pc2kuYyAgICAgIHwgMTkgKysrKysrKysrLS0tDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwg
MzggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNjLWJhc2UuYyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNjLWJhc2UuYw0KPj4gaW5kZXggZmUzZWM4ZDBlYWVl
Li5jZThlMTM1MWZhNTMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0
bWVsL2F0bWVsLWlzYy1iYXNlLmMNCj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRt
ZWwvYXRtZWwtaXNjLWJhc2UuYw0KPj4gQEAgLTI5NCw5ICsyOTQsMTMgQEAgc3RhdGljIGludCBp
c2Nfd2FpdF9jbGtfc3RhYmxlKHN0cnVjdCBjbGtfaHcgKmh3KQ0KPj4gICBzdGF0aWMgaW50IGlz
Y19jbGtfcHJlcGFyZShzdHJ1Y3QgY2xrX2h3ICpodykNCj4+ICAgew0KPj4gICAgICAgIHN0cnVj
dCBpc2NfY2xrICppc2NfY2xrID0gdG9faXNjX2Nsayhodyk7DQo+PiArICAgICBpbnQgcmV0Ow0K
Pj4NCj4+IC0gICAgIGlmIChpc2NfY2xrLT5pZCA9PSBJU0NfSVNQQ0spDQo+PiAtICAgICAgICAg
ICAgIHBtX3J1bnRpbWVfZ2V0X3N5bmMoaXNjX2Nsay0+ZGV2KTsNCj4+ICsgICAgIGlmIChpc2Nf
Y2xrLT5pZCA9PSBJU0NfSVNQQ0spIHsNCj4+ICsgICAgICAgICAgICAgcmV0ID0gcG1fcnVudGlt
ZV9yZXN1bWVfYW5kX2dldChpc2NfY2xrLT5kZXYpOw0KPj4gKyAgICAgICAgICAgICBpZiAocmV0
IDwgMCkNCj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4gKyAgICAgfQ0K
DQpIaSBNYXVybywNCg0KV2l0aCB0aGlzIHBhdGNoLCB0aGUgSVNDIGlzIGJyb2tlbiBvbiBsYXRl
c3QgbWVkaWEgdHJlZS4gSXQgbG9va3MgbGlrZSANCnBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQg
Zm9yIHRoZSBJU0NfSVNQQ0sgY2xvY2sgcmV0dXJucyAtRU5PQUNDRVNTIGFuZCANCnRodXMsIHRo
ZSBwcm9iZSBvZiB0aGUgZHJpdmVyIGZhaWxzOg0KDQphdG1lbC1zYW1hNWQyLWlzYyBmMDAwODAw
MC5pc2M6IGZhaWxlZCB0byBlbmFibGUgaXNwY2s6IC0xMw0KYXRtZWwtc2FtYTVkMi1pc2M6IHBy
b2JlIG9mIGYwMDA4MDAwLmlzYyBmYWlsZWQgd2l0aCBlcnJvciAtMTMNCg0KDQpDb3VsZCB5b3Ug
cG9pbnQgb3V0IGhvdyBJIGNvdWxkIGZpeCB0aGlzID8gTWF5YmUgdGhlIGlzY19jbGstPmRldiBp
cyBub3QgDQpwcm9wZXJseSBoYW5kbGVkL2luaXRpYWxpemVkIGluIHNvbWUgb3RoZXIgcGFydCBv
ZiB0aGUgY29kZSA/DQoNClRoYW5rcyAhDQpFdWdlbg0KDQoNCj4+DQo+PiAgICAgICAgcmV0dXJu
IGlzY193YWl0X2Nsa19zdGFibGUoaHcpOw0KPj4gICB9DQo+PiBAQCAtMzUzLDkgKzM1NywxMyBA
QCBzdGF0aWMgaW50IGlzY19jbGtfaXNfZW5hYmxlZChzdHJ1Y3QgY2xrX2h3ICpodykNCj4+ICAg
ew0KPj4gICAgICAgIHN0cnVjdCBpc2NfY2xrICppc2NfY2xrID0gdG9faXNjX2Nsayhodyk7DQo+
PiAgICAgICAgdTMyIHN0YXR1czsNCj4+ICsgICAgIGludCByZXQ7DQo+Pg0KPj4gLSAgICAgaWYg
KGlzY19jbGstPmlkID09IElTQ19JU1BDSykNCj4+IC0gICAgICAgICAgICAgcG1fcnVudGltZV9n
ZXRfc3luYyhpc2NfY2xrLT5kZXYpOw0KPj4gKyAgICAgaWYgKGlzY19jbGstPmlkID09IElTQ19J
U1BDSykgew0KPj4gKyAgICAgICAgICAgICByZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0
KGlzY19jbGstPmRldik7DQo+PiArICAgICAgICAgICAgIGlmIChyZXQgPCAwKQ0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAwOw0KPj4gKyAgICAgfQ0KPj4NCj4+ICAgICAgICByZWdt
YXBfcmVhZChpc2NfY2xrLT5yZWdtYXAsIElTQ19DTEtTUiwgJnN0YXR1cyk7DQo+Pg0KPj4gQEAg
LTgwNyw3ICs4MTUsMTIgQEAgc3RhdGljIGludCBpc2Nfc3RhcnRfc3RyZWFtaW5nKHN0cnVjdCB2
YjJfcXVldWUgKnZxLCB1bnNpZ25lZCBpbnQgY291bnQpDQo+PiAgICAgICAgICAgICAgICBnb3Rv
IGVycl9zdGFydF9zdHJlYW07DQo+PiAgICAgICAgfQ0KPj4NCj4+IC0gICAgIHBtX3J1bnRpbWVf
Z2V0X3N5bmMoaXNjLT5kZXYpOw0KPj4gKyAgICAgcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5k
X2dldChpc2MtPmRldik7DQo+PiArICAgICBpZiAocmV0IDwgMCkgew0KPj4gKyAgICAgICAgICAg
ICB2NGwyX2VycigmaXNjLT52NGwyX2RldiwgIlJQTSByZXN1bWUgZmFpbGVkIGluIHN1YmRldiAl
ZFxuIiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgcmV0KTsNCj4+ICsgICAgICAgICAgICAg
Z290byBlcnJfcG1fZ2V0Ow0KPj4gKyAgICAgfQ0KPj4NCj4+ICAgICAgICByZXQgPSBpc2NfY29u
ZmlndXJlKGlzYyk7DQo+PiAgICAgICAgaWYgKHVubGlrZWx5KHJldCkpDQo+PiBAQCAtODM4LDcg
Kzg1MSw3IEBAIHN0YXRpYyBpbnQgaXNjX3N0YXJ0X3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVl
ICp2cSwgdW5zaWduZWQgaW50IGNvdW50KQ0KPj4NCj4+ICAgZXJyX2NvbmZpZ3VyZToNCj4+ICAg
ICAgICBwbV9ydW50aW1lX3B1dF9zeW5jKGlzYy0+ZGV2KTsNCj4+IC0NCj4+ICtlcnJfcG1fZ2V0
Og0KPj4gICAgICAgIHY0bDJfc3ViZGV2X2NhbGwoaXNjLT5jdXJyZW50X3N1YmRldi0+c2QsIHZp
ZGVvLCBzX3N0cmVhbSwgMCk7DQo+Pg0KPj4gICBlcnJfc3RhcnRfc3RyZWFtOg0KPj4gQEAgLTE4
MDksNiArMTgyMiw3IEBAIHN0YXRpYyB2b2lkIGlzY19hd2Jfd29yayhzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKncpDQo+PiAgICAgICAgdTMyIGJheXNlbDsNCj4+ICAgICAgICB1bnNpZ25lZCBsb25nIGZs
YWdzOw0KPj4gICAgICAgIHUzMiBtaW4sIG1heDsNCj4+ICsgICAgIGludCByZXQ7DQo+Pg0KPj4g
ICAgICAgIC8qIHN0cmVhbWluZyBpcyBub3QgYWN0aXZlIGFueW1vcmUgKi8NCj4+ICAgICAgICBp
ZiAoaXNjLT5zdG9wKQ0KPj4gQEAgLTE4MzEsNyArMTg0NSw5IEBAIHN0YXRpYyB2b2lkIGlzY19h
d2Jfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKncpDQo+PiAgICAgICAgY3RybHMtPmhpc3RfaWQg
PSBoaXN0X2lkOw0KPj4gICAgICAgIGJheXNlbCA9IGlzYy0+Y29uZmlnLnNkX2Zvcm1hdC0+Y2Zh
X2JheWNmZyA8PCBJU0NfSElTX0NGR19CQVlTRUxfU0hJRlQ7DQo+Pg0KPj4gLSAgICAgcG1fcnVu
dGltZV9nZXRfc3luYyhpc2MtPmRldik7DQo+PiArICAgICByZXQgPSBwbV9ydW50aW1lX3Jlc3Vt
ZV9hbmRfZ2V0KGlzYy0+ZGV2KTsNCj4+ICsgICAgIGlmIChyZXQgPCAwKQ0KPj4gKyAgICAgICAg
ICAgICByZXR1cm47DQo+Pg0KPj4gICAgICAgIC8qDQo+PiAgICAgICAgICogb25seSB1cGRhdGUg
aWYgd2UgaGF2ZSBhbGwgdGhlIHJlcXVpcmVkIGhpc3RvZ3JhbXMgYW5kIGNvbnRyb2xzDQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2kuYyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNpLmMNCj4+IGluZGV4IGUzOTJiM2Vm
ZTM2My4uNWIxZGQzNThmMmU2IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9hdG1lbC9hdG1lbC1pc2kuYw0KPj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1l
bC9hdG1lbC1pc2kuYw0KPj4gQEAgLTQyMiw3ICs0MjIsOSBAQCBzdGF0aWMgaW50IHN0YXJ0X3N0
cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICp2cSwgdW5zaWduZWQgaW50IGNvdW50KQ0KPj4gICAg
ICAgIHN0cnVjdCBmcmFtZV9idWZmZXIgKmJ1ZiwgKm5vZGU7DQo+PiAgICAgICAgaW50IHJldDsN
Cj4+DQo+PiAtICAgICBwbV9ydW50aW1lX2dldF9zeW5jKGlzaS0+ZGV2KTsNCj4+ICsgICAgIHJl
dCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoaXNpLT5kZXYpOw0KPj4gKyAgICAgaWYgKHJl
dCA8IDApDQo+PiArICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+IFRoaXMgaXMgdGhlIGNhc2Ug
SSdtIHJlZmVycmluZyB0byBhYm92ZS4NCj4gDQo+Pg0KPj4gICAgICAgIC8qIEVuYWJsZSBzdHJl
YW0gb24gdGhlIHN1YiBkZXZpY2UgKi8NCj4+ICAgICAgICByZXQgPSB2NGwyX3N1YmRldl9jYWxs
KGlzaS0+ZW50aXR5LnN1YmRldiwgdmlkZW8sIHNfc3RyZWFtLCAxKTsNCj4+IEBAIC03ODIsOSAr
Nzg0LDEwIEBAIHN0YXRpYyBpbnQgaXNpX2VudW1fZnJhbWVpbnRlcnZhbHMoc3RydWN0IGZpbGUg
KmZpbGUsIHZvaWQgKmZoLA0KPj4gICAgICAgIHJldHVybiAwOw0KPj4gICB9DQo+Pg0KPj4gLXN0
YXRpYyB2b2lkIGlzaV9jYW1lcmFfc2V0X2J1c19wYXJhbShzdHJ1Y3QgYXRtZWxfaXNpICppc2kp
DQo+PiArc3RhdGljIGludCBpc2lfY2FtZXJhX3NldF9idXNfcGFyYW0oc3RydWN0IGF0bWVsX2lz
aSAqaXNpKQ0KPj4gICB7DQo+PiAgICAgICAgdTMyIGNmZzEgPSAwOw0KPj4gKyAgICAgaW50IHJl
dDsNCj4+DQo+PiAgICAgICAgLyogc2V0IGJ1cyBwYXJhbSBmb3IgSVNJICovDQo+PiAgICAgICAg
aWYgKGlzaS0+cGRhdGEuaHN5bmNfYWN0X2xvdykNCj4+IEBAIC04MDEsMTIgKzgwNCwxNiBAQCBz
dGF0aWMgdm9pZCBpc2lfY2FtZXJhX3NldF9idXNfcGFyYW0oc3RydWN0IGF0bWVsX2lzaSAqaXNp
KQ0KPj4gICAgICAgIGNmZzEgfD0gSVNJX0NGRzFfVEhNQVNLX0JFQVRTXzE2Ow0KPj4NCj4+ICAg
ICAgICAvKiBFbmFibGUgUE0gYW5kIHBlcmlwaGVyYWwgY2xvY2sgYmVmb3JlIG9wZXJhdGUgaXNp
IHJlZ2lzdGVycyAqLw0KPj4gLSAgICAgcG1fcnVudGltZV9nZXRfc3luYyhpc2ktPmRldik7DQo+
PiArICAgICByZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGlzaS0+ZGV2KTsNCj4+ICsg
ICAgIGlmIChyZXQgPCAwKQ0KPj4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4NCj4+ICAg
ICAgICBpc2lfd3JpdGVsKGlzaSwgSVNJX0NUUkwsIElTSV9DVFJMX0RJUyk7DQo+PiAgICAgICAg
aXNpX3dyaXRlbChpc2ksIElTSV9DRkcxLCBjZmcxKTsNCj4+DQo+PiAgICAgICAgcG1fcnVudGlt
ZV9wdXQoaXNpLT5kZXYpOw0KPj4gKw0KPj4gKyAgICAgcmV0dXJuIDA7DQo+PiAgIH0NCj4+DQo+
PiAgIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKi8NCj4+IEBAIC0xMDg1LDcgKzEwOTIsMTEgQEAgc3RhdGlj
IGludCBpc2lfZ3JhcGhfbm90aWZ5X2NvbXBsZXRlKHN0cnVjdCB2NGwyX2FzeW5jX25vdGlmaWVy
ICpub3RpZmllcikNCj4+ICAgICAgICAgICAgICAgIGRldl9lcnIoaXNpLT5kZXYsICJObyBzdXBw
b3J0ZWQgbWVkaWFidXMgZm9ybWF0IGZvdW5kXG4iKTsNCj4+ICAgICAgICAgICAgICAgIHJldHVy
biByZXQ7DQo+PiAgICAgICAgfQ0KPj4gLSAgICAgaXNpX2NhbWVyYV9zZXRfYnVzX3BhcmFtKGlz
aSk7DQo+PiArICAgICByZXQgPSBpc2lfY2FtZXJhX3NldF9idXNfcGFyYW0oaXNpKTsNCj4+ICsg
ICAgIGlmIChyZXQpIHsNCj4+ICsgICAgICAgICAgICAgZGV2X2Vycihpc2ktPmRldiwgIkNhbid0
IHdha2UgdXAgZGV2aWNlXG4iKTsNCj4+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsg
ICAgIH0NCj4+DQo+PiAgICAgICAgcmV0ID0gaXNpX3NldF9kZWZhdWx0X2ZtdChpc2kpOw0KPj4g
ICAgICAgIGlmIChyZXQpIHsNCj4gDQoNCg==
