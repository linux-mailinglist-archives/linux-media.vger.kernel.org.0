Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62470C07FA
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 16:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbfI0OuY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 10:50:24 -0400
Received: from rcdn-iport-1.cisco.com ([173.37.86.72]:54967 "EHLO
        rcdn-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbfI0OuY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 10:50:24 -0400
X-Greylist: delayed 424 seconds by postgrey-1.27 at vger.kernel.org; Fri, 27 Sep 2019 10:50:23 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=12658; q=dns/txt;
  s=iport; t=1569595823; x=1570805423;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=DEQRw9YCT1K/2s0+11gkX0OgjTHuZb/FsgvovworUJg=;
  b=XYzBmBIrLBC+BJaNSRMZ/yONHSENnfb7jW3xIHUIMCi5Gqqh9d0R8REU
   8G+I78daOxF3svuwInngv50TCiQ8XxLfUETSANRtZ0cemfceHSFg+n83I
   h2GQIbJfoEVrIV4Kd9+ZGBI8YYrQQ0IWRISaEqL29zwdiLS7EIJuALk9a
   8=;
IronPort-PHdr: =?us-ascii?q?9a23=3AixAMWRN31ADqy9lhKSkl6mtXPHoupqn0MwgJ65?=
 =?us-ascii?q?Eul7NJdOG58o//OFDEu6w/l0fHCIPc7f8My/HbtaztQyQh2d6AqzhDFf4ETB?=
 =?us-ascii?q?oZkYMTlg0kDtSCDBj7JfjxcSEgH+xJVURu+DewNk0GUMs=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AbFADoHo5d/4MNJK1mHgEGEoMyUAO?=
 =?us-ascii?q?BQyAECyoKhBiDRwOKVk2aBYFCgRADVAkBAQEMAQEtAgEBg0CBGYMgIzgTAgM?=
 =?us-ascii?q?JAQEEAQEBAgEFBG2FLQyFZBERDAEBOBEBIgImAgQwFRIEDQYCAQEegwCBawM?=
 =?us-ascii?q?dAaMzAoE4iGF1gTKCfQEBBYJJgkcYghcJgQwojA4YgUA/gTiDKYQsgyOCWIx?=
 =?us-ascii?q?UgwmdPgqCIpUFBhuCN5Z9j16XYQIEAgQFAg4BAQWBaSGBWHAVgydQEBSBToN?=
 =?us-ascii?q?yilN0gSmMegGBIgEB?=
X-IronPort-AV: E=Sophos;i="5.64,555,1559520000"; 
   d="scan'208";a="635150923"
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 27 Sep 2019 14:43:18 +0000
Received: from XCH-ALN-012.cisco.com (xch-aln-012.cisco.com [173.36.7.22])
        by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id x8REhIIj009044
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2019 14:43:18 GMT
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by XCH-ALN-012.cisco.com
 (173.36.7.22) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Sep
 2019 09:43:17 -0500
Received: from xhs-aln-003.cisco.com (173.37.135.120) by xhs-rtp-001.cisco.com
 (64.101.210.228) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Sep
 2019 10:43:17 -0400
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-003.cisco.com (173.37.135.120) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 27 Sep 2019 09:43:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRz4xFEJvJXusFk2y+t1D7G4hjoAG1N6xXqncFoIHkbZgkSmBXoOhs3KHFFdSwZlH5fAzmYNYUZXqBd+rTv/UO08Cn5T/flN21hlzjPdEaX/tW/aceVh/h9CtPVimP91YTgReL+vOqVbiwPlgpIfcvdPyzoiW8kMDV7FAJP30BXXtTHgs2SzVcB9TO/AY2kACZIewPANRmhgvppEvfCctGgZtjHh82CYSHCJdexXhAu55OnHbZi9RhgvvWo6sdnpW1l99qW1go3KXUDECMWQGXTxRfpkzBcc1UmtbK55aOm5cPEcFrGScsM4rNxh5nDAphT6KOZryA385AZQsbZAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEQRw9YCT1K/2s0+11gkX0OgjTHuZb/FsgvovworUJg=;
 b=Dd+hqQL5c4fXMMZVNZlOHW7azYVFIxILcdQ/7oh8J0unzjnfr55Pd9EWjZARjdIgtxvq+UKEgSmwzy6VzaL+FKraZf+kOX1j3VOsmEob0rvtWjj7RFrLGE6gG8pbpwA7DqKhtqTadu8BGTblgG2oW+8agp9qpJnoTvKcYw0cwSj1A96hLdTVV1aYa0r/WMXSyDl4Mzh8+C8Vfn5eIFEI/pArkZbDs/PL8L32wgFkTZ+y2wzGk7OlB+16P9hYVToCXbAUosC/dSQfutPf01eVxlbYXWmnedHUZOamSHbezoUGHuwNWajm+tYxdgtBwDW8VtCVCvlCx3/LJLtjHTgX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEQRw9YCT1K/2s0+11gkX0OgjTHuZb/FsgvovworUJg=;
 b=BlCoLU9HzVVlfSzEwmEIsIKElvHbGaPD0yk38nocuJ5R02eN8FABgDPWgmhOsUQBqt3vcpqxCQ9jEBdFWS8lSBcSCo8VoK9V59KFIWfqiv9Oz9WInC0dEdyaR6j5QQvrLyJZznKxX1xg5ItMKBka6UrYLE5TuYhp6yhy42YPA/I=
Received: from MWHPR11MB0062.namprd11.prod.outlook.com (10.164.204.34) by
 MWHPR11MB0080.namprd11.prod.outlook.com (10.164.204.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 27 Sep 2019 14:43:15 +0000
Received: from MWHPR11MB0062.namprd11.prod.outlook.com
 ([fe80::8d90:195:7e7e:21a3]) by MWHPR11MB0062.namprd11.prod.outlook.com
 ([fe80::8d90:195:7e7e:21a3%7]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 14:43:15 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCHv2 1/2] uapi/linux/cec.h: add defines for the CEC UI Command
 Operand
Thread-Topic: [PATCHv2 1/2] uapi/linux/cec.h: add defines for the CEC UI
 Command Operand
Thread-Index: AQHVdUHly7552TMxsEa4H+p3vf6mJA==
Date:   Fri, 27 Sep 2019 14:43:15 +0000
Message-ID: <365f3161-3d77-8ba8-1a92-a9cd2c74df62@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hansverk@cisco.com; 
x-originating-ip: [173.38.220.39]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8384f4cb-22e7-4530-e9e0-08d7435907c1
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR11MB0080;
x-ms-traffictypediagnostic: MWHPR11MB0080:
x-microsoft-antispam-prvs: <MWHPR11MB0080745D6F5169FBEC756152DE810@MWHPR11MB0080.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:127;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(189003)(199004)(65806001)(476003)(486006)(6506007)(31696002)(66066001)(65956001)(2616005)(31686004)(71190400001)(36756003)(99286004)(478600001)(71200400001)(6916009)(256004)(14454004)(7736002)(186003)(6486002)(5660300002)(58126008)(2906002)(305945005)(91956017)(76116006)(14444005)(81156014)(81166006)(64756008)(8676002)(6116002)(6436002)(26005)(66476007)(66556008)(6512007)(316002)(8936002)(66446008)(86362001)(66946007)(3846002)(102836004)(66574012)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR11MB0080;H:MWHPR11MB0062.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9Vq89o5HOCvqt23Q53KCVlju5r13Sh81gtXMHx2BJD73FgPkP7zw/0rezpM/XN9Bnef96ZYy5hNO5j+HGFgN9PZoeuqgpC/tcpDGgkaqo/zypMtCUEFw/D3OYdgJhOlqILc4PJXtGYoswB4gV56wT01+3airxVzbeqX+/ZibXY8VRx2GRX34GuYRnD8ltBmEiC1A5jOf/K1Kw7svDhic+uQC6l/D/88mOODMdYjLtJlr9JXgQfN2jgW7k/iGSm4gxALzhDChQQpDbuuVjp/QmqNnz0WLH+BXBfdz6Rnj9VJTzTanA9TyH3lu1pR8xHJ8V0dJBuWw70JKd3ftQ2WRbVDsJInK2S4AE1EKkqen+iQ/y685ALPHzVKSbpR8+5W8XF5xv14kbjEpOhV3AmPyXs03vIvwy1dSbS+4ObtuQnE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <308B514D9362DE43B8C0460BE5CF2528@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8384f4cb-22e7-4530-e9e0-08d7435907c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 14:43:15.6744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZVjy/bm2HmXbwRo93Ft0LkQOj5bgWMrBJ8SPSmM4+DRJuapkJ4Y7UQrCIbiZT9oJn7wfqlbe0p1Avw7pFobJoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0080
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.22, xch-aln-012.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhlc2UgZGVmaW5lcyB3ZXJlIG5ldmVyIGFkZGVkIHRvIHRoaXMgQ0VDIGhlYWRlciwgbGlrZWx5
IGR1ZQ0KdG8gbGF6aW5lc3Mgb24gdGhlIHBhcnQgb2YgdGhlIG9yaWdpbmFsIGF1dGhvciwgaS5l
LiBtZS4NCg0KQnV0IGl0IGlzIHVzZWZ1bCB0byBoYXZlIHRoZW0sIHNvIGFkZCB0aGVtLg0KDQpB
bHNvIHVwZGF0ZSB0aGUgY2VjLmgucnN0LmV4Y2VwdGlvbnMgZmlsZSB0byBhdm9pZCBlcnJvcnMg
d2hlbg0KYnVpbGRpbmcgdGhlIGRvY3VtZW50YXRpb24uDQoNClNpZ25lZC1vZmYtYnk6IEhhbnMg
VmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPg0KLS0tDQpDaGFuZ2VzIHNpbmNlIHYx
Og0KDQotIGFkZCB0aGUgbmV3IGRlZmluZXMgdG8gY2VjLmgucnN0LmV4Y2VwdGlvbnMNCi0gdGhl
IENFQ19PUF9VSV9DTURfRjFfQkxVRSBkZWZpbmUgaGFkIGEgc3B1cmlvdXMgXyBhdCB0aGUgZW5k
LCB0aGlzIHdhcyByZW1vdmVkLg0KLS0tDQogRG9jdW1lbnRhdGlvbi9tZWRpYS9jZWMuaC5yc3Qu
ZXhjZXB0aW9ucyB8IDg5ICsrKysrKysrKysrKysrKysrKysrKysrKw0KIGluY2x1ZGUvdWFwaS9s
aW51eC9jZWMuaCAgICAgICAgICAgICAgICAgfCA4OSArKysrKysrKysrKysrKysrKysrKysrKysN
CiAyIGZpbGVzIGNoYW5nZWQsIDE3OCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL21lZGlhL2NlYy5oLnJzdC5leGNlcHRpb25zIGIvRG9jdW1lbnRhdGlvbi9tZWRp
YS9jZWMuaC5yc3QuZXhjZXB0aW9ucw0KaW5kZXggMDE0ODE2ZDA0YjllLi5kODM3OTBjY2FjOGUg
MTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL21lZGlhL2NlYy5oLnJzdC5leGNlcHRpb25zDQor
KysgYi9Eb2N1bWVudGF0aW9uL21lZGlhL2NlYy5oLnJzdC5leGNlcHRpb25zDQpAQCAtMzM1LDYg
KzMzNSw5NSBAQCBpZ25vcmUgZGVmaW5lIENFQ19PUF9NRU5VX1NUQVRFX0RFQUNUSVZBVEVEDQoN
CiBpZ25vcmUgZGVmaW5lIENFQ19NU0dfVVNFUl9DT05UUk9MX1BSRVNTRUQNCg0KK2lnbm9yZSBk
ZWZpbmUgQ0VDX09QX1VJX0NNRF9TRUxFQ1QNCitpZ25vcmUgZGVmaW5lIENFQ19PUF9VSV9DTURf
VVANCitpZ25vcmUgZGVmaW5lIENFQ19PUF9VSV9DTURfRE9XTg0KK2lnbm9yZSBkZWZpbmUgQ0VD
X09QX1VJX0NNRF9MRUZUDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX1JJR0hUDQoraWdu
b3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX1JJR0hUX1VQDQoraWdub3JlIGRlZmluZSBDRUNfT1Bf
VUlfQ01EX1JJR0hUX0RPV04NCitpZ25vcmUgZGVmaW5lIENFQ19PUF9VSV9DTURfTEVGVF9VUA0K
K2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9MRUZUX0RPV04NCitpZ25vcmUgZGVmaW5lIENF
Q19PUF9VSV9DTURfREVWSUNFX1JPT1RfTUVOVQ0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NN
RF9ERVZJQ0VfU0VUVVBfTUVOVQ0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9DT05URU5U
U19NRU5VDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX0ZBVk9SSVRFX01FTlUNCitpZ25v
cmUgZGVmaW5lIENFQ19PUF9VSV9DTURfQkFDSw0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NN
RF9NRURJQV9UT1BfTUVOVQ0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9NRURJQV9DT05U
RVhUX1NFTlNJVElWRV9NRU5VDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX05VTUJFUl9F
TlRSWV9NT0RFDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX05VTUJFUl8xMQ0KK2lnbm9y
ZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9OVU1CRVJfMTINCitpZ25vcmUgZGVmaW5lIENFQ19PUF9V
SV9DTURfTlVNQkVSXzBfT1JfTlVNQkVSXzEwDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01E
X05VTUJFUl8xDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX05VTUJFUl8yDQoraWdub3Jl
IGRlZmluZSBDRUNfT1BfVUlfQ01EX05VTUJFUl8zDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlf
Q01EX05VTUJFUl80DQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX05VTUJFUl81DQoraWdu
b3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX05VTUJFUl82DQoraWdub3JlIGRlZmluZSBDRUNfT1Bf
VUlfQ01EX05VTUJFUl83DQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX05VTUJFUl84DQor
aWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX05VTUJFUl85DQoraWdub3JlIGRlZmluZSBDRUNf
T1BfVUlfQ01EX0RPVA0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9FTlRFUg0KK2lnbm9y
ZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9DTEVBUg0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NN
RF9ORVhUX0ZBVk9SSVRFDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX0NIQU5ORUxfVVAN
CitpZ25vcmUgZGVmaW5lIENFQ19PUF9VSV9DTURfQ0hBTk5FTF9ET1dODQoraWdub3JlIGRlZmlu
ZSBDRUNfT1BfVUlfQ01EX1BSRVZJT1VTX0NIQU5ORUwNCitpZ25vcmUgZGVmaW5lIENFQ19PUF9V
SV9DTURfU09VTkRfU0VMRUNUDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX0lOUFVUX1NF
TEVDVA0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9ESVNQTEFZX0lORk9STUFUSU9ODQor
aWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX0hFTFANCitpZ25vcmUgZGVmaW5lIENFQ19PUF9V
SV9DTURfUEFHRV9VUA0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9QQUdFX0RPV04NCitp
Z25vcmUgZGVmaW5lIENFQ19PUF9VSV9DTURfUE9XRVINCitpZ25vcmUgZGVmaW5lIENFQ19PUF9V
SV9DTURfVk9MVU1FX1VQDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX1ZPTFVNRV9ET1dO
DQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX01VVEUNCitpZ25vcmUgZGVmaW5lIENFQ19P
UF9VSV9DTURfUExBWQ0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9TVE9QDQoraWdub3Jl
IGRlZmluZSBDRUNfT1BfVUlfQ01EX1BBVVNFDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01E
X1JFQ09SRA0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9SRVdJTkQNCitpZ25vcmUgZGVm
aW5lIENFQ19PUF9VSV9DTURfRkFTVF9GT1JXQVJEDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlf
Q01EX0VKRUNUDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX1NLSVBfRk9SV0FSRA0KK2ln
bm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9TS0lQX0JBQ0tXQVJEDQoraWdub3JlIGRlZmluZSBD
RUNfT1BfVUlfQ01EX1NUT1BfUkVDT1JEDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX1BB
VVNFX1JFQ09SRA0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9BTkdMRQ0KK2lnbm9yZSBk
ZWZpbmUgQ0VDX09QX1VJX0NNRF9TVUJfUElDVFVSRQ0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJ
X0NNRF9WSURFT19PTl9ERU1BTkQNCitpZ25vcmUgZGVmaW5lIENFQ19PUF9VSV9DTURfRUxFQ1RS
T05JQ19QUk9HUkFNX0dVSURFDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX1RJTUVSX1BS
T0dSQU1NSU5HDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX0lOSVRJQUxfQ09ORklHVVJB
VElPTg0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9TRUxFQ1RfQlJPQURDQVNUX1RZUEUN
CitpZ25vcmUgZGVmaW5lIENFQ19PUF9VSV9DTURfU0VMRUNUX1NPVU5EX1BSRVNFTlRBVElPTg0K
K2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9BVURJT19ERVNDUklQVElPTg0KK2lnbm9yZSBk
ZWZpbmUgQ0VDX09QX1VJX0NNRF9JTlRFUk5FVA0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NN
RF8zRF9NT0RFDQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX1BMQVlfRlVOQ1RJT04NCitp
Z25vcmUgZGVmaW5lIENFQ19PUF9VSV9DTURfUEFVU0VfUExBWV9GVU5DVElPTg0KK2lnbm9yZSBk
ZWZpbmUgQ0VDX09QX1VJX0NNRF9SRUNPUkRfRlVOQ1RJT04NCitpZ25vcmUgZGVmaW5lIENFQ19P
UF9VSV9DTURfUEFVU0VfUkVDT1JEX0ZVTkNUSU9ODQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlf
Q01EX1NUT1BfRlVOQ1RJT04NCitpZ25vcmUgZGVmaW5lIENFQ19PUF9VSV9DTURfTVVURV9GVU5D
VElPTg0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9SRVNUT1JFX1ZPTFVNRV9GVU5DVElP
Tg0KK2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9UVU5FX0ZVTkNUSU9ODQoraWdub3JlIGRl
ZmluZSBDRUNfT1BfVUlfQ01EX1NFTEVDVF9NRURJQV9GVU5DVElPTg0KK2lnbm9yZSBkZWZpbmUg
Q0VDX09QX1VJX0NNRF9TRUxFQ1RfQVZfSU5QVVRfRlVOQ1RJT04NCitpZ25vcmUgZGVmaW5lIENF
Q19PUF9VSV9DTURfU0VMRUNUX0FVRElPX0lOUFVUX0ZVTkNUSU9ODQoraWdub3JlIGRlZmluZSBD
RUNfT1BfVUlfQ01EX1BPV0VSX1RPR0dMRV9GVU5DVElPTg0KK2lnbm9yZSBkZWZpbmUgQ0VDX09Q
X1VJX0NNRF9QT1dFUl9PRkZfRlVOQ1RJT04NCitpZ25vcmUgZGVmaW5lIENFQ19PUF9VSV9DTURf
UE9XRVJfT05fRlVOQ1RJT04NCitpZ25vcmUgZGVmaW5lIENFQ19PUF9VSV9DTURfRjFfQkxVRQ0K
K2lnbm9yZSBkZWZpbmUgQ0VDX09QX1VJX0NNRF9GMl9SRUQNCitpZ25vcmUgZGVmaW5lIENFQ19P
UF9VSV9DTURfRjNfR1JFRU4NCitpZ25vcmUgZGVmaW5lIENFQ19PUF9VSV9DTURfRjRfWUVMTE9X
DQoraWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQ01EX0Y1DQoraWdub3JlIGRlZmluZSBDRUNfT1Bf
VUlfQ01EX0RBVEENCisNCiBpZ25vcmUgZGVmaW5lIENFQ19PUF9VSV9CQ0FTVF9UWVBFX1RPR0dM
RV9BTEwNCiBpZ25vcmUgZGVmaW5lIENFQ19PUF9VSV9CQ0FTVF9UWVBFX1RPR0dMRV9ESUdfQU5B
DQogaWdub3JlIGRlZmluZSBDRUNfT1BfVUlfQkNBU1RfVFlQRV9BTkFMT0dVRQ0KZGlmZiAtLWdp
dCBhL2luY2x1ZGUvdWFwaS9saW51eC9jZWMuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9jZWMuaA0K
aW5kZXggNTcwNGZhMDI5MmI1Li5kOGMwNGViNzlkODkgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL3Vh
cGkvbGludXgvY2VjLmgNCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9jZWMuaA0KQEAgLTgyMCw2
ICs4MjAsOTUgQEAgc3RydWN0IGNlY19ldmVudCB7DQogI2RlZmluZSBDRUNfT1BfTUVOVV9TVEFU
RV9ERUFDVElWQVRFRAkJCTB4MDENCg0KICNkZWZpbmUgQ0VDX01TR19VU0VSX0NPTlRST0xfUFJF
U1NFRAkJCTB4NDQNCisvKiBVSSBDb21tYW5kIE9wZXJhbmQgKHVpX2NtZCkgKi8NCisjZGVmaW5l
IENFQ19PUF9VSV9DTURfU0VMRUNUCQkJCTB4MDANCisjZGVmaW5lIENFQ19PUF9VSV9DTURfVVAJ
CQkJMHgwMQ0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9ET1dOCQkJCTB4MDINCisjZGVmaW5lIENF
Q19PUF9VSV9DTURfTEVGVAkJCQkweDAzDQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX1JJR0hUCQkJ
CTB4MDQNCisjZGVmaW5lIENFQ19PUF9VSV9DTURfUklHSFRfVVAJCQkJMHgwNQ0KKyNkZWZpbmUg
Q0VDX09QX1VJX0NNRF9SSUdIVF9ET1dOCQkJMHgwNg0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9M
RUZUX1VQCQkJCTB4MDcNCisjZGVmaW5lIENFQ19PUF9VSV9DTURfTEVGVF9ET1dOCQkJCTB4MDgN
CisjZGVmaW5lIENFQ19PUF9VSV9DTURfREVWSUNFX1JPT1RfTUVOVQkJCTB4MDkNCisjZGVmaW5l
IENFQ19PUF9VSV9DTURfREVWSUNFX1NFVFVQX01FTlUJCQkweDBhDQorI2RlZmluZSBDRUNfT1Bf
VUlfQ01EX0NPTlRFTlRTX01FTlUJCQkweDBiDQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX0ZBVk9S
SVRFX01FTlUJCQkweDBjDQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX0JBQ0sJCQkJMHgwZA0KKyNk
ZWZpbmUgQ0VDX09QX1VJX0NNRF9NRURJQV9UT1BfTUVOVQkJCTB4MTANCisjZGVmaW5lIENFQ19P
UF9VSV9DTURfTUVESUFfQ09OVEVYVF9TRU5TSVRJVkVfTUVOVQkweDExDQorI2RlZmluZSBDRUNf
T1BfVUlfQ01EX05VTUJFUl9FTlRSWV9NT0RFCQkJMHgxZA0KKyNkZWZpbmUgQ0VDX09QX1VJX0NN
RF9OVU1CRVJfMTEJCQkJMHgxZQ0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9OVU1CRVJfMTIJCQkJ
MHgxZg0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9OVU1CRVJfMF9PUl9OVU1CRVJfMTAJCTB4MjAN
CisjZGVmaW5lIENFQ19PUF9VSV9DTURfTlVNQkVSXzEJCQkJMHgyMQ0KKyNkZWZpbmUgQ0VDX09Q
X1VJX0NNRF9OVU1CRVJfMgkJCQkweDIyDQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX05VTUJFUl8z
CQkJCTB4MjMNCisjZGVmaW5lIENFQ19PUF9VSV9DTURfTlVNQkVSXzQJCQkJMHgyNA0KKyNkZWZp
bmUgQ0VDX09QX1VJX0NNRF9OVU1CRVJfNQkJCQkweDI1DQorI2RlZmluZSBDRUNfT1BfVUlfQ01E
X05VTUJFUl82CQkJCTB4MjYNCisjZGVmaW5lIENFQ19PUF9VSV9DTURfTlVNQkVSXzcJCQkJMHgy
Nw0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9OVU1CRVJfOAkJCQkweDI4DQorI2RlZmluZSBDRUNf
T1BfVUlfQ01EX05VTUJFUl85CQkJCTB4MjkNCisjZGVmaW5lIENFQ19PUF9VSV9DTURfRE9UCQkJ
CTB4MmENCisjZGVmaW5lIENFQ19PUF9VSV9DTURfRU5URVIJCQkJMHgyYg0KKyNkZWZpbmUgQ0VD
X09QX1VJX0NNRF9DTEVBUgkJCQkweDJjDQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX05FWFRfRkFW
T1JJVEUJCQkweDJmDQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX0NIQU5ORUxfVVAJCQkweDMwDQor
I2RlZmluZSBDRUNfT1BfVUlfQ01EX0NIQU5ORUxfRE9XTgkJCTB4MzENCisjZGVmaW5lIENFQ19P
UF9VSV9DTURfUFJFVklPVVNfQ0hBTk5FTAkJCTB4MzINCisjZGVmaW5lIENFQ19PUF9VSV9DTURf
U09VTkRfU0VMRUNUCQkJMHgzMw0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9JTlBVVF9TRUxFQ1QJ
CQkweDM0DQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX0RJU1BMQVlfSU5GT1JNQVRJT04JCTB4MzUN
CisjZGVmaW5lIENFQ19PUF9VSV9DTURfSEVMUAkJCQkweDM2DQorI2RlZmluZSBDRUNfT1BfVUlf
Q01EX1BBR0VfVVAJCQkJMHgzNw0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9QQUdFX0RPV04JCQkJ
MHgzOA0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9QT1dFUgkJCQkweDQwDQorI2RlZmluZSBDRUNf
T1BfVUlfQ01EX1ZPTFVNRV9VUAkJCQkweDQxDQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX1ZPTFVN
RV9ET1dOCQkJMHg0Mg0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9NVVRFCQkJCTB4NDMNCisjZGVm
aW5lIENFQ19PUF9VSV9DTURfUExBWQkJCQkweDQ0DQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX1NU
T1AJCQkJMHg0NQ0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9QQVVTRQkJCQkweDQ2DQorI2RlZmlu
ZSBDRUNfT1BfVUlfQ01EX1JFQ09SRAkJCQkweDQ3DQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX1JF
V0lORAkJCQkweDQ4DQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX0ZBU1RfRk9SV0FSRAkJCTB4NDkN
CisjZGVmaW5lIENFQ19PUF9VSV9DTURfRUpFQ1QJCQkJMHg0YQ0KKyNkZWZpbmUgQ0VDX09QX1VJ
X0NNRF9TS0lQX0ZPUldBUkQJCQkweDRiDQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX1NLSVBfQkFD
S1dBUkQJCQkweDRjDQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX1NUT1BfUkVDT1JECQkJMHg0ZA0K
KyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9QQVVTRV9SRUNPUkQJCQkweDRlDQorI2RlZmluZSBDRUNf
T1BfVUlfQ01EX0FOR0xFCQkJCTB4NTANCisjZGVmaW5lIENFQ19PUF9VSV9DTURfU1VCX1BJQ1RV
UkUJCQkweDUxDQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX1ZJREVPX09OX0RFTUFORAkJCTB4NTIN
CisjZGVmaW5lIENFQ19PUF9VSV9DTURfRUxFQ1RST05JQ19QUk9HUkFNX0dVSURFCQkweDUzDQor
I2RlZmluZSBDRUNfT1BfVUlfQ01EX1RJTUVSX1BST0dSQU1NSU5HCQkJMHg1NA0KKyNkZWZpbmUg
Q0VDX09QX1VJX0NNRF9JTklUSUFMX0NPTkZJR1VSQVRJT04JCTB4NTUNCisjZGVmaW5lIENFQ19P
UF9VSV9DTURfU0VMRUNUX0JST0FEQ0FTVF9UWVBFCQkweDU2DQorI2RlZmluZSBDRUNfT1BfVUlf
Q01EX1NFTEVDVF9TT1VORF9QUkVTRU5UQVRJT04JCTB4NTcNCisjZGVmaW5lIENFQ19PUF9VSV9D
TURfQVVESU9fREVTQ1JJUFRJT04JCQkweDU4DQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX0lOVEVS
TkVUCQkJCTB4NTkNCisjZGVmaW5lIENFQ19PUF9VSV9DTURfM0RfTU9ERQkJCQkweDVhDQorI2Rl
ZmluZSBDRUNfT1BfVUlfQ01EX1BMQVlfRlVOQ1RJT04JCQkweDYwDQorI2RlZmluZSBDRUNfT1Bf
VUlfQ01EX1BBVVNFX1BMQVlfRlVOQ1RJT04JCTB4NjENCisjZGVmaW5lIENFQ19PUF9VSV9DTURf
UkVDT1JEX0ZVTkNUSU9OCQkJMHg2Mg0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9QQVVTRV9SRUNP
UkRfRlVOQ1RJT04JCTB4NjMNCisjZGVmaW5lIENFQ19PUF9VSV9DTURfU1RPUF9GVU5DVElPTgkJ
CTB4NjQNCisjZGVmaW5lIENFQ19PUF9VSV9DTURfTVVURV9GVU5DVElPTgkJCTB4NjUNCisjZGVm
aW5lIENFQ19PUF9VSV9DTURfUkVTVE9SRV9WT0xVTUVfRlVOQ1RJT04JCTB4NjYNCisjZGVmaW5l
IENFQ19PUF9VSV9DTURfVFVORV9GVU5DVElPTgkJCTB4NjcNCisjZGVmaW5lIENFQ19PUF9VSV9D
TURfU0VMRUNUX01FRElBX0ZVTkNUSU9OCQkweDY4DQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX1NF
TEVDVF9BVl9JTlBVVF9GVU5DVElPTgkJMHg2OQ0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9TRUxF
Q1RfQVVESU9fSU5QVVRfRlVOQ1RJT04JMHg2YQ0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9QT1dF
Ul9UT0dHTEVfRlVOQ1RJT04JCTB4NmINCisjZGVmaW5lIENFQ19PUF9VSV9DTURfUE9XRVJfT0ZG
X0ZVTkNUSU9OCQkweDZjDQorI2RlZmluZSBDRUNfT1BfVUlfQ01EX1BPV0VSX09OX0ZVTkNUSU9O
CQkJMHg2ZA0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9GMV9CTFVFCQkJCTB4NzENCisjZGVmaW5l
IENFQ19PUF9VSV9DTURfRjJfUkVECQkJCTB4NzINCisjZGVmaW5lIENFQ19PUF9VSV9DTURfRjNf
R1JFRU4JCQkJMHg3Mw0KKyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9GNF9ZRUxMT1cJCQkJMHg3NA0K
KyNkZWZpbmUgQ0VDX09QX1VJX0NNRF9GNQkJCQkweDc1DQorI2RlZmluZSBDRUNfT1BfVUlfQ01E
X0RBVEEJCQkJMHg3Ng0KIC8qIFVJIEJyb2FkY2FzdCBUeXBlIE9wZXJhbmQgKHVpX2JjYXN0X3R5
cGUpICovDQogI2RlZmluZSBDRUNfT1BfVUlfQkNBU1RfVFlQRV9UT0dHTEVfQUxMCQkJMHgwMA0K
ICNkZWZpbmUgQ0VDX09QX1VJX0JDQVNUX1RZUEVfVE9HR0xFX0RJR19BTkEJCTB4MDENCi0tIA0K
Mi4yMy4wLnJjMQ0KDQo=
