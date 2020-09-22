Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3795F273A4E
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 07:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbgIVFi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 01:38:58 -0400
Received: from mail-eopbgr60074.outbound.protection.outlook.com ([40.107.6.74]:42371
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726497AbgIVFi5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 01:38:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8PW3um7KV6lcTiIQQ5r+hSDeXejQj8w9iOup5KhdWyDkZACIoKThFnj/CWhvGNhuJsfCgLoVQh+8xHylsK6/nqsabPlMz1j03XvcbASCk38Ql9L1lai3F6D3S91QptNj+9wyDtIYDBfAY9doDR5DhQANmLmZ9HuXUgKULJmIFBURuQYpJGBIiQ/cpRQSotEOSrrqErDmjTd3TPrtOXCK/LIlyK77d/D+9SNlJKfTbzHIeeXL74wSQgQwr0e4nb6ekHUN3Qg4O+HTmHWOxKIhgjPgWDxNsQt70yNrooEr2i1ovLObhYzcTFx7ZYutIgcSebgjFdO4YY8zHHqnthsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFInAtCOufzpuJT/vXwR9TveZanWjqHTCymEIdW3KMY=;
 b=bqGYiBeNW9SxM3/Df5gaz2jaLAFWIN9TwDQZjB+NCit5pO0tK53CYcVDsyx2UYS/GIMZXgD5RA0E78Sig3YCLVQKXAQ8NFxUgB3sI2Z2L2LSHQ6J6VCgce92k2ZE6tt5NIMtMQ5tr+yzpxUfEhq+gLBXTEGGwBQODLo5MjRaSEFwNfke5UINnJeBycEzL18V1o3XsgN4UWxS2rq9h5V0M+T+57fEdHnni4aaErph7xpP2mGjD0iwIvGNFk0kDF0QVudvXbQ0FZ0za2YwirANrcDvKSkIPageHPHBhQaDveWq1rlEfjpicu5au1kKd4CGdVrANQSAD6miYX6wzm9ZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFInAtCOufzpuJT/vXwR9TveZanWjqHTCymEIdW3KMY=;
 b=S5EHsnoESXYIMvR0HuRo+LS4h+1i43LOWX3eHRE4euit6npiO6ZNC5ZFF/xnR4R7U/40wqDDoygHykMA+2Vdu3YxwsjTD9JpsNzeCvGnAfPcYKh3Q0VlZofFbBJUOT86mQaAB2d2M5fKCeg4eMad5n3RGPjrEnOviypSX4MbBpg=
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB6PR04MB3095.eurprd04.prod.outlook.com (2603:10a6:6:11::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 05:38:54 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3391.011; Tue, 22 Sep 2020
 05:38:54 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sean@mess.org" <sean@mess.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 0/2] add QoS support for cpuidle system
Thread-Topic: [PATCH V2 0/2] add QoS support for cpuidle system
Thread-Index: AQHWjaToTSANC+n2mk++k582VkkwTal0Kc0g
Date:   Tue, 22 Sep 2020 05:38:54 +0000
Message-ID: <DB8PR04MB6795D6319089ACB955D7F5FFE63B0@DB8PR04MB6795.eurprd04.prod.outlook.com>
References: <20200918181717.24056-1-qiangqing.zhang@nxp.com>
In-Reply-To: <20200918181717.24056-1-qiangqing.zhang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e0dfc7b4-c41e-4a1c-5b86-08d85eb9cb51
x-ms-traffictypediagnostic: DB6PR04MB3095:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR04MB30953BED5656FD29AFC360D5E63B0@DB6PR04MB3095.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pCpZmnNoNhRCLiX9UbVux00W2tAsVIh0ZlKJGwErhWV55nYM3MUVsWfDFFhh/n53VOr68sPLegiQCamAJsbZbGrXWgCVNst9Ug7ZrVR6U89yDwsdgH5fms6SfolztL1hNT1U6UZUrIE7dtNBrKipaGDTk7chJPHCVkoIjYRD0iIfstCekV6mBMM4uKKN+aTO6DfLiEw/M3L/EfvdSy9trQhOFtVN+3PMSJ5hh8mvmSflnAM1o3a6JH5m9eMHzAS7/OjxFh30+cN5vru3Wq5oxpLMTF2/4dXAWGSKxTYAR0A4OGiTWuPQtd0hiaVaVJa+m3kbS8v/NobODFaoUpX28DgF88OHxikdBvkkzByOAi48hClXISTUnNFIsKkJsjbT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(8676002)(66446008)(64756008)(76116006)(110136005)(66556008)(54906003)(66946007)(33656002)(71200400001)(55016002)(66476007)(478600001)(9686003)(83380400001)(26005)(186003)(52536014)(4326008)(7696005)(8936002)(53546011)(6506007)(86362001)(4744005)(316002)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: VAKf/zIIzBhKY0u+wb/Qt8LaYLi5r1ootT0lEbOP4r+AxFE646exXX4U0RFWQVeadlF/0KS69HH3fwuuTe07i6MO121sdmdzClF/GS+MZuFhuyrq0wqttJtIl120WIAbspl/PmBTgq9r0MA1OLWEPQi3Mo9Lqwdsbwfd+jaR2dwBXwEjL10ipYhqTWRpD2plmEbtpG0CAu5FEc+h4OeeVHbGiXlr7KOKIh9e3B91GkbAbJ7Ud+5/HrKGY4dbYVq+BhBvnZnpU7WUuvwP13htH+Eic3Tu3qJqBWlVXrqNKbH8ZAfKdPqnP1QAEv4Vm+f8JbLaJkO/KlLe6HKyHyu2i7Ne25r7RlV2wBpvsNlV/IThqjj8zSS3h4DLS9UTcSxzkRZmWh7xXYCiiA+u8GoOMB/+yrwcnlnKgqilYVO/f/WjkO0NDURBIEemgIa/PVIUdK/EG0QMzydBFb1DmShc5DcyCNG71ThgrG6E/eHuFxP7E9rvVF1EqPdygHZDKd/VfmyjRDm/guEufmMWj/dQ2GRx7oi3MLc/Of9vLqCQAfZTDBO7CA/884wzWtCs2AhcfXAaFDvQcUj4mGuLd3lrMt5agaFHYF/OvROztCJBlaDuTk8ABaLHFTVWvRE2IyZjLCsA2LksxPyZdNENgqNDug==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0dfc7b4-c41e-4a1c-5b86-08d85eb9cb51
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 05:38:54.4379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cNGCFtApsjw2W7B2AMO+0OWFFdq7PszKmktfGzwY/U4XwMGqWDDCrNaYeLNxlaHQfDS1h3e6AFpuOmM6AHxL1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3095
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQpIaSBTZWFuLA0KDQpBbnkgY29tbWVudHM/DQoNCkJlc3QgUmVnYXJkcywNCkpvYWtpbSBaaGFu
Zw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvYWtpbSBaaGFuZyA8
cWlhbmdxaW5nLnpoYW5nQG54cC5jb20+DQo+IFNlbnQ6IDIwMjDE6jnUwjE5yNUgMjoxNw0KPiBU
bzogbWNoZWhhYkBrZXJuZWwub3JnOyByb2JoK2R0QGtlcm5lbC5vcmc7IHNlYW5AbWVzcy5vcmcN
Cj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGlu
dXgtaW14QG54cC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBWMiAwLzJdIGFkZCBRb1Mgc3VwcG9y
dCBmb3IgY3B1aWRsZSBzeXN0ZW0NCj4gDQo+IEFkZCBRb1Mgc3VwcG9ydCBmb3IgY3B1aWRsZSBz
eXN0ZW0uDQo+IA0KPiBKb2FraW0gWmhhbmcgKDIpOg0KPiAgIGJpbmRpbmdzOiBtZWRpYTogZ3Bp
by1pci1yZWNlaXZlcjogYWRkIGxpbnV4LGF1dG9zdXNwZW5kLXBlcmlvZA0KPiAgICAgcHJvcGVy
dHkNCj4gICBtZWRpYTogcmM6IGdwaW8taXItcmVjdjogYWRkIFFvUyBzdXBwb3J0IGZvciBjcHVp
ZGxlIHN5c3RlbQ0KPiANCj4gIC4uLi9iaW5kaW5ncy9tZWRpYS9ncGlvLWlyLXJlY2VpdmVyLnR4
dCAgICAgICB8ICAzICsrDQo+ICBkcml2ZXJzL21lZGlhL3JjL2dwaW8taXItcmVjdi5jICAgICAg
ICAgICAgICAgfCA1MCArKysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUz
IGluc2VydGlvbnMoKykNCj4gDQo+IC0tDQo+IDIuMTcuMQ0KDQo=
