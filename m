Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4B384B78A5
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 21:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244086AbiBOUK7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 15:10:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244064AbiBOUK4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 15:10:56 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9C9DB870
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 12:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1644955843; x=1676491843;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ru07RQXlsYxZ6M2+wY2kcwR1MYHPjpvQQadnR/srIwM=;
  b=GPJ6RuyNdb1YWcLt/06Kp/ltsfUfaH8OqQFtDj24Fd61JPkyNAA6ltws
   gohhY635TtCuW9CuVvAuklGSSrgQKLohDenSCjDkqQYw4aKF63u/UZEie
   F9aNsDyV17JzZkVI99lN5rkE+A2MIOIuIfe2HhbMbflmiv9eLklYysElH
   0Ho8HYF48XirjTGmdsPen/5kSkiMu0faJR7uVTt20yEyJYqBEAu3z/0Ho
   DagAe9sZyKZKaUiQtjAbTj0LNhH5Q7csXJIxyXQmD9JoR996iN+UPueTD
   v3ZDxCLfpj+ZcwGXyqUmpTDOTVM1pAA+iIkQ7mEf9qPEaGCqqbgxGlo1S
   A==;
IronPort-SDR: Sj/E/Yhk0xSvyX8FdlivIJ+8AgqE+VQHbgzikFGmcuUugV+dfXSyT46HClHNQHx9Gg5MFcQoKa
 ADIazTnxrj0CWxVTLmnkki97NJQKwo0oG/OD0zqcjOxGWesXwW3sVYk8VwFKMQiuPJuKW9Yfaw
 N8RSvJXUyN3I/93UhYLduEOekh2aTfE+o7LAT2q6NkSFYxDIrDSiylvUc6OwPIsUU5ONz5Nt/B
 xVZlKh8B1RriN6rqxFTFlqEJtaqU1QNhOAX52GQKMkVa95GZwMwd+54/j3fTfzFrtAcfGYY/GP
 WJ5j2V3zhGtrJuOKx7+Kf2kn
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="153188254"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Feb 2022 13:10:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 15 Feb 2022 13:10:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 15 Feb 2022 13:10:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9G5cRaUqbRbQCd+rQ4u9bz4BmAB+mjj5TdYqvMu+c5+DlJIWcdJfFJ9BBU8isRykE54zQraKEfpzgZnx4fAJiEuLY1T7pA650FO+vugYJ7BpXIl6GQmEAozCc/kxVPpjnW3psVUyYm1zvMY0guUKgadQLZP+AqN34XKY22j+l1BqOaMBnH5EyzIhUu57EgoS6VQ6YnZDz3+v3Kg6LCnBK0m3cmb1fFXMDZuDuoFVTuBMWEhR+CGQ4NI+D0PGnEKFyy48YstVBeRAtn6BNYsOeHBuZ/nooOgzGg1XUJiKLHGr3wGxR8vJKA+FIxd7wTuROFhOchqsRWNHpytYH67tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ru07RQXlsYxZ6M2+wY2kcwR1MYHPjpvQQadnR/srIwM=;
 b=SXGjtocScIhL+yEJ5JsquQdx/ELAi9Dl5fRsczII7b4/37oM+/jKPgX0hwnvumbKwYLXJNcAUXQe0fD19XslAod8TTQzAFyvbvFC4H+L9cxiP0Ih3ijI93LlXKHuooKFWaL5f0JMbNNdl2hMw4GeaLbgMa4PczAkuG6jIvSMTvXBYzxbfFKfEnxB2XfNGrp2HgCbfydvZfTxUIi/CY4+2kIKGkTcQrFdBDA2AkC3gTEphT6NtM6Nq3XtxJuNpKcxfNTrjocwshJDP7LHLDgAoxULWlqAfDAlUkhOdhT4DnHavJNk3Xfh9nFii13lKw1Rd8IrYI+7qsnlpXvyOANoGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ru07RQXlsYxZ6M2+wY2kcwR1MYHPjpvQQadnR/srIwM=;
 b=Q1L7YZpUR0lSQWkQKJHl603SDyLe3iSDLb0epNSDmstfUdKPgBACt/kPpEyEoM/iw8qPZjVkwOnrsJEId1eWdabin+6n2yLv9J8YItOGP/jDwnZRCE2HLpggxDBhrATdkCGNzZRq4Xkc+JwaKEtkWFUimH6sS/+q3kTu8dg1Ga4=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by DM6PR11MB3996.namprd11.prod.outlook.com (2603:10b6:5:196::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 20:10:19 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.4995.015; Tue, 15 Feb 2022
 20:10:18 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <sakari.ailus@linux.intel.com>
CC:     <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Thread-Topic: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Thread-Index: AQHYGErW4A/BdhOeLUW3uTV7RDBBc6yJJBKAgAAvKoCAADP3gIAACF2AgAuCYwCAAA2NAA==
Date:   Tue, 15 Feb 2022 20:10:18 +0000
Message-ID: <c0676a4e-803f-9f1c-542b-4b007705ef3d@microchip.com>
References: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
 <20220208061129.158ba126@sal.lan>
 <ed240352-0588-d963-2b0a-7b65280e96b0@microchip.com>
 <YgJOqb06gmNhFw6X@pendragon.ideasonboard.com>
 <5168daa7-2f8b-fdbe-7a15-12de3428322a@microchip.com>
 <Ygv9SP2OpIHDtXfA@paasikivi.fi.intel.com>
In-Reply-To: <Ygv9SP2OpIHDtXfA@paasikivi.fi.intel.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aed8e4b3-dac4-44e0-2c8b-08d9f0bf3052
x-ms-traffictypediagnostic: DM6PR11MB3996:EE_
x-microsoft-antispam-prvs: <DM6PR11MB39967E162118E8CDFC81BF46E8349@DM6PR11MB3996.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +LiDPYEBsF6zm37q0/IHAmDrTviyoarYzlFxUiOYkRottoM48rB5ZJLlw/Na+gnS1tspXhMNBMmzDPe6Lvm1VKQGLpk/HjqMJCFvOGy2p6DJNF3iX1YKdGUii5k0cPvHd1+Qe5Y/BjZPDsFPRwi/hKGYOcXdlUmz93lmVkMg82Pk0mDeQ1suFjXu3iOWleZe7GitOhDXUGn78/H2Y6J9uxlzhL/VynFeDSCKvAnrhwdK1GMqBZlabP5uaiZynvZ2cuXBQpyEtaXhoyJ/nLTEyO1YNvqHWiii9lC9OQivP4kzfYFH2TYT+at/Ni7tED4ziJRBYT1P4IWfRGI5JbGbQvAy9lNBmqodwCiLSJqVep+R+v/0kEhIJ3n5mmlbXOOxqWmSPR4KiDq9k8UqYapPm6cZsw9QpDN8ayZ9NL0BzVFIkg2Hb72m9utHjB/hNv3Sh8wwZxo9MUKfLmARyVLEerKYXuTmBOGvrAOGTou4uTUAYVdcGguJ+uxPXkYynfYafm/NgxDdsEUWitBfpANpF5jw4tGyeQwxfG4XxtHpVOoDwO3ep5GXbwQk8CAAFp2hVIPOBoH72efKAyQdBLx3gJzBANnBuSJiqIRQ3VWJDIrrANKQK0ilm3a2c0qExsMUFpvXWfblhna0ByOMnxE6/5FhVruGTiiGcEVqog0IBwa62bDAexSEQtFReL4eskcidLbg0pvIGhlx6SSYwSPck9mWssQMTgbZleM2b6nGQxXV2EiStLHvghbWcQajGEqTnCRyVgWJwx50cGAhUuaqOA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5384.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(71200400001)(2906002)(31696002)(86362001)(6506007)(53546011)(6512007)(38070700005)(8936002)(5660300002)(83380400001)(54906003)(508600001)(64756008)(66556008)(6916009)(122000001)(6486002)(31686004)(66446008)(66476007)(4326008)(26005)(36756003)(38100700002)(66946007)(316002)(76116006)(186003)(91956017)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2xoYkppWDlsVkw1Z3lKb2ZYcTNFUVJEb1c5RE9IbkhzVXFibEVZbWN2a0ky?=
 =?utf-8?B?aEQ0WklHVHo3NWh2TVVJQ0QrMlVCazlZanZTMFV0dmlIUFZRRlVCUkcvK2Zq?=
 =?utf-8?B?aHRzT05CZ0JBYW5HRG85UUVXS1pDclFEcjVMUWpRUzQ2a2dGek9pT2xQUlV4?=
 =?utf-8?B?TGFDN2dIeU9EOE13RjhxRHZ0dkRhNFNITFFzRGFObTVIc3pjSklpWk12YzFK?=
 =?utf-8?B?dy9rS2hDMjM3WHNYalRKQUNjVWcrTjJ4TDVqSHd4K3RDelhUaFg0TDYwY2xu?=
 =?utf-8?B?T2xwUHVtYVR5ZEdzV1pnSWx6eXhQbFRQRG5oVVd5WnRXNTQ4YWw5bzFQdGhj?=
 =?utf-8?B?ZVZRbnpJQndMRVp6Q3RVd3RWdEhnM2NybmQzYXVPcWtmaFM1bUEvRFFLSDlC?=
 =?utf-8?B?MytlQjQrOWRFNS9XbVUyR3JvN3BHZ1dvbE10NEkvZFFHelNoVEdkNFBIc1NB?=
 =?utf-8?B?K2YrRmNHOGxCWWdyNTNKcy9peUVXYVJ5YUxINGlZSnZhRmhrMUVQWkV6eDFI?=
 =?utf-8?B?dG1lQnpkQ0tSRk5iV3VCcEwvWmhXMm93a0pQRmVPMzZTYnF0K0dQL2dBaGNG?=
 =?utf-8?B?THFWRnJuVjJWU3JrVlZ4ZTR2QlBqZDZSNER6QlFqaVBhUmpBZlU1Qk1SVXpn?=
 =?utf-8?B?RjdzOXp0Q2Q3eG5NZU5mNWJYejdKb0VDaDNJMjJhSzZKblQ4M3VNa1Q4czFH?=
 =?utf-8?B?Z3VkM3FBc2VCQi93ZWhpU0RhNGdlSEdsSHZSaGl6M2RMNXZoTSs4bDBmVXQ4?=
 =?utf-8?B?MTBRQTIrRGRDbXMxSHdQSUNzR0VUSXpCK3lpRXdKa1BleUVKVUlOcjJsRW9X?=
 =?utf-8?B?Mi9hVUhXTFFyZlBYRjB5dlFXKzRKYkFFYitWQ01nMUZEQ0lHUEF3eno0bTYv?=
 =?utf-8?B?QnpkNW11ZUdiNEdNMDZvOUdCelJQSVUwMmhNMTBqKzBxVGZFNHAyZFBhb3Jk?=
 =?utf-8?B?T0c1Qy8rRlMydFV5UVpVMXZReEF2c1V6cWlLVzQraHE3TnNSZ0VWY2lXUjhX?=
 =?utf-8?B?Q0dqWWR6bTVSa3loSDZyNWlrL3VtWEFYZG5YNVVtalRBT3lFaUp5a2c5dGNl?=
 =?utf-8?B?ZzVDb1NXYnUyenBzdTY5TyswaDZjc3ZmNDVGcnVZaUF4WTlFR0IwS3IxSzli?=
 =?utf-8?B?Sys2bzJkczhESk9heGF3UmEycGlUMmR6SDBEdGoyWFJXVFdoVkh3ZW1DR25w?=
 =?utf-8?B?TTlBaUNYa1JsNitSa1grdFRNYStHWmlXNXJ2Sm54OW4relFNUzA1S3hGekxX?=
 =?utf-8?B?Y2w4Z0hqODRnNTZYYmhQWTZONEh5eVlRdW9VMFhONkc5NngzL2gwVE1Db0lC?=
 =?utf-8?B?L0NvNWs3SGtKbEU5aHNnNzFZOU1JaFBLNXFSM25keUw4TmR1VTZ5OFhSbWY2?=
 =?utf-8?B?QTRWN2oyOUNpcFBtMjFZREFMbTFRcnc5N2ZESUcrS1Bua2RkZVpkWUw1aFFI?=
 =?utf-8?B?M24rcXlJTFJOVkMrQUc0VDlDN1ZtQXlUVnNFSDRVbk9RenM5WFBCclNPVW9I?=
 =?utf-8?B?QS9QbmlxVkRUMzhoRVZ1TmhXQWE3VEczOFFtNmx1WTVKeHZuTkxpZ0ZOWnV6?=
 =?utf-8?B?eDJYYXpEa3JtdmpzNHdlVlhNaitYcVZIcDgxbXZ2emNKSm13MEhaWG4vdXB6?=
 =?utf-8?B?OWFQRlY3OG5nWVFhWE4rendwVVJ4Y2g1anh5WFBncDBOemFMelFGMlVPZGFi?=
 =?utf-8?B?anRlWHorOXlkRGRFUWR2eDdId0JkeUJNNVM0NEFBODFiWk82ckNDZDhUZzVz?=
 =?utf-8?B?WWdaREJHeXl6S2ZDbXAxT01vY3VjNk5qL0JPTUJwbjIwYk8vWHVmcTg1L2dM?=
 =?utf-8?B?NFcwNm1UYmxLQmtaUUFWRTc2OGV5UG5tK3d2aGVMTGVUUEZud1ZyL1EvUHhW?=
 =?utf-8?B?Rm1CQjV3Ym8zTXJ1N1lBdTlSWk9LbFluYTVjY3lpZUlVNnF3QmVwaXpKby9F?=
 =?utf-8?B?UGVuNVlXMGo0V0Y0b3NHcS8wcy80dHNMNFlFVmtZRTBYaEI0ZFUyZWE4SS9G?=
 =?utf-8?B?Qnd2Ui94Tm0vNVp3cHQ5YzdRWjlnYVo4R2I1UEJ5TTVpTjJudXBLaDBHTllY?=
 =?utf-8?B?cUJYMHlzSWRieko0U3d1aisyRTlqRXlUTjl0WXUvTjhkcHZIYUVHVmlTRWhk?=
 =?utf-8?B?aVlGUkJjaFh5ak9oVllkeVM1dFpGSkp0YWd4TWwvR04xNXdtQnNBYmVmVFJp?=
 =?utf-8?B?NjhRYi90TkZXN01BaG9KaG5IcWFDRkl1bUhTZjlBV2lSd1p5SkNXemx4WDcy?=
 =?utf-8?B?bklNNFlsV1lROElrZEtqa294cXh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BED22102F965F441B51D0B5DAD751BEC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed8e4b3-dac4-44e0-2c8b-08d9f0bf3052
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 20:10:18.9122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XHr0g7ZmEwRjBX+vUZrgnbppfMEytYbw0fEMiT8ecVgOpMd2nnfkUSB4opLMfjE+4rDCIrZBspFShoqvL6qLUM+ln6otJivGGg4uAKfoVoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3996
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMi8xNS8yMiA5OjIxIFBNLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+IEhpIEV1Z2VuLA0KPiAN
Cj4gT24gVHVlLCBGZWIgMDgsIDIwMjIgYXQgMTE6MzY6MTZBTSArMDAwMCwgRXVnZW4uSHJpc3Rl
dkBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gSSBhbSBzb3JyeSwgSSB3YXMgcmVmZXJyaW5nIHRv
IHRoZSBnZXRfbWJ1c19jb25maWcgd2hpY2ggd2FzIHJlY2VudGx5DQo+PiBhZGRlZCwgd2hpY2gg
aW4gbXkgY2FzZSB1c2VzIFY0TDJfTUJVU19DU0kyX0NIQU5ORUxfKiAuDQo+PiBXaXRob3V0IHRo
ZSBnZXRfbWJ1c19jb25maWcsIEkgd2Fzbid0IHN1cHBvc2VkIHRvIHVzZSB0aGUNCj4+IFY0TDJf
TUJVU19DU0kyX0NIQU5ORUxfKiBhdCBhbGwgLg0KPj4gSGVuY2UgbXkgY29uZnVzaW9uIGluIGFk
ZGluZyB0aGVtIGludG8gdGhlIHNhbWUgYnVja2V0Lg0KPj4NCj4+IE15IGRyaXZlciB1c2VzIHRo
ZXNlIGZsYWdzIGJlY2F1c2UgbXkgaW5pdGlhbCBpbXBsZW1lbnRhdGlvbiB0byBnZXQgdGhlDQo+
PiBWQyBmcm9tIHRoZSBkZXZpY2V0cmVlIHdhcyByZWplY3RlZCBhbmQgdGhpcyB3YXMgc3VnZ2Vz
dGVkIGluc3RlYWQuDQo+IA0KPiBBcyBub3RlZCBieSBMYXVyZW50LCB0aGlzIGZlYXR1cmUgaXMg
bm90IHN1cHBvcnRlZCBpbiBtYWlubGluZSBjdXJyZW50bHkuDQo+IEJleW9uZCB0aGF0LCBubyB0
cmFuc21pdHRlciBkcml2ZXIgdXNlcyB2aXJ0dWFsIGNoYW5uZWwgZGlmZmVyZW50IGZyb20NCj4g
emVybywgc28gdGhlIGNhc2UgZm9yIHNldHRpbmcgbm9uLXplcm8gdmlydHVhbCBjaGFubmVsIGlu
IGFic2VuY2Ugb2YNCj4gbXVsdGlwbGUgc3RyZWFtcyBkb2VzIG5vdCBleGlzdC4NCj4gDQo+IEFs
c28gdGhlIGludGVyZmFjZXMgcmVxdWlyZWQgdG8gbWFrZSB1c2Ugb2YgbXVsdGlwbGUgc3RyZWFt
cyBkbyBub3QgZXhpc3QNCj4gaW4gbWFpbmxpbmUgYXQgdGhlIG1vbWVudC4gVGhleSB3aWxsIGJl
IGFkZGVkIGJ5IHRoZSBzdHJlYW1zIHBhdGNoc2V0DQo+IGV2ZW50dWFsbHksIGFuZCBhZGRpbmcg
c3VwcG9ydCBmb3IgdGhlbSByZXF1aXJlcyBleHRyYSBkcml2ZXIgd29yay4NCj4gDQo+IFRodXMs
IHdlJ3JlIG5vdCBsb3NpbmcgYW55IGZ1bmN0aW9uYWxpdHkgYnkgZHJvcHBpbmcgdGhlIGRlZmlu
ZXMgYW5kDQo+IHBvdGVudGlhbGx5IGFzc29jaWF0ZWQgZHJpdmVyIGNvZGUuIFRoZXJlZm9yZSBJ
IHNlZSBubyByZWFzb24gdG8gcG9zdHBvbmUNCj4gdGhlc2UgcGF0Y2hlcy4NCg0KSGkgU2FrYXJp
LA0KDQpJIHVuZGVyc3RhbmQuIEkgYW0gZmluZSB3aXRoIHRoZSBwYXRjaC4NCg0KRXVnZW4NCg0K
PiANCj4gLS0NCj4gS2luZCByZWdhcmRzLA0KPiANCj4gU2FrYXJpIEFpbHVzDQo+IA0KDQo=
