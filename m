Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA7F86CDD4
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 14:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbfGRMHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 08:07:16 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:12700 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726715AbfGRMHQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 08:07:16 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6IC43Vb032713;
        Thu, 18 Jul 2019 05:07:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=proofpoint;
 bh=EZJeBTVR2eK/S8AamVrzFbA3W8V1j26PA4cJalCC+V4=;
 b=LeyNW4RVGgPxtUbMagKk1Sm+i1vd2s8nb9DI2PVpusg8Wo6hD0CfnbVtzwYyQWl7B45E
 r/PHqnrcppMx6Zsag7RhOy46zhH6HdtM+sD4IL9J1U5NL0ydZtOxauCMc/B6uFK+JQnM
 WOzUMg24U9N8ZG5HaD3CDcy7HUZo61R7cAnt0p3Y5E1zSIgxUjBy6A8cH58ds96dF7vV
 G+1CXFchv5jU2RBhvhjT55UfyZorVH6QIq4GV2SqAtx/X2sFGd6txz0935ilubayM8c0
 Jvg4sRjfROZp86ri0a0GIWOXGiZVwyl1HJmHpb76Wkax64zoKzpgDrA6Xhe146EKkCl4 cg== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam03-by2-obe.outbound.protection.outlook.com (mail-by2nam03lp2050.outbound.protection.outlook.com [104.47.42.50])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2tqavwv732-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 18 Jul 2019 05:07:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cq+cIGYLfa60tqeDhdwv0Y2KOsVBLjqF49FbdEflDwEDYNlH4QlXvkPgjFfqW9cIbccCiZBYjrBepOxpb3KlgFkNwKGhCJKXiiWUmuzNubprmjJG/ZixZNdXN2QOXWbmDabvSkLdn7T10aQPKZlmQZTcUUjNCwAvx0dNW+q9+0T0Mn9Jf5pujvPS5KsFR4WkkEGT+B1BaGI2+NgVqW/XgoHsBb3QymkbdGWa5kGEF44mRScPVlB7zgdfbVC2MB6PpMrumbvYPOZf3CYn4MsAydFYqSUCJo7gn8iHDTgU/6f8LT3uUsP/1+R+cQlXIgDbMVh2lPq+BS9KpG2gzc8ZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZJeBTVR2eK/S8AamVrzFbA3W8V1j26PA4cJalCC+V4=;
 b=StoFDr5J1muYVdKZDugHHvAxXuM7PWOK0JteAbDMRkcVita+iKVG2D62buAlTgl43wnlQjC4g68Nw20GDhw1PbDjHHYspZJRu1gsIprtB1BiSrGagNZqglz5Gtj7oFwzOVwBY4w+0hJ2lMSrmklmABAYqx23cIevPa2xaOOWsSA9M6n9pfbzIcPu2H1KpfRsc772nxtKoSONzMvgIhhYXSPoOr1UhtfwNfYeXfxNpLdL1kQnbxSK8CkEveo+lEuHtwdXJfKsG6N526li6IlnMqjs+Gd8+F02e+eDY+qxFTQKGndAUSKVVrdHVcK7s3NxqRDSD57NszXX7QUfcMQ6rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=cadence.com;dmarc=pass action=none
 header.from=cadence.com;dkim=pass header.d=cadence.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZJeBTVR2eK/S8AamVrzFbA3W8V1j26PA4cJalCC+V4=;
 b=ZIoHSOre0iSoMbncC1T0NBZ0NfYo5x+2rOgNwQsE4Lrged4JoioAyzuAc2i8aTPlEE8sLsTOOluco7GMHGtopV/nRTHv0RoTYmTCJriNT8ektQ6jxPpHMypWReLzgdBl4xvTsrLfMz73HERyFMumCb4XE6/cW/101M4ciKxdBos=
Received: from CY1PR07MB2521.namprd07.prod.outlook.com (10.167.16.12) by
 CY1PR07MB2586.namprd07.prod.outlook.com (10.166.206.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 12:07:09 +0000
Received: from CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::fdfa:c66c:60e5:9b07]) by CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::fdfa:c66c:60e5:9b07%10]) with mapi id 15.20.2094.011; Thu, 18 Jul
 2019 12:07:09 +0000
From:   Jan Kotas <jank@cadence.com>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
CC:     Jan Kotas <jank@cadence.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] media: Add lane checks for Cadence CSI2TX
Thread-Topic: [PATCH 2/3] media: Add lane checks for Cadence CSI2TX
Thread-Index: AQHVPVokB1lRWRlUyU+zijqVl4MU4KbQQ/WAgAAD+wA=
Date:   Thu, 18 Jul 2019 12:07:09 +0000
Message-ID: <9CAC42FF-30B1-4540-B58B-82A81353D37C@global.cadence.com>
References: <20190718111509.29924-1-jank@cadence.com>
 <20190718111509.29924-3-jank@cadence.com>
 <0fea09d4-1e8a-b9bf-b549-ee7cd72bd814@free.fr>
In-Reply-To: <0fea09d4-1e8a-b9bf-b549-ee7cd72bd814@free.fr>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 395807ea-7461-4826-4c37-08d70b7875a1
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY1PR07MB2586;
x-ms-traffictypediagnostic: CY1PR07MB2586:
x-microsoft-antispam-prvs: <CY1PR07MB25864275C1A3679162872107D0C80@CY1PR07MB2586.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:513;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(199004)(189003)(36092001)(7736002)(6486002)(102836004)(25786009)(99286004)(6916009)(305945005)(6246003)(446003)(53936002)(229853002)(4744005)(11346002)(476003)(6506007)(478600001)(53546011)(6436002)(76176011)(14454004)(54906003)(8676002)(33656002)(76116006)(4326008)(71200400001)(256004)(486006)(81166006)(316002)(81156014)(3846002)(6116002)(71190400001)(66066001)(26005)(186003)(68736007)(6512007)(86362001)(8936002)(66556008)(66476007)(66946007)(91956017)(64756008)(2906002)(66446008)(5660300002)(15866825006);DIR:OUT;SFP:1101;SCL:1;SRVR:CY1PR07MB2586;H:CY1PR07MB2521.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bsYDt6s9UG4VgDgdYkT9IKKzGWQttqtTMl6M9TuwrVW5ZYpIVoGFRAZQc5BT7iqeMQkvzdGFwVU+M5GQhJMyY+TLOb/nvaKIpdFW0E0KwFsNPUhTcxGIkA9dbr5sy0088BOD/i/tnafapo/rby3VbECd6O/ZF+GpkjJa0XV4djHur8OYOeezZNLC4evus6TXalGrcYv3aoDB/Akb+G1Er2/wW61qQeG5cGR1krczKoS0R/d5AJJ32c/t5TCi2z/s/IhLXy9/iJfuiLQktqKs1ZxZop23ia7N4X82/wiBdY1LmbEu1P9sYYhkm3Q+ncqCaJKRlVRZlAjyvsbNqkG71XFV4piks1e8iFLNnB+OQK9bPRYb2LvTFbPpePrzWE230ZuzpupvNAPcx6qLwUJ7/DZSq4xGgtTiTks93gHt0v4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B8C9BE056C7674682D4F18DFC3F4EF7@namprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395807ea-7461-4826-4c37-08d70b7875a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 12:07:09.2219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jank@global.cadence.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2586
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-18_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=555 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180129
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQo+IE9uIDE4IEp1bCAyMDE5LCBhdCAxMzo1MiwgTWFyYyBHb256YWxleiA8bWFyYy53Lmdvbnph
bGV6QGZyZWUuZnI+IHdyb3RlOg0KPiANCj4gRVhURVJOQUwgTUFJTA0KPiANCj4gDQo+IE9uIDE4
LzA3LzIwMTkgMTM6MTUsIEphbiBLb3RhcyB3cm90ZToNCj4gDQo+PiBUaGlzIHBhdGNoIGFkZHMg
bGluZSBjaGVja3MgZm9yIENTSTJUWCwgdG8gcHJldmVudA0KPj4gY2xvY2sgbGFuZSBiZWluZyB1
c2VkIGFzIGEgZGF0YSBsYW5lLg0KPiANCj4gImxpbmUgY2hlY2tzIiBvciAibGFuZSBjaGVja3M/
IF5fXg0KDQpZZXMsIHlvdeKAmXJlIHJpZ2h0LCBzaG91bGQgYmUgbGFuZSBjaGVja3MgOikNCg0K
UmVnYXJkcywNCkphbg0KDQo+IA0KPiBOQjogY29tbWl0IG1lc3NhZ2VzIG1heSBiZSB1cCB0byA3
Mi1jaGFyYWN0ZXItd2lkZSA7LSkNCj4gKE5vIG5lZWQgdG8gbGluZS13cmFwIGF0IDUwKQ0KPiAN
Cj4gUmVnYXJkcy4NCg0K
