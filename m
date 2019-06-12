Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D90428BD
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 16:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404979AbfFLOWd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 10:22:33 -0400
Received: from alln-iport-6.cisco.com ([173.37.142.93]:8916 "EHLO
        alln-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbfFLOWc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 10:22:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2358; q=dns/txt; s=iport;
  t=1560349352; x=1561558952;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=z4+IsXt+Arkma5vEpnhbinw2KnAIOHi3ossCy3IQ9fU=;
  b=e6Im31y+gpPqyQY7DKAkWC4w076HrkHiBoefuQTXFxwkH+KGGbnb0K61
   MlRI6/6Av9r9uS/uzD91eTBlF0GKz9k0N7wWS4whj3YVj/qmotn1EQADp
   kSbvOtkUDNpJcrITQ6g5xbQiFtDpJ4BRLfY8IbK+rMo4BXxXn2zkzHPjy
   I=;
IronPort-PHdr: =?us-ascii?q?9a23=3AFt4dSRHymOFyymEVf4arkp1GYnJ96bzpIg4Y7I?=
 =?us-ascii?q?YmgLtSc6Oluo7vJ1Hb+e4z1Q3SRYuO7fVChqKWqK3mVWEaqbe5+HEZON0pNV?=
 =?us-ascii?q?cejNkO2QkpAcqLE0r+ef7jaTckEd5BfFRk5Hq8d0NSHZW2ag=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0B3CQAXCgFd/4kNJK1lg1VQA2pVIAQ?=
 =?us-ascii?q?LKAqEC4NHA45fSoFgl2CCUgNUCQEBAQwBARsSAgEBhEAZgi0jOBMBAwEBBAE?=
 =?us-ascii?q?BAgEEbRwMhWMREQwBATgRASICJgIEMBUSBA0IAQEegwABgWoDHQGddAKBOIh?=
 =?us-ascii?q?fcYExgnkBAQWCR4I6GIIPCYEMKItdF4FAP4E4iASCc4JYi2eCSpsVCQKCEIZ?=
 =?us-ascii?q?HjH0GG4MOlBqjYQIEAgQFAg4BAQWBZiGBWHAVgycJhXaFFIU/coEpjUEBgSA?=
 =?us-ascii?q?BAQ?=
X-IronPort-AV: E=Sophos;i="5.63,366,1557187200"; 
   d="scan'208";a="289688740"
Received: from alln-core-4.cisco.com ([173.36.13.137])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 12 Jun 2019 14:22:31 +0000
Received: from XCH-RCD-002.cisco.com (xch-rcd-002.cisco.com [173.37.102.12])
        by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id x5CEMV0r010759
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 14:22:31 GMT
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by XCH-RCD-002.cisco.com
 (173.37.102.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Jun
 2019 09:22:30 -0500
Received: from xhs-aln-001.cisco.com (173.37.135.118) by xhs-rcd-003.cisco.com
 (173.37.227.248) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Jun
 2019 09:22:30 -0500
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-001.cisco.com (173.37.135.118) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 12 Jun 2019 09:22:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4+IsXt+Arkma5vEpnhbinw2KnAIOHi3ossCy3IQ9fU=;
 b=DHKFvA12PNwiNlDOgnMaxHvdsBR81ELKEQKeNGbzHQ9VaKDXRRf3MtwAPvcn0QHgDzvtWHqrWSou+pEN/cy8V/UXVTmdnHzFjeGiEFebGyo4E51qiZHUF203RaZoQK84TzzZjtt+OkpUPByy6d8kpEce/Z6CU8/11YsljvaHm3Y=
Received: from MWHPR11MB0062.namprd11.prod.outlook.com (10.164.204.34) by
 MWHPR11MB1949.namprd11.prod.outlook.com (10.175.54.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 12 Jun 2019 14:22:29 +0000
Received: from MWHPR11MB0062.namprd11.prod.outlook.com
 ([fe80::e5b7:4479:44f3:5f51]) by MWHPR11MB0062.namprd11.prod.outlook.com
 ([fe80::e5b7:4479:44f3:5f51%6]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 14:22:29 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [GIT PULL FOR v5.3] Various fixes
Thread-Topic: [GIT PULL FOR v5.3] Various fixes
Thread-Index: AQHVISpDWhp0Mp/Gzk+jYbq6aX4FSQ==
Date:   Wed, 12 Jun 2019 14:22:28 +0000
Message-ID: <2be1fd52-9db4-da0c-4e61-a331bba476ac@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hansverk@cisco.com; 
x-originating-ip: [173.38.220.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0072b6f-f1e4-423d-8f7d-08d6ef416680
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR11MB1949;
x-ms-traffictypediagnostic: MWHPR11MB1949:
x-microsoft-antispam-prvs: <MWHPR11MB1949694950B18270D0F1AA65DEEC0@MWHPR11MB1949.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:651;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(346002)(39860400002)(366004)(189003)(199004)(2616005)(476003)(58126008)(66556008)(66476007)(6512007)(14444005)(486006)(256004)(91956017)(14454004)(76116006)(8936002)(73956011)(68736007)(66946007)(5660300002)(6506007)(86362001)(31696002)(3846002)(316002)(102836004)(305945005)(8676002)(81156014)(26005)(81166006)(186003)(2906002)(66446008)(64756008)(71200400001)(71190400001)(6116002)(31686004)(65806001)(65956001)(66066001)(99286004)(7736002)(6916009)(6436002)(64126003)(53936002)(6486002)(478600001)(65826007)(36756003)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR11MB1949;H:MWHPR11MB0062.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +rgbTO9c6T69Wm5ie9oUmgaNPbw7negLXd5wfq86+FKH1Tyrqwl7ki400yrUn1zr1X6m63mGkJwxTDs1VCLyHOKkHa5aszarPdZS2LTcXQzHE65NhKM5c8cbuQK1AYORo9vh9tGDMFeMVpv1zx98HOAi67qfsiU4rKWKkDlK24iFqXix2h7E8z16D1n5Be90WWO09R7XOL+xwbyK3FeLulHX07z9MKt0/fjXcGj3GLKt+cm3ttVaAzJ94xY0x4v15GLJo09cx969AkelqlTzvd7j+qvBjE1hhaGwoEitPUW3T6fTBQlrBPFqadk0ep+cxwDvlMwFYrWofaiAqHcC4tgYncX/+oh7oOoCCkc0XuN/avbiYggv4gf4t42CIMllrwZz0uJMGaTzQ/yyjxSkCwWpA9bKrXw3Sv4VZuvQvvI=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFCAEE709F26F44BB480EB2030E3D33F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f0072b6f-f1e4-423d-8f7d-08d6ef416680
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 14:22:29.0068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hansverk@cisco.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1949
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.12, xch-rcd-002.cisco.com
X-Outbound-Node: alln-core-4.cisco.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0ZThjMTIwZGU5MjY4ZmMyNmY1ODMy
NjhiOWQyMmU3ZDM3YzQ1OTVmOg0KDQogIG1lZGlhOiBmZHAxOiBTdXBwb3J0IE0zTiBhbmQgRTMg
cGxhdGZvcm1zICgyMDE5LTA2LTExIDEyOjI5OjU0IC0wNDAwKQ0KDQphcmUgYXZhaWxhYmxlIGlu
IHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBnaXQ6Ly9saW51eHR2Lm9yZy9odmVya3VpbC9t
ZWRpYV90cmVlLmdpdCBmb3ItdjUuM3ANCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IDRjYTQ5OGFkMjY2MDNkNzhkNzZkZWZmNDA1YTAwNzBmOWJmNjVjMjE6DQoNCiAgbWVkaWE6IGlt
eDIxNDogRml4IHR5cG8gaW4gbW9kdWxlIGRlc2NyaXB0aW9uIG9mIGlteDIxNCAoMjAxOS0wNi0x
MiAxNjoxMToyNyArMDIwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KQW5kZXJzIFJveGVsbCAoMik6DQogICAgICBk
cml2ZXJzOiBtZWRpYTogaTJjOiBkb24ndCBlbmFibGUgaWYgQ09ORklHX0RSTV9JMkNfQURWNzUx
MT1uDQogICAgICBkcml2ZXJzOiBtZWRpYTogY29kYTogZml4IHdhcm5pbmcgc2FtZSBtb2R1bGUg
bmFtZXMNCg0KSGFucyBWZXJrdWlsICgxKToNCiAgICAgIHRvdWNoc2NyZWVuL3N1cjQwOiBzZXQg
ZGV2aWNlX2NhcHMgaW4gc3RydWN0IHZpZGVvX2RldmljZQ0KDQpNYXJlayBTenlwcm93c2tpICgx
KToNCiAgICAgIG1lZGlhOiBzNXAtbWZjOiBmaXggcmVhZGluZyBtaW4gc2NyYXRjaCBidWZmZXIg
c2l6ZSBvbiBNRkMgdjYvdjcNCg0KTWFzYW5hcmkgSWlkYSAoMSk6DQogICAgICBtZWRpYTogaW14
MjE0OiBGaXggdHlwbyBpbiBtb2R1bGUgZGVzY3JpcHRpb24gb2YgaW14MjE0DQoNClRvbWFzeiBG
aWdhICgxKToNCiAgICAgIE1BSU5UQUlORVJTOiBtZWRpYTogQWRkIFRvbWFzeiBGaWdhIGFzIGEg
dmlkZW9idWYyIHJldmlld2VyDQoNCllvdW5nIFhpYW8gKDEpOg0KICAgICAgbWVkaWE6IGRhdmlu
Y2k6IHZwaWZfY2FwdHVyZTogZml4IG1lbW9yeSBsZWFrIGluIHZwaWZfcHJvYmUoKQ0KDQpZdWVI
YWliaW5nICgxKToNCiAgICAgIG1lZGlhOiBtZXNvbjogdmRlYzogQWRkIG1pc3Npbmcga3RocmVh
ZC5oDQoNCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSArDQogZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9zdXI0MC5jICAgICAgICAgICAgIHwgIDYg
KystLS0tDQogZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwg
IDEgKw0KIGRyaXZlcnMvbWVkaWEvaTJjL2lteDIxNC5jICAgICAgICAgICAgICAgICAgICB8ICAy
ICstDQogZHJpdmVycy9tZWRpYS9wY2kvY29iYWx0L0tjb25maWcgICAgICAgICAgICAgIHwgIDIg
Ky0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NvZGEvTWFrZWZpbGUgICAgICAgICAgfCAgNCAr
Ky0tDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9kYXZpbmNpL3ZwaWZfY2FwdHVyZS5jIHwgMTYg
KysrKysrKysrKysrKystLQ0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vczVwLW1mYy9zNXBfbWZj
LmMgICAgICB8ICAzICsrLQ0KIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMu
YyAgICAgICB8ICAxICsNCiA5IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQ==
