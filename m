Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F884441B0
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 13:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhKCMmc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 08:42:32 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:23543 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbhKCMmb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 08:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635943196; x=1667479196;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tGIerj3DABoBc0yOeuf1/qO9aIZIyo+/IftUfIlqJho=;
  b=tTHypL/PpVwoDBC+jRmaAAxxrLjEDivz273+DUvj7a3Rj1PGVr6WDsy6
   r+VI1JdhnJI2aRtBpuuc5/3KamNDBdG1al7fyqRR7GDFPnuxdlXe2stz1
   +3jMG/W1TII1eCD2UsOClpyGrTR7NCOrkV7QOhfOc4gon8zX/nCCi8Ci1
   0kzIWNw8kbb3xNY6VhqpcTj0Fw5EqkDOoVThpiJZMD2hr5GZwxOqk0jXF
   2fasv2JUo6mHrQlPY6VjmmgONO1Tj7GRIoehNPzrcwleSwaS7iJIgda2I
   lfhJNgF3u3eC6mhchrZZ2LI7oTEyomxz6yFsvumnbiDfrE5lImpw11pWn
   A==;
IronPort-SDR: 9n2aOC7UWHgnEfcEkVh5E5Raeehz6C0JId/F6RQBj7rIXjLWrzKGjpkj8E/5pgrJVP+YrUmxga
 9hcE+l6YQuWgrz97eJBo7gZxS84Nucns8NuWJ8dd32TJxu4nx5sFsa94LDM6cabb1aNh0Y0MHo
 ZlCaMFy1gy91OqYg8oSoAR/FOjAb1SHZnuF6KYtQE+OfymyM1/DcWI/xbfE0fjAggTQHv5DwhC
 EbPyhdZA3xU4CWXAc+4TxQcORd21qVVOwzR8Qg7gFczUSQlclRnkAf6g/go48O/aHto5Vij+iF
 mDZGDBbfFEdV04Qj8jcCTB55
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; 
   d="scan'208";a="142064786"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Nov 2021 05:39:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 3 Nov 2021 05:39:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Wed, 3 Nov 2021 05:39:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUIaAd2Z73nJawPAjxODbTvaJ3RIZQ3URW3B74PLkUZkdvbfFVx13tTx4RqHHYqTlaHwyaBX3n7OXA/vciC1DmGpTvPQAUglz3/fiNMObJUIr9UgmWkIsApdmjo/E7ULRfzLk/O4qw9pcm4MQi8j1CzYpqSE/YF+U+Tk/y7JkrveuVOVXAWPgW33tT+8tMuaZB2GUpFHY009PXeCKUWCt2yCuipZCT0Oh2iowNzoTRypuAeP4t1w4FR+d6EpxZiDFact0LCgbEKrPi9yEPSalXawS/2l9VnAS2khLqBHL/Xvak6pKcw2H94mR7kySzjyznNOGxM0MK1qaoLs1Yf4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGIerj3DABoBc0yOeuf1/qO9aIZIyo+/IftUfIlqJho=;
 b=CislTEYrDK2HspxDL5pH+FrcG/HU8is7G8tUCMVK2Tmd3pNRenUpld5M6aQZi6M0ogsefzp2HrGBfK/ICk5wEV49fUOHN0Mt5zVO4pEpUmra6FyGrKxjC6fiWmekrVkm0T3FUrTuf3406JK13jSF2/oWk0HpfdXGjRLWoJWb67VDwiBaerJ9QmJnMbg2+Hy1dc10KqCDltbPwihAA9breeGkUnYoBeI2kot921sfmf6C7zgo99wNHTPYCVbvm5K7DySCS3F162BFM8Qtkubf4FEn/LMuSHDztThlVJWt+fTL7atJsQd4Y6/8288pN9Kcki7l1kj0/0gQ5F0LjEKa3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGIerj3DABoBc0yOeuf1/qO9aIZIyo+/IftUfIlqJho=;
 b=lIhYW75GWPiQpabQhqgeTpiHn754bL/YTvQft6NWcyThNkqrFbwbMt6lznbM29IWW/89qh3RbpnGiTYl4y3F3yW4qykzHdrr5nXgcUJvXMnALczZkbFpJjWx+QdS8VSvfpBZszuxPYpEv8AXemPmaOxVYTFfNHjOf8iRJFkEwi0=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN6PR11MB1588.namprd11.prod.outlook.com (2603:10b6:405:e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 12:39:52 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21%8]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 12:39:52 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <sakari.ailus@linux.intel.com>
CC:     <akinobu.mita@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <jacopo@jmondi.org>
Subject: Re: [PATCH] media: i2c: ov7740: implement get_mbus_config
Thread-Topic: [PATCH] media: i2c: ov7740: implement get_mbus_config
Thread-Index: AQHXz/6Sb4uy5G8AD0Wb3lFt0OWCT6vxc+sAgABL4YA=
Date:   Wed, 3 Nov 2021 12:39:52 +0000
Message-ID: <84ff4389-3458-0811-b43f-ded957c01f88@microchip.com>
References: <20211102153008.1349895-1-eugen.hristev@microchip.com>
 <YYJDcIiBXo/XlKCX@paasikivi.fi.intel.com>
In-Reply-To: <YYJDcIiBXo/XlKCX@paasikivi.fi.intel.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a783b15-6871-41b0-a75a-08d99ec7085d
x-ms-traffictypediagnostic: BN6PR11MB1588:
x-microsoft-antispam-prvs: <BN6PR11MB15881011EAEF94E80267E265E88C9@BN6PR11MB1588.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zd8RhV881rwpIDgNpRctEfkbWhJe+siAbLU1hEm6NA8CqPXzttK9rAV+0NpH8nz+9Q2IzFEqoHbnvA+RgU+y0eF4v0IdzHVhToa/Gu1DeE/6OKWLLKombwWiAGAzYKDF25TutNvjXrLYQUxgykMGbF/9aqbrXPJmsXVZ9GxN6O+IeepSxk+P7gG+cTI3M/J4hVdPNpJZ8rOFFKMQDdH7hr2I2trcC/w0ups7ctZ/Qgm13yhBU6p2A+EiyEJIDnagWN42GI4LJ0T3k3GfccdD61xhxkhxhFiUNjilyOZzXq2rdJgz0DW/BfGbIdo8BH/nUmXB2N7FdG1O5XP72nPGE5ITek+vwZN6PMR5BlUgQf3HqDOk1PR82F+xJ7TMZZx7nNWKRO046aK7Ky7CtRUWQ9sj/WIRGuR0Rl+aeOOt1djBpygw7bmSz7yp1IywrXnkEPDJHFK80P0SzSXThERjFd0bYSTctwhKFNUCixdAygJ8o1FuxlfNxsG7sKUVewlLV5ZXhXDa5k3b0quV1FHOIHJdYi4fvoMIxKusK6k83gQvpkgEVPPdu19fasWPum+ZQI/Vt/VDblIp7Oekijv5OB87U8luBSRF17xmdrZjyhLPNN8Zz7ZSZ4QSH8PM85u5O7n5NcbbCso1C0NZvh+IynhRDAPfsm75ZGaPLTJXk3qYk7sVARa8pBhVYdd6Y54WOiKXCcyP65H9tMe9Ybo7K1BiSQVcsHgu0r8l6IW7moWNHkBDcaSvucFNWCPr9qDMpMBxSNNtKS6VlJjKfZoPtQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(86362001)(71200400001)(122000001)(36756003)(31696002)(66446008)(8936002)(91956017)(38100700002)(26005)(8676002)(2616005)(76116006)(64756008)(66556008)(66476007)(66946007)(5660300002)(2906002)(38070700005)(316002)(4326008)(6486002)(508600001)(31686004)(54906003)(6512007)(83380400001)(6506007)(53546011)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?end4UVZteElqbmE4WjRyd0VIOWh3RWxTeEZSdmFzeE4rYm5wakxVcXRuM1dL?=
 =?utf-8?B?b2xOOG5UdnBKSzR5VStQRndFbGxZcThPbkN1MkdLbkNrc1A5VEF4ejlwOW56?=
 =?utf-8?B?SktYTkdvZ1BWcGtkaTN5Y1ExdE9TUnNCMDBORnNXdlQxY2cvYXlkdEJtUXRH?=
 =?utf-8?B?d1B6cGZPbjNud2ZybEIrcXQ4Y0pHbXhrdk9zVW9RdEhCMzBJUFNGWk1URm9a?=
 =?utf-8?B?eCs5L2Y2MXNPemp0L2JzbStQVmd5b1hHN3k3WWRPTUlZSWJHaStISzdMa3FB?=
 =?utf-8?B?U0toeDFaUlo2RmVVVzZOWEVUTlhKSlNCNmFNdGVMd0RveTZyL1V3RGJ5V2RW?=
 =?utf-8?B?QUNkamhML2h4bjZRQ3Fncmw2NXBIQm5tRXk5YmVwTkQrVTY3WitrSG52bGo2?=
 =?utf-8?B?U1J0WlFiZTBuRW5tTUExTFZrWHpDUitnblVJUSsveDYyUDgxYWd4RElzYzNU?=
 =?utf-8?B?Vm5nV0lhbWFGQkF6S3pWYkoxZnFya0UvU2NRRmJ2djNXcjFqT0wzNllJTk8z?=
 =?utf-8?B?cFlQN1RkM2ROSDhiR21DbGZScDIxc3lqbVBVMDRHbzVubTYyS0xsNkFGUWFG?=
 =?utf-8?B?NzNmekVoN3g0YWVoSnlDSnZ5bmZjZnlrakVUSHdMQTBwQmJmWjNNcldUK01T?=
 =?utf-8?B?L1R6RHFyZWpnZy94N3ozdGNJVWRvSHlpMnRsWDFHZ2JGdXZjT3U2M1I5Tkc2?=
 =?utf-8?B?T2RkbFZvV2NpNGg3RFVKQkRYYlZERVA5dXJzNlphcnlpaEc4bVovdXF1WGZm?=
 =?utf-8?B?bnNGa0ozMy8zQ1d4Z1FWSWVXZUNBVzBwKzNyVUhZR2swNVUrTUVuUDc0RlRH?=
 =?utf-8?B?d3ZubElMeDNtY3JwY0xYTjJLZHFsNDVacFphbnZ4b2RKOFdQa1JmK21KYUho?=
 =?utf-8?B?TURGMlhSOGw4azA5M0lqeGtHU2RaNEdtTUU5cXhrY0I1RWRkc2xyRm1TL0xO?=
 =?utf-8?B?QzhhbGhLYmtBKzc1Qk16UUFIazk0WFE3bkJFVGR6UGVieE9Gc3dBdG5WWUpM?=
 =?utf-8?B?TExTMEliRXBEQStpT3FZNnBMZnVtZUZqU1FkcWJPRUxIeVlRVlBWYmtZZmhu?=
 =?utf-8?B?LzVHQklkOHZ1T0RyRytBaTZSbTJtdDIwbTd0N0VCQW5GSEVFUlBOaDF5VzVW?=
 =?utf-8?B?a1NTcXhURGJkN2g5T0VkM3hGaXpHWERxcGYxVDRhWEpWV042RW5xNnhhcXJr?=
 =?utf-8?B?Vks3b3VsSkNsdjV4ZGlkaHlMVW8xMlRCSEh6NmxJTStJcWEvOUtnMTJxaDJk?=
 =?utf-8?B?elVjUjRNZmQzYXhnUmx2KzRyYlVQU29WTmRmYlF3LzFNK3lBTUhYMjJxNURG?=
 =?utf-8?B?U0pWMklIbTczbEFQMkp0QmRGcFpERHhtMitNZTU2Rzc5V0N0MnkvMGVLdXRR?=
 =?utf-8?B?eGlqVGZMczdBTEdMK1lkVUNTRW56SE92aTVoVjRxbFZvM04yYmhGc2FLcU1V?=
 =?utf-8?B?TnVYbTFqTUoxcE4rQ2ZLNmNnVjZudmVwQjNadXdzZENxN3BzaEdrdG56cmtQ?=
 =?utf-8?B?TGpPL3MvakU5anU4V2RWWjY0bmhoZnU3cFYwWWpzWkdmcFQ0RjRhUEN1dmty?=
 =?utf-8?B?OTY3Yk1rbDVjVTB1SWtvc1A3a0hwUHZBWXJIRTlYblhlalBpQ2xsNzB1bVd1?=
 =?utf-8?B?SmQzM09RUkN3U3VFTVpFRjZ3ei9IWmRBRUhqQmY5TXRLQVQzYWQySFFhQWtO?=
 =?utf-8?B?SVlqWHJ4eVJTdHY2SzdYZ2dZT1B3ZEp6eWp4UXZwSVgwaWMwalBXUmtTVnBK?=
 =?utf-8?B?clV4WStFcUtJNGNNbmh3QWVBbjZValNUcENBU3FLdU1GSlhXQ0hnMGR2SGoz?=
 =?utf-8?B?K25EK243WHMwdSszeFYrQ2dqNUxxaFZ6eGpZMnRtQWx1bkRJTTRUbmZnSCtK?=
 =?utf-8?B?d1NBbDRKM2RCR3dBdk44RVcyamlFQVZCTS9OWkg1M0l3TnNLM0pnVDBIRDBr?=
 =?utf-8?B?VHlyYUhaZFZlNk9NZThPYjJxdWNIQW1SZXpJckFyNVNoNHBKMUVPSzBOK0pQ?=
 =?utf-8?B?MU1CMmx6RzF6NFZjMmFRVXh6NVRhbVRORzZod05DNnRZbkNLQmdscldkclZ5?=
 =?utf-8?B?YUFwN0gxakIvMjZNWDUwdEZTNngrQ3BUZlRmVTdnQkZFUlZ2QlJaMHlmSGRr?=
 =?utf-8?B?N2R4cXJjSlZuT3BYN0d2RDdaWldyaGxXaWozdi84ZzJQNFlyOGdPalo1Q05P?=
 =?utf-8?B?Y3Q4RWR6a2ZjVlhoMlBsSjBUNWh1SXdVdUN5VHZvanpPNjJhWTBCcmNodVI0?=
 =?utf-8?B?bEhENlNSamFhZDNQTEp2VGhnSWxnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F9A7B297F47B44B97626EE9F11865CF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a783b15-6871-41b0-a75a-08d99ec7085d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 12:39:52.4347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 04xBejA9JJFxvr6OOuh7gCSKfe8GfBHr15uBG8b+su2keel5x98VGpNfabCSOgMy2sp4s3YjFgymlhl1hVe/3z9K7iO7Snr6VBzQWu76ufI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1588
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTEvMy8yMSAxMDowOCBBTSwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KPiBIaSBFdWdlbiwNCj4g
DQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gVHVlLCBOb3YgMDIsIDIwMjEgYXQg
MDU6MzA6MDhQTSArMDIwMCwgRXVnZW4gSHJpc3RldiB3cm90ZToNCj4+IEltcGxlbWVudCB0aGUg
Z2V0X21idXNfY29uZmlnIGNhbGxiYWNrLg0KPj4gb3Y3NzQwIGlzIGEgcGFyYWxsZWwgc2Vuc29y
LCBhbmQgYWNjb3JkaW5nIHRvIGRhdGFzaGVldCwgdGhlIHJlZ2lzdGVyDQo+PiBSRUcxMiBjb250
cm9scyB0aGUgQ0NJUjY1NiBtb2RlLiBUaGlzIHJlZ2lzdGVyIGlzIHdyaXR0ZW4gdG8gMCBpbiB5
dXl2IG1vZGUuDQo+PiBBY2NvcmRpbmcgdG8gUkVHMTJbNV0gLCBDQ0lSNjU2IG1vZGUsIHRoZSBi
ZWhhdmlvciBpczoNCj4+IENDSVI2NTY6IGRpc2FibGVkDQo+PiBSRUcyOCBjb250cm9scyB0aGUg
cG9sYXJpdHkgb2YgdGhlIHNpZ25hbHMuIFRoaXMgcmVnaXN0ZXIgaXMgdW51c2VkLg0KPj4gVGhl
IGRlZmF1bHQgYmVoYXZpb3IgaXMgdGhlbjoNCj4+IEhTWU5DIHBvbGFyaXR5IDogcG9zaXRpdmUN
Cj4+IFZTWU5DIHBvbGFyaXR5IDogcG9zaXRpdmUNCj4+IEhSRUYgcG9sYXJpdHk6IHBvc2l0aXZl
DQo+Pg0KPiANCj4gRG9lc24ndCB0aGUgcmVjZWl2ZXIgZHJpdmVyIGdldCB0aGlzIGluZm9ybWF0
aW9uIGZyb20gRFQ/DQo+IA0KDQpIaSBTYWthcmksDQoNClRoaXMgcGF0Y2ggY29tZXMgYXMgYSBy
ZXN1bHQgb2YgbXkgZGlzY3Vzc2lvbnMgd2l0aCBKYWNvcG8sIGhlIGFkdmlzZWQgDQp0byBnZXQg
bWJ1cyBjb25maWd1cmF0aW9uIHZpYSB0aGUgZ2V0X21idXNfY29uZmlnIC4gSSBhZ3JlZSB0aGF0
IHRoaXMgDQppbmZvcm1hdGlvbiBjYW4gYmUgdGFrZW4gZnJvbSBEVCBhcyB5b3Ugc2FpZC4NCklu
IHRoZSBlbmQgLCBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgZ2V0X21idXNfY29uZmlnIHNob3Vs
ZCBiZSB1c2VkIA0Kb25seSBmb3IgcnVudGltZSBjb25maWd1cmF0aW9uIHdoaWNoIGNhbiBjaGFu
Z2UuDQpUaHVzLCBpZiBhbGwgdGhpcyBpbmZvcm1hdGlvbiBpcyBzdGF0aWMsIHRoZW4sIEkgd2ls
bCBwcm9jZWVkIHdpdGggDQpvYnRhaW5pbmcgaXQgZnJvbSBEVCwgYW5kIHlvdSBjYW4gZGlzcmVn
YXJkIHRoaXMgcGF0Y2gsIGFzIGl0IGlzIG5vdCB1c2VmdWwuDQoNClRoYW5rcywNCkV1Z2VuDQoN
Cj4+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlw
LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL21lZGlhL2kyYy9vdjc3NDAuYyB8IDE0ICsrKysr
KysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL292Nzc0MC5jIGIvZHJpdmVycy9tZWRpYS9p
MmMvb3Y3NzQwLmMNCj4+IGluZGV4IDI1MzljZmVlODVjOC4uZjhhNzE3YWVjYjZmIDEwMDY0NA0K
Pj4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y3NzQwLmMNCj4+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvaTJjL292Nzc0MC5jDQo+PiBAQCAtODczLDEyICs4NzMsMjYgQEAgc3RhdGljIGludCBvdjc3
NDBfZ2V0X2ZtdChzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLA0KPj4gICAgICAgIHJldHVybiByZXQ7
DQo+PiAgIH0NCj4+DQo+PiArc3RhdGljIGludCBvdjc3NDBfZ2V0X21idXNfY29uZmlnKHN0cnVj
dCB2NGwyX3N1YmRldiAqc2QsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBwYWQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCB2NGwyX21idXNfY29uZmlnICpjZmcpDQo+PiArew0KPj4gKyAgICAgY2ZnLT50eXBlID0gVjRM
Ml9NQlVTX1BBUkFMTEVMOw0KPj4gKyAgICAgY2ZnLT5mbGFncyA9IFY0TDJfTUJVU19NQVNURVIg
fCBWNEwyX01CVVNfSFNZTkNfQUNUSVZFX0hJR0ggfA0KPj4gKyAgICAgICAgICAgICAgICAgIFY0
TDJfTUJVU19WU1lOQ19BQ1RJVkVfSElHSCB8DQo+PiArICAgICAgICAgICAgICAgICAgVjRMMl9N
QlVTX1BDTEtfU0FNUExFX1JJU0lORyB8DQo+PiArICAgICAgICAgICAgICAgICAgVjRMMl9NQlVT
X0ZJRUxEX0VWRU5fTE9XIHwgVjRMMl9NQlVTX0RBVEFfQUNUSVZFX0hJR0g7DQo+PiArDQo+PiAr
ICAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRs
Ml9zdWJkZXZfcGFkX29wcyBvdjc3NDBfc3ViZGV2X3BhZF9vcHMgPSB7DQo+PiAgICAgICAgLmVu
dW1fZnJhbWVfaW50ZXJ2YWwgPSBvdjc3NDBfZW51bV9mcmFtZV9pbnRlcnZhbCwNCj4+ICAgICAg
ICAuZW51bV9mcmFtZV9zaXplID0gb3Y3NzQwX2VudW1fZnJhbWVfc2l6ZSwNCj4+ICAgICAgICAu
ZW51bV9tYnVzX2NvZGUgPSBvdjc3NDBfZW51bV9tYnVzX2NvZGUsDQo+PiAgICAgICAgLmdldF9m
bXQgPSBvdjc3NDBfZ2V0X2ZtdCwNCj4+ICAgICAgICAuc2V0X2ZtdCA9IG92Nzc0MF9zZXRfZm10
LA0KPj4gKyAgICAgLmdldF9tYnVzX2NvbmZpZyA9IG92Nzc0MF9nZXRfbWJ1c19jb25maWcsDQo+
PiAgIH07DQo+Pg0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfc3ViZGV2X29wcyBvdjc3
NDBfc3ViZGV2X29wcyA9IHsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBTYWthcmkgQWls
dXMNCj4gDQoNCg==
