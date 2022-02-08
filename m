Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D7A4AD7CB
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 12:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242325AbiBHLsv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 06:48:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353143AbiBHLsi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 06:48:38 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A6AE01CECD
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 03:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1644320204; x=1675856204;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+d8msRoBUBZ3wbtx5Nb6vbFrWXzZFn/w1xuDJibdGaQ=;
  b=VhanuNkyMXfFRE5D+qMjQjO2AOdf9Biyc2tA3SBPPwMTt2p/SlUu0je2
   /2LFKt0g44DC2X0N8dn2ScTO7W8TkZT9dR9so31uMsreYuxAe5uxETr0g
   yHcrqQfHBrE/T+Og3XiY9ZlQwseGztkpGca2f/994bXUPynkmlcjKRdNi
   4cpeLzl03ChKIE1KRirC0R8GHr3ijomweKf13kKR8nuUzcOh7vEkClxAf
   CSzARKTBgKkHoesQv96/1egFx4f6V/Di8ejmmdDtfcMYo+Pp38ct/+jmG
   9Ao5twCAYohmBywutr+6i8EzkNMtG+FgCP/kX42zD/1+TQEFVFVQ6N9fh
   w==;
IronPort-SDR: jICJ+6cpDTy1Qg9YgLgl2Zj6yLd9Soh2pf1c4OJcd4vYev5ZfnPUeWiqS73JxY4+EyJSudt/rz
 sFYe/ZHt6rWDFcBAmicBCTnJLm0iGZdjUdgUDxZcbCmpvLRrd5AeFnxCMsbhCtxgVjBp7GlQz+
 0FZjKzy6tu4RTicERHoVtb2Hof1XtA4nSutbEGrC7ysaqNLhoTB95CQmby6gxwCkHpNHmW2vnV
 Xq2N7UdaXPf2lX7yLq0ZRsxoEIqD+ZqwPUwNeEb156c5WnFL4pFMD681mkwnqtRNWxX2bNF47q
 y4DxCE5Zv3hGPk46rKkhqrTI
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; 
   d="scan'208";a="145241777"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Feb 2022 04:36:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 8 Feb 2022 04:36:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 8 Feb 2022 04:36:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrpZbSII8t99SGxwGwW6DRo74m9uRzTn4Gq9uMAkFawZ2tXgekvEv7SG+DGylLybf3XoOBELO20SKeaGVaP+DRe9iBb/arM98CS6ynaRFiaZzVYpcOzfN6ASt8HzeSLM8nLl/js4Em7WKZ/bzQ357qK8xz6opVNNsMGG6AhZ3JO+nTp9OxKwfLzuv1H9IkMJ6GRSqdpAWNC2jIem/OntddfchO9ErUP472k3gvHnSjGcuLTJU7lOfySMOYXPfGN5BPBWNf1CgRNm2MYlDkLLmPCrYBpEOT48amAZvAzLPZb0UK8pdxhdt1vPT4sxuW/lUbmNzH9Gk1O58DgWf6C6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+d8msRoBUBZ3wbtx5Nb6vbFrWXzZFn/w1xuDJibdGaQ=;
 b=YKF9wtslqB8wRfAzN5HUdcDQi/3YDSYMx6dGnThORlFuS2QCPYzaojSLAhNNrORL4W6/dJbbMg96mO6fL07QwMFmXXy968SOrPNaDR70GDfevL/TcN1yjIlklDr+ApZkeqVU6wnyD2seP92sZF/dqO2h/bopZ/RVgor0I11/56abTF+wOqGzxg2ADnqyqn19o7ReqnhEhK3Y7qYbR9sftcsL1jCAaBjDvJbvn3LRgPq3dhVWFwICSQnyvieKsfR7A30PRfsCOERjQYhnWepS0ZytkjTaff0w33rstBJQyPI5uBQTP0vxH/c+yN9xtoqzuE2YjpIkgXmvdkVY23YUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+d8msRoBUBZ3wbtx5Nb6vbFrWXzZFn/w1xuDJibdGaQ=;
 b=SYE7Z93usdLhUi+z0ZzFpfjMtCvqB6pmDkvxdRpHswSqeR5iw1QDcS2daPukjiBFkyPC3KC6p2oT/InwnPzSr+G36tRHYPuYt1nsc+VqqsG21uMmycMries+/2OudYnhowFfv93TRkkiyPwVS78AXNrdbxvkotGPv83zAq6RBLU=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by MWHPR11MB2030.namprd11.prod.outlook.com (2603:10b6:300:28::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 11:36:16 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.4975.011; Tue, 8 Feb 2022
 11:36:16 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <laurent.pinchart@ideasonboard.com>
CC:     <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Thread-Topic: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Thread-Index: AQHYGErW4A/BdhOeLUW3uTV7RDBBc6yJJBKAgAAvKoCAADP3gIAACF2A
Date:   Tue, 8 Feb 2022 11:36:16 +0000
Message-ID: <5168daa7-2f8b-fdbe-7a15-12de3428322a@microchip.com>
References: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
 <20220208061129.158ba126@sal.lan>
 <ed240352-0588-d963-2b0a-7b65280e96b0@microchip.com>
 <YgJOqb06gmNhFw6X@pendragon.ideasonboard.com>
In-Reply-To: <YgJOqb06gmNhFw6X@pendragon.ideasonboard.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18bf33ea-c4be-44b8-7a85-08d9eaf73813
x-ms-traffictypediagnostic: MWHPR11MB2030:EE_
x-microsoft-antispam-prvs: <MWHPR11MB20306A1951DCC9C78E95E875E82D9@MWHPR11MB2030.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fUyL73fjHMopGwQh+t5G/8CvaAw1/IW+eK5YK2cSLKyzTfUnl1zJIUaeBWzsez7AJhacOD011u4LlwGb12OdBIaG51crPMGbR6gKH7UPFve+f77I5iwJaGpFE0bfnvD7Fv3VPqmR7Qcsols7viLi7eZRpop89TG9Tpv7UYhlduB2iB/BXh6x8qPo083wNfPKzSqgrCWyUlJ0GTUW5n03skXzOJ9gNMr5o7z154ctB8gjLl0uXvZMgeghwQ9x+AoNUJjuhkhpp+Z8Y3uiwX0fq1McY7uAqWOJ5CjMbltq2XizfkmMtQG+JjprOtwwX/WKep3c/o9OcNMI0xnWOX+L2hiyeVw/t+J2Qq2Z8+OCRpz1UBVH4fLHHxO3OiiyT5g3pyTX7FzllKdyzh6gAiPOKhfNJSdo10gZITrai0Fd5d9eatEYDNYX1pBAHyHLcVtSt10yAXfXoXrS5INHCo1bs1nz40mGWY0T8AGF3JQyIER4Bi4TtCO6r2ch8omzaIweg+RmwJPj2yj0oJH9bA2QJ9I+K5IQ+0fksGxkIAOouzev0JZ9SrPrRSYEi0hlVsqekSwc0wyYj0dsZcAJcIfqOPn3+gIoBm+DoK0oux4Bpc/Q7n2JhmmkoteHD7UtMH7MS/vBmPIL0dUbxqO9aBnXU6ubIWPWH6zHqVbU9L33+/ZFSsOWK7xsjZ1fldOpjzHJy2J75kicat/nHP0qDFx9og39lVDmg+q/f6X+KT+A0f430/F+qVw5dbpJ1ytW50tZdNZmNtgzfZtFnaF4xZi7cYhpOfYvgeRW8hbieNMUPk6+3WRonkk3axguo21cp+Uym/ExyIWO5vCmLf8jQUhYdSK/Z9z79nqKHoyMywJvRf4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5384.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(8936002)(4326008)(5660300002)(83380400001)(186003)(316002)(8676002)(66946007)(64756008)(66556008)(66446008)(66476007)(91956017)(36756003)(76116006)(31686004)(6916009)(54906003)(6512007)(966005)(6486002)(6506007)(53546011)(31696002)(71200400001)(2906002)(122000001)(508600001)(2616005)(38070700005)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1B6dWl4NHBkc0NwSFBKY3RmYjlkRjlRMHNDV2VjdG9qSjdIQmZWd3RsVjRl?=
 =?utf-8?B?SjdIOUZ1RnN1eENERTBmUmxzN1Y1emVSWHhXT2VLVjJyNk53di95a3dIaktH?=
 =?utf-8?B?UmJIbnFBS0FPSXd6Tlh3NkU2NmtJR0U2bVZZc3E3aURycUhXK1dnWjJnSGlM?=
 =?utf-8?B?cjBzeXBSV0dEMkNpeUVNOURKRWJLck9TWjdOQjM5amwvc1lGa0JMMXpid2Ey?=
 =?utf-8?B?NWhZVjROSnFCMHhldWpGdHRoMVlpRXlHSmFsSFVlWVREbndSbE1VSS9FUW1U?=
 =?utf-8?B?ak4ybDNWMzNwWDhxUVY4YVN6d2JWanQ2UlFIY0FjTGE4MVhXa2tWRjFpcFNH?=
 =?utf-8?B?N2NUcDU5ZFhhMmhYemdUZkdneWJrWU9KbnFWNFcyR1ZJMnM2Y0dtY05uZmRi?=
 =?utf-8?B?c0VFTGZ1b3ZYMVViOEhINXBucFdjbEs0QzQyMFBYRHBCOUJMRHdXYy9QbUNm?=
 =?utf-8?B?YnNrbGVDVkxFaTUyam9VY2ZNRjk1bElDd3VPZCt4aUZYYU9ENi93emFtcG5x?=
 =?utf-8?B?NG1QckwyUG9NTHM2U0JuODUrOGtoWHNzTzErQ3lmTGNnWFlDbEtRL2NSdzdF?=
 =?utf-8?B?UVY5QmFudXdmWjBnd25NRnVLWDN5TjFPYzh1VzdRaFlrUDZINTZqNStWVFl1?=
 =?utf-8?B?WGtubVNHUzZOeUJGb3h3UDhqSnZ6Ym5XMy9sUjB4VUlwdFd2aURHcGIyZFZw?=
 =?utf-8?B?M1NqY0hZVDZuejdueHU5T2MydzRIRnNRWkdtemV5UVdaWTgvNC9JTmV3Rm1E?=
 =?utf-8?B?a0wvN09heWVoNGVUeXlPc1RXUXNDUkYvTzNKMVR6VWNPdWRFVzZzMHRmaWFD?=
 =?utf-8?B?ZlFRY0RKT2VNUlB0UktJV2Jra0JxWStaaUNuSTlna2FubFhabERuMzBpNFdL?=
 =?utf-8?B?NWQyQ1BhamtNVE9TZlNlR1F2UE1UZ29HZEtKUktUZE45c2d2YTQ3K0JXQUJx?=
 =?utf-8?B?ZGhHb3BvNHByYWpIeU1Jc2hXR3BZVkhJbnU4WHlEVzI2ekJSK1NNQXh3c3dY?=
 =?utf-8?B?cjRXV3FvSlA3cmovbk9jSEVQSXJ2SE5GU0pua3lNeGZBQmdhMEE4NjdWdHJP?=
 =?utf-8?B?SitFTlhDT3FWdEgzaFJrYjRlUW14a3ZKZm5YUFZ2djlNd0JYRDYzbUovb2tw?=
 =?utf-8?B?b2RFL05YMXhraFBRUENDMGZ0L1ozS21kVGhmOWhLL3pQMVdUcjRzVlpCc2gy?=
 =?utf-8?B?N1FaK20zeGk1ZzJoVm9OMGpJUGNUL2hDdTVKZVVMMFY4TVlsb0pUV2hiNCs4?=
 =?utf-8?B?Q29nWTA5SlRjdVJWVmpvNlh0NEtrSkZqbll6eVArSUZXQVNqK1lJNWZOYUdE?=
 =?utf-8?B?SEJ2TDc2ZnhteGVhRUtuM2NMSHFpOGk0UnQrMmc1RHlqc1pldjhCRVJKTGox?=
 =?utf-8?B?NU5uKzYvRGtvWGJuODE1YmdmbnZ2RjNHLzNtSGtjeGwxVGxjeFp6ckFJQVJB?=
 =?utf-8?B?bnlvR3lTNHpJOHhZekh3d2o0S2l5Y1R6b1E1QmVvL3RCZDUvMnd1c3kzQ3Ry?=
 =?utf-8?B?ZzVsc2N2ajNIRG5lL0pCVlEvYzFmaFVjVkp1YUdSOWJQenRrdEJJUGpKak56?=
 =?utf-8?B?QTluY1c5c2hEWnpPdTN1SHhPd2RaNWhZOVJMUjl0RFZjTlRxRER0RFJZVVd6?=
 =?utf-8?B?YTdKRWdsaEM4MUpMV1pZcEhVZno5cDdmY2VSanIyY0NmMkNnL0dIOFlyR0h3?=
 =?utf-8?B?TDNsNHlKYi91d3lEMUtxU1dUL3FhV2Z4WE45dzN3NkRnek9VbEl5Z1BBU0pa?=
 =?utf-8?B?cHg5Y0lGNFpjeHR2SzBDRWd4czN6eklJNWgyUjdGVFlpLzIyMnFLQlRZMm00?=
 =?utf-8?B?ZnBvMTIyWXZXb3pHZnFxYzhPb01ndzA5WmVzTnFCb1RObjEya2V2TXhNcmdW?=
 =?utf-8?B?TlU1ZGJ3eVI5dVRGemd5Yy9rSGt5T0FFVUJ3MEQyTWF1SnRLVnlEOHFHMUI2?=
 =?utf-8?B?YVJBUmpZL1I0RlpSTzFJOEFzOGRJZWs5N0lZQlhJMzZrYjZRMjlrSXBhZGo4?=
 =?utf-8?B?WFd4UXZXZHVGUittVDFjdUw1NWRBcEdvUzgxY3B3ZXp1dTJwYlgvZDJUc3ZX?=
 =?utf-8?B?WGI5azRvRFJLQ0FtM1A5OXNMMG42RHRmdGpFU0NJbmNPZzlydlFJSHRRZlZI?=
 =?utf-8?B?UXhlZkgwVzJ1SlVBdnAwcWR1amc1T1QyV1FuUGMzWmZxeVVKUzVwUyswRHdh?=
 =?utf-8?B?dlJVYTM2WVJVSkc0bVRRK2g2R3JRdzEvK2ZpSjMydHNQT2NzK0kvU1Vwb1Fm?=
 =?utf-8?B?TElmQnhkbmg4K3J1V3pPbnJBdVdnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8094C8FAA33BB24498DCB9763CE20A69@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bf33ea-c4be-44b8-7a85-08d9eaf73813
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 11:36:16.7477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xuWKcHy01ZGN8YQKQDrdJlIGLXvmtoAnP+lE0IUh0skKeN0Ld0kbZjgb7jwZzAXNmPYzb2WqUoUejfM7JEckb+eEmBQre7nUFfvbhjF1I50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2030
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMi84LzIyIDE6MDYgUE0sIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+IEhpIEV1Z2VuLA0K
PiANCj4gT24gVHVlLCBGZWIgMDgsIDIwMjIgYXQgMDg6MDA6MTlBTSArMDAwMCwgRXVnZW4uSHJp
c3RldkBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gT24gMi84LzIyIDc6MTEgQU0sIE1hdXJvIENh
cnZhbGhvIENoZWhhYiB3cm90ZToNCj4+PiBFbSBXZWQsICAyIEZlYiAyMDIyIDE3OjM2OjA5ICsw
MjAwIFNha2FyaSBBaWx1cyBlc2NyZXZldToNCj4+Pg0KPj4+PiBBcyBwYXJ0IG9mIHJlbW92aW5n
IG1idXMgY29uZmlnIGZsYWdzLCByZW1vdmUgVkMgZmxhZyB1c2UgaW4gdGhlDQo+Pj4+IG1pY3Jv
Y2hpcC1jc2kyZGMgZHJpdmVyLiBUaGUgc3VwcG9ydCBjYW4gYmUgcmVpbnRyb2R1Y2VkIGxhdGVy
IG9uIGFzIHBhcnQNCj4+Pj4gb2YgdGhlIHN0cmVhbXMgcGF0Y2hlcy4NCj4+Pj4NCj4+Pj4gQ2M6
IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4+Pg0KPj4+IEht
bS4uLiB0aGF0IHNvdW5kcyBhIHJlZ3Jlc3Npb24gdG8gbWUuIFdoYXQgZWZmZWN0cyB0aGlzIHdp
bGwgY2F1c2UgYXQNCj4+PiB0aGUgZHJpdmVyPw0KPj4+DQo+Pj4gRXVnZW4sIGFueSBjb21tZW50
cz8NCj4+DQo+PiBIaSAsDQo+Pg0KPj4gSSBhbSBub3QgaGFwcHkgd2l0aCB0aGlzIGNoYW5nZS4g
SXQgbG9va3MgbGlrZSBJIHdhc24ndCBldmVuIENDLWVkIG9uDQo+PiB0aGUgb3JpZ2luYWwgcGF0
Y2ggZS1tYWlsLg0KPj4NCj4+IFRoZSBlZmZlY3Qgb24gdGhlIGRyaXZlciB3aWxsIGJlIHRoYXQg
ZXZlcnl0aGluZyB3aWxsIGJlIHRyZWF0ZWQgYXMNCj4+IHZpcnR1YWwgY2hhbm5lbD0wIC4NCj4g
DQo+IEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhbnkgcmlzayBvZiByZWdyZXNzaW9uLCBhcyB3ZSBo
YXZlIG5vIGRyaXZlcg0KPiBzZXR0aW5nIGFueSBvZiB0aGUgVjRMMl9NQlVTX0NTSTJfQ0hBTk5F
TF9bMTIzXSBmbGFncyBpbiB0aGUga2VybmVsLg0KPiANCj4+IEkgZG8gbm90IHlldCB1bmRlcnN0
YW5kIHdoeSB3ZSBhcmUgYWJvdXQgdG8gcmVtb3ZlDQo+PiBWNEwyX01CVVNfQ1NJMl9DSEFOTkVM
XyogYXMgSSByZW1lbWJlciB0aGlzIHdhcyBqdXN0IGludHJvZHVjZWQuDQo+IA0KPiBUaG9zZSBm
bGFncyB3ZXJlIGFkZGVkIGluIDIwMTEuIElmIHlvdSB0aGluayBvZiB0aGF0IGFzICJqdXN0DQo+
IGludHJvZHVjZWQiIHRoZW4gSSB1bmRlcnN0YW5kIHdoeSB5b3Ugd291bGQgYmUgdW5oYXBweSBh
Ym91dCAic3VkZGVuDQo+IGNoYW5nZXMiIG1lbnRpb25lZCBiZWxvdyA7LSkNCg0KSGVsbG8gTGF1
cmVudCwNCg0KSSBhbSBzb3JyeSwgSSB3YXMgcmVmZXJyaW5nIHRvIHRoZSBnZXRfbWJ1c19jb25m
aWcgd2hpY2ggd2FzIHJlY2VudGx5IA0KYWRkZWQsIHdoaWNoIGluIG15IGNhc2UgdXNlcyBWNEwy
X01CVVNfQ1NJMl9DSEFOTkVMXyogLg0KV2l0aG91dCB0aGUgZ2V0X21idXNfY29uZmlnLCBJIHdh
c24ndCBzdXBwb3NlZCB0byB1c2UgdGhlIA0KVjRMMl9NQlVTX0NTSTJfQ0hBTk5FTF8qIGF0IGFs
bCAuDQpIZW5jZSBteSBjb25mdXNpb24gaW4gYWRkaW5nIHRoZW0gaW50byB0aGUgc2FtZSBidWNr
ZXQuDQoNCk15IGRyaXZlciB1c2VzIHRoZXNlIGZsYWdzIGJlY2F1c2UgbXkgaW5pdGlhbCBpbXBs
ZW1lbnRhdGlvbiB0byBnZXQgdGhlIA0KVkMgZnJvbSB0aGUgZGV2aWNldHJlZSB3YXMgcmVqZWN0
ZWQgYW5kIHRoaXMgd2FzIHN1Z2dlc3RlZCBpbnN0ZWFkLg0KDQo+IA0KPj4gSXMgdGhlcmUgYW55
IGFsdGVybmF0aXZlIGluIHBsYWNlID8NCj4gDQo+IFZpcnR1YWwgY2hhbm5lbHMgaGF2ZSBuZXZl
ciBiZWVuIHByb3Blcmx5IHN1cHBvcnRlZCBpbiBWNEwyLiBUaGlzIGlzDQo+IGdvaW5nIHRvIGNo
YW5nZSB3aXRoICJbUEFUQ0ggdjEwIDAwLzM4XSB2NGw6IHN1YmRldiBpbnRlcm5hbCByb3V0aW5n
IGFuZA0KPiBzdHJlYW1zIiAoWzFdKS4NCj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyMTExMzAxNDE1MzYuODkxODc4LTEtdG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJk
LmNvbQ0KDQpJbiB0aGF0IGNhc2UgdGhlbiBJIHN1cHBvc2UgdGhlIHN1cHBvcnQgaW4gdGhlIGNz
aTJkYyBkcml2ZXIgaGFzIHRvIGJlIA0KcmV3cml0dGVuDQoNCj4gDQo+PiBNeSBvcGluaW9uIGlz
IHRoYXQgaWYgd2Ugd2FudCB0byByZXBsYWNlIHNvbWV0aGluZyBleGlzdGluZyB3aXRoIGEgbmV3
DQo+PiBBUEkgb3Igc29tZXRoaW5nIGVsc2UsIHdlIHNob3VsZCBmaXJzdCBhZGQgdGhlIG5ldyBz
dXBwb3J0LCBibG9jayBhbnkNCj4+IG5ldyBhZG9wdGVycyBmb3IgdGhlIG9sZCBBUEkgc3VjaCB0
aGF0IGV2ZXJ5b25lIHVzZXMgdGhlIG5ldyBBUEksIGFuZA0KPj4gb25seSBhZnRlciB0aGF0IGNv
bnZlcnQgdGhlIG9sZCBBUEkgY2xpZW50cyB0byB0aGUgbmV3IEFQSS4NCj4+IFNvICdjYW4gYmUg
cmVpbnRyb2R1Y2VkIGxhdGVyIG9uJyBpcyBub3Qgb2theS4gV2UgY2FuJ3QgcmVtb3ZlIHRoaW5n
cyBpbg0KPj4gdGhlIGhvcGUgdGhhdCBpdCB3b3VsZCBiZSByZWludHJvZHVjZWQgbGF0ZXIuIEp1
c3QgbXkgcGVyc29uYWwgdGFrZSBvbg0KPj4gdGhpcywgZmVlbCBmcmVlIHRvIGhhdmUgYSBkaWZm
ZXJlbnQgb3Bpbmlvbi4NCj4gDQo+IFdoZW4gcmVncmVzc2lvbnMgYXJlIGludHJvZHVjZWQgdGhp
cyBtYWtlcyBzZW5zZSwgYnV0IGhlcmUgd2UncmUNCj4gZHJvcHBpbmcgYSBmZWF0dXJlIHRoYXQg
aXNuJ3QgdXNlZCBhcyBubyBrZXJuZWwgZHJpdmVyIHNlbGVjdHMgYSBWQw0KPiBkaWZmZXJlbnQg
dGhhbiAwLg0KDQpJIHN0aWxsIGRpc2FncmVlIHRoYXQgdGhlc2Ugc2hvdWxkIGJlIHJlbW92ZWQg
YmVmb3JlIHRoZSBwYXRjaCB5b3UgDQptZW50aW9uZWQgZWFybGllciBhYm91dCBhZGRpbmcgJ3N1
YmRldiBpbnRlcm5hbCByb3V0aW5nIGFuZCBzdHJlYW1zJyBpcyANCmFwcGxpZWQuIEkgc2VlIHRo
aW5ncyBpbiB0aGUgd2F5IHRoYXQgYWZ0ZXIgdGhlIG5ldyBzdXBwb3J0IGlzIA0KYXZhaWxhYmxl
LCBvbGQgZmxhZ3MgLCBldmVuIGlmIHVudXNlZCwgY2FuIGJlIHJlbW92ZWQuDQpZb3UgY2FuIGRp
c2FncmVlLCBvZiBjb3Vyc2UuDQoNClRoYW5rIHlvdSBmb3Igc2hhcmluZyB5b3VyIHRob3VnaHRz
LA0KRXVnZW4NCg0KPiANCj4+IEluIHRoZSBlbmQgeW91IGd1eXMgYXJlIHRoZSBtYWludGFpbmVy
cyBmb3IgdGhlIHN1YnN5c3RlbSBhbmQgY2FuIGhhdmUNCj4+IHRoaXMgY2hhbmdlIGlmIHlvdSBs
aWtlLCBJIGFtIG1vcmUgdW5oYXBweSBhYm91dCB0aGUgZmFjdCB0aGF0IGNoYW5nZXMNCj4+IGhh
cHBlbiBzdWRkZW5seSBhbmQgd2l0aG91dCBub3RpY2UuDQo+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+DQo+Pj4+IC0tLQ0K
Pj4+PiAgICAuLi4vbWVkaWEvcGxhdGZvcm0vYXRtZWwvbWljcm9jaGlwLWNzaTJkYy5jICAgIHwg
MTggKystLS0tLS0tLS0tLS0tLS0tDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9hdG1lbC9taWNyb2NoaXAtY3NpMmRjLmMgYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL2F0bWVsL21pY3JvY2hpcC1jc2kyZGMuYw0KPj4+PiBpbmRleCA2YmM1NDljMjhlMDUu
LjZhN2Y1YjRiMGUzYiAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9h
dG1lbC9taWNyb2NoaXAtY3NpMmRjLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9hdG1lbC9taWNyb2NoaXAtY3NpMmRjLmMNCj4+Pj4gQEAgLTM0OCwyNCArMzQ4LDE1IEBAIHN0
YXRpYyBpbnQgY3NpMmRjX2dldF9tYnVzX2NvbmZpZyhzdHJ1Y3QgY3NpMmRjX2RldmljZSAqY3Np
MmRjKQ0KPj4+PiAgICAgICAgIGlmIChyZXQgPT0gLUVOT0lPQ1RMQ01EKSB7DQo+Pj4+ICAgICAg
ICAgICAgICAgICBkZXZfZGJnKGNzaTJkYy0+ZGV2LA0KPj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAibm8gcmVtb3RlIG1idXMgY29uZmlndXJhdGlvbiBhdmFpbGFibGVcbiIpOw0KPj4+PiAt
ICAgICAgICAgICAgIGdvdG8gY3NpMmRjX2dldF9tYnVzX2NvbmZpZ19kZWZhdWx0czsNCj4+Pj4g
KyAgICAgICAgICAgICByZXR1cm4gMDsNCj4+Pj4gICAgICAgICB9DQo+Pj4+DQo+Pj4+ICAgICAg
ICAgaWYgKHJldCkgew0KPj4+PiAgICAgICAgICAgICAgICAgZGV2X2Vycihjc2kyZGMtPmRldiwN
Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgImZhaWxlZCB0byBnZXQgcmVtb3RlIG1idXMg
Y29uZmlndXJhdGlvblxuIik7DQo+Pj4+IC0gICAgICAgICAgICAgZ290byBjc2kyZGNfZ2V0X21i
dXNfY29uZmlnX2RlZmF1bHRzOw0KPj4+PiArICAgICAgICAgICAgIHJldHVybiAwOw0KPj4+PiAg
ICAgICAgIH0NCj4+Pj4NCj4+Pj4gLSAgICAgaWYgKG1idXNfY29uZmlnLmZsYWdzICYgVjRMMl9N
QlVTX0NTSTJfQ0hBTk5FTF8wKQ0KPj4+PiAtICAgICAgICAgICAgIGNzaTJkYy0+dmMgPSAwOw0K
Pj4+PiAtICAgICBlbHNlIGlmIChtYnVzX2NvbmZpZy5mbGFncyAmIFY0TDJfTUJVU19DU0kyX0NI
QU5ORUxfMSkNCj4+Pj4gLSAgICAgICAgICAgICBjc2kyZGMtPnZjID0gMTsNCj4+Pj4gLSAgICAg
ZWxzZSBpZiAobWJ1c19jb25maWcuZmxhZ3MgJiBWNEwyX01CVVNfQ1NJMl9DSEFOTkVMXzIpDQo+
Pj4+IC0gICAgICAgICAgICAgY3NpMmRjLT52YyA9IDI7DQo+Pj4+IC0gICAgIGVsc2UgaWYgKG1i
dXNfY29uZmlnLmZsYWdzICYgVjRMMl9NQlVTX0NTSTJfQ0hBTk5FTF8zKQ0KPj4+PiAtICAgICAg
ICAgICAgIGNzaTJkYy0+dmMgPSAzOw0KPj4+PiAtDQo+Pj4+ICAgICAgICAgZGV2X2RiZyhjc2ky
ZGMtPmRldiwgInN1YmRldiBzZW5kaW5nIG9uIGNoYW5uZWwgJWRcbiIsIGNzaTJkYy0+dmMpOw0K
Pj4+Pg0KPj4+PiAgICAgICAgIGNzaTJkYy0+Y2xrX2dhdGVkID0gbWJ1c19jb25maWcuZmxhZ3Mg
Jg0KPj4+PiBAQCAtMzc1LDExICszNjYsNiBAQCBzdGF0aWMgaW50IGNzaTJkY19nZXRfbWJ1c19j
b25maWcoc3RydWN0IGNzaTJkY19kZXZpY2UgKmNzaTJkYykNCj4+Pj4gICAgICAgICAgICAgICAg
IGNzaTJkYy0+Y2xrX2dhdGVkID8gImdhdGVkIiA6ICJmcmVlIHJ1bm5pbmciKTsNCj4+Pj4NCj4+
Pj4gICAgICAgICByZXR1cm4gMDsNCj4+Pj4gLQ0KPj4+PiAtY3NpMmRjX2dldF9tYnVzX2NvbmZp
Z19kZWZhdWx0czoNCj4+Pj4gLSAgICAgY3NpMmRjLT52YyA9IDA7IC8qIFZpcnR1YWwgSUQgMCBi
eSBkZWZhdWx0ICovDQo+Pj4+IC0NCj4+Pj4gLSAgICAgcmV0dXJuIDA7DQo+Pj4+ICAgIH0NCj4+
Pj4NCj4+Pj4gICAgc3RhdGljIHZvaWQgY3NpMmRjX3ZwX3VwZGF0ZShzdHJ1Y3QgY3NpMmRjX2Rl
dmljZSAqY3NpMmRjKQ0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hh
cnQNCj4gDQoNCg==
