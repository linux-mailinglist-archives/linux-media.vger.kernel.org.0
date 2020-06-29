Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D7520D285
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 20:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgF2St4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 14:49:56 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57816 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729000AbgF2Stx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 14:49:53 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05T8ASlU008548;
        Mon, 29 Jun 2020 10:13:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=w3dIE67dE3KoXbBoLblS3zP9klm4N4Ihl8g7RfI8wH4=;
 b=egF/bFkmDFi7YrM+IdLAZv0HQBZnKlfV+ZcniDcXQgm0yYyQudJlHBmPZOj+bvarfTpC
 N2vq7bC3bsrcygWGevkP28ipsoYRjbYzU/ukbSDNeWdIFxPpQgFeUFfWo0HImZzP96r6
 NO4om23b3JpL5HGFBOlb90MZs2YD59p8FBst0j1X10V6NFOGGR0HbkYH/PzXDIV5Vo4t
 BYzVz379+39a+OCZmA/jRfUyFQTVEOgQVO3QZNFcCX5rJRG2Q5MX7P5q4wGRnjxbVd+B
 OSS/qYn0R40K+763Eag4amcidi0CidlPYJjlQQnskRL6qCLn37ZAmuEGeJdhQSGA4O/t mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31ww0ftpxb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Jun 2020 10:13:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 510A010002A;
        Mon, 29 Jun 2020 10:13:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 136A82ADA04;
        Mon, 29 Jun 2020 10:13:28 +0200 (CEST)
Received: from SFHDAG3NODE1.st.com (10.75.127.7) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jun
 2020 10:13:27 +0200
Received: from SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86]) by
 SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86%20]) with mapi id
 15.00.1473.003; Mon, 29 Jun 2020 10:13:27 +0200
From:   Erwan LE RAY <erwan.leray@st.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: add generic DT binding for
 announcing RTS/CTS lines
Thread-Topic: [PATCH 1/2] dt-bindings: serial: add generic DT binding for
 announcing RTS/CTS lines
Thread-Index: AQHWLqwdvriVa1dO+kuLItas4TvOb6jsnKeAgAK+zQA=
Date:   Mon, 29 Jun 2020 08:13:27 +0000
Message-ID: <b282002b-bca6-96a0-98f8-b4dd5f813296@st.com>
References: <20200520133932.30441-1-erwan.leray@st.com>
 <20200520133932.30441-2-erwan.leray@st.com>
 <20200627141801.GA1945477@kroah.com>
In-Reply-To: <20200627141801.GA1945477@kroah.com>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <85399D0122B0FC468E36B331A46F0E31@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-29_07:2020-06-26,2020-06-29 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQpPbiA2LzI3LzIwIDQ6MTggUE0sIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gT24gV2Vk
LCBNYXkgMjAsIDIwMjAgYXQgMDM6Mzk6MzFQTSArMDIwMCwgRXJ3YW4gTGUgUmF5IHdyb3RlOg0K
Pj4gQWRkIHN1cHBvcnQgb2YgZ2VuZXJpYyBEVCBiaW5kaW5nIGZvciBhbm5vdWNpbmcgUlRTL0NU
UyBsaW5lcy4gVGhlIGluaXRpYWwNCj4+IGJpbmRpbmcgJ3N0LGh3LWZsb3ctY29udHJvbCcgaXMg
bm90IG5lZWRlZCBhbnltb3JlIHNpbmNlIGdlbmVyaWMgYmluZGluZw0KPj4gaXMgYXZhaWxhYmxl
LCBidXQgaXMga2VwdCBmb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBFcndhbiBMZSBSYXkgPGVyd2FuLmxlcmF5QHN0LmNvbT4NCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9zdCxzdG0zMi11
YXJ0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3N0LHN0
bTMyLXVhcnQueWFtbA0KPj4gaW5kZXggNzViODUyMWViN2NiLi4wNmQ1ZjI1MWVjODggMTAwNjQ0
DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3N0LHN0
bTMyLXVhcnQueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NlcmlhbC9zdCxzdG0zMi11YXJ0LnlhbWwNCj4+IEBAIC0zNSw5ICszNSwxMSBAQCBwcm9wZXJ0
aWVzOg0KPj4gICAgICAgZGVzY3JpcHRpb246IGxhYmVsIGFzc29jaWF0ZWQgd2l0aCB0aGlzIHVh
cnQNCj4+ICAgDQo+PiAgICAgc3QsaHctZmxvdy1jdHJsOg0KPj4gLSAgICBkZXNjcmlwdGlvbjog
ZW5hYmxlIGhhcmR3YXJlIGZsb3cgY29udHJvbA0KPj4gKyAgICBkZXNjcmlwdGlvbjogZW5hYmxl
IGhhcmR3YXJlIGZsb3cgY29udHJvbCAoZGVwcmVjYXRlZCkNCj4+ICAgICAgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcNCj4+ICAgDQo+PiArICB1YXJ0LWhhcy1y
dHNjdHM6IHRydWUNCj4+ICsNCj4+ICAgICBkbWFzOg0KPj4gICAgICAgbWluSXRlbXM6IDENCj4+
ICAgICAgIG1heEl0ZW1zOiAyDQo+PiAtLSANCj4+IDIuMTcuMQ0KPj4NCj4gRGlkIHRoaXMgZ2V0
IGlnbm9yZWQgYnkgdGhlIERUIG1haW50YWluZXJzPyAgOigNCg0KSGkgUm9iLA0KDQpHZW50bGUg
cmVtaW5kZXIuIENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSB5b3VyIGZlZWRiYWNrIG9uIHRoaXMg
cGF0Y2ggPw0KDQpCZXN0IFJlZ2FyZHMsIEVyd2FuLg0K
