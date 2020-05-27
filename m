Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7428E1E4561
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 16:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729461AbgE0ONJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 10:13:09 -0400
Received: from mail-dm6nam12on2062.outbound.protection.outlook.com ([40.107.243.62]:4673
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726069AbgE0ONI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 10:13:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cu+IKm0GDu2ugP1zrfDZCU5vadfgMe9cSStTqWAJTgwmlOa155WRxlGM+ohWpFigTPwCqYRkXuo4aGVtfcRdna8XMNdHc5VGrtPUC9rsZ/rD+T5lJMm/OmZtiQccPOiBhdfUnpzzYW/SjpJElgrjUg03F+a9R1ZI/zCPHqCwDslZS1xJLqaduAkxy3wQWJr0R9koCV6m4b8rvg4eUEas0ezpvhjNNyV5t6jLV7rzJjYCyTwYavl4hrHYBfq89tHo74LRYA0Z0Y7GmmXi4Jlo8n7PpjoLY24pVLlP9KPXbn32FGTtErLT5xsPw+ullEAKzZVK+ibvDomlpuwEETDgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/o2tae7R4E22TlXPOqtgrXvjZPkYdgQIEYMhqYHC0Tw=;
 b=kXxFokhxhbNwiEwqu/SBa68NzObtuNr2eE/aU1dyYKe07cZhu3aRjF/VDuyn/LBT/mQ/yg9WT3KOJIVj9K644NqqMW5N0y54QFSjc7jvKDOcXPn0NFD2kIug6NT/Q1x34aLmWTIG8fRHtULjDyLaToxGCU2h1aB9Emhv5rTE6QQRAQZ2zWpk8ceaHVbCslWRwAxYiwTz3PFDGCxauA6l4sbN87YyouJ4YQzmrx/Gb9iRL0qVEQBnDWxpd/Xfe7MxvM96wFlc23GNSKX2wiZFS8Fyq1x880Dba3vbh2p80bS7RsLKRoHrt3eEH1BQT3XeR9oGk4RRvXPYXBW235ME6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/o2tae7R4E22TlXPOqtgrXvjZPkYdgQIEYMhqYHC0Tw=;
 b=PGoOwVJtMoldzYzqMuWSthq5BtW8XNaPuRBnloChuZbyEShG97O9lS/adloTftTX/TKsEtbwIy/SzSsuiK41nZT21Wh/q0eKIcLd/4mY60n21N5tfledQq4I0oCM7zbBeac8pk0U7KTIzgnpRgptDPLXElr0olG5p92Nsq5L8qE=
Received: from DM6PR02MB6876.namprd02.prod.outlook.com (2603:10b6:5:22c::11)
 by DM6PR02MB4377.namprd02.prod.outlook.com (2603:10b6:5:22::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Wed, 27 May
 2020 14:13:01 +0000
Received: from DM6PR02MB6876.namprd02.prod.outlook.com
 ([fe80::ad68:d392:e519:f671]) by DM6PR02MB6876.namprd02.prod.outlook.com
 ([fe80::ad68:d392:e519:f671%9]) with mapi id 15.20.3021.029; Wed, 27 May 2020
 14:13:01 +0000
From:   Vishal Sagar <vsagar@xilinx.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Hyun Kwon <hyunk@xilinx.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>, Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v13 1/2] media: dt-bindings: media: xilinx: Add Xilinx
 MIPI CSI-2 Rx Subsystem
Thread-Topic: [PATCH v13 1/2] media: dt-bindings: media: xilinx: Add Xilinx
 MIPI CSI-2 Rx Subsystem
Thread-Index: AQHWKHDc6Gvs+SWyz0SjP54hjxgjuai2jc4AgAVYrQCAABy6AIAAC31g
Date:   Wed, 27 May 2020 14:13:01 +0000
Message-ID: <DM6PR02MB6876967667A2FDFA4ABD8AEFA7B10@DM6PR02MB6876.namprd02.prod.outlook.com>
References: <20200512151947.120348-1-vishal.sagar@xilinx.com>
 <20200512151947.120348-2-vishal.sagar@xilinx.com>
 <20200524020214.GB6026@pendragon.ideasonboard.com>
 <DM6PR02MB68762DFB8F24E485B9B302B6A7B10@DM6PR02MB6876.namprd02.prod.outlook.com>
 <20200527132344.GC6171@pendragon.ideasonboard.com>
In-Reply-To: <20200527132344.GC6171@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8c5fee14-7846-45b9-8a9a-08d8024810e8
x-ms-traffictypediagnostic: DM6PR02MB4377:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB4377C91BE94B515CA062AF04A7B10@DM6PR02MB4377.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u1qcx6ul8PWGR+dYl0gRg654cHSGgItypzd+Ey9KJTdfXzhMznQmeW+QMD5ZjmY8zfZ9lKcxf/UyV53qMlnah35YCTsPFewF9Yx9ERINoQ6F5zxyOEzbuMLZLs3j+FlvGn3K+/Uwy3yKgG3JP9U2UAKWuNzGyKuuQtaW/r9hn3pAr20mDU5tdpAmCTk8VZiBwmKMgdmDLY4fxyDEJiGf8PCVUWvOnRM6xnch8szG1Wk9u1T2gK8XWVXC0ZLM3PMRbHAdwhXxM9cAhMSNFX/3hierw1d1R+zXr8A6G1bmBIgDCbP7VCJdztPcNDjHkKjMTk5iRfHvJ7SIVxPt1qJfOxPckz1jWteaLBrBegGpCMkLVrkpYvdDMQnj0VvoYd1WPJPnHY4M5fGXZNNrBQcyDg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB6876.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39860400002)(136003)(366004)(396003)(8936002)(55016002)(478600001)(9686003)(71200400001)(6916009)(83380400001)(76116006)(52536014)(86362001)(66476007)(66446008)(66946007)(66556008)(64756008)(30864003)(5660300002)(966005)(26005)(8676002)(7416002)(4326008)(53546011)(316002)(33656002)(186003)(7696005)(54906003)(6506007)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: x1Y9S3anAXr5KvOhyf3jEiKmLAUT10heutnC9VGtd6+wrQ6BX+rKxxssNwSqpkcO9SbIkl1qFC29gD0YUj/Yky/a/Ecpb8uUizV0NSJPhe/poKaskODJmpC2rbRCOLxybiDHbTqYiFVXK0ygZL9px+Af/jf2UC2br4lyT2Iwa2p0M4DcJArgA9tsa/kf0PB/SDbLZtIEECSsAm1b0czBHAYigN/A2gihHszb6kDByepSMU0ihuBcwhhHWYT5U1PN79Ui9G8240eouGCgXWGfRTVd41Nq6oFqs7EZAXWgjn2KyI8yY1KMH0t7ND0XiIQzOi9xFFBuS/+sb2CABF5b0dvAOKLDqhehhZyQnn+yLd3lbs3FqPVWbHDLht+raZekWmPLnortr+KHvlxF07ovlr4OGrHmXQmw0OhSKJqYmi22aXP4KBb+HtL/iMwvDnseNTt5Uhr9PIiTC76hh+mx6cBOEpCh6kk2fwzXO/r8RKyfYrHCHZ+6Uf1jYHlPwb1X
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5fee14-7846-45b9-8a9a-08d8024810e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 14:13:01.6017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tVjPqxsbPCBn/Yd4WX+ebiqmmeI2xWmk8zpna2/cSlTUYJJ1JsNB15Syb0dcXNJqQMHbthTGwJd0rEm9Sf7ITQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4377
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgTWF5IDI3LCAyMDIwIDY6NTQgUE0NCj4gVG86IFZpc2hhbCBTYWdhciA8dnNh
Z2FyQHhpbGlueC5jb20+DQo+IENjOiBIeXVuIEt3b24gPGh5dW5rQHhpbGlueC5jb20+OyBtY2hl
aGFiQGtlcm5lbC5vcmc7DQo+IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5j
b207IE1pY2hhbCBTaW1law0KPiA8bWljaGFsc0B4aWxpbnguY29tPjsgbGludXgtbWVkaWFAdmdl
ci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgaGFucy52ZXJrdWls
QGNpc2NvLmNvbTsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgRGluZXNoIEt1bWFyDQo+IDxkaW5lc2hrQHhpbGlu
eC5jb20+OyBTYW5kaXAgS290aGFyaSA8c2FuZGlwa0B4aWxpbnguY29tPjsgTHVjYSBDZXJlc29s
aQ0KPiA8bHVjYUBsdWNhY2VyZXNvbGkubmV0PjsgSmFjb3BvIE1vbmRpIDxqYWNvcG9Aam1vbmRp
Lm9yZz47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjEzIDEvMl0gbWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogeGlsaW54OiBBZGQgWGls
aW54IE1JUEkNCj4gQ1NJLTIgUnggU3Vic3lzdGVtDQo+IA0KPiBIaSBWaXNoYWwsDQo+IA0KPiBP
biBXZWQsIE1heSAyNywgMjAyMCBhdCAxMTo1MzowMUFNICswMDAwLCBWaXNoYWwgU2FnYXIgd3Jv
dGU6DQo+ID4gT24gU3VuZGF5LCBNYXkgMjQsIDIwMjAgNzozMiBBTSwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgTWF5IDEyLCAyMDIwIGF0IDA4OjQ5OjQ2UE0gKzA1MzAs
IFZpc2hhbCBTYWdhciB3cm90ZToNCj4gPiA+ID4gQWRkIGJpbmRpbmdzIGRvY3VtZW50YXRpb24g
Zm9yIFhpbGlueCBNSVBJIENTSS0yIFJ4IFN1YnN5c3RlbS4NCj4gPiA+ID4NCj4gPiA+ID4gVGhl
IFhpbGlueCBNSVBJIENTSS0yIFJ4IFN1YnN5c3RlbSBjb25zaXN0cyBvZiBhIENTSS0yIFJ4DQo+
ID4gPiA+IGNvbnRyb2xsZXIsIGEgRC1QSFkgaW4gUnggbW9kZSBhbmQgYSBWaWRlbyBGb3JtYXQg
QnJpZGdlLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBWaXNoYWwgU2FnYXIgPHZp
c2hhbC5zYWdhckB4aWxpbnguY29tPg0KPiA+ID4gPiBSZXZpZXdlZC1ieTogSHl1biBLd29uIDxo
eXVuLmt3b25AeGlsaW54LmNvbT4NCj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNh
QGx1Y2FjZXJlc29saS5uZXQ+DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4g
PiB2MTMNCj4gPiA+ID4gLSBCYXNlZCBvbiBMYXVyZW50J3Mgc3VnZ2VzdGlvbnMNCj4gPiA+ID4g
LSBGaXhlZCB0aGUgZGF0YXR5cGVzIHZhbHVlcyBhcyBtaW5pbXVtIGFuZCBtYXhpbXVtDQo+ID4g
PiA+IC0gY29uZGl0aW9uIGFkZGVkIGZvciBlbi12Y3ggcHJvcGVydHkNCj4gPiA+ID4NCj4gPiA+
ID4gdjEyDQo+ID4gPiA+IC0gTW92ZWQgdG8geWFtbCBmb3JtYXQNCj4gPiA+ID4gLSBVcGRhdGUg
Q1NJLTIgYW5kIEQtUEhZDQo+ID4gPiA+IC0gTWVudGlvbiB0aGF0IGJpbmRpbmdzIGZvciBELVBI
WSBub3QgaGVyZQ0KPiA+ID4gPiAtIHJlc2V0IC0+IHZpZGVvLXJlc2V0DQo+ID4gPiA+DQo+ID4g
PiA+IHYxMQ0KPiA+ID4gPiAtIE1vZGlmeSBjb21wYXRpYmxlIHN0cmluZyBmcm9tIDQuMCB0byA1
LjANCj4gPiA+ID4NCj4gPiA+ID4gdjEwDQo+ID4gPiA+IC0gTm8gY2hhbmdlcw0KPiA+ID4gPg0K
PiA+ID4gPiB2OQ0KPiA+ID4gPiAtIEZpeCB4bG54LHZmYiBkZXNjcmlwdGlvbi4NCj4gPiA+ID4g
LSBzL09wdGlvbmFsL1JlcXVpcmVkIGVuZHBvaW50IHByb3BlcnR5Lg0KPiA+ID4gPiAtIE1vdmUg
ZGF0YS1sYW5lcyBkZXNjcmlwdGlvbiBmcm9tIFBvcnRzIHRvIGVuZHBvaW50IHByb3BlcnR5IHNl
Y3Rpb24uDQo+ID4gPiA+DQo+ID4gPiA+IHY4DQo+ID4gPiA+IC0gQWRkZWQgcmVzZXQtZ3Bpb3Mg
b3B0aW9uYWwgcHJvcGVydHkgdG8gYXNzZXJ0IHZpZGVvX2FyZXNldG4NCj4gPiA+ID4NCj4gPiA+
ID4gdjcNCj4gPiA+ID4gLSBSZW1vdmVkIHRoZSBjb250cm9sIG5hbWUgZnJvbSBkdCBiaW5kaW5n
cw0KPiA+ID4gPiAtIFVwZGF0ZWQgdGhlIGV4YW1wbGUgZHQgbm9kZSBuYW1lIHRvIGNzaTJyeA0K
PiA+ID4gPg0KPiA+ID4gPiB2Ng0KPiA+ID4gPiAtIEFkZGVkICJjb250cm9sIiBhZnRlciBWNEwy
X0NJRF9YSUxJTlhfTUlQSUNTSVNTX0FDVF9MQU5FUyBhcw0KPiA+ID4gPiBzdWdnZXN0ZWQgYnkg
THVjYQ0KPiA+ID4gPiAtIEFkZGVkIHJldmlld2VkIGJ5IFJvYiBIZXJyaW5nDQo+ID4gPiA+DQo+
ID4gPiA+IHY1DQo+ID4gPiA+IC0gSW5jb3Jwb3JhdGVkIGNvbW1lbnRzIGJ5IEx1Y2EgQ2Vyc29s
aQ0KPiA+ID4gPiAtIFJlbW92ZWQgRFBIWSBjbG9jayBmcm9tIGRlc2NyaXB0aW9uIGFuZCBleGFt
cGxlDQo+ID4gPiA+IC0gUmVtb3ZlZCBiYXllciBwYXR0ZXJuIGZyb20gZGV2aWNlIHRyZWUgTUlQ
SSBDU0kgSVANCj4gPiA+ID4gICBkb2Vzbid0IGRlYWwgd2l0aCBiYXllciBwYXR0ZXJuLg0KPiA+
ID4gPg0KPiA+ID4gPiB2NA0KPiA+ID4gPiAtIEFkZGVkIHJldmlld2VkIGJ5IEh5dW4gS3dvbg0K
PiA+ID4gPg0KPiA+ID4gPiB2Mw0KPiA+ID4gPiAtIHJlbW92ZWQgaW50ZXJydXB0IHBhcmVudCBh
cyBzdWdnZXN0ZWQgYnkgUm9iDQo+ID4gPiA+IC0gcmVtb3ZlZCBkcGh5IGNsb2NrDQo+ID4gPiA+
IC0gbW92ZWQgdmZiIHRvIG9wdGlvbmFsIHByb3BlcnRpZXMNCj4gPiA+ID4gLSBBZGRlZCByZXF1
aXJlZCBhbmQgb3B0aW9uYWwgcG9ydCBwcm9wZXJ0aWVzIHNlY3Rpb24NCj4gPiA+ID4gLSBBZGRl
ZCBlbmRwb2ludCBwcm9wZXJ0eSBzZWN0aW9uDQo+ID4gPiA+DQo+ID4gPiA+IHYyDQo+ID4gPiA+
IC0gdXBkYXRlZCB0aGUgY29tcGF0aWJsZSBzdHJpbmcgdG8gbGF0ZXN0IHZlcnNpb24gc3VwcG9y
dGVkDQo+ID4gPiA+IC0gcmVtb3ZlZCBEUEhZIHJlbGF0ZWQgcGFyYW1ldGVycw0KPiA+ID4gPiAt
IGFkZGVkIENTSSB2Mi4wIHJlbGF0ZWQgcHJvcGVydHkgKGluY2x1ZGluZyBWQ1ggZm9yIHN1cHBv
cnRpbmcgdXB0byAxNg0KPiA+ID4gPiAgIHZpcnR1YWwgY2hhbm5lbHMpLg0KPiA+ID4gPiAtIG1v
ZGlmaWVkIGNzaS1weGwtZm9ybWF0IGZyb20gc3RyaW5nIHRvIHVuc2lnbmVkIGludCB0eXBlIHdo
ZXJlIHRoZSB2YWx1ZQ0KPiA+ID4gPiAgIGlzIGFzIHBlciB0aGUgQ1NJIHNwZWNpZmljYXRpb24N
Cj4gPiA+ID4gLSBEZWZpbmVkIHBvcnQgMCBhbmQgcG9ydCAxIGFzIHNpbmsgYW5kIHNvdXJjZSBw
b3J0cy4NCj4gPiA+ID4gLSBSZW1vdmVkIG1heC1sYW5lcyBwcm9wZXJ0eSBhcyBzdWdnZXN0ZWQg
YnkgUm9iIGFuZCBTYWthcmkNCj4gPiA+ID4gLi4uL2JpbmRpbmdzL21lZGlhL3hpbGlueC94bG54
LGNzaTJyeHNzLnlhbWwgIHwgMjI2DQo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKw0KPiA+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDIyNiBpbnNlcnRpb25zKCspICBjcmVhdGUgbW9kZSAxMDA2NDQN
Cj4gPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3hpbGlueC94
bG54LGNzaTJyeHNzLnlhbWwNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS94aWxpbngveGxueCxjc2ky
cnhzcy55YW0NCj4gPiA+ID4gbA0KPiA+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZWRpYS94aWxpbngveGxueCxjc2kycnhzcy55YW0NCj4gPiA+ID4gbA0KPiA+ID4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmIwODg1
ZjQ2MTc4NQ0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS94aWxpbngveGxueCxjc2kycnhzcw0KPiA+ID4g
PiArKysgLnlhbQ0KPiA+ID4gPiArKysgbA0KPiA+ID4gPiBAQCAtMCwwICsxLDIyNiBAQA0KPiA+
ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpICVZQU1MDQo+ID4gPiA+ICsxLjINCj4gPiA+ID4gKy0tLQ0KPiA+ID4gPiArJGlkOg0K
PiA+ID4gPiAraHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEveGlsaW54L3hsbngs
Y3NpMnJ4c3MueWFtbCMNCj4gPiA+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ID4gPiArDQo+ID4gPiA+ICt0aXRsZTogWGlsaW54
IE1JUEkgQ1NJLTIgUmVjZWl2ZXIgU3Vic3lzdGVtDQo+ID4gPiA+ICsNCj4gPiA+ID4gK21haW50
YWluZXJzOg0KPiA+ID4gPiArICAtIFZpc2hhbCBTYWdhciA8dmlzaGFsLnNhZ2FyQHhpbGlueC5j
b20+DQo+ID4gPiA+ICsNCj4gPiA+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gPiA+ICsgIFRoZSBY
aWxpbnggTUlQSSBDU0ktMiBSZWNlaXZlciBTdWJzeXN0ZW0gaXMgdXNlZCB0byBjYXB0dXJlDQo+
ID4gPiA+ICtNSVBJDQo+ID4gPiA+ICtDU0ktMg0KPiA+ID4gPiArICB0cmFmZmljIGZyb20gY29t
cGxpYW50IGNhbWVyYSBzZW5zb3JzIGFuZCBzZW5kIHRoZSBvdXRwdXQgYXMNCj4gPiA+ID4gK0FY
STQgU3RyZWFtDQo+ID4gPiA+ICsgIHZpZGVvIGRhdGEgZm9yIGltYWdlIHByb2Nlc3NpbmcuDQo+
ID4gPiA+ICsgIFRoZSBzdWJzeXN0ZW0gY29uc2lzdHMgb2YgYSBNSVBJIEQtUEhZIGluIHNsYXZl
IG1vZGUgd2hpY2gNCj4gPiA+ID4gK2NhcHR1cmVzIHRoZQ0KPiA+ID4gPiArICBkYXRhIHBhY2tl
dHMuIFRoaXMgaXMgcGFzc2VkIGFsb25nIHRoZSBNSVBJIENTSS0yIFJ4IElQIHdoaWNoDQo+ID4g
PiA+ICtleHRyYWN0cyB0aGUNCj4gPiA+ID4gKyAgcGFja2V0IGRhdGEuIFRoZSBvcHRpb25hbCBW
aWRlbyBGb3JtYXQgQnJpZGdlIChWRkIpIGNvbnZlcnRzDQo+ID4gPiA+ICt0aGlzIGRhdGEgdG8N
Cj4gPiA+ID4gKyAgQVhJNCBTdHJlYW0gdmlkZW8gZGF0YS4NCj4gPiA+ID4gKyAgRm9yIG1vcmUg
ZGV0YWlscywgcGxlYXNlIHJlZmVyIHRvIFBHMjMyIFhpbGlueCBNSVBJIENTSS0yDQo+ID4gPiA+
ICtSZWNlaXZlcg0KPiA+ID4gU3Vic3lzdGVtLg0KPiA+ID4gPiArICBQbGVhc2Ugbm90ZSB0aGF0
IHRoaXMgYmluZGluZ3MgaW5jbHVkZXMgb25seSB0aGUgTUlQSSBDU0ktMiBSeA0KPiA+ID4gPiAr
Y29udHJvbGxlcg0KPiA+ID4gPiArICBhbmQgVmlkZW8gRm9ybWF0IEJyaWRnZSBhbmQgbm90IEQt
UEhZLg0KPiA+ID4gPiArDQo+ID4gPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ID4gPiArICBjb21wYXRp
YmxlOg0KPiA+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4gPiArICAgICAgLSBlbnVtOg0KPiA+ID4g
PiArICAgICAgICAtIHhsbngsbWlwaS1jc2kyLXJ4LXN1YnN5c3RlbS01LjANCj4gPiA+ID4gKw0K
PiA+ID4gPiArICByZWc6DQo+ID4gPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiA+ID4gKw0KPiA+
ID4gPiArICBpbnRlcnJ1cHRzOg0KPiA+ID4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gPiA+ICsN
Cj4gPiA+ID4gKyAgY2xvY2tzOg0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOiBMaXN0IG9mIGNs
b2NrIHNwZWNpZmllcnMNCj4gPiA+ID4gKyAgICBpdGVtczoNCj4gPiA+ID4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IEFYSSBMaXRlIGNsb2NrDQo+ID4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBW
aWRlbyBjbG9jaw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgIGNsb2NrLW5hbWVzOg0KPiA+ID4gPiAr
ICAgIGl0ZW1zOg0KPiA+ID4gPiArICAgICAgLSBjb25zdDogbGl0ZV9hY2xrDQo+ID4gPiA+ICsg
ICAgICAtIGNvbnN0OiB2aWRlb19hY2xrDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgeGxueCxjc2kt
cHhsLWZvcm1hdDoNCj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiArICAgICAg
VGhpcyBkZW5vdGVzIHRoZSBDU0kgRGF0YSB0eXBlIHNlbGVjdGVkIGluIGh3IGRlc2lnbi4NCj4g
PiA+ID4gKyAgICAgIFBhY2tldHMgb3RoZXIgdGhhbiB0aGlzIGRhdGEgdHlwZSAoZXhjZXB0IGZv
ciBSQVc4IGFuZA0KPiA+ID4gPiArICAgICAgVXNlciBkZWZpbmVkIGRhdGEgdHlwZXMpIHdpbGwg
YmUgZmlsdGVyZWQgb3V0Lg0KPiA+ID4gPiArICAgICAgUG9zc2libGUgdmFsdWVzIGFyZSBhcyBi
ZWxvdyAtDQo+ID4gPiA+ICsgICAgICAweDFlIC0gWVVWNDIyOEINCj4gPiA+ID4gKyAgICAgIDB4
MWYgLSBZVVY0MjIxMEINCj4gPiA+ID4gKyAgICAgIDB4MjAgLSBSR0I0NDQNCj4gPiA+ID4gKyAg
ICAgIDB4MjEgLSBSR0I1NTUNCj4gPiA+ID4gKyAgICAgIDB4MjIgLSBSR0I1NjUNCj4gPiA+ID4g
KyAgICAgIDB4MjMgLSBSR0I2NjYNCj4gPiA+ID4gKyAgICAgIDB4MjQgLSBSR0I4ODgNCj4gPiA+
ID4gKyAgICAgIDB4MjggLSBSQVc2DQo+ID4gPiA+ICsgICAgICAweDI5IC0gUkFXNw0KPiA+ID4g
PiArICAgICAgMHgyYSAtIFJBVzgNCj4gPiA+ID4gKyAgICAgIDB4MmIgLSBSQVcxMA0KPiA+ID4g
PiArICAgICAgMHgyYyAtIFJBVzEyDQo+ID4gPiA+ICsgICAgICAweDJkIC0gUkFXMTQNCj4gPiA+
ID4gKyAgICAgIDB4MmUgLSBSQVcxNg0KPiA+ID4gPiArICAgICAgMHgyZiAtIFJBVzIwDQo+ID4g
PiA+ICsgICAgYWxsT2Y6DQo+ID4gPiA+ICsgICAgICAtICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ID4gPiArICAgICAgLSBhbnlPZjoNCj4gPiA+ID4g
KyAgICAgICAgLSBtaW5pbXVtOiAweDFlDQo+ID4gPiA+ICsgICAgICAgIC0gbWF4aW11bTogMHgy
NA0KPiA+ID4gPiArICAgICAgICAtIG1pbmltdW06IDB4MjgNCj4gPiA+ID4gKyAgICAgICAgLSBt
YXhpbXVtOiAweDJmDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgeGxueCx2ZmI6DQo+ID4gPiA+ICsg
ICAgdHlwZTogYm9vbGVhbg0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOiBQcmVzZW50IHdoZW4g
VmlkZW8gRm9ybWF0IEJyaWRnZSBpcyBlbmFibGVkIGluDQo+ID4gPiA+ICsgSVAgY29uZmlndXJh
dGlvbg0KPiA+ID4gPiArDQo+ID4gPiA+ICsgIHhsbngsZW4tY3NpLXYyLTA6DQo+ID4gPiA+ICsg
ICAgdHlwZTogYm9vbGVhbg0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOiBQcmVzZW50IGlmIENT
SSB2MiBpcyBlbmFibGVkIGluIElQIGNvbmZpZ3VyYXRpb24uDQo+ID4gPiA+ICsNCj4gPiA+ID4g
KyAgeGxueCxlbi12Y3g6DQo+ID4gPiA+ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+ID4gPiArICAg
IGRlc2NyaXB0aW9uOiB8DQo+ID4gPiA+ICsgICAgICBXaGVuIHByZXNlbnQsIHRoZXJlIGFyZSBt
YXhpbXVtIDE2IHZpcnR1YWwgY2hhbm5lbHMsIGVsc2Ugb25seSA0Lg0KPiA+ID4gPiArDQo+ID4g
PiA+ICsgIHhsbngsZW4tYWN0aXZlLWxhbmVzOg0KPiA+ID4gPiArICAgIHR5cGU6IGJvb2xlYW4N
Cj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiArICAgICAgUHJlc2VudCBpZiB0
aGUgbnVtYmVyIG9mIGFjdGl2ZSBsYW5lcyBjYW4gYmUgcmUtY29uZmlndXJlZCBhdA0KPiA+ID4g
PiArICAgICAgcnVudGltZSBpbiB0aGUgUHJvdG9jb2wgQ29uZmlndXJhdGlvbiBSZWdpc3Rlci4g
T3RoZXJ3aXNlIGFsbCBsYW5lcywNCj4gPiA+ID4gKyAgICAgIGFzIHNldCBpbiBJUCBjb25maWd1
cmF0aW9uLCBhcmUgYWx3YXlzIGFjdGl2ZS4NCj4gPiA+ID4gKw0KPiA+ID4gPiArICB2aWRlby1y
ZXNldC1ncGlvczoNCj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogT3B0aW9uYWwgc3BlY2lmaWVy
IGZvciBhIEdQSU8gdGhhdCBhc3NlcnRzIHZpZGVvX2FyZXNldG4uDQo+ID4gPiA+ICsgICAgbWF4
SXRlbXM6IDENCj4gPiA+ID4gKw0KPiA+ID4gPiArICBwb3J0czoNCj4gPiA+ID4gKyAgICB0eXBl
OiBvYmplY3QNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgIHByb3BlcnRpZXM6DQo+ID4gPiA+ICsg
ICAgICBwb3J0QDA6DQo+ID4gPiA+ICsgICAgICAgIHR5cGU6IG9iamVjdA0KPiA+ID4gPiArICAg
ICAgICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiArICAgICAgICAgIElucHV0IC8gc2luayBwb3J0
IG5vZGUsIHNpbmdsZSBlbmRwb2ludCBkZXNjcmliaW5nIHRoZQ0KPiA+ID4gPiArICAgICAgICAg
IENTSS0yIHRyYW5zbWl0dGVyLg0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgIHByb3BlcnRp
ZXM6DQo+ID4gPiA+ICsgICAgICAgICAgcmVnOg0KPiA+ID4gPiArICAgICAgICAgICAgY29uc3Q6
IDANCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgIGVuZHBvaW50Og0KPiA+ID4gPiArICAg
ICAgICAgICAgdHlwZTogb2JqZWN0DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAgICAgIHBy
b3BlcnRpZXM6DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgZGF0YS1sYW5lczoN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgVGhpcyBpcyByZXF1aXJlZCBvbmx5IGluIHRoZSBzaW5rIHBvcnQgMCBlbmRw
b2ludCB3aGljaA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgY29ubmVjdHMgdG8gTUlQSSBD
U0ktMiBzb3VyY2UgbGlrZSBzZW5zb3IuDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICBUaGUg
cG9zc2libGUgdmFsdWVzIGFyZSAtDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAxICAgICAg
IC0gRm9yIDEgbGFuZSBlbmFibGVkIGluIElQLg0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
MSAyICAgICAtIEZvciAyIGxhbmVzIGVuYWJsZWQgaW4gSVAuDQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAxIDIgMyAgIC0gRm9yIDMgbGFuZXMgZW5hYmxlZCBpbiBJUC4NCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgIDEgMiAzIDQgLSBGb3IgNCBsYW5lcyBlbmFibGVkIGluIElQLg0KPiA+
ID4gPiArICAgICAgICAgICAgICAgIGl0ZW1zOg0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
LSBjb25zdDogMQ0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgLSBjb25zdDogMg0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgLSBjb25zdDogMw0KPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgLSBjb25zdDogNA0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgICAgICAgIHJlbW90ZS1l
bmRwb2ludDogdHJ1ZQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgICAgICByZXF1aXJlZDoN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgLSBkYXRhLWxhbmVzDQo+ID4gPiA+ICsgICAgICAgICAg
ICAgIC0gcmVtb3RlLWVuZHBvaW50DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAgICAgIGFk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgIGFk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICBwb3J0
QDE6DQo+ID4gPiA+ICsgICAgICAgIHR5cGU6IG9iamVjdA0KPiA+ID4gPiArICAgICAgICBkZXNj
cmlwdGlvbjogfA0KPiA+ID4gPiArICAgICAgICAgIE91dHB1dCAvIHNvdXJjZSBwb3J0IG5vZGUs
IGVuZHBvaW50IGRlc2NyaWJpbmcgbW9kdWxlcw0KPiA+ID4gPiArICAgICAgICAgIGNvbm5lY3Rl
ZCB0aGUgQ1NJLTIgcmVjZWl2ZXIuDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAgcHJvcGVy
dGllczoNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgIHJlZzoNCj4gPiA+ID4gKyAgICAg
ICAgICAgIGNvbnN0OiAxDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAgICBlbmRwb2ludDoN
Cj4gPiA+ID4gKyAgICAgICAgICAgIHR5cGU6IG9iamVjdA0KPiA+ID4gPiArDQo+ID4gPiA+ICsg
ICAgICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgICAgICAg
IHJlbW90ZS1lbmRwb2ludDogdHJ1ZQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgICAgICBy
ZXF1aXJlZDoNCj4gPiA+ID4gKyAgICAgICAgICAgICAgLSByZW1vdGUtZW5kcG9pbnQNCj4gPiA+
ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+
ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+
ID4gPiA+ICsNCj4gPiA+ID4gK3JlcXVpcmVkOg0KPiA+ID4gPiArICAtIGNvbXBhdGlibGUNCj4g
PiA+ID4gKyAgLSByZWcNCj4gPiA+ID4gKyAgLSBpbnRlcnJ1cHRzDQo+ID4gPiA+ICsgIC0gY2xv
Y2tzDQo+ID4gPiA+ICsgIC0gY2xvY2stbmFtZXMNCj4gPiA+ID4gKyAgLSB4bG54LGNzaS1weGwt
Zm9ybWF0DQo+ID4gPiA+ICsgIC0gcG9ydHMNCj4gPiA+ID4gKw0KPiA+ID4gPiAraWY6DQo+ID4g
PiA+ICsgIG5vdDoNCj4gPiA+ID4gKyAgICByZXF1aXJlZDoNCj4gPiA+ID4gKyAgICAgIC0geGxu
eCxlbi1jc2ktdjItMA0KPiA+ID4gPiArdGhlbjoNCj4gPiA+ID4gKyAgcHJvcGVydGllczoNCj4g
PiA+ID4gKyAgICB4bG54LGVuLXZjeDogZmFsc2UNCj4gPiA+DQo+ID4gPiBBcyBJJ3ZlIGp1c3Qg
Y29tbWVudGVkIG9uIHYxMiwgSSB0aGluayB3ZSBzaG91bGQgY29uZGl0aW9uIHRoZQ0KPiA+ID4g
eGxueCxjc2ktcHhsLSBmb3JtYXQgcHJvcGVydHkgdG8geGxueCx2ZmIgYmVpbmcgc2V0Lg0KPiA+
ID4geGxueCxjc2ktcHhsLWZvcm1hdCBzaG91bGQgYmUgcmVtb3ZlZCBmcm9tIHRoZSByZXF1aXJl
ZCBwcm9wZXJ0aWVzIGFib3ZlLA0KPiBhbmQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zIGFkZGVk
Og0KPiA+ID4NCj4gPiA+IGFsbE9mOg0KPiA+ID4gICAtIGlmOg0KPiA+ID4gICAgICAgcmVxdWly
ZWQ6DQo+ID4gPiAgICAgICAgIC0geGxueCx2ZmINCj4gPiA+ICAgICB0aGVuOg0KPiA+ID4gICAg
ICAgcmVxdWlyZWQ6DQo+ID4gPiAgICAgICAgIC0geGxueCxjc2ktcHhsLWZvcm1hdA0KPiA+ID4g
ICAgIGVsc2U6DQo+ID4gPiAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gICAgICAgICB4bG54LGNz
aS1weGwtZm9ybWF0OiBmYWxzZQ0KPiA+ID4NCj4gPiA+ICAgLSBpZjoNCj4gPiA+ICAgICAgIG5v
dDoNCj4gPiA+ICAgICAgICAgcmVxdWlyZWQ6DQo+ID4gPiAgICAgICAgICAgLSB4bG54LGVuLWNz
aS12Mi0wDQo+ID4gPiAgICAgdGhlbjoNCj4gPiA+ICAgICAgIHByb3BlcnRpZXM6DQo+ID4gPiAg
ICAgICAgIHhsbngsZW4tdmN4OiBmYWxzZQ0KPiA+ID4NCj4gPiA+IFRoZSAnYWxsT2YnIGlzIG5l
ZWRlZCBhcyB5b3UgY2FuJ3QgaGF2ZSB0d28gJ2lmJyBjb25zdHJ1Y3RzIGF0IHRoZSB0b3AgbGV2
ZWwuDQo+ID4gPg0KPiA+IFRoYW5rcyBmb3Igc2hhcmluZyB0aGUgZXhwbGFuYXRpb24gZm9yIHRo
aXMuDQo+ID4gQ2FuIHlvdSBwbGVhc2Ugc2hhcmUgd2hlcmUgSSBjYW4gZ2V0IHRoaXMgaW5mbz8N
Cj4gDQo+IFRoZSBqc29uLXNjaGVtYSBzcGVjaWZpY2F0aW9uIGlzIGF2YWlsYWJsZSBhdCBodHRw
czovL2pzb24tDQo+IHNjaGVtYS5vcmcvc3BlY2lmaWNhdGlvbi5odG1sLiBhbGxPZiBpcyBkZWZp
bmVkIGluIGh0dHBzOi8vanNvbi0NCj4gc2NoZW1hLm9yZy9kcmFmdC8yMDE5LTA5L2pzb24tc2No
ZW1hLWNvcmUuaHRtbCNhbGxPZi4NCj4gDQo+IEpTT04gc2NoZW1hcyBhcmUgZXhwcmVzc2VkIGlu
IEpTT04gZm9ybWF0LCBhbmQgWUFNTCBpcyBhIChtb3JlIHJlYWRhYmxlKQ0KPiBzdXBlcnNldCBz
eW50YXggb2YgSlNPTi4gQSBZQU1MIGRvY3VtZW50IGNvbnRhaW5zIGxpc3RzIGFuZCBvYmplY3Rz
Og0KPiANCj4gLSB0aGlzDQo+IC0gaXMNCj4gLSBhDQo+IC0gbGlzdA0KPiANCj4gb2JqZWN0Og0K
PiAgIGNhbjogaGF2ZQ0KPiAgIHByb3BlcnRpZXM6DQo+ICAgICB0aGF0OiBjYW4NCj4gICAgIGJl
OiBvdGhlcg0KPiAgICAgb2JqZWN0cw0KPiANCj4gQW4gb2JqZWN0IGlzIHNpbWlsYXIgdG8gYSBQ
eXRob24gZGljdGlvbmFyeSwgaXQgY2FuJ3QgaGF2ZSBtdWx0aXBsZSBlbnRyaWVzIHdpdGgNCj4g
dGhlIHNhbWUga2V5LiBTbyBoYXZpbmcNCj4gDQo+IGlmOg0KPiAgIHJlcXVpcmVkOg0KPiAgICAg
LSB4bG54LHZmYg0KPiB0aGVuOg0KPiAgIHJlcXVpcmVkOg0KPiAgICAgLSB4bG54LGNzaS1weGwt
Zm9ybWF0DQo+IGVsc2U6DQo+ICAgcHJvcGVydGllczoNCj4gICAgIHhsbngsY3NpLXB4bC1mb3Jt
YXQ6IGZhbHNlDQo+IA0KPiBpZjoNCj4gICBub3Q6DQo+ICAgICByZXF1aXJlZDoNCj4gICAgICAg
LSB4bG54LGVuLWNzaS12Mi0wDQo+IHRoZW46DQo+ICAgcHJvcGVydGllczoNCj4gICAgIHhsbngs
ZW4tdmN4OiBmYWxzZQ0KPiANCj4gYXQgdGhlIHRvcCBsZXZlbCBpcyBub3QgdmFsaWQsIHRoZSBz
YW1lIHdheSB0aGF0DQo+IA0KPiBwcm9wZXJ0aWVzOg0KPiAgIHJlZzoNCj4gICAgIG1heEl0ZW1z
OiAxDQo+ICAgcmVnOg0KPiAgICAgbWF4SXRlbXM6IDENCj4gDQo+IHdvdWxkbid0IGJlIHZhbGlk
LiBUaGUgYWxsT2Ygb2JqZWN0IGhhcyBhIHZhbHVlIHRoYXQgaXMgYSBsaXN0IG9mDQo+IHNjaGVt
YXM6DQo+IA0KPiBhbGxPZjoNCj4gICAtIHNjaGVtYTENCj4gICAtIHNjaGVtYTINCj4gICAtIHNj
aGVtYTMNCj4gDQo+IGFuZCBpbiB0aGlzIGNhc2UsIHdlIHVzZSBpdCB3aXRoIGEgaWYuLi50aGVu
Li4uZWxzZSBmb3IgZWFjaCBvZiB0aGUgc2NoZW1hcy4gQXMNCj4gZG9jdW1lbnRlZCBpbiB0aGUg
c3BlYywgIkFuIGluc3RhbmNlIHZhbGlkYXRlcyBzdWNjZXNzZnVsbHkgYWdhaW5zdCBbYWxsT2Zd
IGlmIGl0DQo+IHZhbGlkYXRlcyBzdWNjZXNzZnVsbHkgYWdhaW5zdCBhbGwgc2NoZW1hcyBkZWZp
bmVkIGJ5IFthbGxPZl0ncyB2YWx1ZSIuDQo+IA0KPiBhbGxPZiBpcyBhbHNvIHVzZWQgdG8gaW5j
bHVkZSBzdWItc2NoZW1hcywgYXMgZXhwbGFpbmVkIGluDQo+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9leGFtcGxlLXNjaGVtYS55YW1sLg0KPiANCj4gICB2ZW5kb3IsaW50LXBy
b3BlcnR5Og0KPiAgICAgZGVzY3JpcHRpb246IFZlbmRvciBzcGVjaWZpYyBwcm9wZXJ0aWVzIG11
c3QgaGF2ZSBhIGRlc2NyaXB0aW9uDQo+ICAgICAjICdhbGxPZicgaXMgdGhlIGpzb24tc2NoZW1h
IHdheSBvZiBzdWJjbGFzc2luZyBhIHNjaGVtYS4gSGVyZSB0aGUgYmFzZQ0KPiAgICAgIyB0eXBl
IHNjaGVtYSBpcyByZWZlcmVuY2VkIGFuZCB0aGVuIGFkZGl0aW9uYWwgY29uc3RyYWludHMgb24g
dGhlIHZhbHVlcw0KPiAgICAgIyBhcmUgYWRkZWQuDQo+ICAgICBhbGxPZjoNCj4gICAgICAgLSAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gICAgICAgLSBl
bnVtOiBbMiwgNCwgNiwgOCwgMTBdDQo+IA0KPiBJZiB0aGlzIHdhcyB3cml0dGVuDQo+IA0KPiAg
IHZlbmRvcixpbnQtcHJvcGVydHk6DQo+ICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy91aW50MzINCj4gICAgIGVudW06IFsyLCA0LCA2LCA4LCAxMF0NCj4gDQo+IHdl
IHdvdWxkIGhhdmUgYW4gaXNzdWUgKGFtb25nIG90aGVyIHByb2JsZW1zKSBpZg0KPiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIgY29udGFpbmVkIGFuIGVudW0sIGFzIHRo
ZXJlIHdvdWxkDQo+IGJlIHR3byBlbnVtIHByb3BlcnRpZXMgZm9yIHZlbmRvcixpbnQtcHJvcGVy
dHkuDQo+IA0KDQpUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBleHBsYW5hdGlvbiBMYXVyZW50ISAN
Cg0KPiA+ID4gUGxlYXNlIGhvd2V2ZXIgbGV0IG1lIGtub3cgaWYgbXkgdW5kZXJzdGFuZGluZyBp
cyB3cm9uZyBhbmQNCj4gPiA+IHhsbngsY3NpLXB4bC0gZm9ybWF0IGlzIG5lZWRlZCBldmVuIHdo
ZW4geGxueCx2ZmIgaXMgbm90IHNldC4gSW4NCj4gPiA+IHRoYXQgY2FzZSBwbGVhc2UgaWdub3Jl
IHRoaXMgY2hhbmdlIChidXQgcGxlYXNlIGFkZCB0aGUgLi4uIGJlbG93KS4NCj4gPg0KPiA+IE9r
LiBJIHdpbGwgYWRkIC4uLiBpbiB0aGUgZW5kLg0KPiA+DQo+ID4gPiA+ICsNCj4gPiA+ID4gK2Fk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ID4gPiArDQo+ID4gPiA+ICtleGFtcGxlczoN
Cj4gPiA+ID4gKyAgLSB8DQo+ID4gPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8v
Z3Bpby5oPg0KPiA+ID4gPiArICAgIHhjc2kycnhzc18xOiBjc2kycnhAYTAwMjAwMDAgew0KPiA+
ID4gPiArICAgICAgICBjb21wYXRpYmxlID0gInhsbngsbWlwaS1jc2kyLXJ4LXN1YnN5c3RlbS01
LjAiOw0KPiA+ID4gPiArICAgICAgICByZWcgPSA8MHgwIDB4YTAwMjAwMDAgMHgwIDB4MTAwMDA+
Ow0KPiA+ID4gPiArICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+Ow0KPiA+ID4gPiAr
ICAgICAgICBpbnRlcnJ1cHRzID0gPDAgOTUgND47DQo+ID4gPiA+ICsgICAgICAgIHhsbngsY3Np
LXB4bC1mb3JtYXQgPSA8MHgyYT47DQo+ID4gPiA+ICsgICAgICAgIHhsbngsdmZiOw0KPiA+ID4g
PiArICAgICAgICB4bG54LGVuLWFjdGl2ZS1sYW5lczsNCj4gPiA+ID4gKyAgICAgICAgeGxueCxl
bi1jc2ktdjItMDsNCj4gPiA+ID4gKyAgICAgICAgeGxueCxlbi12Y3g7DQo+ID4gPiA+ICsgICAg
ICAgIGNsb2NrLW5hbWVzID0gImxpdGVfYWNsayIsICJ2aWRlb19hY2xrIjsNCj4gPiA+ID4gKyAg
ICAgICAgY2xvY2tzID0gPCZtaXNjX2Nsa18wPiwgPCZtaXNjX2Nsa18xPjsNCj4gPiA+ID4gKyAg
ICAgICAgdmlkZW8tcmVzZXQtZ3Bpb3MgPSA8JmdwaW8gODYgR1BJT19BQ1RJVkVfTE9XPjsNCj4g
PiA+ID4gKw0KPiA+ID4gPiArICAgICAgICBwb3J0cyB7DQo+ID4gPiA+ICsgICAgICAgICAgICAj
YWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICNzaXplLWNlbGxzID0g
PDA+Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgICAgICBwb3J0QDAgew0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgIC8qIFNpbmsgcG9ydCAqLw0KPiA+ID4gPiArICAgICAgICAgICAgICAg
IHJlZyA9IDwwPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICBjc2lzc19pbjogZW5kcG9pbnQg
ew0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICBkYXRhLWxhbmVzID0gPDEgMiAzIDQ+Ow0K
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAvKiBNSVBJIENTSS0yIENhbWVyYSBoYW5kbGUg
Ki8NCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZjYW1l
cmFfb3V0PjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICB9Ow0KPiA+ID4gPiArICAgICAgICAg
ICAgfTsNCj4gPiA+ID4gKyAgICAgICAgICAgIHBvcnRAMSB7DQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgLyogU291cmNlIHBvcnQgKi8NCj4gPiA+ID4gKyAgICAgICAgICAgICAgICByZWcgPSA8
MT47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgY3Npc3Nfb3V0OiBlbmRwb2ludCB7DQo+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmdnByb2NfaW4+Ow0K
PiA+ID4gPiArICAgICAgICAgICAgICAgIH07DQo+ID4gPiA+ICsgICAgICAgICAgICB9Ow0KPiA+
ID4gPiArICAgICAgICB9Ow0KPiA+ID4gPiArICAgIH07DQo+ID4gPg0KPiA+ID4gWUFNTCBmaWxl
cyB1c3VhbGx5IGVuZCB3aXRoDQo+ID4gPg0KPiA+ID4gLi4uDQo+ID4gPg0KPiA+ID4gb24gdGhl
IGxhc3QgbGluZSB0byBtYXJrIHRoZSBlbmQgb2YgZmlsZS4NCj4gPiA+DQo+ID4NCj4gPiBPayBJ
IHdpbGwgYWRkIHRoaXMgdG8gdGhlIGVuZCBvZiB0aGUgZmlsZS4NCj4gPg0KPiA+ID4gUmV2aWV3
ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQoNClJlZ2Fy
ZHMNClZpc2hhbCBTYWdhcg0KDQo=
