Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09635F3D9D
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 10:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbiJDIDO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 04:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiJDIDM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 04:03:12 -0400
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 04 Oct 2022 01:03:11 PDT
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 055322E69B;
        Tue,  4 Oct 2022 01:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3486; q=dns/txt; s=iport;
  t=1664870591; x=1666080191;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=o0XYSVCyv8gZ/I8rxKh7EE4zytGbcTSTNs0JlyErOyc=;
  b=f3IQRDjXI2FwiD//MJ3T2aurQsffZe6xBZW7XYy7T95JvNHxjGhsMW2b
   LNQPyRJvJpq+sIT/UzCbCkeWNKwatDnngNOEsq+QIAWll0N5kQrjM45kX
   VtRFGn4Zi5uCtYK1p/Su3mD6PakVHOKxNUVmhjept4ZrbLj3K3w0dJyPc
   U=;
IronPort-PHdr: =?us-ascii?q?A9a23=3AF8RXLx2WEjW2I0lZsmDPr1BlVkEcU/3cMg0U7?=
 =?us-ascii?q?88hjLRDOuSm8o/5NUPSrfNqkBfSXIrd5v4F7oies63pVWEap5rUtncEfc9AU?=
 =?us-ascii?q?hYfgpAQmAotSMeOFUz8KqvsaCo3VMRPXVNo5Te1K09QTc3/fFbV5Ha16G16J?=
 =?us-ascii?q?w=3D=3D?=
IronPort-Data: =?us-ascii?q?A9a23=3AizSMPq0reHxEC3YEX/bD5QRzkn2cJEfYwER7X?=
 =?us-ascii?q?KvMYLTBsI5bp2RUnWccC2GFbKvYNGShfNl+bdzi/UsOupeDm4Q1QAtt3Hw8F?=
 =?us-ascii?q?HgiRegpqji6wuYcB84ZRyH6ZBoPA/42N5+RdajYcleG/k33auW48yElvU21b?=
 =?us-ascii?q?uOU5NDsa3gZqTBMEE/NuTo78wIIqtYAbeqRWmthivuqyyHrA2JJ7hYvWo4iB?=
 =?us-ascii?q?w1vnzs01Bj6kGtwUlXT/pmntneG/5UeJMp3ya1csxLFrodo8u6SH44vzZmj9?=
 =?us-ascii?q?W/fuhwqEN7gyPDwc1YBRfjZOg3mZnh+Avf5xEMd4H1plP9mb5Lwam8P49mNt?=
 =?us-ascii?q?9B1yshLupOqYQwoJabL3u8aVnG0FgknZfAbouCbfifh2SCU5wicG5f2+N1iA?=
 =?us-ascii?q?V83NoAE4Ot6KX9B+OZeKz0XaB2HweWsz9qTTuhqm9RmKcTnPYo3pH5t13faA?=
 =?us-ascii?q?OwgTJSFRL/FjfdC2z0wrsNDB/DTY4weczUHUfhqS3WjIX8NA5442eyvnHS6K?=
 =?us-ascii?q?XtTqUmeouw85G278eC465C1WPK9RzBAbZw9cp6km1/7?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AZ2bgbKM3EJic6MBcT2r155DYdb4zR+YMi2?=
 =?us-ascii?q?TDiHoedfUFSKOlfp6V8MjzjSWE9Ar4WBkb6LS90DHpewKRyXcH2/hvAV7EZn?=
 =?us-ascii?q?iohILIFvAu0WKG+Vzd8kLFh5ZgPMtbAspD4ZjLfCVHZKXBkUeF+rQbsaK6Gc?=
 =?us-ascii?q?mT7I+0pRoMPGJXguNbnn1E422gYypLrXx9dOME/e2nl6x6TlSbCBEqR/X+Ik?=
 =?us-ascii?q?NAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEg9n8PMHyyzoggb57q?=
 =?us-ascii?q?Ksv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyjpAJb4RGIFqjgpF5d1H22?=
 =?us-ascii?q?xa1OUkZC1QePib3kmhPF1dZyGdnTUIngxeskMKgmXo/0cL6faJNQ7STfAx3b?=
 =?us-ascii?q?6wtnDimhAdVBYW6tMR44vRjesmMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZ?=
 =?us-ascii?q?IZc6I5l/1WwKp5KuZ3IMvB0vFvLMB+SMXHoPpGe1KTaH7U+mFp3dy3R3w2Wh?=
 =?us-ascii?q?OLWFILtMCZ2yVf2CkR9TpT+OUP2nMbsJ4tQZhN4OrJdqxuibFVV8cTKaZwHv?=
 =?us-ascii?q?0IT8e7AnHEBRjMLGWRK1L6E7xvAQOHl7fnpLEuoO26cp0By5U/3JzHTVNDrG?=
 =?us-ascii?q?Y3P1njDMWftac7hSwlgF/NKQgF5vsukqSR4IeMN4YDGRfzOmwTrw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0B2BgAHbIJi/5ldJa1aHgErCwYMIoF?=
 =?us-ascii?q?PgVJSB3UCWDlDhE6DSgIDhTGFCYMFmziBLIElA1QLAQEBDQEBNwsEAQGFAgI?=
 =?us-ascii?q?WhSgCJTQJDgECBAEBARIBAQUBAQECAQcEgQkThWgBDIZCAQEBAQIBEhERDAE?=
 =?us-ascii?q?BNwEECwIBBgIYAgImAgICMBUQAgQOBSKCXIJjAw0kAQ6QMI83AYE+AoofeoE?=
 =?us-ascii?q?xgQGCCAEBBgQEgTcBg1UYgjgJgRAsgxSEKYMGhB0nHIINgRWBPIFuPoJiAYF?=
 =?us-ascii?q?LLYM/gmWNV4YggVMdOwNUgQUSgSFxAQgGBgcKBTIGAgwYFAQCExJTHgITDAo?=
 =?us-ascii?q?cDlQZDA8DEgMRAQcCCxIIFSwIAwIDCAMCAyMLAgMYCQcKAx0IChwSEBQCBBM?=
 =?us-ascii?q?fCwgDGh8tCQIEDgNDCAsKAxEEAxMYCxYIEAQGAwkvDSgLAwUPDwEGAwYCBQU?=
 =?us-ascii?q?BAyADFAMFJwcDIQcLJg0NBBwHHQMDBSYDAgIbBwICAwIGFwYCAnEKKA0IBAg?=
 =?us-ascii?q?EHB4lEwUCBzEFBC8CHgQFBhEJAhYCBgQFAgQEFgICEggCCCcbBxY2GQEFXQY?=
 =?us-ascii?q?LCSMcLAsGBQYWAyYnKwYiARuVW4IIgQ4rR3+XHKlMgTAKg0yLGpRwMYVEoxO?=
 =?us-ascii?q?WZiCNB5lXAgQCBAUCDgEBBoFhPIFZcBUagwkJSBkPjiwWg1CFFIVKdTsCBgE?=
 =?us-ascii?q?KAQEDCY5TgkcBAQ?=
X-IronPort-AV: E=Sophos;i="5.91,230,1647302400"; 
   d="scan'208";a="1055274776"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 04 Oct 2022 08:02:06 +0000
Received: from mail.cisco.com (xfe-aln-001.cisco.com [173.37.135.121])
        by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 29482597017994
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 4 Oct 2022 08:02:06 GMT
Received: from xfe-rcd-005.cisco.com (173.37.227.253) by xfe-aln-001.cisco.com
 (173.37.135.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Tue, 4 Oct 2022
 03:02:05 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (72.163.14.9) by
 xfe-rcd-005.cisco.com (173.37.227.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9
 via Frontend Transport; Tue, 4 Oct 2022 03:02:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLPAruuPw1qCX6BgEMebFOXegkPZQtotqi3sJX4oVG5Ldflu2ugaSf6sU3EgrJx6InMu90EDJ1ibOlHoRz8H9d4oF5ftr665nzxhzHQyg+UtRCCPwCeiSYyOW8wEhwTw4nHO3c/RCoYjOnwHVUB7UjB4UrnwEMh99eMKK1sAGA5Utm8YvYAiDkgdLfMrpwnyMaz7lU6tN4bwZOwREO2v3rErKfnvnuwp86mATZOoJ2E2CioRz+LT4Y8NrViY/mTfqOaMHNvFmYU0oeVrqyyGMqkXWtf9ehikbl7YUrn3RZcFsUWu/egDnaW39wUX8o7kEWljGE9oxLh0McCNFPVjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0XYSVCyv8gZ/I8rxKh7EE4zytGbcTSTNs0JlyErOyc=;
 b=htEPojUu2FRC9D57tV/uT4uI+KQkrO3mzPrb08ksR899GM8ssfyslPEChxFdUroDs5lUxr8GiWIiNyHTZqmMVwXXX75VtikdAdpb1Ax4dZzufoRKCjCebqnpHyT7oIesrUk1mGyDpj5rkZfpoF4hcmB2PjCPP4w660Afi6v5J7KALYBFCUErLXtqo8JikW7UJfEu4dpqNzbytN4G5UcodSWf/Ew5KXbWGDglDqm1jhdQBptvdh355u5sILO3hr86UMqhiyoFBRzhYaySuf4n9JnrJXM8hWaFvGLY7TDpcddLlY9SlNMRxa6Desk/oSUtob8jFgeLqwsY19jIgcDzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0XYSVCyv8gZ/I8rxKh7EE4zytGbcTSTNs0JlyErOyc=;
 b=tE4aEZ5zG7RLmtHsOOUBN+kywuIXYvr7nwRaKBuMp3vwOUUrMoOUtzITpvqYJet2Ak6xCYsXO2nGgwJgx942pGs9MYm2YFCiD8Rs1WJNv8MWxQO4+ugMpstjWxbuK24ApThdLsWIvYazWQoByQ1+OPGli1SWrM3gWV6AXT3D9yQ=
Received: from PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 by DM4PR11MB6359.namprd11.prod.outlook.com (2603:10b6:8:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.30; Tue, 4 Oct
 2022 08:02:03 +0000
Received: from PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::1876:fa5b:674:d80]) by PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::1876:fa5b:674:d80%3]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 08:02:03 +0000
From:   "Erling Ljunggren (hljunggr)" <hljunggr@cisco.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: media: add cat24c208 bindings
Thread-Topic: [PATCH v3 3/5] dt-bindings: media: add cat24c208 bindings
Thread-Index: AQHY0yxyo+8f0izUE0O3/i/ePvWV0q32Z+UAgAeBNwA=
Date:   Tue, 4 Oct 2022 08:02:03 +0000
Message-ID: <860b36883737fc0789f8fcea4a243a889c87b873.camel@cisco.com>
References: <20220928112147.358745-1-hljunggr@cisco.com>
         <20220928112147.358745-4-hljunggr@cisco.com>
         <20220929132646.GA1881529-robh@kernel.org>
In-Reply-To: <20220929132646.GA1881529-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4792:EE_|DM4PR11MB6359:EE_
x-ms-office365-filtering-correlation-id: 9aea50b3-4353-401f-a0c6-08daa5deb939
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ey9FKjtGyoZFGZN6GKkIqsjek3J7wxL7tBq0u07COzJp9fUV1ROOIkTBUQFvhwNEt8ZeAOP5tjttfj7cmPsjh68Y9nL1YmJ7IXyES3bcXJWu/9bci0Qy4HhIPa3Fx9CYaCPrmfFiBUfMdMQdz6FURh/08MS3XSde3bvCVqRL/3WUHB4mt4f2gLMCSXbRWppjyRyloxFwuP9Obu+uhYGoFwX39DWzdKW98nWW+d0LKtllYUvG5sFiysOdN4vp4om0Dbm/EbbYNyfW/SMbyZxVU5/0OAM9Lg4yX2B/EXr0WZW3FL2ugpNuzWnp00Ig4HLH0uOo6LPlRbTNWpDBSpAhc4MIkmsFaSxb99wzZjVDfM9VBAAml7KPuzJNiz5mLbH/DEGiJnZ4TPymbJxqtblTHKdS9aQOXTEZ+HuJNAel/XtqcOSqqYc6enx0PRHKcd3sBSQBSdtMvuBKvZ12rfDWKNsjfdF0I+C++QxVHfZLG1f0iQdWWeVR9SPRQBnPsSeqsN6i2opdgk25cmXYDab/hYf1al8FEvIlcpV2O7kHTYaS/DvL7s0cmTKbvQprJlXaSIT/lj++EsfZFBYOGPkEfLL2ZGApjoQXrKtZk4lXIsbzwZkae5CKF9z8WhrKDZcVCKNo7dXTVPMPzBmBwmw2KKnIMAJUdybL0RV/z5n/2oy1MGxaCNmnudl56HenTeToXp9buECQLqVqlH4QLIykboNaiWmzULmSBLU1qeaWFZouuhhPYd7/LQZujMnnWFSwOMbUdEC99QaFfi6XGETCCsAViPHY6kTKwiPzeuj04Zc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199015)(66556008)(76116006)(66446008)(64756008)(91956017)(66946007)(8676002)(66476007)(2906002)(186003)(4326008)(83380400001)(41300700001)(36756003)(6512007)(966005)(6486002)(38100700002)(38070700005)(478600001)(71200400001)(86362001)(6506007)(54906003)(6916009)(122000001)(316002)(2616005)(8936002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ni9QYURNWm5wc2VjZUUxWGlndkRZdVBvSEhCNUNIWk40N3B1enp4MFNqYk80?=
 =?utf-8?B?THhLSjBRb1BYOGVnLzZMSUZNcndrbTh5ZThIRi8wMGtaMG54ZW5JTWd2Y1J0?=
 =?utf-8?B?RnY5OHMyS2JBWlVRMFRkdnNSYlorWnpxNXl2Y01sdVhvY05wUlNuZndCTFhU?=
 =?utf-8?B?c1pqaWk0YzQ1d2ZLR09weERoVURzQjV4bXR3Y2N1UDRSM1VMRkpTRUI3eEF5?=
 =?utf-8?B?SHpGL1VBRDRXUy8xY3VzcVV2c3NlL2NmZjZ1MkNoeDBmc3NDRy9DZ2J5d0pB?=
 =?utf-8?B?eXgwRGJGUnBjQlc3M21OSFEwNkwyU1E1aWdGL3ludVdSQ2xTWm14K1hvUmh5?=
 =?utf-8?B?YS8rWTFIYXlvZmgwOFh0dGozZ0V0cXJQV3h4OTNmc2xmdmNlSWYzQUlIdnB6?=
 =?utf-8?B?RjQwZUkzVnYvaTYwOW13TnkwTlpSWW1LYVZnbFlPVGVGNVg3aktvNisreXVj?=
 =?utf-8?B?TmJDMUtuN1RlWmF1UlBPZWhjaHRTVU1pYUUwN0pDWlV6aGJYL1BTa1NVMno1?=
 =?utf-8?B?UjVoYmEvSDZXWFdjUkNMWkpneVlPckFnUzdKZW1BUkU3RTI2eEFjWC84cU93?=
 =?utf-8?B?TUVleEFkRW9hV2h5NEZWamZjckVQZTZmKzl5YS9yVnhzM0o0TVh6dWlXTGd5?=
 =?utf-8?B?UDg3NzFXdVRzKzJsNzJyQlVveldLMS9YWmMyVjNOT3VtNEN5M2syQXZjdXQy?=
 =?utf-8?B?UmhuUWwwQnVNZXhrQ3pka3pnQ0xxSStLT3pRV3RmR21zWmhMajg2TVVjYzZm?=
 =?utf-8?B?WWlFZGR5b3FtRlZuTG9IaFdoQm9BZUdzT1FUWGhoOG5wQXl0bzB6QmlHU05T?=
 =?utf-8?B?bGFjLzBhSFVlRjMvd1EyaytnZWZtMGJNUWp4bHJZQmVmY0xHbkdNbk1Ld0g5?=
 =?utf-8?B?eENFUkJEcHpRS1dSU1p6QmRsNUloQlozVVRtYlpLYXFNREhTek5kRTQ5ajl0?=
 =?utf-8?B?V2NiVXRhRk1HaXg1cVIzdS9CVVJLV1hvQ1U3ZXM1M1BrRjBtRWswNk9YemUv?=
 =?utf-8?B?OXFnbHp2bFpCNFVPUVg1VFBqbmVvWGEzYTZta2dsd0hBQzZTWG5qYnBrL3o3?=
 =?utf-8?B?K3Jhd1Q4blBWaTh6clBwQiswVnJncllBTlM3Wm96YWxzblFXR1BsUFk0MWs2?=
 =?utf-8?B?TkxxNTNmU1RkUFk5d1hwNXBiWm1FSkllV3RFSmphaEJYcWU4TXhMbVk1WnBN?=
 =?utf-8?B?Rk43V1A1bTc1Ujh5SUV4VGpQQktZNEZ5N2d1WUg5TWs0VjRIZjYvd3lLSzJL?=
 =?utf-8?B?Q1lYMW9LZHU4SUE4ZXU1NXUwWDVBcDcxOERXcXMrT1ArSnMyZ0VWVWxGeG8y?=
 =?utf-8?B?N0ExNC92b3FsK3kyYWp2Z3BuUThZRldoc1FHQzJmY09UZW92cXIzUnVOZ0JQ?=
 =?utf-8?B?aS9EUEI2WlhPaDRYY1lhWmdCSS9LWGxZYWU3SmRrWjE2anBCV2VadC8vc1VU?=
 =?utf-8?B?UVJ5WXNHazk2YWEzRXVYbndwdkRRWWtRdFp6cEJPU3l1cXl2OUViZ3VIc1Nw?=
 =?utf-8?B?alk2UVpaZU5mS0RiaFRwVFRJL3FrMCtOcUFncjN1NUtOaUdwZkVod0NEaUlI?=
 =?utf-8?B?eUR5YWxUMnd5Ynd3b1R2SjFENHBnZHlNWGZabmUwa0lFNVdHNC9TRnFvM0FH?=
 =?utf-8?B?VC9RQWx2WFZEOGJoLzRwNFJpN3RTdVpOZzdub3NTZ1hrOXBWaWhMekg0RFV3?=
 =?utf-8?B?eklCdGwvUE13UlFrWXJ3Skg4YUcwWS9TZk4reVdEYU1Rc1FHRUo3anIrWm1l?=
 =?utf-8?B?TG05QUZrdTUxekhZcVpwRnFrTWxFcXJESzhESW55NWM0RzZsV0htWDhyRFp2?=
 =?utf-8?B?QVBneGYwVUZQalY4QzVzMWl3NE9kN3JoUHkvTWxzSXFaK2M0cGRmYzJ4Smtw?=
 =?utf-8?B?YytZSnFhY0pxYXdxM0hjRXV2SlFOVFRVMXBFMjZ2aThTLzJHazk3WEZvWlVK?=
 =?utf-8?B?a1pYc2NWQUloSnh2VndnK2EzSzdtOGZibXBZdnZVY2ROTkhKc0ZVM2FwN2RS?=
 =?utf-8?B?NEdjKzhuTjVlRUVOVEZkQ3BGNm1HdDFMRm85NjdzWnVlTWliY3V1eXJWY1h5?=
 =?utf-8?B?Z283QWRSdXNnOXVZZnkzQmovbnFCNDRyUkZFWG1oNDAvT0dKVzExWDA2dE9O?=
 =?utf-8?B?NERlbElCNFhXMkd6QWNicUdVajVxVHF3a0NqNG1Bc1pSUDJPWUVsR0xFZHV1?=
 =?utf-8?Q?DHVeZRbWfcCWl36KhYGYqXT4VcgynuP4pddGqTJFp+EQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF5F14859C1D8B4F8B9D567832F67F47@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aea50b3-4353-401f-a0c6-08daa5deb939
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 08:02:03.5074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y8XlkCmV/RzznSB2TyojhcYH/8/USyCUJemJiEAJq+p1+bPRHZa1pdgu8wsuB60t3aUGrjyVIF8iUTQi269vEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6359
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.135.121, xfe-aln-001.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVGh1LCAyMDIyLTA5LTI5IGF0IDA4OjI2IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gV2VkLCBTZXAgMjgsIDIwMjIgYXQgMDE6MjE6NDVQTSArMDIwMCwgRXJsaW5nIExqdW5nZ3Jl
biB3cm90ZToNCj4gPiBBZGQgZGV2aWNldHJlZSBiaW5kaW5ncyBmb3IgbmV3IGNhdDI0YzIwOCBF
RElEIEVFUFJPTSBkcml2ZXIuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRXJsaW5nIExqdW5n
Z3JlbiA8aGxqdW5nZ3JAY2lzY28uY29tPg0KPiA+IC0tLQ0KPiA+IMKgLi4uL2JpbmRpbmdzL21l
ZGlhL2kyYy9vbm5uLGNhdDI0YzIwOC55YW1swqDCoMKgIHwgNDgNCj4gPiArKysrKysrKysrKysr
KysrKysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQ0KPiA+IMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL2kyYy9vbm5uLGNhdDI0YzIwOC55YW1sDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vbm5uLGNhdDI0YzIw
OC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJj
L29ubm4sY2F0MjRjMjA4LnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZmNmYWNjYjVlMzlmDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKw0K
PiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vbm5uLGNh
dDI0YzIwOC55YW1sDQo+ID4gQEAgLTAsMCArMSw0OCBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArJVlBTUwgMS4y
DQo+ID4gKy0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lZGlh
L2kyYy9vbm5uLGNhdDI0YzIwOC55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBPTiBTZW1p
Y29uZHVjdG9yIENBVDI0QzIwOCBFRElEIEVFUFJPTSBkcml2ZXINCj4gPiArDQo+ID4gK21haW50
YWluZXJzOg0KPiA+ICvCoCAtIEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5s
Pg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246IHwNCj4gPiArwqAgQ0FUMjRDMjA4IGlzIGEgZHVh
bCBwb3J0IGkyYyBFRVBST00gZGVzaWduZWQgZm9yIEVESUQgc3RvcmFnZS4NCj4gPiArDQo+ID4g
Kw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICvCoCBjb21wYXRpYmxlOg0KPiA+ICvCoMKgwqAgY29u
c3Q6IG9ubm4sY2F0MjRjMjA4DQo+ID4gKw0KPiA+ICvCoCByZWc6DQo+ID4gK8KgwqDCoCBtYXhJ
dGVtczogMQ0KPiA+ICsNCj4gPiArwqAgaHBkLWdwaW9zOg0KPiA+ICvCoMKgwqAgbWF4SXRlbXM6
IDENCj4gPiArwqDCoMKgIGRlc2NyaXB0aW9uOg0KPiA+ICvCoMKgwqDCoMKgIFJlZmVyZW5jZXMg
dG8gdGhlIEdQSU8gdGhhdCBjb250cm9scyB0aGUgSERNSSBob3QtcGx1Zw0KPiA+IGRldGVjdGlv
biBwaW4uDQo+ID4gK8KgwqDCoMKgwqAgVGhlIGFjdGl2ZSBmbGFnIGluZGljYXRlcyB0aGUgR1BJ
TyBsZXZlbCB0aGF0IGVuYWJsZXMgaG90LQ0KPiA+IHBsdWcgZGV0ZWN0aW9uLg0KPiANCj4gVGhp
cyBub2RlIGlzIHN1cHBvc2VkIHRvIHJlcHJlc2VudCBhIGRldmljZSwgY2F0MjRjMjA4LCBidXQg
dGhhdA0KPiBkZXZpY2UgDQo+IEknbSBndWVzc2luZyBrbm93cyBub3RoaW5nIGFib3V0IEhQRC4g
VGhhdCdzIGEgcHJvcGVydHkgb2YgdGhlDQo+IGNvbm5lY3RvciANCj4gYW5kIGJlbG9uZ3MgaW4g
YSBjb25uZWN0b3Igbm9kZSBtdWNoIGxpa2Ugd2UgaGF2ZSBmb3IgdGhlIG90aGVyIHNpZGUNCj4g
b2YgDQo+IGRpc3BsYXkgY29ubmVjdGlvbnMuIEl0IG1heSBzZWVtIGxpa2Ugb3ZlcmtpbGwsIGJ1
dCBpdCBmcmVxdWVudGx5IA0KPiBldm9sdmVzIHN1Y2ggdGhhdCBub3QgaGF2aW5nIGEgY29ubmVj
dG9yIG5vZGUgYmVjb21lcyBhIHByb2JsZW0uIFNlZSANCj4gJ2hkbWktY29ubmVjdG9yJyBiaW5k
aW5nIGZvciBleGFtcGxlLg0KPiANCj4gUm9iDQoNCklzIHRoaXMgd2hhdCB5b3UgaGFkIGluIG1p
bmQ/DQoNCmNhdDI0YzIwODogY2F0MjRjMjA4QDMxIHsNCgljb21wYXRpYmxlID0gIm9ubm4sY2F0
MjRjMjA4IjsNCglyZWcgPSA8MHgzMT47DQoJc3RhdHVzID0gIm9rYXkiOw0KCWNvbm5lY3Rvci1w
aGFuZGxlID0gPCZoZG1pX2luX25vZGU+Ow0KfTsNCg0KaGRtaV9pbl9ub2RlOiBoZG1pLWluIHsN
Cgljb21wYXRpYmxlID0gImhkbWktY29ubmVjdG9yIjsNCglsYWJlbCA9ICJIRE1JIElOIjsNCgl0
eXBlID0gImEiOw0KCWhwZC1ncGlvcyA9IDwmcGNhOTU1NCA0IEdQSU9fQUNUSVZFX0hJR0g+Ow0K
CXBvcnQgew0KCQloZG1pX2luOiBlbmRwb2ludCB7DQoJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmhk
bWlfb3V0PjsNCgkJfTsNCgl9Ow0KfTsNCg0KLSBFcmxpbmcNCg0K
