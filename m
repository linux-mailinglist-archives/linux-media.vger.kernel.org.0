Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1D2E5104AD
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 18:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238941AbiDZQ4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 12:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353451AbiDZQz6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 12:55:58 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E325A0BA;
        Tue, 26 Apr 2022 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650991959; x=1682527959;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RljwWtvwxyZRY8Pp9/rrO7I2/KDri4Ar9viL/YgUIMc=;
  b=fa4LsYvQCt/PJqYdDF0d1DFuLvDRb0RgO1AuQCLyEQ6fLFQQFNk/pVMC
   OkRiK1vtgQM34KDhokhXSkLmv3M5mpuL4w91vXOxPlYBdIxHyq47VZesh
   fwSU639O76t9/EVnDh8dN6oboRMQy7l9N1Ji47P58XWyCaTQs7pKYLIH4
   udjeSMG7MIH0U2W8bj6CS+C3RsuVC/DhjHNrZEjnKH8ehXJrUkyzodIap
   r4cFyjM2OsgSwOc9gT5D5HEnROjpllgtntQ2bLeESeNmLaB9HsvGl2+as
   9FIBZgyMvDs3zKh//JiBA1tEHP+0sGcYKZHUQ3P56YvEX8u+iub65++zu
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326141562"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; 
   d="scan'208";a="326141562"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 09:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; 
   d="scan'208";a="532760192"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga006.jf.intel.com with ESMTP; 26 Apr 2022 09:52:39 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:52:38 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:52:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 09:52:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 09:52:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWIyuYUXhupvoKwtM7nehh9U2AUonW9hOOfPDl4KDrBkBOU9oPIEOLI+LTdnx1Uqs4J1XMTPJFUWzRN7Vfutpl8+lylAK/JfPebyg2kNzkonrE1nY8D1bmZqNLJQx7fGXNWyZpfqXmulAnvA9UGTnFR/HEFmvBCe4D+KjGVz6H9jXF36FAOepMRwiBn65qYVqLWlURSUsy5GXLUypco9vmF3ZykFulgtMe0UTXj5ZwuqvuyuVL3eaR/P9Sk7lfngbunSoeVhq6lV6cWJIn/Wxp82caCv0fDz/s8CwC76d6hC5QYNroobRH7qVxE7Us0ITutFOo+d1ncc0vjx3xHgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RljwWtvwxyZRY8Pp9/rrO7I2/KDri4Ar9viL/YgUIMc=;
 b=meQfUPSyfcuDmLfEN9rh7AAz2i2te/KLVRKgsLXVkEWjDS/j9vzLAtMprgs56hOLwG+QHO5DPh7Y1L89WE/IiHwJkH5eOp22QwVwi9mgeM5FX4mHtPtN8Y288L4BzjhiRUdhOux3xuSfomJLKA5I8P7Okasd0ZaCUyqwMK9nIpfXCQfk3tni8/k2hTGaBxTwxAZHUpuZHEigcImdNYojySxaPsTscL1e7htBzY2oAiGeJYEZSSexqrxZZgbv7vdB/dpbVRoLj5REwyb/mIe88Om+hCIZ0sQVL93cQ9NPf9Tyzp9nMQtiqURZAxFgThbgBr2oMOUQQdkIKUhAY2vzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 by BN6PR11MB1396.namprd11.prod.outlook.com (2603:10b6:404:4a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 16:52:35 +0000
Received: from SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::f0ad:94c3:5f16:3c2f]) by SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::f0ad:94c3:5f16:3c2f%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:52:35 +0000
From:   "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>
To:     "Murphy, Paul J" <paul.j.murphy@intel.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
CC:     "hfink@snap.com" <hfink@snap.com>,
        "robert.foss@linaro.org" <robert.foss@linaro.org>,
        "vladimir.zapolskiy@linaro.org" <vladimir.zapolskiy@linaro.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "jgrahsl@snap.com" <jgrahsl@snap.com>
Subject: Re: [PATCH v5 4/4] media: i2c: imx412: Add bulk regulator support
Thread-Topic: [PATCH v5 4/4] media: i2c: imx412: Add bulk regulator support
Thread-Index: AQHYUMBowNFR77RnBkKjew2pMG877K0CeowA
Date:   Tue, 26 Apr 2022 16:52:35 +0000
Message-ID: <da428db5504bbed1a255e1415b0c81dea4093eaf.camel@intel.com>
References: <20220415115954.1649217-1-bryan.odonoghue@linaro.org>
         <20220415115954.1649217-5-bryan.odonoghue@linaro.org>
In-Reply-To: <20220415115954.1649217-5-bryan.odonoghue@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 141441a8-e471-40ec-ac35-08da27a52a3c
x-ms-traffictypediagnostic: BN6PR11MB1396:EE_
x-microsoft-antispam-prvs: <BN6PR11MB13963B9C44AA262308ECFAB0F2FB9@BN6PR11MB1396.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2+UsG3yCxDX6urhPl922dBrHABMnfS7j7t2vK9CDJbp5czkHZLAGCTaQbZ61PmqZmdbgt4XS6K5QB9Jh2WXDwG1TkvwTsNf3bQ9oYx3ZAc9WMDAQVLJoSqYeQi7j80Jk9q4yCLV6isViRPFhtShvlRHtYBB2+YT5BpdrzBbBSI33IS7IdJgQnaQ/B4g6K+Ozgb+zHzSmMt562nUiqzonzRFhFXeJDSdreOQjyUV6+0aw0EsDpEpS1g+cV/tUtTLcPqqt8AE0j9GjuC+sxED+ASkftmJsg+NAr/Jyk7qLqvMHvqnxRwiibSDwYyvD4rf4aT2/DEb0dPPuhn2RcxaU/ngUwLRZaJD0bOeAib/kSdMlwMmFDBUqFVIIDKdOWCamUc9a5BHna47AWEr5prPOHgLAfmQjcZXHyNAHKMx98F2w2DFXkfFHNqwxXvbWTAsd9tUnlwNtsKSDoD57fbEOEzhsnN3rehdhfjLJRFXP4ojPYZAayJCLJ1mAyTARIwjqFS1DaJ1Dkr6tGx/LRxt5AowlCz3buFs2qEbja+5zqcIpOCI8dDcBQPhbi0Z7QH69IHhYTj11fSB+mqlN8//mNv4Qb1zP/74R+nLBAIfczwDclQeR0UnQThrmQ1LJom2iJTknt3paKWpSIceM8Npa95DZaemEGZra9wTHe0iulrT0r5ip4kpzcAZb+BouGfNJXb2OZPK07ztW2JtwGiqz4Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3055.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(66476007)(86362001)(76116006)(66446008)(91956017)(66556008)(64756008)(5660300002)(71200400001)(66946007)(186003)(38070700005)(38100700002)(8936002)(2616005)(7416002)(316002)(36756003)(6486002)(2906002)(508600001)(26005)(8676002)(54906003)(6512007)(110136005)(122000001)(82960400001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTBiUjVmS2YwWlVqenNNb1QzMlVQUUdWc29DR0dlWEkyeHlJSXQ5ZWwzL0hm?=
 =?utf-8?B?NG1sNUpFUVNWNmcrT0M2VG0zMmZaUmRmNCtzWlhaR0UrTVlQRTQyZ1Erd2ZG?=
 =?utf-8?B?SVBpV3VYcnNIT1lmZStFQjJUM2w4aDI4bzkrOHVEZnFjNDMzaWxaZHpzME9U?=
 =?utf-8?B?VUlKSGZwZlFzQnA5enNHK2VBcHJERXNabFNRQ1hxdTAyMHNGeldqYkRDOFNn?=
 =?utf-8?B?ak9scSs0MW81dXBNd3R5NlZzLzYwVHFpWWxqNHJ6Q1puUVRzUEVMUFhzaTFm?=
 =?utf-8?B?NFgzWnl6UlBSR0NNTFZONEtNN3JhSml5aGJPemJtS3c5YVVtUisvM1BKU09B?=
 =?utf-8?B?d0pZK2lqT3FsNU5yeUNpMVJNbXQvYkVmZ3RGVVRzYldNWWIyYlJIU0ltM2xQ?=
 =?utf-8?B?NXZyTHgvU0licmNLc1lzeU9sNG9jT0krd09OUktKbmI2TlFZdEUyS3lpWFpt?=
 =?utf-8?B?T0t3cTNXS0srVE5kRUxWQ2xYeE1xQ3hTWWJxTkNXTkNmRjBlWng3cmRrazd5?=
 =?utf-8?B?NkRVRzBqbzNHYWJuVldMMi8xUHdub1YrYWNwOSs0WnZnanR1aGxvcS9hTHE4?=
 =?utf-8?B?Z2RVZURGV3EwWTFZeHJSK0Y0TW9mOW5qMmhuNUFxS1BuUnJKUGxoL3gya1VP?=
 =?utf-8?B?QW1keTBZYmV1Rm5vQ0c2QTk3N0NGOXJWc1JBUHdQVEdMZmZqYUY1cGVWQzZK?=
 =?utf-8?B?Vi9KcDcvVXdEeWpTK0lsTkZ2c1pEdEtjWnUwYjJZK3NNYmYzcitMZU40ZXdi?=
 =?utf-8?B?R3NkUGs0azNvWVhhcmhJN05nLzNJWFdSamd5dmRxQjNTQTlkTlpjNmY5YmlY?=
 =?utf-8?B?NGxHN1hzZ0owdXFNYmpMY1dWditRVklEcUZLK1UzTUM3SDErOVM1TzMyc0w1?=
 =?utf-8?B?cjVmdnVLenhJb1FocWlFNFovNVRIYXRTbjZzQ2lyYjVXRDFWWkxBTVdTaVJJ?=
 =?utf-8?B?QjRZaUpjSXgzdE91VnozdVB0Q2ZVOGxjVUp2WnRac2tnZjR6UkVpbTQvc0dO?=
 =?utf-8?B?dnU1bnllbEJVY3RiVUlJRFptQzgzWDROWVdEK1FONU9ZckoxeHRGOFlSSWJh?=
 =?utf-8?B?VkM1YlVnSTg2ZkdEUHRnbnV4NXgxWVYzc3V6MmQraVZzOVphbkZHOVViVno2?=
 =?utf-8?B?cHlxdnR0OXBBamorTUFvYTc0S0UzWFV5bVB3VTZUUHBHblpVTWU1T3N4VzRr?=
 =?utf-8?B?cVkwK2NjamVXbHE5dUdxZU1DMnVTbFF1QVFvbC9hUnRvVXNkUkU5c0pWdmFu?=
 =?utf-8?B?THlzMzh4RzB2OVFqL1RPSUVmWDBmN2Y0VlE4a3JZVzJubVpHVmRBUHJzdlA3?=
 =?utf-8?B?aWIwekxnWGVYV090K0FpY3psUXR3UXBtcElFcTBNbjBoZU1TNElFR0IycmtW?=
 =?utf-8?B?S0dueThCM2JYNXluQ29HdnhXR25JOGtrZk1IY1VrajlIY21Qcm90THNRd0Ev?=
 =?utf-8?B?NjlJRXd2cGV3TzNrREl4cGtLcmI4TyszY1hkdFQ4WDZnNGxpY2ttemZEZjJO?=
 =?utf-8?B?N1o4SmRjVVNVcS95QTlSeXpwN0dEekNTSm5BZmhTZlRrT2x2clFBVHNMVjdx?=
 =?utf-8?B?NEJQaEdHK0xQV2F2eXAwdVR3TXVPSmZKWFpuUG41UkprQXVjK3RpMlhZeWpU?=
 =?utf-8?B?ZVFpNStPeFlORHk3cWd6U0FqdzZ3YmllY09NSmZWUkFIYnVreUFWNzBNZkta?=
 =?utf-8?B?c3R1dmxwNWVPbG9QVU0zVTlrOFVGeERUL1Bia05Vb2Z5QjlydlNlWkExSkVD?=
 =?utf-8?B?UWErdElqbW1FSHBYMDJCc2diUm9CbnlIeVdXRmNBZEpBVWdjR1h2MjNGUHJx?=
 =?utf-8?B?TFhPTDV2OHhjT3M0Qkpoei8rcDJDWm5IcGRsdnpuSy9yVmxteXZmTU56aHpI?=
 =?utf-8?B?c0k2aU95K2g0SnNxci9UeDc2ZkU0SlFrMWNabE5xcFJxS2cwUUFjVTNXZEtM?=
 =?utf-8?B?M21WaGtqQWg4UU8rME4yb1BmQm5yN0lZU2NzYVdwSXNvMEE4ZlV5N1lqdXYr?=
 =?utf-8?B?bzBsS1dDaEJCQ3VDTWswam5OcDBkb0U0ODJOc05hVjFJU1A3YnNtQ0ZYdzNP?=
 =?utf-8?B?Rk13NEZwVFYrQWpoM0NIU3o3NDMvdWVkSDV6N2FJcmxyZXpEcjNIVldIY2tQ?=
 =?utf-8?B?djB4RG16N0o0bWlqZ1djSk1rY2VMVzZwWXllZmswaktVTUFaZy93M2tRaGRi?=
 =?utf-8?B?YjhSQVdwZWpiRk5mYW51Y2FpSnpoM1NGckJTVDk4dTU0eGc1M3lxL2lSYmlO?=
 =?utf-8?B?OGlMci9mdUNqMVloR0wzMzRGZTU0MzlGNFo2UlpLdXU1VENhZGh3MU96VzNk?=
 =?utf-8?B?aFNwQ0g3aTYzckJyZlRURlRhcjVmSWVTVGErbjlaYWNhd0pZTEx1VThWZzNU?=
 =?utf-8?Q?N42HY64jJ6tcYNHm3s0eXIuzsgbrnmaukXZ6P?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D25F732A4485DB40966A4BF6635E0F28@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3055.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141441a8-e471-40ec-ac35-08da27a52a3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 16:52:35.7584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BXbWwYKNWwpfBlqgWmMAAj4DbOggw/En6w5BioBEhvnlXNmR/gnnFFQPhdOrsFCTnrHTSYyDbE3FSNA0zYSNR1NtlFRtH/Max79XqenUTDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1396
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIyLTA0LTE1IGF0IDEyOjU5ICswMTAwLCBCcnlhbiBPJ0Rvbm9naHVlIHdyb3Rl
Ogo+IERlcGVuZGluZyBvbiB0aGUgcGxhdGZvcm0gd2UgbWF5IG5lZWQgdG8gZW5hYmxlIGFuZCBk
aXNhYmxlIHRocmVlIHNlcGFyYXRlCj4gcmVndWxhdG9ycyBmb3IgdGhlIGlteDQxMi4KPiAKPiAt
IERPVkRECj4gRGlnaXRhbCBJL08gcG93ZXIKPiAKPiAtIEFWREQKPiBBbmFsb2cgcG93ZXIKPiAK
PiAtIERWREQKPiBEaWdpdGFsIGNvcmUgcG93ZXIKPiAKPiBUaGUgYWRkaXRpb24gb2YgdGhlc2Ug
cmVndWxhdG9ycyBzaG91bGRuJ3QgYWZmZWN0IGV4aXN0aW5nIHVzZXJzIHVzaW5nCj4gZml4ZWQt
b24vZmlybXdhcmUtY29udHJvbGxlZCByZWd1bGF0b3JzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJy
eWFuIE8nRG9ub2dodWUgPGJyeWFuLm9kb25vZ2h1ZUBsaW5hcm8ub3JnPgoKQWNrZWQtYnk6IERh
bmllbGUgQWxlc3NhbmRyZWxsaSA8ZGFuaWVsZS5hbGVzc2FuZHJlbGxpQGludGVsLmNvbT4KCj4g
LS0tCj4gwqBkcml2ZXJzL21lZGlhL2kyYy9pbXg0MTIuYyB8IDMwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvaW14NDEyLmMgYi9kcml2ZXJzL21lZGlhL2ky
Yy9pbXg0MTIuYwo+IGluZGV4IDg0Mjc5YTY4MDg3My4uMTc5NWE2MTgwZDYwIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbWVkaWEvaTJjL2lteDQxMi5jCj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMv
aW14NDEyLmMKPiBAQCAtMTEsNiArMTEsNyBAQAo+IMKgI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgo+
IMKgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRp
bWUuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgo+IMKgCj4gwqAj
aW5jbHVkZSA8bWVkaWEvdjRsMi1jdHJscy5oPgo+IMKgI2luY2x1ZGUgPG1lZGlhL3Y0bDItZndu
b2RlLmg+Cj4gQEAgLTEwMSw2ICsxMDIsMTIgQEAgc3RydWN0IGlteDQxMl9tb2RlIHsKPiDCoMKg
wqDCoMKgwqDCoMKgc3RydWN0IGlteDQxMl9yZWdfbGlzdCByZWdfbGlzdDsKPiDCoH07Cj4gwqAK
PiArc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBpbXg0MTJfc3VwcGx5X25hbWVzW10gPSB7Cj4g
K8KgwqDCoMKgwqDCoMKgImRvdmRkIizCoMKgwqDCoMKgwqDCoMKgLyogRGlnaXRhbCBJL08gcG93
ZXIgKi8KPiArwqDCoMKgwqDCoMKgwqAiYXZkZCIswqDCoMKgwqDCoMKgwqDCoMKgLyogQW5hbG9n
IHBvd2VyICovCj4gK8KgwqDCoMKgwqDCoMKgImR2ZGQiLMKgwqDCoMKgwqDCoMKgwqDCoC8qIERp
Z2l0YWwgY29yZSBwb3dlciAqLwo+ICt9Owo+ICsKPiDCoC8qKgo+IMKgICogc3RydWN0IGlteDQx
MiAtIGlteDQxMiBzZW5zb3IgZGV2aWNlIHN0cnVjdHVyZQo+IMKgICogQGRldjogUG9pbnRlciB0
byBnZW5lcmljIGRldmljZQo+IEBAIC0xMjgsNiArMTM1LDcgQEAgc3RydWN0IGlteDQxMiB7Cj4g
wqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBtZWRpYV9wYWQgcGFkOwo+IMKgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgZ3Bpb19kZXNjICpyZXNldF9ncGlvOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgY2xr
ICppbmNsazsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcmVndWxhdG9yX2J1bGtfZGF0YSBzdXBw
bGllc1tBUlJBWV9TSVpFKGlteDQxMl9zdXBwbHlfbmFtZXMpXTsKPiDCoMKgwqDCoMKgwqDCoMKg
c3RydWN0IHY0bDJfY3RybF9oYW5kbGVyIGN0cmxfaGFuZGxlcjsKPiDCoMKgwqDCoMKgwqDCoMKg
c3RydWN0IHY0bDJfY3RybCAqbGlua19mcmVxX2N0cmw7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVj
dCB2NGwyX2N0cmwgKnBjbGtfY3RybDsKPiBAQCAtOTQ2LDYgKzk1NCwxNiBAQCBzdGF0aWMgaW50
IGlteDQxMl9wYXJzZV9od19jb25maWcoc3RydWN0IGlteDQxMiAqaW14NDEyKQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7Cj4gwqDCoMKgwqDCoMKgwqDC
oH0KPiDCoAo+ICvCoMKgwqDCoMKgwqDCoC8qIEdldCBvcHRpb25hbCBEVCBkZWZpbmVkIHJlZ3Vs
YXRvcnMgKi8KPiArwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShpbXg0
MTJfc3VwcGx5X25hbWVzKTsgaSsrKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
bXg0MTItPnN1cHBsaWVzW2ldLnN1cHBseSA9IGlteDQxMl9zdXBwbHlfbmFtZXNbaV07Cj4gKwo+
ICvCoMKgwqDCoMKgwqDCoHJldCA9IGRldm1fcmVndWxhdG9yX2J1bGtfZ2V0KGlteDQxMi0+ZGV2
LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgQVJSQVlfU0laRShpbXg0MTJfc3VwcGx5X25hbWVzKSwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlteDQxMi0+c3VwcGxpZXMpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChy
ZXQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gKwo+IMKg
wqDCoMKgwqDCoMKgwqBlcCA9IGZ3bm9kZV9ncmFwaF9nZXRfbmV4dF9lbmRwb2ludChmd25vZGUs
IE5VTEwpOwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIWVwKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmV0dXJuIC1FTlhJTzsKPiBAQCAtMTAxMSw2ICsxMDI5LDEzIEBAIHN0YXRp
YyBpbnQgaW14NDEyX3Bvd2VyX29uKHN0cnVjdCBkZXZpY2UgKmRldikKPiDCoMKgwqDCoMKgwqDC
oMKgc3RydWN0IGlteDQxMiAqaW14NDEyID0gdG9faW14NDEyKHNkKTsKPiDCoMKgwqDCoMKgwqDC
oMKgaW50IHJldDsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHJlZ3VsYXRvcl9idWxrX2Vu
YWJsZShBUlJBWV9TSVpFKGlteDQxMl9zdXBwbHlfbmFtZXMpLAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbXg0
MTItPnN1cHBsaWVzKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0IDwgMCkgewo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBlbmFibGUgcmVn
dWxhdG9yc1xuIik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7
Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgZ3Bpb2Rfc2V0X3ZhbHVl
X2NhbnNsZWVwKGlteDQxMi0+cmVzZXRfZ3BpbywgMCk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKg
cmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGlteDQxMi0+aW5jbGspOwo+IEBAIC0xMDI1LDYgKzEw
NTAsOCBAQCBzdGF0aWMgaW50IGlteDQxMl9wb3dlcl9vbihzdHJ1Y3QgZGV2aWNlICpkZXYpCj4g
wqAKPiDCoGVycm9yX3Jlc2V0Ogo+IMKgwqDCoMKgwqDCoMKgwqBncGlvZF9zZXRfdmFsdWVfY2Fu
c2xlZXAoaW14NDEyLT5yZXNldF9ncGlvLCAxKTsKPiArwqDCoMKgwqDCoMKgwqByZWd1bGF0b3Jf
YnVsa19kaXNhYmxlKEFSUkFZX1NJWkUoaW14NDEyX3N1cHBseV9uYW1lcyksCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW14NDEy
LT5zdXBwbGllcyk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDCoH0KPiBA
QCAtMTA0NCw2ICsxMDcxLDkgQEAgc3RhdGljIGludCBpbXg0MTJfcG93ZXJfb2ZmKHN0cnVjdCBk
ZXZpY2UgKmRldikKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBncGlvZF9zZXRfdmFsdWVfY2Fuc2xl
ZXAoaW14NDEyLT5yZXNldF9ncGlvLCAxKTsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoHJlZ3VsYXRv
cl9idWxrX2Rpc2FibGUoQVJSQVlfU0laRShpbXg0MTJfc3VwcGx5X25hbWVzKSwKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbXg0
MTItPnN1cHBsaWVzKTsKPiArCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IMKgfQo+IMKg
Cgo=
