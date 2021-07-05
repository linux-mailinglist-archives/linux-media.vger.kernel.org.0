Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286383BBE97
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 17:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbhGEPDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 11:03:33 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:52558 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhGEPDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 11:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625497253; x=1628089253;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=sJtekkatkpR88tRBQo72WpmNZEJLRJmbr73Ad/WikqY=;
        b=gS2Z23hOBZpiU6vp26a/OGRGozaqmQRw2vCbY/8qZgFOIXy+JfnALkhIteJPwkkw
        qk2ADTaotsRgoEjf8y7T8WPKn6UW+O9jbczK6cXK9Xi9pKawI5GR+MPTHrhlI5dZ
        wQjiaMK/+DhClQAw/zPDzJ8cDVuJpWUv+YGMmsfWjJA=;
X-AuditID: c39127d2-a9fbd70000001c5e-c7-60e31ea5c2bd
Received: from berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 1B.F0.07262.5AE13E06; Mon,  5 Jul 2021 17:00:53 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 5 Jul 2021
 17:00:53 +0200
Received: from Berlix.phytec.de ([fe80::343f:7618:c7ce:97c9]) by
 berlix.phytec.de ([fe80::343f:7618:c7ce:97c9%3]) with mapi id 15.01.2176.009;
 Mon, 5 Jul 2021 17:00:53 +0200
From:   =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: media: mt9p031: Add missing required
 properties
Thread-Topic: [PATCH v3 3/6] dt-bindings: media: mt9p031: Add missing required
 properties
Thread-Index: AQHXbyjvLwsYo70UyUKz+ZFwlE79BqsviLMAgATUjAA=
Date:   Mon, 5 Jul 2021 15:00:53 +0000
Message-ID: <104e925e7b13d358a30d19fddf0211dceef3b349.camel@phytec.de>
References: <20210702095922.118614-1-s.riedmueller@phytec.de>
         <20210702095922.118614-4-s.riedmueller@phytec.de>
         <YN8RWoy0xryBw3bL@pendragon.ideasonboard.com>
In-Reply-To: <YN8RWoy0xryBw3bL@pendragon.ideasonboard.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-Type: text/plain; charset="utf-8"
Content-ID: <904DE4C659053443B204D82422732F63@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsWyRoChVHep3OMEgxkPJS3mHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk0Xr3iPsFp+2fGNyYPeY3TGT1WPTqk42j3knAz0+b5ILYInisklJ
        zcksSy3St0vgynh/7h1jwR7hioOzHBoY/wh1MXJwSAiYSGx75t/FyMUhJLCcSWLnxqPsEM4D
        Rol5N25CORsZJR4fOcbaxcjJwSbgIvG57RsbSLeIgLfEzzlOIDXMAteYJBp+zWMBqREWiJLY
        /2EqWL2IQLTEl5croWwribmt/8FsFgEViTf7OlhA5vAKuEk8/2YCsWsxo8TUf73MIDWcQPVT
        dm9kArEZBWQlOhvegdnMAuISm559B5sjISAgsWTPeWYIW1Ti5eN/UHEFibaeTiaQ+cwCmhLr
        d+lDmBYSb5tZIaYoSkzpfsgOYvMKCEqcnPmEZQKj+CwkC2YhNM9CaJ6FpHkWkuYFjKyrGIVy
        M5OzU4sys/UKMipLUpP1UlI3MQJj9PBE9Us7GPvmeBxiZOJgPMQowcGsJMIrMuVRghBvSmJl
        VWpRfnxRaU5q8SFGaQ4WJXHeDbwlYUIC6YklqdmpqQWpRTBZJg5OqQbGmeGi0V+5ln11DNHI
        DNE58DU29ICKkXR++YtrGou1LvIyOjn+/8J3J1vze0bC4XrZbPldCdrT2m3+HDjDwndl6aXD
        AUvnHX3ZwH71/X+pTGvdE/6l8qKzi9ucj6g+2ckh3Jh/d9/zn6derzl8SybaIzigts75dEKF
        svB8P5veNF42E6N7F52UWIozEg21mIuKEwGSH7vPvwIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KT24gRnJpLCAyMDIxLTA3LTAyIGF0IDE2OjE1ICswMzAwLCBMYXVyZW50
IFBpbmNoYXJ0IHdyb3RlOg0KPiBIaSBTdGVmYW4sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBw
YXRjaC4NCj4gDQo+IE9uIEZyaSwgSnVsIDAyLCAyMDIxIGF0IDExOjU5OjE5QU0gKzAyMDAsIFN0
ZWZhbiBSaWVkbXVlbGxlciB3cm90ZToNCj4gPiBBZGQgbWlzc2luZyByZXF1aXJlZCBjbG9ja3Mg
YW5kIHN1cHBseSByZWd1bGF0b3IgcHJvcGVydGllcyBmb3IgdGhlDQo+ID4gc2Vuc29yIGlucHV0
IGNsb2NrIGFuZCB2ZGQsIHZkZF9pbyBhbmQgdmFhIHN1cHBseSByZWd1bGF0b3JzLg0KPiANCj4g
Q2FuIEkgdm9sdW50ZWVyIHlvdSB0byBjb252ZXJ0IHRoZXNlIGJpbmRpbmdzIHRvIFlBTUwgZmly
c3QsIGFuZCBhZGQgdGhlDQo+IHByb3BlcnRpZXMgb24gdG9wID8gOi0pDQoNClN1cmUsIEkgY2Fu
IGdpdmUgaXQgYSB0cnkgOi0pDQoNClJlZ2FyZHMsDQpTdGVmYW4NCg0KPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBTdGVmYW4gUmllZG11ZWxsZXIgPHMucmllZG11ZWxsZXJAcGh5dGVjLmRlPg0KPiA+
IC0tLQ0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvbXQ5cDAzMS50eHQg
ICAgICAgIHwgMTIgKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZWRpYS9pMmMvbXQ5cDAzMS50eHQNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvbXQ5cDAzMS50eHQNCj4gPiBpbmRleCBjYjYwNDQzZmY3
OGYuLjQ0MzdkMGUzMTQ3ZCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvaTJjL210OXAwMzEudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9tdDlwMDMxLnR4dA0KPiA+IEBAIC05LDYg
KzksMTIgQEAgUmVxdWlyZWQgUHJvcGVydGllczoNCj4gPiAgCShhKSAiYXB0aW5hLG10OXAwMzEi
IGZvciBtdDlwMDMxIHNlbnNvcg0KPiA+ICAJKGIpICJhcHRpbmEsbXQ5cDAzMW0iIGZvciBtdDlw
MDMxbSBzZW5zb3INCj4gPiAgDQo+ID4gKy0gY2xvY2tzOiBSZWZlcmVuY2UgdG8gdGhlIHNlbnNv
ciBpbnB1dCBjbG9jaw0KPiA+ICsNCj4gPiArLSB2ZGQtc3VwcGx5OiBWREQgc3VwcGx5IHJlZ3Vs
YXRvcg0KPiA+ICstIHZkZF9pby1zdXBwbHk6IFZERF9JTyBzdXBwbHkgcmVndWxhdG9yDQo+ID4g
Ky0gdmFhLXN1cHBseTogVkFBIHN1cHBseSByZWd1bGF0b3INCj4gPiArDQo+ID4gIC0gaW5wdXQt
Y2xvY2stZnJlcXVlbmN5OiBJbnB1dCBjbG9jayBmcmVxdWVuY3kuDQo+ID4gIA0KPiA+ICAtIHBp
eGVsLWNsb2NrLWZyZXF1ZW5jeTogUGl4ZWwgY2xvY2sgZnJlcXVlbmN5Lg0KPiA+IEBAIC0yOSw2
ICszNSwxMiBAQCBFeGFtcGxlOg0KPiA+ICAJCQlyZWcgPSA8MHg1ZD47DQo+ID4gIAkJCXJlc2V0
LWdwaW9zID0gPCZncGlvMyAzMCAwPjsNCj4gPiAgDQo+ID4gKwkJCWNsb2NrcyA9IDwmc2Vuc29y
X2Nsaz47DQo+ID4gKw0KPiA+ICsJCQl2ZGQtc3VwcGx5ID0gPCZyZWdfdmRkPjsNCj4gPiArCQkJ
dmRkX2lvLXN1cHBseSA9IDwmcmVnX3ZkZF9pbz47DQo+ID4gKwkJCXZhYS1zdXBwbHkgPSA8JnJl
Z192YWE+Ow0KPiA+ICsNCj4gPiAgCQkJcG9ydCB7DQo+ID4gIAkJCQltdDlwMDMxXzE6IGVuZHBv
aW50IHsNCj4gPiAgCQkJCQlpbnB1dC1jbG9jay1mcmVxdWVuY3kgPSA8NjAwMDAwMD47DQo=
