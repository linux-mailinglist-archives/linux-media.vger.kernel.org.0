Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7944B79FBC3
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 08:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbjINGST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 02:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbjINGSR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 02:18:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E77EF7
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 23:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694672292; x=1726208292;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=mLnc53VslvLwaXSxORcIwHiGJcRUTLmzyhzw+l39rUk=;
  b=iIY5OG9f3wFewQiS7R31a7Ol3M52SKF5uRY9P9x16+gRK1NThQuZIohJ
   ConJm2f/w8ibLxIdRMqjaoN/0tbQrQirOWjoayRnfLoe48iMYMF/pegLT
   SdGUTRfuWbHyllTaIIeRu5E3w8fOCvIuxIm8zpAgN0zCxa0XC/ENBA1lC
   RfVeDPALLM7y29vNZNNokRHg4kvf4a173PfHdtYVBgm6lj6WGYncaWl2f
   9ZUAqDj9g3g26s+RqxKVEkyuSUOjILnlHnNLSzWRXA/s3SNR+oC9keP1O
   bCy+w1ChPPK/E7fOqw2moYHpcnNRQYYS+bsj1GhhWd/BsTWC3sdoyH3N/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="378788070"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="378788070"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 23:18:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="1075235527"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="1075235527"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Sep 2023 23:18:11 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 23:18:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 23:18:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 23:18:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpFv+VZ+FcAGkCicmKFN/e16c8v5VcvMYTaJhDutGKokUYaRokOxiwCc5eqLahqTn5PcY2uYWdsDnE2kR4V15TUJr55dcRPPkABzCTe+sJkk8cazqzB4kdzE0qkoYQZdjOS71VR+OU6ULNIzIRM3wBPuNylh8Aj78yoRJsq6Zb/l987VruToc9xL3/AHg0NtkGUe3X1xsPA13+ERCxZbcPe+uVVeqk2yJm1oSbd441XvYaNx5r8speAB5lAriMF6yA2QZvmEsv/MXyZ0RRxV3TPkM/SympPRuAltCmhWghifapgqZ22zRYKQVT94MLIZ0cbjJZobAaigB+7ri1Baeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLnc53VslvLwaXSxORcIwHiGJcRUTLmzyhzw+l39rUk=;
 b=BHzJJNeuZS7hvygl8ycK5T6GmgIBctnKzwpNEx28NVX78HdasTfA7DXmZYS1nQfze4oCrFM0cJCWT/SuEg7CMk9PJwuVABp8jP51Pmrq4ixDerBTNk+2pylbnUdZeLCIVmeEFmCbNKh+8NGTuH8VmrFY/JqkxUcWMh0AdxGXwuEO7DzTXxbBF4nCTmN6jVeAMF/HI45Ei3PQqejXety9KrSyFZSQceG5ZWHiXG2VtZtZk18kCmVA8zaECgMjkkvSmbACY5yNzpPKsYow5idd6SGbL6TJoJ4qv4XYaXyhOTrkrCd+gQ/C0pBGy9Tph+FDweHTbzGn3uIk/CUhyKdGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22)
 by PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Thu, 14 Sep
 2023 06:18:09 +0000
Received: from DS0PR11MB7459.namprd11.prod.outlook.com
 ([fe80::1c13:f927:574:8708]) by DS0PR11MB7459.namprd11.prod.outlook.com
 ([fe80::1c13:f927:574:8708%3]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 06:18:09 +0000
From:   "Chen, Jason Z" <jason.z.chen@intel.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
CC:     "Yeh, Andy" <andy.yeh@intel.com>,
        "Zhang, Qingwu" <qingwu.zhang@intel.com>
Subject: Recall: [PATCH] media: ov08x40: Modify the tline calculation in 1C
 mode
Thread-Topic: [PATCH] media: ov08x40: Modify the tline calculation in 1C mode
Thread-Index: AQHZ5tM7Ufoj2+kNokylBopAinDAYw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date:   Thu, 14 Sep 2023 06:18:09 +0000
Message-ID: <DS0PR11MB7459289DF82E02FF133C3A95CCF7A@DS0PR11MB7459.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7459:EE_|PH0PR11MB5949:EE_
x-ms-office365-filtering-correlation-id: 913311f7-a928-4343-0eca-08dbb4ea5df3
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 49T0mbTffY6/ldQJOkosSA2S4oMaiWkzU8gFgzXIGPgMivzbXW2H7BgGYsr3blSMK0bRtJDNNpSA3Uoud9EuLsfFVPlld3loblWh/qbU9nVyC5FmVALUTOwpdnfwe14Bm7nIN6RTevv5Wj1pczyAwuxeIVUYDrgSudu85xCdLAh3iNTZP2sGIWTJFnsCYiMsySECS9VHhLF0Pqio4zUgZoKm59qbK5f97lNBJbiy8LE0pkL+cZ7ES1cN1fqc9wZNVS4rzWQ6cjMH+HAElgrW0KQOGgr8BgBIPb957eMAm6iz823zX7rZZhd9+WEejlCQn0XagCF0ewSuAOqH3fW568j4qcB1qNjAOT5dK/+yVQT1lZmlYV2Xf8K3PSkN6FvMn3yd7/gT2Fct2zXSOdBtBgme8TBwPqwVAIaPw+cvXtvoVdkXmGWP3l0xTE9qm5vPnbsKARvunKoyRXPzPd9ziB33Y8xNKV0fggtP4dA5ozJwvArG5L6g5yGoRYRetiPm5g09YC8a7Fr0FTjkR3KQZf5+mBxeBX5KbIySAb+y6SysxzN3QqZe+TWHJzFisau/3cNvlV0UJFdxMnJans4nkPRxtyI9Y1wcSsmMjXK/HFkYtTiYWvV+e7rqKshjquHD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7459.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(1800799009)(451199024)(186009)(2906002)(4326008)(38100700002)(558084003)(52536014)(82960400001)(122000001)(8676002)(5660300002)(38070700005)(86362001)(33656002)(316002)(64756008)(54906003)(66446008)(83380400001)(41300700001)(66476007)(71200400001)(110136005)(6506007)(66556008)(66946007)(9686003)(76116006)(55016003)(26005)(478600001)(7696005)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZmTuPGSU3GA2ulgahPYzr65EspYzVCRYgG10h0b3yNMmlwDvl4aECC2s+/Pa?=
 =?us-ascii?Q?7pqzc2RTFT1cz+omVSS6JfXPZFcHElhNr00+IVwlDH5n8WGJcznKFIVYPW4K?=
 =?us-ascii?Q?++DBkk94X74RfjFCAUEah1gTtKIl4Afjw6VDJvahmkpXiGMDDMGJUJLEFL3I?=
 =?us-ascii?Q?mKrwS7MDOHJo/inoBBQ2/VxoOkdyYU8GUic6VqyKr/Zbn0btjm6iNxl5tW1Z?=
 =?us-ascii?Q?2ejVL8ztRYPcMRAh+HP5Imbxcln4Kg4Yq+cEIf+xy4z3LbQO6oa4PxTU8TAY?=
 =?us-ascii?Q?C7VbP4wBkr0nniY8Zj+MrSWEIGwdP/mzJiZ2dkyguSWeiyLjKQj0a034c2W8?=
 =?us-ascii?Q?lnt8N0j3Lgecl6LUIVPJ0KFLu9rOLthRqC0B1NsgMabcWb/UM7qv+5XHipfE?=
 =?us-ascii?Q?uWUDjl0MczI3i87/2VOPpMUTi1vq9FI9vv6lCq3e754mvWnPcct0HAyYyP5B?=
 =?us-ascii?Q?DqKXWlVfnWhRHsp6UUWxmcM0Xf6DZq92rMozpzDvhxta8Uantp9S4E5iOtr5?=
 =?us-ascii?Q?lmwQIs2GOkmHJmW8BlR2YIUdX0YEeRv+OCwYvXeoAUVw4d05PUegqE1O0ptp?=
 =?us-ascii?Q?v25Bs1ARe2G6UiyE720V8Y3qXbellIn+b6KRrFYdHEdIiD1EpW3fJcSFtI8I?=
 =?us-ascii?Q?Apl47okZnzN9FpjjeX7fDcedjPLnQFODBNKmsexckTcYEj3zGipJ5kLovOVk?=
 =?us-ascii?Q?OFqrHUxK+tdCV/XmsQVgTiWf921jKxvSOW8G/HKDXQXz9ocPf6+RR7gK43w3?=
 =?us-ascii?Q?jme+zVDIi9Vu4k0ibBctUS1/2rQ7s5393j0sne5yBCYemdgjbOaPPHjF8BIU?=
 =?us-ascii?Q?Aev91r9SNjiWAnW7d6ZpK+TRWOXCKW+JsT8FZykVarfSlDl/4UjMjPO6jyxo?=
 =?us-ascii?Q?c9zps06TB9CTlgyVK6Rxn5ILGS39/Ldgbn3aYJ8WfgV48jaCwTdwnCCUWVz/?=
 =?us-ascii?Q?X0DgI9rOFogZJn0LTayFzknzg5YLbJdsyt/l+8wXrZHgO8CAxxscLhMJBVJ2?=
 =?us-ascii?Q?/s69yZFLDLxRv2ifnSudGlYtCJWYLp8ze/uWuGUCukitCZYgTmfO0CsnCO8Q?=
 =?us-ascii?Q?yljV2yzUmqOBcCwlb+ZDaySQmW6eNUOgexzC9ZcIFfxIdUSzo0/GGkxfBbIu?=
 =?us-ascii?Q?lavqatvXrQ8No3HGFrI1wY8h2OvLvcFQKSTq5oZMTClC2hRQLbQ7DoFydaxo?=
 =?us-ascii?Q?LB62IuxLDeGtJ8D13Y/FCYA7X2JrEXeb9OhWtZAYxPaylgXPIddfw+DFTDQY?=
 =?us-ascii?Q?aji8ROAWBCSP09Ujq8bJSNV23gSSJ4VtTrqvVxvEgYql99rXkRd+jEtBppis?=
 =?us-ascii?Q?lHABQKrwehhGzUOexnQ3Slni1sVo7siaQM7/wjz/m9MBTmNBUBsg1wSktHZ3?=
 =?us-ascii?Q?tXpM5w+aT28ZDdxdhBcL8AK+ZFbnIOpFjeJdtE8uGHH08HosYoGJRFxFM6de?=
 =?us-ascii?Q?vbbWsFtGcat9wLw3bYJld/AubMbtOyMffkbxHv/JPAsKoxMjaEkb4+MWh1q/?=
 =?us-ascii?Q?fnxSD/Wn7FzxfY1hSP9I+WaliJUWaN7xRDzL+MsR4Pd6cFqd2BjzbPFRGmx7?=
 =?us-ascii?Q?eYcv79P3yqSqRXzfNtorkgpASRkiB0kPDuFLjAOi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7459.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913311f7-a928-4343-0eca-08dbb4ea5df3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 06:18:09.4214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pvnIipiSB90REZnquVWCxFkqb0euOshJItTyLRhVshKfHKH8MrP0wrK7dhQI5KYeJh1iB8X0KAnKi/5zxPh0+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5949
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Chen, Jason Z would like to recall the message, "[PATCH] media: ov08x40: Mo=
dify the tline calculation in 1C mode".=
