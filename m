Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33261586B94
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 15:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbiHANJD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 09:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiHANJC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 09:09:02 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 01 Aug 2022 06:09:00 PDT
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D6B240A5
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 06:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=6782; q=dns/txt; s=iport;
  t=1659359340; x=1660568940;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aIivF0cfMxR2SGnpzg6paiVVFY8IThFe/3yRJnHIWHQ=;
  b=OU0qOepHsMUFsKDXCcjFZFPOxg1e98icdwaz6brul0tPFp67NmN+FraM
   CXmqvrwTJ4Aws+Y/WknmaT5HGbxNB2iVcauptwkVnu43vQn78c2gKJzLd
   nu7Z3s3YreerPjGZ0CcZpEo8A3LknBhEtKFTu4IcIZnUttux9lXPxPGgw
   o=;
IronPort-PHdr: =?us-ascii?q?A9a23=3A94wA8BFnXqAS8kOE/kVNuZ1GfiYY04WdBeZdw?=
 =?us-ascii?q?pYkircbdKOl8tyiOUHE/vxigRfPWpmT8PNLjefa8sWCEWwN6JqMqjYOJZpLU?=
 =?us-ascii?q?RJWhcAfhQd1BsmDBAXyJ+LraCpvGsNEWRdl8ni3PFITFtz5YgjZo2a56ngZH?=
 =?us-ascii?q?RCsXTc=3D?=
IronPort-Data: =?us-ascii?q?A9a23=3A4cT/E6DOb6ZaLBVW/9/hw5YqxClBgxIJ4kV8j?=
 =?us-ascii?q?S/XYbTApGgqgjYFmmMYWTiOb6vZNzHze99zaoq+9xkOscDcx9BjOVdlrnsFo?=
 =?us-ascii?q?1CmBibm6XV1Fqp7Vs+rBpWroHlPsoNPM7EsEOhuFiWG/kr0bOC4xZVB/fjgq?=
 =?us-ascii?q?oTUWbas1h9ZHWeIeA954f5Ss7ZRbrxA2LBVMCvV0T/GmPAzDXf+s9JC3s343?=
 =?us-ascii?q?IrYwP9nlKyaVDr1JTXSb9gT1LPVvyF94J7yuciMw3XErol8RoZWRs7Zx72/u?=
 =?us-ascii?q?2je5RpoU4vjmbfgeUpMSbnXVeSMoiMJAO753V4T/WprjvhT2Pk0MS+7jx2Jm?=
 =?us-ascii?q?9JsztpCr7S7SBwiOevHn+F1vxxwSnkkY/YYpOaceRBTtuTWlSUqaUDEwfJoB?=
 =?us-ascii?q?V02NIsD8L9fDmRH9PheIzcIBjiDme+sw6+6Tqxnh98oK+H7J98WvnUmyzWxJ?=
 =?us-ascii?q?fInR43TBqDH6d5R9Ck/i9oIHvvEYccdLz11Y3zoahtDKxEMCJ8gl+elgHr4W?=
 =?us-ascii?q?zJdoVOR46Ew5gDuIKZZuFT2GMDedtrPTsJPkwPB/iTN/n/yBVcRM9n39NZMy?=
 =?us-ascii?q?Vr07senoM8xcNl6+GWEy8NX?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AiRT4Yqi1hX1jsHE5Z4Q8w1SWcHBQX3F13D?=
 =?us-ascii?q?Abv31ZSRFFG/FwyPrBoB1L73DJYWgqNE3IwerwRJVpQRvnhPpICRF4B8bvYO?=
 =?us-ascii?q?CUghrWEGgE1/qs/9SAIVyyygc578ZdmsdFeaXN5DRB/KTHCUyDYqsdKbq8ge?=
 =?us-ascii?q?6VbIXlvgxQpGhRAskKhWoYe2Wm+w9NNXN77PECZf2hD7981kOdkAMsH6KG7x?=
 =?us-ascii?q?c+Lo3+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mFK10jDR1+?=
 =?us-ascii?q?GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/Azd4dvfq2?=
 =?us-ascii?q?rCouO85ivIDP4Dr085uVvF5icF7jOQkgrGLUWSj2Nwz0GT+PARDwhKdfapzb?=
 =?us-ascii?q?gpAycxrXBQ5O2VFMlwrjikX109N2KaoM213am5azh60kWzunYsiugVkjhWVp?=
 =?us-ascii?q?YfcqZYqcgF8FpSC4poJlOz1GkLKpgZMCjn3oceTXqKK3TC+mV/yt2lWXo+Wh?=
 =?us-ascii?q?+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuN2d7BUo+Dfdqh4nrBHScEbKap7Ge?=
 =?us-ascii?q?caWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDgRLUYiJ8p3JjRWlJRsm?=
 =?us-ascii?q?A/P0roFM2VxZVOtgvARW2sNA6dvf22J6IJzoEUaICbQxFrEmpe4PdIi89vd/?=
 =?us-ascii?q?HmZw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BwAAB2bIJi/5JdJa1aHQEBAQEJARI?=
 =?us-ascii?q?BBQUBQIE7CAELAYFRUgd1WjlDhE6DTAOEUl+FCYMCA4sUkCSBLBSBEQNUCwE?=
 =?us-ascii?q?BAQ0BAUIEAQGFAgIWhSgCJTQJDgECBAEBARIBAQUBAQECAQcEgQkThWgBDIZ?=
 =?us-ascii?q?CAQEBAQMSEQQNDAEBNwEPAgEGAhUDAgImAgICHxEVEAIECgQFIoU/AzEBkD6?=
 =?us-ascii?q?PNwGBPgKKH3p/MoEBgggBAQYEBIUNDQuCOAmBECwBgxODAoEngwaEHSccgg2?=
 =?us-ascii?q?BFYMqPoIggWeEE4JlY40hh0YdOwNUgQUSgSFxAQgGBgcKBTIGAgwYFAQCExJ?=
 =?us-ascii?q?THgITDAocDlQZDA8DEgMRAQcCCxIIFSwIAwIDCAMCAyMLAgMYCQcKAx0IChw?=
 =?us-ascii?q?SEBQCBBMfCwgDGh8tCQIEDgNDCAsKAxEEAxMYCxYIEAQGAwkvDSgLAwUPDwE?=
 =?us-ascii?q?GAwYCBQUBAyADFAMFJwcDIQcLJg0NBBwHHQMDBSYDAgIbBwICAwIGFwYCAnE?=
 =?us-ascii?q?KKA0IBAgEHB4lEwUCBzEFBC8CHgQFBhEJAhYCBgQFAgQEFgICEggCCCcbBxY?=
 =?us-ascii?q?2GQEFXQYLCSMcLAsGBQYWAyYnKwYiARuWcAFrYSETHDknIx5AMwU0CwYskWo?=
 =?us-ascii?q?dgxlHjgGbS0VrCoNMmg2FfTGDdaRilmYggiqONpB0hQoCBAIEBQIOAQEGgWE?=
 =?us-ascii?q?8gVlwFYMjURkPjiAJAxaDUIpedTsCBgEKAQEDCZEaAQE?=
X-IronPort-AV: E=Sophos;i="5.91,230,1647302400"; 
   d="scan'208";a="1026364130"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 01 Aug 2022 13:07:57 +0000
Received: from mail.cisco.com (xfe-aln-002.cisco.com [173.37.135.122])
        by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 271D7vX8027582
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
        Mon, 1 Aug 2022 13:07:57 GMT
Received: from xfe-rtp-003.cisco.com (64.101.210.233) by xfe-aln-002.cisco.com
 (173.37.135.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 1 Aug 2022
 08:07:56 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (64.101.32.56) by
 xfe-rtp-003.cisco.com (64.101.210.233) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14
 via Frontend Transport; Mon, 1 Aug 2022 09:07:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lq/C+DYBK+Zr2m3Qnw3Hs+GBgLh5/yJ0wF4Zuv8NT5vqHOTzoJJOFFEvmoiEgEovIMfBPVXRjnSkKGDqZgHG3q3iwEsS8Iw7vRR23n3VK8dcCv4ZwH0ymo1J3nU8qQjAR0pSfgGkTmscyg0VDsUMTRD6ifBYp58pLJzWW+71JJ92OCfH7hf7170UySPmrs/rAsIRGMZYGGA2DACGvFbP2dp3byiUbDcWsJekineQHBDd38n105qR7D2UnNA1+rUa8STqeOMMonxjSWek+MAiPKgMyycFIYf0HgeOnC0GO2wEHNqKonl4vhpm6zIHme+mXVbz1ua0+Lwhb6CIdq/nbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIivF0cfMxR2SGnpzg6paiVVFY8IThFe/3yRJnHIWHQ=;
 b=T7/AwylwT0M4UAodfV9uyswguPk+Y44Sfjrbyn/iSDiM9fwlKIP4uw2e0OBXI0QRFMVlGU13DOC5ja7lz8dC1DMusGu5SqsNt1h1sMbJ/vESmI3v5ISk64SFVTXFNzM8NpAT/x5LxM/BeqI53X+M72+8EFJwb5L/Ni8WDARRVXPG1ATl4YZPMqGMT1Esg8otJg1YsDpqFYdtl28C4AFcqEc28zyMHBfJ1p1oY1q7M56FSldZVC5IETA+apWtsb6hlmYfTDEvmp3uOAgfOqNrbdozBG7RqEPV5b6fABhPqS8FeNYvVF1V/v7HxyYlcg8FYGozVF1ksURs2Pn+PCYewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIivF0cfMxR2SGnpzg6paiVVFY8IThFe/3yRJnHIWHQ=;
 b=0wOL8N1OEZT2mw80EUts9bBYwwZs3vntMS7JTSTpTn6RhJ8G3PvqDHpWsAo5XeYdN/34MHS7uKU5paDUVqv8Zpwtp4/vMGOGGTCLdv7OT6Zd3xTria8l3gonxREQY82OD9A9u0JQTkkzjShb8B3iBDGKZzjoG+advlHDYrrHleg=
Received: from PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 by MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15; Mon, 1 Aug
 2022 13:07:55 +0000
Received: from PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::816b:295:78ba:4793]) by PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::816b:295:78ba:4793%9]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 13:07:55 +0000
From:   "Erling Ljunggren (hljunggr)" <hljunggr@cisco.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "jonathansb1@gmail.com" <jonathansb1@gmail.com>
Subject: Re: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID
 EEPROM
Thread-Topic: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID
 EEPROM
Thread-Index: AQHYonbjtslyzMbb206QnIylwC2p7a2VgVIAgASJa4A=
Date:   Mon, 1 Aug 2022 13:07:55 +0000
Message-ID: <db2d74d0ab17b407223092c8e0e01784d36bbda1.camel@cisco.com>
References: <20220728114050.2400475-1-hljunggr@cisco.com>
         <20220728114050.2400475-5-hljunggr@cisco.com>
         <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com>
In-Reply-To: <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfee04d0-2cdf-46a4-98fc-08da73bed92f
x-ms-traffictypediagnostic: MN0PR11MB6012:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lPaW2N8M+4c8efDpiM0+LdTNgA1ticFG0olJMbnLzQfyC3uDtldwcE9ELyiZln8eTjiGN+XT6Yef9nk4N2Ek4PRh6lps3UVk6sEe4gbb1B2oLJZyanSCd/BdM5Zic1mqBWlXhjjKAqQ6kw7Ur9PNGQj1mKG1LHZjCQdx8hmgyI7Ji63iVCs+efLwTL8rMVr3i9PsNQRHax3vgOd6nDd0EJfdWUoGoOBRrKwOoACrk+1Mn2LAjLJwMP0hAcrz4STVmSuc/sL7aFblAVSU6sMlzWTb1xN7Dkt4sHdxWNh7YwzSEeTi3q4pQmMIEuEpCqpBra6TTBweXo+5M1zB7hGpWxKkKBosUPCP+djDwMa34pLdkYKJmbnEwTZHvV98d95C9Ke9Qrt80jhbYvQP9kkwzwkpVb0PDWIj0OV6XRCX0P0t79b5migAL1qprnhAjU/1YDXd/0YgUz96q2V7Ua9GEnIB9xcsRbiwoUCIi4wCuMv53wWeovIgu236faWDIKzvjj/8gGdjUWHIoeybRGQNmGNZnIjtzvn4O0w0JYucMEybEIAnCqGMX0QlBSCwpAmsXPR8sxWrz2K+lGKtyeCht/SHN9UWiqbwZckVfKdc4DdWYjVd1xzgN7TheG3+kEpcDrxCoNUS45oDiVii3YTO2U/lgHpXnXW7yXSY6LPToTrofUJd+Q2ffFhIytUdC+XoAyCIixBJd5WxyRfdahl1xTB1cx74IRSDbteeaCsQwhYdMEWk5DmquzqxaqBblHNRB2TASUzXzoYcjVl81dQPGdALuxPmpRoDGiJDJo/bVLPSmTvSG3sbfTXYT/1i447X
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(83380400001)(54906003)(66446008)(186003)(6486002)(71200400001)(2616005)(122000001)(38100700002)(478600001)(41300700001)(6512007)(38070700005)(6916009)(8936002)(5660300002)(53546011)(2906002)(6506007)(36756003)(66556008)(64756008)(86362001)(66946007)(66476007)(316002)(76116006)(4326008)(91956017)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3JUeFl3Wm9VdTY1Q2QwN2h5OUl6Rlk3SVNlYkdSRGljdnRUd0VvRUEzNUlH?=
 =?utf-8?B?b1l6Snc5TGJsRDQ4OFh1dGdQb0JYaGJEWVJMNnRXeERSOVdHNGJwa1dzR1RU?=
 =?utf-8?B?KzZ2dW0vbUplUitRWW9DMUloaG5GOWRIYzFPYkR5bW96cWdkRkRneDJVeWtU?=
 =?utf-8?B?UUtDeTBzV3lTLzFTRnJYcUhycWw1aExsbjNJR3ovbVRtZHNiRExna0cxVEp0?=
 =?utf-8?B?VWpPd3BmbFZkVU5zd3IyanNhRlJCWjF1VSttWFdrbnREREpPVSs0QjBMbWgx?=
 =?utf-8?B?dnV0b0ZKbjd5RkVscXhlQzI4NlNrOEdIdFlZN2J1R3JJZFMyMDR1WHcvTDl5?=
 =?utf-8?B?QlFQSkxJLzVaejR6ckVwdXZtdnpRVVdIaDM2dnVQSjNTUHp6ZE0wVW5rT3Zu?=
 =?utf-8?B?UjA3eURiSTFlUlRyc0xKbnFXSW91YTVtNXMrcll2WGFwcUt4bG05djZmYUZr?=
 =?utf-8?B?MjdzdTdWNXhHY1FSYWFKWE1TdVN0RFVrVWxhblZEM1ZvcFJZakp3MHBTMG4w?=
 =?utf-8?B?dzBFelQyM2VGZGx6b0lTNXhyVFUrZ2l1YURaYk1ETEZFNWZEczJQUytaVFZp?=
 =?utf-8?B?YWpCNFc2RVNzSGhxK3d0NG5nbkE5RWZ1WmZtM3Y0OC9veHZhTG1oWk9jT3o4?=
 =?utf-8?B?SFBUVGdSdUFMdi80MmpoL3hjYUxBd3JWMWVVZVEranMvUTQ1ZzJsdFJTV0ZD?=
 =?utf-8?B?YkRSQzlQdnczQ2drTUNxZDd4Qk5PdmMybnZCNmJlNFlkRWcvbTVlTkNTaFhS?=
 =?utf-8?B?a0liN3dHK0U4cEg5bnJLbWw3S3pSb0lEVWozdVUvMm9oYXE3NFd6aHhCYzF3?=
 =?utf-8?B?dzJETFBwV3laaDl3L3dqS0ZYNWFJMG9ucVh0OHdCNUlsZFlNTDg5dE1xdzdp?=
 =?utf-8?B?MGdIYTMvb2plTU9CNDIrU0dwS3pVaHpnYVRkTjh5UWVTdTBsZFVvcmNiSjRr?=
 =?utf-8?B?T3lWYmF4SjdYYWZYYnpXbDZITmpJTUNydFFtZFpVSzZ5Yk5xNSt4L05mOTAw?=
 =?utf-8?B?RUlmeU1sdjN3WVF5VTJHUWRJaTBRblZSdEl0VHZvSWY2Vmp1bm9zTE1lL2xm?=
 =?utf-8?B?M2pCZ0J6YmV2cjRwYytlbHdHTzRVdDdTY1FuZFd2cnp6YWJXek42Q1YzMFha?=
 =?utf-8?B?WStpeG5nem1xbklveEthOUthekhJa1BJTlkyWVQ5MjlqSDF2anVxSEozV0FH?=
 =?utf-8?B?LzlpWjFWSjhWeVpGYURDOGZtSnpudzVNT3BqM21RMWhaS2lQbzc1Q2cwSzQ5?=
 =?utf-8?B?aW8xQjFQSTkxV3M3dFpjSWNPZ1VXbE1iRk9ONm1JVjRYVVkrazAvZkJKbDJi?=
 =?utf-8?B?dVd0NElEZzVJL1ZNdWZYWjFiUmhiZDUwTVp0OXVBTytySzdmYWVyaTNITk5O?=
 =?utf-8?B?aWh6SU1KN3JWb3c3ZXVGWDJpYnJkQ09PcytOcWNlMng1dURoTUtwNWEyVHhk?=
 =?utf-8?B?a2xVSWkxYmt5U0ZqeDVjaC9adGFnNkU1UEhja2xxWlJYdlhBanM0NVg0VUdj?=
 =?utf-8?B?MlEzOGZBWUpsT0dSbG1GQ1RsTm9LbDRxNTRRQjNSaGFpU2lXOTNIZEhXQXl2?=
 =?utf-8?B?Z044MVltQzVaL2NRWDJhZEtJcTlTa1RVS2lWVVEvQlUvRTJTenBpZkQ0WjJ1?=
 =?utf-8?B?Sis1OXJBVXlFRzhDbVE2bkpEcWdNZ3dLMkJBcjJUc3BzMnF1MkJDV3FVL0sx?=
 =?utf-8?B?UlFUWHFuSnVCQ05EV2VWUUZ3ZEtCbDVRQkFXdHZlUjVsUGdYZnVnMFJnQVV1?=
 =?utf-8?B?Q3YwVk1NMFBJWEh6ZDNqMkZaS0ZuU0dLY0xGS2ZCUXAyQlFReWR3V2hqNXJy?=
 =?utf-8?B?Z2dYLzhEcWZjcTQzSXY0eXI2NFV4MGlIZC9EYUVVekM3dnBXQ3BrbnlveUs3?=
 =?utf-8?B?elUyRmNucXJiTldBVTF2akZ5dmdnaHN4WEowWUtuNnBnUEV3bjdCNnBaVFdT?=
 =?utf-8?B?TWxOK1BYNHc5S1B6MTlRQWFUU0NXVjdDUEpMRzdQKzk0eWdNVWROa3FIQ01R?=
 =?utf-8?B?SFZYcW5RMHZNVjVTQS9vMzZ0dE9pSDkzb0ZRWXYrZlZabEhkaWZzWFlXbkZO?=
 =?utf-8?B?S0RkRUpCanA3N1IxT0phRlNXOElvb1pybGhmMmRXZ2s2VklmVzdHMTJESWdG?=
 =?utf-8?B?cHFNaWJrT0M4WHpRaTc5cUlQWUs3endnc3pLZ2xLNlZXQThlS1pwQ3Z4WjZQ?=
 =?utf-8?B?WGxRNXcybUlRbkZCUHFqR1lKSkYxcEorcXA4c2RiM2JxZWJ6ZUJtdzVDTVpD?=
 =?utf-8?B?N3JSUTdrTC9JdElJb3ZBQzg2Yzd3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2BC30B01B6C1845BF0A790F5279396B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfee04d0-2cdf-46a4-98fc-08da73bed92f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2022 13:07:55.0789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kO8jDHx2GdFyH3rHrT3veriiHo4cgST66mDjnodZEqdTZAXeZsQ8E4dELtcJlT8qqqX15bms1PBLXRTCDMSPCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.135.122, xfe-aln-002.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIyLTA3LTI5IGF0IDE3OjUxICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFRodSwgSnVsIDI4LCAyMDIyIGF0IDE6NTMgUE0gRXJsaW5nIExqdW5nZ3JlbiA8aGxq
dW5nZ3JAY2lzY28uY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBGcm9tOiBKb25hdGhhbiBTZWxu
ZXMgPGpvbmF0aGFuc2IxQGdtYWlsLmNvbT4NCj4gPiANCj4gPiBTdXBwb3J0IHJlYWRpbmcgYW5k
IHdyaXRpbmcgdGhlIEVESUQgRUVQUk9NIHRocm91Z2ggdGhlDQo+ID4gdjRsMiBBUEkuDQo+ID4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gU2VsbmVzIDxqb25hdGhhbnNiMUBnbWFpbC5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRh
bGwubmw+DQo+ID4gU2lnbmVkLW9mZi1ieTogRXJsaW5nIExqdW5nZ3JlbiA8aGxqdW5nZ3JAY2lz
Y28uY29tPg0KPiANCj4gV29uZGVyaW5nIGlmIHRoZSBsYXN0IHR3byBwZW9wbGUgZG9uJ3QgZG8g
YW55IGRldmVsb3BtZW50LCBvdGhlcndpc2UNCj4gQ28tZGV2ZWxvcGVkLWJ5IHdvdWxkIGJlIGFw
cHJlY2lhdGVkLg0KPiANCk9LDQo+IC4uLg0KPiANCj4gPiDCoG9iai0kKENPTkZJR19WSURFT19I
STU1NikgKz0gaGk1NTYubw0KPiA+IMKgb2JqLSQoQ09ORklHX1ZJREVPX0hJODQ2KSArPSBoaTg0
Ni5vDQo+ID4gwqBvYmotJChDT05GSUdfVklERU9fSEk4NDcpICs9IGhpODQ3Lm8NCj4gPiArb2Jq
LSQoQ09ORklHX1ZJREVPX0NBVDI0QzIwOCkgKz0gY2F0MjRjMjA4Lm8NCj4gDQo+IFBlcmhhcHMg
bW9yZSBzb3J0ZWQ/DQpPSw0KPiANCj4gPiDCoG9iai0kKENPTkZJR19WSURFT19JMkMpICs9IHZp
ZGVvLWkyYy5vDQo+ID4gwqBvYmotJChDT05GSUdfVklERU9fSU1YMjA4KSArPSBpbXgyMDgubw0K
PiA+IMKgb2JqLSQoQ09ORklHX1ZJREVPX0lNWDIxNCkgKz0gaW14MjE0Lm8NCj4gDQo+IC4uLg0K
PiANCj4gPiArLyoNCj4gPiArICogY2F0MjRjMjA4IC0gSERNSSBpMmMgY29udHJvbGxlZCBFRVBS
T00gZnJvbSBPTiBTZW1pY29uZHVjdG9yIG9yDQo+ID4gQ2F0YWx5c3QgU2VtaWNvbmR1Y3Rvcg0K
PiANCj4gSGVyZS4uLg0KPiANCj4gPiArICogY2F0MjRjMjA4LmMgLSBTdXBwb3J0IGZvciBpMmMg
YmFzZWQgRERDIEVFUFJPTQ0KPiANCj4gLi4uYW5kIGhlcmUgYW5kIGluIGdlbmVyYWwgcHV0dGlu
ZyBmaWxlbmFtZSBpbnRvIHRoZSBmaWxlIGlzIG5vdCBhDQo+IGdvb2QgaWRlYSBpbiB0aGUgbG9u
ZyB0ZXJtLiBGb3IgZXhhbXBsZSwgdGhpcyBjYW4gYmUgZXhwYW5kZWQgaW4gdGhlDQo+IGZ1dHVy
ZSB0byBzdXBwb3J0IG1vcmUgRURJRCBFRVBST01zLCBhbmQgaWYgd2Ugd2FudCB0byByZW5hbWUs
IHRoaXMNCj4gYWRkcyBhbiBhZGRpdGlvbmFsIGJ1cmRlbi4NCk9LDQo+IA0KPiA+ICsgKiBDb3B5
cmlnaHQgKEMpIDIwMjEtMjAyMiBDaXNjbyBTeXN0ZW1zLCBJbmMuIGFuZC9vciBpdHMNCj4gPiBh
ZmZpbGlhdGVzLiBBbGwgcmlnaHRzIHJlc2VydmVkLg0KPiA+ICsgKi8NCj4gDQo+IC4uLg0KPiAN
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2kyYy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KPiANCj4gPiArI2luY2x1ZGUgPGxp
bnV4L29mX2RldmljZS5oPg0KPiANCj4gV2h5PyBXaG8gaXMgdGhlIHVzZXIgb2YgdGhpcz8NCj4g
UGVyaGFwcyB5b3UgbWVhbnQgbW9kX2RldmljZXRhYmxlLmgsIHdoaWNoIGlzIGN1cnJlbnRseSBt
aXNzZWQ/DQp5ZXMNCj4gDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4NCj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3ZpZGVvZGV2Mi5oPg0K
PiANCj4gPiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KPiANCj4gUGVyaGFwcyBrZWVwIGl0
IG9yZGVyZWQ/DQpPSw0KPiANCj4gLi4uDQo+IA0KPiA+ICsvKg0KPiA+ICsgKiBGcm9tIHRoZSBk
YXRhc2hlZXQ6DQo+IA0KPiBNYXliZcKgIGFkZCBhbiBVUkwgdG8gdGhlIERhdGFzaGVldD8NCg0K
VGhlcmUgYWxyZWFkeSBpcyBhIGxpbmsgdG8gdGhlIGRhdGFzaGVldCBpbiB0aGUgc291cmNlIGZp
bGUgZnVydGhlciB1cCwNCm5vIG5lZWQgdG8gYWRkIGFub3RoZXIuDQoNCg0KPiANCj4gPiArICog
VGhlIHdyaXRlIGN5Y2xlIHRpbWUgaXMgdGhlIHRpbWUgZnJvbSBhIHZhbGlkIHN0b3AgY29uZGl0
aW9uIG9mDQo+ID4gYSB3cml0ZQ0KPiA+ICsgKiBzZXF1ZW5jZSB0byB0aGUgZW5kIG9mIHRoZSBp
bnRlcm5hbCBwcm9ncmFtL2VyYXNlIGN5Y2xlLiBEdXJpbmcNCj4gPiB0aGUgd3JpdGUNCj4gPiAr
ICogY3ljbGUsIHRoZSBidXMgaW50ZXJmYWNlIGNpcmN1aXRzIGFyZSBkaXNhYmxlZCwgU0RBIGlz
IGFsbG93ZWQNCj4gPiB0byByZW1haW4NCj4gPiArICogaGlnaCwgYW5kIHRoZSBkZXZpY2UgZG9l
cyBub3QgcmVzcG9uZCB0byBpdHMgc2xhdmUgYWRkcmVzcy4NCj4gPiArICovDQo+ID4gKyNkZWZp
bmUgV1JJVEVfQ1lDTEVfVElNRV9VU8KgwqDCoCA1MDAwDQo+IA0KPiAuLi4NCj4gDQo+ID4gK8Kg
wqDCoMKgwqDCoCBzdHJ1Y3QgaTJjX2NsaWVudCAqZGV2X2NsaWVudCA9IHN0YXRlLT5pMmNfY2xp
ZW50c1swXTsNCj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBpMmNfY2xpZW50ICpkYXRhX2NsaWVu
dCA9IHN0YXRlLT5pMmNfY2xpZW50c1sxXTsNCj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBpMmNf
Y2xpZW50ICpzZWdfY2xpZW50ID0gc3RhdGUtPmkyY19jbGllbnRzWzJdOw0KPiANCj4gV2h5IG5v
dCBoYXZlIHRob3NlIGNsaWVudHMgbmFtZWQgYWNjb3JkaW5nbHkgaW4gdGhlIGRhdGEgc3RydWN0
LA0KPiBpbnN0ZWFkIG9mIGluZGV4aW5nIHRoZW0/DQpPSw0KPiANCj4gLi4uDQo+IA0KPiA+ICvC
oMKgwqDCoMKgwqAgaWYgKHNlZykNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
cnIgPSBpMmNfdHJhbnNmZXIoZGV2X2NsaWVudC0+YWRhcHRlciwgbXNnLA0KPiA+IEFSUkFZX1NJ
WkUobXNnKSk7DQo+ID4gK8KgwqDCoMKgwqDCoCBlbHNlDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZXJyID0gaTJjX3RyYW5zZmVyKGRldl9jbGllbnQtPmFkYXB0ZXIsICZtc2db
MV0sDQo+ID4gMSk7DQo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoZXJyIDwgMCkNCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKCZkZXZfY2xpZW50LT5kZXYsICJXcml0aW5n
IHRvIDB4JXggZmFpbGVkDQo+ID4gKHNlZ21lbnQgJWQpXG4iLA0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkYXRhX2NsaWVudC0+YWRkciwgc2VnKTsN
Cj4gDQo+ID4gK8KgwqDCoMKgwqDCoCB1c2xlZXBfcmFuZ2UoV1JJVEVfQ1lDTEVfVElNRV9VUywg
MiAqIFdSSVRFX0NZQ0xFX1RJTUVfVVMpOw0KPiANCj4gU2xlZXAgZXZlbiBpbiBjYXNlIG9mIGVy
cm9yPyBJcyBpdCByZXF1aXJlZD8NCj4gKFNhbWUgUSBwZXIgb3RoZXIgc2ltaWxhciBwbGFjZXMp
DQoNClRoZSBpMmMgdHJhbnNmZXIgbWF5IHN0aWxsIGhhdmUgd3JpdHRlbiBzb21lIGRhdGEsIGFu
ZCB3ZSBuZWVkIHRvIHdhaXQNCmZvciB0aGUgRUVQUk9NIHRvIHVwZGF0ZS4NCg0KPiANCj4gPiAr
wqDCoMKgwqDCoMKgIHJldHVybiBlcnIgPCAwID8gZXJyIDogMDsNCj4gDQo+IEhlbmNlIGhlcmUu
Li4NCj4gDQo+IC4uLg0KPiANCj4gPiArwqDCoMKgwqDCoMKgIGlmIChlcnIgPCAwKQ0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoJmRldl9jbGllbnQtPmRldiwgIlJl
YWRpbmcgb2YgRURJRA0KPiA+IGZhaWxlZFxuIik7DQo+ID4gK8KgwqDCoMKgwqDCoCByZXR1cm4g
ZXJyIDwgMCA/IGVyciA6IDA7DQo+IA0KPiAuLi5hbmQgaGVyZSB3ZSBjYW4gYXZvaWQgYSBkdXBs
aWNhdGlvbiB0ZXN0IGZvciBlcnJvciBjb2RlIGJlaW5nIHNldCwNCj4gcmlnaHQ/DQo+IChTYW1l
IHN1Z2dlc3Rpb24gcGVyIG90aGVyIHNpbWlsYXIgY2FzZXMpDQpPSw0KPiANCj4gLi4uDQo+IA0K
PiA+ICvCoMKgwqDCoMKgwqAgc3RhdGljIGNvbnN0IHU4IGhlYWRlcl9wYXR0ZXJuW10gPSB7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwMCwgMHhmZiwgMHhmZiwgMHhmZiwg
MHhmZiwgMHhmZiwgMHhmZiwgMHgwMA0KPiANCj4gS2VlcGluZyBhIGNvbW1hIGF0IHRoZSBlbmQg
aXMgZ29vZCBhbnl3YXkuDQoNClRoaXMgaGVhZGVyIHBhdHRlcm4gaXMgZml4ZWQgdG8gOCBieXRl
cywgYW5kIHdpbGwgbmV2ZXIgYmUgbW9yZSB0aGFuIDgNCmJ5dGVzLiBTbyBJIGRvbid0IHRoaW5r
IHRoaW5rIHRoZSBhZGRlZCBjb21tYSBpcyBuZWNlc3NhcnkuDQoNCj4gDQo+ID4gK8KgwqDCoMKg
wqDCoCB9Ow0KPiANCj4gLi4uDQo+IA0KPiA+ICvCoMKgwqDCoMKgwqAgc3RhdGUgPSBremFsbG9j
KHNpemVvZigqc3RhdGUpLCBHRlBfS0VSTkVMKTsNCj4gPiArwqDCoMKgwqDCoMKgIGlmICghc3Rh
dGUpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07DQo+
IA0KPiBkZXZtX2t6YWxsb2MoKSA/DQoNClRoaXMgd2lsbCBmYWlsIGlmIHRoZSBkZXZpY2UgaXMg
Zm9yY2libHkgdW5sb2FkZWQgd2hpbGUgc29tZQ0KYXBwbGljYXRpb24gaGFzIHRoZSBkZXZpY2Ug
bm9kZSBvcGVuLg0KDQo+IA0KPiAuLi4NCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYmxvY2tzID0gMSArIHN0YXRlLT5lZGlkWzEyNl07DQo+IA0KPiBNYWdpYyBpbmRleC4N
CkFjaw0KPiANCj4gLi4uDQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5v
Zl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihjYXQyNGMyMDhfb2ZfbWF0Y2gpLA0KPiANCj4g
b2ZfbWF0Y2hfcHRyKCkgYnJpbmdzIG1vcmUgaGFybSB0aGFuIGhlbHAuDQpPSw0KPiANCg0K
