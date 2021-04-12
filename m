Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE8E235C376
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 12:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239011AbhDLKNc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 06:13:32 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:15191 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238870AbhDLKMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 06:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618222346; x=1649758346;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mcfUdaaCrT5rTWGKHOAu4K+X5wHqkaWOK4j03mP8aBg=;
  b=Ce/aTXTaWd2h64teRADp+X1vHx/SXahOWzMh7D4uDRYRrGEmuWE0/A0E
   AtG2Zp13CftWE872Z832rrmXgQIWqpGBIT5Ld3wQn80XSC/tw9m9N/Zbb
   r8q8W7UBBWHzrn8QSfNvifSXG/7WVkS+RC7hEmOnDXWCPaUaBzswXQBtS
   GUhwesHoR9LfuA388OLbOenjy/cdINHz9AK2R/yYOC33EohiHFICRa40W
   bxmrpRO2KNl22rTyQ8ArsJkC8Pq9+ZCE9SwKok276tXD0ge+XebSFN4yA
   KjjvbInlsgkbqDVAFA9RPGWRZXJNqk/t2J1SA9zdOiajEra/onI7BC3+r
   w==;
IronPort-SDR: dWnuQE9h3t8ZMsDdvsrGvElUbL/gO5mSzX4Sfv9rBvNXqNT0MODx9CCYg+/exdVD8Fnj/PKMC4
 XjcrYywmew2wVp4Q07KFFncbeFlR4iHTXGwaogMqHrD1eXbZX6QdmZa6tRoUfesDnsHPeZ+dF2
 AQ/G654Ac+i7pEMcxsF74rbHIeI59inzzlmJ2nC0mLwAexb7r+EuslissIc8tVPANL5a4zdeiU
 Fi9HwI1WfDF8N9tUGzvFYce0tOp4w8QwKR8KFvENWXnnmQtwMWCAC8TqOvlOhYpeLlZUURiPXK
 EPo=
X-IronPort-AV: E=Sophos;i="5.82,216,1613458800"; 
   d="scan'208";a="50798565"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Apr 2021 03:12:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 12 Apr 2021 03:12:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 12 Apr 2021 03:12:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSewAYi+eBcNCAYcKWL2AaU+BPGbOID66z1IHZs9HHySolNFJWnhkHgOMtrWFamrmkYu7vysPAlW2+xXG5EK41sapE9VelJHU77A8LaWNRwJt3N6Hk9AXOuIzFgHaea3Zk3xuEVC0cXyznQv6mSzcSNbD2eZ3TaNTw7+X0bm0ivHCMxseVw5if12j6PmA9v1nUYz1PHnWlDN7isd9C5CoDf8OhmDfzJJODdHZ2H0CFWAfTg+ihYbA7KACGpddwQaJzE/toj8KIz5Gevip5LNivTfzRJdn4ZMZPhuBOeVrJvOKk29P1cuikz8U+XdRBzLIOnEPNUQ2O3ViPp7H+HorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcfUdaaCrT5rTWGKHOAu4K+X5wHqkaWOK4j03mP8aBg=;
 b=ZA/HtHkmLdcWpDjpsI+EXb/mxj3X1dmJzJIlyKk+7NODb2nzaYpP4gaDuf5OKIV5+Su+iQVXaNbfRgYQF2J/WwmP9agTX+8Vtbt6Kkvu4GbgJdnRf8PyuRGwZskepejcJu2VNILwaxc3/PsehO1UQU8DnRvSivFww3EZ1+WuU1TmVcz8EUD3FS6n75jh1xTgZee3JwjMoYjwb13nfvpID/i5eo+CJp4p2V19S0fAJm4avxiOhfNCDZJVp3o4+0qGuyNYjWYC8eIuT+L3BHMkIkVSqy2CAQ9bdXxwFZAe/9xv3M65c1mDtolvN8a9x8MaN98ysmRn7nTJXPiMRyZDvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcfUdaaCrT5rTWGKHOAu4K+X5wHqkaWOK4j03mP8aBg=;
 b=X5dWphVPTO+yvvnaxqG/xPoTWmTxyOWaQXAUTu3Yj/sCPe8Plw9oalIzYzOserAahim57u3rMVixGvW5Fq1AqQcISzwf/zvvUD9uopk7QI639ICowbXiNIVDgXhaRsuJ3BmaBoLhVodt+m83j8/kzpvDpaWl2flPmC2o7t78b5o=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3029.namprd11.prod.outlook.com (2603:10b6:a03:8e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Mon, 12 Apr
 2021 10:12:22 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::743e:9115:21df:d5a]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::743e:9115:21df:d5a%5]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 10:12:22 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <jacopo@jmondi.org>
CC:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 28/30] dt-bindings: media: atmel: add microchip-xisc
 binding
Thread-Topic: [PATCH v2 28/30] dt-bindings: media: atmel: add microchip-xisc
 binding
Thread-Index: AQHXKjSqXVo9iDXeREu/i677rFa/aKqwsAMAgAAEM4A=
Date:   Mon, 12 Apr 2021 10:12:22 +0000
Message-ID: <7269db4c-bc76-58e4-4423-7be9f0369d5c@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
 <20210405155105.162529-29-eugen.hristev@microchip.com>
 <20210412095714.uivebcatgazzq5ae@uno.localdomain>
In-Reply-To: <20210412095714.uivebcatgazzq5ae@uno.localdomain>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.121.125.229]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 345d1d81-4f1e-45f2-f950-08d8fd9b767e
x-ms-traffictypediagnostic: BYAPR11MB3029:
x-microsoft-antispam-prvs: <BYAPR11MB30297556EF4DC2A4DB16D917E8709@BYAPR11MB3029.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3rCzc45FgESQaeTxvSJmOB31o84n46Jbdd8iJEKnoLP6cI50QUQEwdJ1xkuwDqCLbv89bLN/JpQTyEeM7j14sOFHgH7PiLpmkLK+EHldpPCmGQmPFQRVeF1trGGB7iqvQ/TW3P+Bq4clrXaUVsaCjw5+17D9kbpxmz+9ngIh7b5MzzGHSkYoTniFpRXwSzjTOXYUo8MUNVdvrd2xFhLfLPj30CRV/RNe5ORch25wWoe9JQUyIEQ82XqmQDCOca91Y3bUMr62h8BP6HnXXFX+uZuAzWgWXv+N7ZjlGZ/aGoTeY0cm/QoPg9/rqXJ4vasvnnY4aCTavL7u5jdO6GmemJkJrWWIDzBkBxfX7CtfVxin3dU5NEV5qnJHqoTyw2tttEAOYDPPOaFP3nciGmRH5ZqPGH6ShBqALylh8vHLTypImWvT5PmqCfupc384U7MaQjc9IPlNLJFg7y7JYEg1llTlPkK6UdwI4Hba3xpR0Q5W+OXgJidJ9xjK8J6PpmjY0imze/sRpPh4yqquyAZP8Kt0MQWfa7+pUSBKMxP3HCS0oppSCD9fpSK4w3hEQ2OUv0p+3RUrDxCpV6uUoH7i736u/5+aG4bTCTpPrFwpEuW2wePjeBopJpSRd2NfLpXyPQgx5eVzVudtnVbMW2l+I4YVKQtFe3dsirYCScHyXNPplkM5HrZ8C6uFVXY5Czgu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(346002)(376002)(396003)(136003)(31686004)(186003)(8676002)(6486002)(26005)(54906003)(8936002)(71200400001)(5660300002)(6512007)(38100700002)(478600001)(83380400001)(91956017)(66446008)(64756008)(2616005)(76116006)(36756003)(31696002)(53546011)(6916009)(66476007)(66556008)(66946007)(4326008)(86362001)(6506007)(2906002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bXZnaVFnWE1GYjhWR09FT1FCR3pCK1JDNDRPTk9YVGxmU1lhZ0Nud0JkVlF5?=
 =?utf-8?B?THUrNzJKNHRPY3B3dXVwVDlTU3B0R01tQW00V09ISSt1SVVOWEw1dXNveUVn?=
 =?utf-8?B?blgvQUt5bnBWckl4U3c1QlpjbzRlaDl5NGgxVzN2MHE2OE9DM0tNK3JObWFl?=
 =?utf-8?B?VWJQejRKdjlxcUVGNHdmTjROTk5TQXFkTHNueldrVHpJWnNQOGRxNGxLd090?=
 =?utf-8?B?T2tscTAyNnJZTXl6WWVLYTJWbjdpbU9xdFdJSVdtSjRMUjkzQXhsVERqZEJz?=
 =?utf-8?B?NXBUUHRMZ2VoN3ZpeTIzOWoya3ZJeW5lWFdqZlR6cTFiWUllRXoyRmF1NWly?=
 =?utf-8?B?eCtxTG9VK3JucHRTYi8wRjJhZk5aT3JkbzZQbjR0YW5iK0dZSG51ck04VzBH?=
 =?utf-8?B?OWpBdGM3cWJJbXpZRlhDZ2poSUNodEdGKzJQbU5MU2tJWittWTQ2OTBTcXUw?=
 =?utf-8?B?Tk82S3ZTbkdySklHZTk0L1VtU3dmSmt6eGwrRHpuc3dlUk00a055VmQ5Y3g3?=
 =?utf-8?B?MFNpQVhrenJZM3NjRE4va2MzaTIybHBlY2ZKcVJDQmYyVmlBRnlhTGRONDd5?=
 =?utf-8?B?TXNCK2hocStLMmdaQ0JrdHZGOHRIZmVRcHJYdWhIWWUrTTNsd2Z0UjFCU1JM?=
 =?utf-8?B?dHVYZnduWlNlSERnYnBKNDcydjBJQ1ErWURoemNIbCtuQkplTkk3MC93cC9o?=
 =?utf-8?B?THZ1WmhNWWFmeS9ncU84MGl4U2poNFZ0VXBTWkF4RlpJd2diellkRkFCN3FF?=
 =?utf-8?B?RGVraVl0cEdadHF5WVRkRHEvNHFUbkVHaFJodWpHNTNDQkxrZHpZQVVBL3lD?=
 =?utf-8?B?Wmc0c2s4UW16eW5va2FYbjI5eWtFbTlqT1o3cm54L2pyZlF5RS9jcFIvSXRs?=
 =?utf-8?B?dVY4V0w3UnhQK1B0YUoxL0g1T2UxK3FGNm05Nm43V0h0aFBoZERZblR1allD?=
 =?utf-8?B?SDhuNnJhSkcwUjBSL1hQOWZQMXpqK21Db0tLT0hmZVB2bDU1ODZSY20yMFlH?=
 =?utf-8?B?VGt1NGhyTnNEZlhRVzY5RG12M0E4N09VSVJubU44TFhUbCtNMXF1OUV0V3Bw?=
 =?utf-8?B?YlkxNEZIeGNmenJxZ0hXTnpCZ0VjWDBxdkZkMWlCem5aZVg2VkFQOW9WSFQ5?=
 =?utf-8?B?c3JCeVBLNVRoVzNnVXBMRStON2NETWVYOHJoZjhZRE1jSTl2WSsyMTVjZ0lm?=
 =?utf-8?B?RUtsbWFqZGxseURpT1hPZkZCV1JvKzBYZVRaMnJKOWl3MzFiRjZlTFhtbGo3?=
 =?utf-8?B?QXBMNGhoYUxMVGFkMzJYd1FhZDU5dndMZENHR3FrWDR0azJSZE5pMTZrblRr?=
 =?utf-8?B?ZVQ4ZGlNWmsrOU5qNmpSa0tDVjJuTzQ1c1F2VVVYRVd0Nm9PaS9pdmozSVV3?=
 =?utf-8?B?UndnbCtFWGdQZVcvN1hmVGlJbUFwMkI5ZDZ6YWhVczhWWDNJeXhZQmZPVEhO?=
 =?utf-8?B?alVYRytMWkVnQmVhR0xHbzFqcDBia2lwNjNxMzV1VGtoVWNkTm1vZXRNdUpy?=
 =?utf-8?B?THJiV3BBSDJhN3ZZdXVWS1U4N092a3NZTSszejBCUjEvUkZtTnlWeHJKS2Vp?=
 =?utf-8?B?d1JvOVBwems1dXNXZVRCNEtIcVdhTFFBYkxUdXArUmdkZFFlN1NUSHl3Sjcw?=
 =?utf-8?B?eHIxSkpYaHIrOXFaUG9CNFJGczdmMVdwamNQcFZsMTY1aHljSTZSTHgreE1y?=
 =?utf-8?B?Z051RDIvaTJQQ05rMjdOR3I0c0VqYy9nZjQ4M3A0cHZGazM2UG8wWDg3VHQ4?=
 =?utf-8?Q?MZxiQAtLNgdlc3q61InX45rOJh8ZU7rMOn8EsfZ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B45C2AB4B2A0DE46ADF1333338C5CEF7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345d1d81-4f1e-45f2-f950-08d8fd9b767e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 10:12:22.2009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IO8imkcncPL4wi/YzEc9WdQBtErVIzUIxtSr7H+atWqIb1EkkDXI+/vvPXSCQcfMyYcJ+cn0UMal50rumJyGwxS2KLArzmeJO/8Xz9tNbA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3029
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gNC8xMi8yMSAxMjo1NyBQTSwgSmFjb3BvIE1vbmRpIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIEV1Z2VuZSwNCj4gDQo+IE9uIE1vbiwgQXBy
IDA1LCAyMDIxIGF0IDA2OjUxOjAzUE0gKzAzMDAsIEV1Z2VuIEhyaXN0ZXYgd3JvdGU6DQo+PiBB
ZGQgYmluZGluZ3MgZm9yIHRoZSBtaWNyb2NoaXAgeGlzYywgYSBkcml2ZXIgYmFzZWQgb24gYXRt
ZWwtaXNjLg0KPj4gSXQgc2hhcmVzIGNvbW1vbiBjb2RlIHdpdGggYXRtZWwtaXNjLCBidXQgdGhl
IHhpc2MgaXMgdGhlIG5leHQgZ2VuZXJhdGlvbg0KPj4gSVNDIHdoaWNoIGlzIHByZXNlbnQgb24g
c2FtYTdnNSBwcm9kdWN0Lg0KPj4gSXQgaGFzIGFuIGVuaGFuY2VkIHBpcGVsaW5lLCBhZGRpdGlv
bmFsIG1vZHVsZXMsIGZvcm1hdHMsIGFuZCBpdCBzdXBwb3J0cw0KPj4gbm90IG9ubHkgcGFyYWxs
ZWwgc2Vuc29ycywgYnV0IGFsc28gc2VyaWFsIHNlbnNvcnMsIGJ5IGNvbm5lY3RpbmcgdG8gYSBk
ZW11eA0KPj4gZW5kcG9pbnQgcHJlc2VudCBvbiBzYW1hN2c1Lg0KPj4gT25lIG9mIHRoZSBrZXkg
cG9pbnRzIGZvciBjcmVhdGluZyBhIG5ldyBiaW5kaW5nIGlzIHRoZSBjbG9ja2luZyBzY2hlbWUs
IGFzDQo+PiBhdG1lbC1pc2MgcmVxdWlyZXMgMyBtYW5kYXRvcnkgY2xvY2tzLCB0aGUgbWljcm9j
aGlwLXhpc2MgcmVxdWlyZXMgYSBzaW5nbGUNCj4+IGlucHV0IGNsb2NrLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4+
IC0tLQ0KPj4NCj4+IEhlbGxvIFJvYiwgYWxsLA0KPj4NCj4+IEkgZGlkIG5vdCBjb252ZXJ0IHRo
aXMgeWV0IHRvIHlhbWwgYmVjYXVzZSBJIHdvdWxkIGxpa2UgZmlyc3QgeW91ciBmZWVkYmFjaw0K
Pj4gaWYgdGhlIGJpbmRpbmcgaXMgZ29vZC4NCj4+IElmIGl0J3MgZmluZSBJIHdpbGwgY29udmVy
dCBib3RoIHRoaXMgbmV3IGJpbmRpbmcgYW5kIHRoZSBvbGQgYXRtZWwtaXNjDQo+PiB0byB5YW1s
Lg0KPj4NCj4+IFRoYW5rcyBmb3IgeW91ciBmZWVkYmFjaywNCj4+IEV1Z2VuDQo+Pg0KPj4gICAu
Li4vYmluZGluZ3MvbWVkaWEvbWljcm9jaGlwLXhpc2MudHh0ICAgICAgICAgfCA2NCArKysrKysr
KysrKysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspDQo+PiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvbWljcm9jaGlwLXhpc2MudHh0DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9taWNyb2NoaXAteGlzYy50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWljcm9jaGlwLXhpc2MudHh0DQo+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wODBhMzU3ZWQ4NGQNCj4+
IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9taWNyb2NoaXAteGlzYy50eHQNCj4+IEBAIC0wLDAgKzEsNjQgQEANCj4+ICtNaWNy
b2NoaXAgZVh0ZW5kZWQgSW1hZ2UgU2Vuc29yIENvbnRyb2xsZXIgKFhJU0MpDQo+PiArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gKw0KPj4gK1JlcXVp
cmVkIHByb3BlcnRpZXMgZm9yIFhJU0M6DQo+PiArLSBjb21wYXRpYmxlDQo+PiArICAgICBNdXN0
IGJlICJtaWNyb2NoaXAsc2FtYTdnNS14aXNjIi4NCj4+ICstIHJlZw0KPj4gKyAgICAgUGh5c2lj
YWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIHJlZ2lzdGVycyBzZXQgZm9yIHRoZSBk
ZXZpY2UuDQo+PiArLSBpbnRlcnJ1cHRzDQo+PiArICAgICBTaG91bGQgY29udGFpbiBJUlEgbGlu
ZSBmb3IgdGhlIFhJU0MuDQo+PiArLSBjbG9ja3MNCj4+ICsgICAgIExpc3Qgb2YgY2xvY2sgc3Bl
Y2lmaWVycywgY29ycmVzcG9uZGluZyB0byBlbnRyaWVzIGluDQo+PiArICAgICB0aGUgY2xvY2st
bmFtZXMgcHJvcGVydHk7DQo+PiArICAgICBQbGVhc2UgcmVmZXIgdG8gY2xvY2stYmluZGluZ3Mu
dHh0Lg0KPj4gKy0gY2xvY2stbmFtZXMNCj4+ICsgICAgIFJlcXVpcmVkIGVsZW1lbnRzOiAiaGNs
b2NrIi4NCj4+ICsgICAgIFRoaXMgaXMgdGhlIGNsb2NrIHRoYXQgY2xvY2tzIHRoZSBzZW5zb3Ig
Y29udHJvbGxlciwgYW5kIGlzIHVzdWFsbHkNCj4+ICsgICAgIGZlZCBmcm9tIHRoZSBjbG9jayB0
cmVlLiBJdCBpcyB1c2VkIGZvciB0aGUgaW50ZXJuYWwgY29udHJvbGxlciBsb2dpYy4NCj4+ICst
ICNjbG9jay1jZWxscw0KPj4gKyAgICAgU2hvdWxkIGJlIDAuDQo+PiArLSBjbG9jay1vdXRwdXQt
bmFtZXMNCj4+ICsgICAgIFNob3VsZCBiZSAiaXNjLW1jayIuDQo+PiArLSBwaW5jdHJsLW5hbWVz
LCBwaW5jdHJsLTANCj4+ICsgICAgIFBsZWFzZSByZWZlciB0byBwaW5jdHJsLWJpbmRpbmdzLnR4
dC4NCj4+ICsNCj4+ICtPcHRpb25hbCBwcm9wZXJ0aWVzIGZvciBYSVNDOg0KPj4gKy0gbWljcm9j
aGlwLG1pcGktbW9kZTsNCj4+ICsgICAgIEFzIHRoZSBYSVNDIGlzIHVzdWFsbHkgY29ubmVjdGVk
IHRvIGEgZGVtdXgvYnJpZGdlLCB0aGUgWElTQyByZWNlaXZlcw0KPj4gKyAgICAgdGhlIHNhbWUg
dHlwZSBvZiBpbnB1dCwgaG93ZXZlciwgaXQgc2hvdWxkIGJlIGF3YXJlIG9mIHRoZSB0eXBlIG9m
DQo+PiArICAgICBzaWduYWxzIHJlY2VpdmVkLiBUaGUgbWlwaS1tb2RlIGVuYWJsZXMgZGlmZmVy
ZW50IGludGVybmFsIGhhbmRsaW5nDQo+PiArICAgICBvZiB0aGUgZGF0YSBhbmQgY2xvY2sgbGlu
ZXMuDQo+IA0KPiBXaGF0IGRvZXMgJ21pcGktbW9kZScgZG8gdG8gYSBjb21wb25lbnQgdGhhdCBo
YXMgYW4gcGFyYWxsZWwgcmVjZWl2ZXIgPw0KDQpBY3R1YWxseSwgdGhpcyBpbmRlZWQgaGFzIGEg
cGFyYWxsZWwgcmVjZWl2ZXIsIGJ1dCBpdCdzIG9ubHkgaW5zaWRlIHRoZSANClNvQy4gVGhlIG90
aGVyIGVuZCBvZiB0aGUgcGFyYWxsZWwgY29ubmVjdGlvbiBpcyBhIGRlbXV4ZXIvYnJpZGdlLiBU
aGlzIA0KZGVtdXhlciB3aWxsIHRha2UgdGhlIGlucHV0IGZyb20gZWl0aGVyIGEgcmVhbCBwYXJh
bGxlbCBzZW5zb3Igb3IgYSBDU0kyIA0Kc3RyZWFtLg0KRXZlbiBpZiB0aGUgcGl4ZWxzIGFyZSB0
aGVuIGNvbnZlcnRlZCBpbnRvIGEgcGFyYWxsZWwgc3RyZWFtLCBpdCBsb29rcyANCmxpa2UgdGhl
IHBpeGVsIGRhdGEgaGFzIGEgYml0IG9mIGRpZmZlcmVudCBjb25zdHJhaW5zIGluIHRlcm0gb2Yg
aG9sZCANCmFuZCBzZXR1cCB0aW1lLCBhbmQgb3RoZXIgZWxlY3RyaWNhbCBjaGFyYWN0ZXJpc3Rp
Y3MgaW5zaWRlIHRoZSBTb0MuDQpUaGUgWElTQyBoYXJkd2FyZSBkZXNpZ25lciBkZWNpZGVkIHRv
IGxlYXZlIGEgYml0IGluIHRoZSB1c2VyIGludGVyZmFjZSANCmNhbGxlZCAnbWlwaS1tb2RlJyAs
IGFuZCBieSBzZXR0aW5nIHRoaXMsIHRoZSBjYXB0dXJlIGludGVyZmFjZSBvZiB0aGUgDQpYSVND
IGlzIGJldHRlciBhZGFwdGVkIHRvIGEgZGVtdXhlZCBzdHJlYW0gZnJvbSBhIENTSTIsIHJhdGhl
ciB0aGFuIA0KYWRhcHRlZCB0byBhIHN0cmVhbSBjb21pbmcgZnJvbSBhIHBhcmFsbGVsIHNlbnNv
ciBkaXJlY3RseS4NCg0KSSBhbSBub3Qgc3VyZSBJIGV4cGxhaW5lZCBpdCByaWdodCwgYnV0IHRo
aXMgaXMgd2hhdCBJIHVuZGVyc3RhbmQsIHdoZW4gDQpJIGFza2VkIHRoZSBoYXJkd2FyZSBkZXNp
Z24gYWJvdXQgaXQuDQoNClNvIHdlIGhhdmUgdG8gbWFudWFsbHkgc2V0IHRoaXMgYml0IGlmIHdl
IGhhdmUgdGhlIGRlbXV4ZXIgZGVzZXJpYWxpemluZyANCnRoZSBDU0kyIHBpeGVscyBvciB0aGV5
IGFyZSBjb25uZWN0ZWQgdG8gYSBwYXJhbGxlbCBzZW5zb3IuDQpUaGUgWElTQyBoYXMgbm8gd2F5
IG9mIHRlbGxpbmcgd2hpY2ggaXMgdGhlIGNvcnJlY3Qgc2V0dXAsIGFuZCBmcm9tIHRoZSANCmRl
bXV4ZXIgcGVyc3BlY3RpdmUsIHRoaW5ncyBhcmUgdGhlIHNhbWUuDQoNClRoZSBlbmRwb2ludCBj
b25uZWN0aW9uIGJldHdlZW4gdGhlIHhpc2MgYW5kIHRoZSBkZW11eGVyIGxvb2tzIHRvIGJlIHRo
ZSANCnNhbWUsIGxvb2tpbmcgYXMgaWYgdGhlcmUgaXMgYSBwYXJhbGxlbCBjb25uZWN0aW9uLg0K
VG8ga25vdyBtb3JlLCB0aGUgWElTQyB3b3VsZCBiZSBuZWVkaW5nIHRvIGxvb2sgZnVydGhlciBk
b3duIHRoZSANCnBpcGVsaW5lLCBhbmQgdGhpcyBpcyBzb21ldGhpbmcgd2hpY2ggSSBjb3VsZCBu
b3QgZm9yY2UgaXQgdG8gZG8uDQoNCg0KPiANCj4+ICsNCj4+ICtYSVNDIHN1cHBvcnRzIGEgc2lu
Z2xlIHBvcnQgbm9kZSB3aXRoIGludGVybmFsIHBhcmFsbGVsIGJ1cy4NCj4+ICtJdCBzaG91bGQg
Y29udGFpbiBvbmUgJ3BvcnQnIGNoaWxkIG5vZGUgd2l0aCBjaGlsZCAnZW5kcG9pbnQnIG5vZGUu
DQo+PiArUGxlYXNlIHJlZmVyIHRvIHRoZSBiaW5kaW5ncyBkZWZpbmVkIGluDQo+PiArRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0Lg0K
Pj4gKw0KPj4gK1RoaXMgZW5kcG9pbnQgaGFzIHRvIGJlIGNvbm5lY3RlZCB0byBhIGJyaWRnZSB0
aGF0IGFjdHMgYXMgYSBkZW11eCBmcm9tIGVpdGhlcg0KPj4gK2Egc2VyaWFsIGludGVyZmFjZSBv
ciBhY3RzIGFzIGEgc2ltcGxlIGRpcmVjdCBicmlkZ2UgdG8gYSBwYXJhbGxlbCBzZW5zb3IuDQo+
PiArDQo+PiArRXhhbXBsZToNCj4+ICt4aXNjOiB4aXNjQGUxNDA4MDAwIHsNCj4+ICsgICAgIGNv
bXBhdGlibGUgPSAibWljcm9jaGlwLHNhbWE3ZzUtaXNjIjsNCj4+ICsgICAgIHJlZyA9IDwweGUx
NDA4MDAwIDB4MjAwMD47DQo+PiArICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNTYgSVJRX1RZ
UEVfTEVWRUxfSElHSD47DQo+PiArICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+ICsgICAg
ICNzaXplLWNlbGxzID0gPDA+Ow0KPj4gKyAgICAgY2xvY2tzID0gPCZwbWMgUE1DX1RZUEVfUEVS
SVBIRVJBTCA1Nj47DQo+PiArICAgICBjbG9jay1uYW1lcyA9ICJoY2xvY2siOw0KPj4gKyAgICAg
I2Nsb2NrLWNlbGxzID0gPDA+Ow0KPj4gKyAgICAgY2xvY2stb3V0cHV0LW5hbWVzID0gImlzYy1t
Y2siOw0KPj4gKyAgICAgbWljcm9jaGlwLG1pcGktbW9kZTsNCj4+ICsNCj4+ICsgICAgIHBvcnRA
MSB7DQo+PiArICAgICAgICAgICAgIHJlZyA9IDwxPjsNCj4+ICsgICAgICAgICAgICAgeGlzY19p
bjogZW5kcG9pbnQgew0KPj4gKyAgICAgICAgICAgICBidXMtd2lkdGggPSA8MTI+Ow0KPj4gKyAg
ICAgICAgICAgICBoc3luYy1hY3RpdmUgPSA8MT47DQo+PiArICAgICAgICAgICAgIHZzeW5jLWFj
dGl2ZSA9IDwxPjsNCj4+ICsgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZjc2kyZGNf
b3V0PjsNCj4gbml0OiBpbmRlbnRhdGlvbg0KPiANCj4gSGF2ZSB5b3UgY29uc2lkZWQgdXNpbmcg
YnVzLXR5cGUgcHJvcGVydHkgPyBBcyB0aGF0J3MgYSBuZXcgYmluZGluZyBJDQo+IHdvdWxkIGNv
bnNpZGVyIG1ha2luZyBpdCBtYW5kYXRvcnksIGFuZCB0byBtb2RpZnkgdGhlIERUIHBhcnNpbmdh
DQo+IHJvdXRpbmUgYWNjb3JkaW5nbHkgdG8gcmVtb3ZlIGF1dG8tZ3Vlc3NpbmcsIHdoaWNoIGFj
Y29yZGluZyB0byBteQ0KPiB1bmRlcnN0YW5kaW5nIGlzIGFsbW9zdCAnZGVwcmVjYXRlZCcgPw0K
DQpIYXZpbmcgYnVzLXR5cGUgd291bGQganVzdCBiZSBhbiB1c2VmdWwgYWRkaXRpb24gZm9yIGZp
bmRpbmcgb3V0IHRoZSBidXMgDQppbnRlcmZhY2UgPyBvciBpdCBoYXMgc29tZSBvdGhlciBjb25z
ZXF1ZW5jZXMgYXMgd2VsbCA/DQpDdXJyZW50IFhJU0MgY29kZSBhY3R1YWxseSBleHBlY3RzIGEg
cGFyYWxsZWwgaW50ZXJmYWNlLCBzbyBpdCdzIGtpbmQgb2YgDQpzZXQgYWxyZWFkeSwgaGF2aW5n
IGEgYnVzLXR5cGUgd291bGQgbm90IGJyaW5nIGFueSBuZXcgaW5mb3JtYXRpb24gZnJvbSANCmEg
ZHJpdmVyIHBlcnNwZWN0aXZlDQoNCj4gDQo+PiArICAgICAgICAgICAgIH07DQo+PiArICAgICB9
Ow0KPj4gK307DQo+PiArDQo+PiAtLQ0KPj4gMi4yNS4xDQo+Pg0KDQo=
