Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E355B8CB2
	for <lists+linux-media@lfdr.de>; Wed, 14 Sep 2022 18:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiINQTX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Sep 2022 12:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiINQTV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Sep 2022 12:19:21 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB11F7696A;
        Wed, 14 Sep 2022 09:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663172359; x=1694708359;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EHK86YQK5eBD26b9MUbKX5QlO511fmc9X0zkannNSVg=;
  b=c/GHCURXNwvdsFMSP66O/RsT1jplAEgz6tvZw1lda1pHr+dvOtsX21FS
   KdYuPY8ZuVMCUv9OMWFNy77JLLs5vaCzgb77r7Yt0yBb0uWf7wHBCipHQ
   QEneCzrRSDaHNzc4rDakLrO0j7kShUoSTC+Q6iBRJqYByVdQ/nfYtEfk/
   ZZr+HEEWfFBbdKVu/5VR5oFGC/3aoX2M5z9zPN4eDPR+fWd5fKlbL3BvA
   e9zezjqBmGB9N9bIxQ1mDH2EmMbFPaAsoX5Wv84GVuxEG0aeo9Ny3LLr7
   h4s5U24mMnKCCkd5F6HM4dJO1B4nBf0JnFWLoUA8drCx7Xm/uvchjpUmP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="384765095"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="384765095"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 09:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="679114204"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga008.fm.intel.com with ESMTP; 14 Sep 2022 09:19:19 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 09:19:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 14 Sep 2022 09:19:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 14 Sep 2022 09:19:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qi+BmxFDM6LIPdn0T8N2+05N4GXTZP8RF8d3FNnpyvTcSUEN7nCYT7RBlDueCyWwS/XfiUsakyfY6co6l91WgnSRrPS+1jSim/tYgLcwpWMbRz9goSuaBJI4QCuEEUOP1Zo6lZtAxi5BehEbmUZevz52dVLSKfDJKGlD1ICJz6t7TbfCxX+qKiYYrCybxzlB8VkcZH9DW5qQR89BzceU6k4iV2mW5AhLe0pRn0XBq4HqcR9GJ/P2wMpm9RU8eUqFF+a0lipciC/f5LjkNQzO4OfI3ecFdWTXOv/vN7xNUTYVDzmHMqLHmtqmr0VeSgncds/3YJ40xa7ZwDSYFOx0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHK86YQK5eBD26b9MUbKX5QlO511fmc9X0zkannNSVg=;
 b=R/7JdACqKX1lzDyXBgJXoOtJ1WPeKmwJruC+jsSUEgPYyMo/cvbOeIERGCnLhU04Yes8TF6xHOyhf98Xx+ti/2xXd3TAuQL5mggXYePaiNofcszXr7PqIlhwNQ0EcD2rbKh2Xy8+pLUUabXPwNIxyx3L0Om49LDdoc61ELwzAjYyp7XB7wziT7ePHbe2/ZA/sYrcZqKqzI3IxCEWOwRcYvwia2npmzvKOmDySTNRNgtgRmzRAutRPk9rD3w90v0wJrgQqu4I6K6eC64Tx8BOwmSvkaE5R7/0gS9f/aKJDedW9aKveQ8w+pgFxqc9/6QM1rYCIuBcnerbT0zz8dkwxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14; Wed, 14 Sep
 2022 16:19:16 +0000
Received: from SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::b57f:c087:8508:7fdc]) by SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::b57f:c087:8508:7fdc%4]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 16:19:16 +0000
From:   "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>
To:     "Murphy, Paul J" <paul.j.murphy@intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shravan.chippa@microchip.com" <shravan.chippa@microchip.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Prakash.Battu@microchip.com" <Prakash.Battu@microchip.com>
Subject: Re: [PATCH v3] media: i2c: imx334: support lower bandwidth mode
Thread-Topic: [PATCH v3] media: i2c: imx334: support lower bandwidth mode
Thread-Index: AQHYwcn9L29mjs5jWEST7Avk4amsIq3fJ+KA
Date:   Wed, 14 Sep 2022 16:19:16 +0000
Message-ID: <e5f49377bf005dcca22a333aaf85480df2165815.camel@intel.com>
References: <20220906082327.4029-1-shravan.chippa@microchip.com>
In-Reply-To: <20220906082327.4029-1-shravan.chippa@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB3055:EE_|SA0PR11MB4717:EE_
x-ms-office365-filtering-correlation-id: 40294058-f330-4918-72c3-08da966cdefd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 626CA/Rxpp5Jyj80zM3iZ12I+9Tv5Hugcv6dquRzB7Z+4VgPMIq0HWk9ng9yXuuoV2A0chF95nIzoiId1p6S52U00Z9wKbNIZq7lMD1GsdkwGQYVP9Ayfrjlw1DJhHMKA7yjmco45ucsSeKeFTajCcLn4ZVT+veMVgu/teDWn3gtZtXbREOfMbj1U9qfTdfLju79MiOmNDMFELzn4Jr82homYdbyQPpDvIBou1JucOtTFbCxEV4B9sQqGfF3rEQFBxJhtLxrmy0gUes4vSvfMIxCIHpR/WYRwHd0n7LPmMz4wd+0sgHqVKJEy6z0Ns8fQf5vRO/kiCnygfw7UJxrTCJMLXrqE7vrYuVzGLgcdJQB7J6F1XmZtWuKweuhVBrtLFXilfxpBXjl2c55QXplwUTPM9iREg+rnQq+vff3RqLudLNUoNhmZnu1Tre2faV9DxsfLKhjpmC7VqvRx8b1cd/hDTSDB+bEmymha7AzXfm+77+z+3D4rifubn46jDZvYGyDHrCLpGZtMSxcd7mzJm/FngGBjJwZ32BEae4cApWHItS1aCdZDT/0iKq2grRD6+Numnkgpgn51AstWLMrPYYhaeABi4xVyGck7kY2Q2fjXqcb78bRLWq2P70kX7I1GZ6Iet8egYXm0Dn2xrkryU6wE5KIOnfhGIikKvI+ZNpxJf7UpKp4lRCtZtFzTptbioF8zAnfNIhsws9wrIjE1CzEeCxDNyM5aKmMa4WnMPrgYm+gEHkRaxLtfebyiYTcfhMQ6/SV3bFaFJ76cGPaZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3055.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199015)(54906003)(86362001)(8936002)(110136005)(5660300002)(66946007)(91956017)(76116006)(66476007)(66446008)(64756008)(66556008)(6486002)(316002)(4326008)(8676002)(122000001)(38100700002)(82960400001)(83380400001)(41300700001)(6506007)(71200400001)(478600001)(26005)(2616005)(186003)(6512007)(38070700005)(36756003)(2906002)(30864003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1cyMHBFTVNLdVNmQ2tTbmJnRVNMVFg3V3p6SHFyWmJxdG5FYXRBN09hWHZy?=
 =?utf-8?B?WTR2cVpYdUpjS0dnOE9KcjhjN3JXZm5SeVZZR0xEODdSV3ZSZlh3K0lsbkxo?=
 =?utf-8?B?VExVZlRDVXdZQUwrdmVaRVVzV09ZRWVvdHhjb3czaC9jS2ZyZkt3bnM0ZXl4?=
 =?utf-8?B?amQ1QUE1RDdXbkZYQjZReWhNZEhWa1IvSXROODNIcEY2YkJWSm4waTl6ai8r?=
 =?utf-8?B?bHRxOEYza2hGQkhqVWhXTTMrd1RjMXRBcGxVa3R5TnIxaSttWG4wTHBldkti?=
 =?utf-8?B?a3FjZTFua1ZMUnJFQ2hKK05Ha05CVWE2TStxdlEvcCtTZXpyT3VHd1BDL3Jo?=
 =?utf-8?B?N29DOFBVK2lmbVpqM2NMa0l5MytXSzM3UWl4czFvSWt1eG04ZWtIY0FuY0dK?=
 =?utf-8?B?M0JDS09kVkM4S3R2UHJRWG5UL1BBZnRVanJvcEVieGZ0UzR0dzBRcENrT2Iw?=
 =?utf-8?B?d3lNRXd1UFllU1NWUVhqRjhMVFM1U0tGRlFCdVM1cCtGUUNBdm1KNEE3ekZn?=
 =?utf-8?B?b2ttNm01b1NCeG1sNi80bVVOQTRNb3JJREZSZE1VcFZVeHYrdEUwWDlsOTZu?=
 =?utf-8?B?TVBLN3IyUW9JMWdEQTRWYmdpTkwzMDRSNGRRRkIraXFqZk5HWkhzeXZwZEIz?=
 =?utf-8?B?N01WbXE2QUE5alNQL1R3S0c0dFlsdHhqc3hxb3N0bGVmZDBTc2s4OFRRTnJv?=
 =?utf-8?B?STI3c2Z4WUVkc0lNZHViaEVPNmVRdnovVXV6dE50cGhXcG1jNTh5elVtR1c0?=
 =?utf-8?B?Zy8zSHRXaWk1L2ZUMDhaSzVTZ2JYaGVrVXhrNHB5a0hCZkZlUFVUdVp6eGI1?=
 =?utf-8?B?UTM1Q3ovd01kby9IQS9TY1ZNUzJzMVdwL1VLUDluM2UyYkZaUjd6VTZ4TGFK?=
 =?utf-8?B?bHdONjloVUR3Z0oyOG9tTExZalhDUHR3ajJLazBFUURtazRZRXUvdDF1QzNO?=
 =?utf-8?B?eWpRR0s4K2NGTjBYZnBReFNjNnltVDFKWnJjNndvM1g4aUVpL2wwbEFUVS9X?=
 =?utf-8?B?OXNIWmVmcWJCNUd0Ull5ZUlPdzIvNmpabDdTTml3NXduWFlTS2FSdnpJYkVq?=
 =?utf-8?B?bS9FUkVuYWFKYXd4YXg1amN0RmFVTWYrbm9iNU0xemd2Z3VFdGFpaU1OZWww?=
 =?utf-8?B?emJyOEVucVJuWUNVWEtrZklJd2MrWWlPaWZnSEFzOUpPNWl2ekZ0SnJDcUpi?=
 =?utf-8?B?NDdGaEd0NkxoVVZ1NlFtQWdFeWZQamprYnI1U2d3ZWNWdy9NaEZLME8xZHZS?=
 =?utf-8?B?MXd6YkNJQndReTZvRXowcFBXTlVSVTBJSng3aU42aUlBZ2syczJsb1dBR3pB?=
 =?utf-8?B?cHJqVkdUUUxXODczTm9vQTM2c3lNbCtjbGEvbVU0WVZpZ2ZrMmJSRFZnNVQr?=
 =?utf-8?B?eUdmSS91RlBIcHplSlFUVldPZ1JHTjd3ZmFTejlCTFBOb3BRSFJna2JINGx2?=
 =?utf-8?B?MG1yQjBMSjNaYUI5aytlcXVMN3F5OVVLOTFya3RUME02UDNEN3hqUmpIb1Jj?=
 =?utf-8?B?T0tjVkZUTncwMklOcG9aV1FXY0xKZE15MWFJaVBLTCtuQlEwUnYyeDhSZkZx?=
 =?utf-8?B?MjRZNFJySFBSM1JzSHFnaEw5MW16WWh3Qkl3cERjUTloTVZsNXBlY1ZTcm5P?=
 =?utf-8?B?UlRzWDB4eVh0YUxiZFQ5Z1N2UUdrVWh5T1NBZXVBV2V3akxmSTlwMFVlQmVl?=
 =?utf-8?B?R3QxWVViVXFRVXdVVXJPMFFHc1VYU1JsdHhjYXg2bWZNcyt1UnArTk4yMWRG?=
 =?utf-8?B?UVFJYUhWd0Z2bXBuZ3pib0xFUkMyMG1WZENBMFJ5UFk3YzZRSURGbHVpb1Z4?=
 =?utf-8?B?dkpHcTdnRDZSNkR4Uk5ERW9iNEloNnJTSGJJMFZDUXBBYWlkL3dKMjIxZXM4?=
 =?utf-8?B?RXpacHMyUVl0V2N2bzgxblA5a01lTU01SmlvcjVvMGZRR0t2Rm5ab2R6K05z?=
 =?utf-8?B?OGJPWWM4cE9wWmx2N0RFNU1YaGphZGZWOVhGQmk4TDFZN1J3enhxREMwcW04?=
 =?utf-8?B?MmNPeC9kdU1uRjA5NHVPT0lmLzZwc0taUG03WEFSS1I2Qkc0TmlmY2FWL3Zs?=
 =?utf-8?B?UU1xcmpmUHRZZyttR1c3Ulk3SlVNMCtPVGRTMVluc1llMGxIUzhQMXdmbDRS?=
 =?utf-8?B?REF0WDgrMjIzV3JuazIwYWo1cncrV3dSSDVweEYza3FHYWg5T0VHVncrV2R3?=
 =?utf-8?Q?rn0AAIuJ27zLtRoZFlTiinM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA0443BBE184CF4384AFCE3727E2FB68@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3055.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40294058-f330-4918-72c3-08da966cdefd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2022 16:19:16.7820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VCu83OCTrUjOyDc5o8/Ios620VNldRDG3luPsyxHDhiccGEhyVeFB90azcBnUK5mdmdMacVwOa8aZ6rq4tW9gF7J3Zwd75KCAOYxI/3YjK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVHVlLCAyMDIyLTA5LTA2IGF0IDEzOjUzICswNTMwLCBzaHJhdmFuIGt1bWFyIHdyb3RlOgo+
ID4gRnJvbTogU2hyYXZhbiBDaGlwcGEgPHNocmF2YW4uY2hpcHBhQG1pY3JvY2hpcC5jb20+Cj4g
PiAKPiA+IFNvbWUgcGxhdGZvcm1zIG1heSBub3QgYmUgY2FwYWJsZSBvZiBzdXBwb3J0aW5nIHRo
ZSBiYW5kd2lkdGgKPiA+IHJlcXVpcmVkIGZvciAxMiBiaXQgb3IgMzg0MHgyMTYwIHJlc29sdXRp
b25zLgo+ID4gCj4gPiBBZGQgc3VwcG9ydCBmb3IgZHluYW1pY2FsbHkgc2VsZWN0aW5nIDEwIGJp
dCBhbmQgMTkyMHgxMDgwCj4gPiByZXNvbHV0aW9ucyB3aGlsZSBsZWF2aW5nIHRoZSBleGlzdGlu
ZyBjb25maWd1cmF0aW9uIGFzIGRlZmF1bHQKPiA+IAo+ID4gQ0M6IENvbm9yIERvb2xleSA8Y29u
b3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQcmFrYXNoIEJhdHR1
IDxQcmFrYXNoLkJhdHR1QG1pY3JvY2hpcC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHJhdmFu
IENoaXBwYSA8c2hyYXZhbi5jaGlwcGFAbWljcm9jaGlwLmNvbT4KClRoYW5rcyBmb3IgdGhlIHBh
dGNoIQoKPiA+IC0tLQo+ID4gW1BBVENIIHYzXQo+ID4gRml4IGZvciB3YXJuaW5nIFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+IAo+ID4gW1BBVENIIHYy
XQo+ID4gRml4ZSBmb3IgYmlnIFJlcG9ydGVkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wb0BqbW9u
ZGkub3JnPgo+ID4gLWlteDMzNF9lbnVtX2ZyYW1lX3NpemUoKSBsb29wIGZ1bmN0aW9uCj4gPiAK
PiA+IENoYW5nZXMgU3VnZ2VzdGVkIGJ5OiBKYWNvcG8gTW9uZGkgPGphY29wb0BqbW9uZGkub3Jn
Pgo+ID4gLXJlbmFtZWQgYXJyYXkgY29kZXNbXSAtLT4gaW14MzM0X21idXNfY29kZXNbXQo+ID4g
LW1vZGlmaWVkIHN1cHBvcnRlZF9tb2Rlc1tdIHRvIGdldCBoaWdoZXIgcmVzb2x1dGlvbiBmaXJz
dAo+ID4gCj4gPiAtLS0KPiA+IMKgZHJpdmVycy9tZWRpYS9pMmMvaW14MzM0LmMgfCAzMDUgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwg
Mjc5IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZWRpYS9pMmMvaW14MzM0LmMgYi9kcml2ZXJzL21lZGlhL2kyYy9pbXgzMzQuYwo+
ID4gaW5kZXggMDYyMTI1NTAxNzg4Li45MjBkNDA3YWFhMmQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL21lZGlhL2kyYy9pbXgzMzQuYwo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvaW14MzM0
LmMKPiA+IEBAIC03OSw3ICs3OSw2IEBAIHN0cnVjdCBpbXgzMzRfcmVnX2xpc3Qgewo+ID4gwqAg
KiBzdHJ1Y3QgaW14MzM0X21vZGUgLSBpbXgzMzQgc2Vuc29yIG1vZGUgc3RydWN0dXJlCj4gPiDC
oCAqIEB3aWR0aDogRnJhbWUgd2lkdGgKPiA+IMKgICogQGhlaWdodDogRnJhbWUgaGVpZ2h0Cj4g
PiAtICogQGNvZGU6IEZvcm1hdCBjb2RlCj4gPiDCoCAqIEBoYmxhbms6IEhvcml6b250YWwgYmxh
bmtpbmcgaW4gbGluZXMKPiA+IMKgICogQHZibGFuazogVmVydGljYWwgYmxhbmtpbmcgaW4gbGlu
ZXMKPiA+IMKgICogQHZibGFua19taW46IE1pbmltYWwgdmVydGljYWwgYmxhbmtpbmcgaW4gbGlu
ZXMKPiA+IEBAIC05MSw3ICs5MCw2IEBAIHN0cnVjdCBpbXgzMzRfcmVnX2xpc3Qgewo+ID4gwqBz
dHJ1Y3QgaW14MzM0X21vZGUgewo+ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiB3aWR0aDsKPiA+IMKg
wqDCoMKgwqDCoMKgwqB1MzIgaGVpZ2h0Owo+ID4gLcKgwqDCoMKgwqDCoMKgdTMyIGNvZGU7Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgdTMyIGhibGFuazsKPiA+IMKgwqDCoMKgwqDCoMKgwqB1MzIgdmJs
YW5rOwo+ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiB2YmxhbmtfbWluOwo+ID4gQEAgLTExOSw2ICsx
MTcsNyBAQCBzdHJ1Y3QgaW14MzM0X21vZGUgewo+ID4gwqAgKiBAdmJsYW5rOiBWZXJ0aWNhbCBi
bGFua2luZyBpbiBsaW5lcwo+ID4gwqAgKiBAY3VyX21vZGU6IFBvaW50ZXIgdG8gY3VycmVudCBz
ZWxlY3RlZCBzZW5zb3IgbW9kZQo+ID4gwqAgKiBAbXV0ZXg6IE11dGV4IGZvciBzZXJpYWxpemlu
ZyBzZW5zb3IgY29udHJvbHMKPiA+ICsgKiBAY3VyX2NvZGU6IGN1cnJlbnQgc2VsZWN0ZWQgZm9y
bWF0IGNvZGUKPiA+IMKgICogQHN0cmVhbWluZzogRmxhZyBpbmRpY2F0aW5nIHN0cmVhbWluZyBz
dGF0ZQo+ID4gwqAgKi8KPiA+IMKgc3RydWN0IGlteDMzNCB7Cj4gPiBAQCAtMTQwLDYgKzEzOSw3
IEBAIHN0cnVjdCBpbXgzMzQgewo+ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiB2Ymxhbms7Cj4gPiDC
oMKgwqDCoMKgwqDCoMKgY29uc3Qgc3RydWN0IGlteDMzNF9tb2RlICpjdXJfbW9kZTsKPiA+IMKg
wqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbXV0ZXggbXV0ZXg7Cj4gPiArwqDCoMKgwqDCoMKgwqB1MzIg
Y3VyX2NvZGU7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBzdHJlYW1pbmc7Cj4gPiDCoH07Cj4g
PiDCoAo+ID4gQEAgLTE0Nyw2ICsxNDcsMTY5IEBAIHN0YXRpYyBjb25zdCBzNjQgbGlua19mcmVx
W10gPSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgSU1YMzM0X0xJTktfRlJFUSwKPiA+IMKgfTsKPiA+
IMKgCj4gPiArLyogU2Vuc29yIG1vZGUgcmVnaXN0ZXJzICovCj4gPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBpbXgzMzRfcmVnIG1vZGVfMTkyMHgxMDgwX3JlZ3NbXSA9IHsKPiA+ICvCoMKgwqDCoMKg
wqDCoHsweDMwMDAsIDB4MDF9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzAxOCwgMHgwNH0sCj4g
PiArwqDCoMKgwqDCoMKgwqB7MHgzMDMwLCAweENBfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMw
MzEsIDB4MDh9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzAzMiwgMHgwMH0sCj4gPiArwqDCoMKg
wqDCoMKgwqB7MHgzMDM0LCAweDRDfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMwMzUsIDB4MDR9
LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzAyQywgMHhGMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7
MHgzMDJELCAweDAzfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMwMkUsIDB4ODB9LAo+ID4gK8Kg
wqDCoMKgwqDCoMKgezB4MzAyRiwgMHgwN30sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMDc0LCAw
eENDfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMwNzUsIDB4MDJ9LAo+ID4gK8KgwqDCoMKgwqDC
oMKgezB4MzA4RSwgMHhDRH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMDhGLCAweDAyfSwKPiA+
ICvCoMKgwqDCoMKgwqDCoHsweDMwNzYsIDB4Mzh9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzA3
NywgMHgwNH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMDkwLCAweDM4fSwKPiA+ICvCoMKgwqDC
oMKgwqDCoHsweDMwOTEsIDB4MDR9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzMwOCwgMHgzOH0s
Cj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMzA5LCAweDA0fSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsw
eDMwQzYsIDB4MDB9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzBDNywgMHgwMH0sCj4gPiArwqDC
oMKgwqDCoMKgwqB7MHgzMENFLCAweDAwfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMwQ0YsIDB4
MDB9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzBEOCwgMHgxOH0sCj4gPiArwqDCoMKgwqDCoMKg
wqB7MHgzMEQ5LCAweDBBfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMwNEMsIDB4MDB9LAo+ID4g
K8KgwqDCoMKgwqDCoMKgezB4MzA0RSwgMHgwMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMDRG
LCAweDAwfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMwNTAsIDB4MDB9LAo+ID4gK8KgwqDCoMKg
wqDCoMKgezB4MzBCNiwgMHgwMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMEI3LCAweDAwfSwK
PiA+ICvCoMKgwqDCoMKgwqDCoHsweDMxMTYsIDB4MDh9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4
MzExNywgMHgwMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMUEwLCAweDIwfSwKPiA+ICvCoMKg
wqDCoMKgwqDCoHsweDMxQTEsIDB4MEZ9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzAwQywgMHgz
Qn0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMDBELCAweDI5fSwKPiA+ICvCoMKgwqDCoMKgwqDC
oHsweDMxNEMsIDB4Mjl9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzE0RCwgMHgwMX0sCj4gPiAr
wqDCoMKgwqDCoMKgwqB7MHgzMTVBLCAweDBBfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMxNjgs
IDB4QTB9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzE2QSwgMHg3RX0sCj4gPiArwqDCoMKgwqDC
oMKgwqB7MHgzMTlFLCAweDAyfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMxOTksIDB4MDB9LAo+
ID4gK8KgwqDCoMKgwqDCoMKgezB4MzE5RCwgMHgwMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgz
MURELCAweDAzfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMzMDAsIDB4MDB9LAo+ID4gK8KgwqDC
oMKgwqDCoMKgezB4MzQxQywgMHhGRn0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNDFELCAweDAx
fSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDNBMDEsIDB4MDN9LAo+ID4gK8KgwqDCoMKgwqDCoMKg
ezB4M0ExOCwgMHg3Rn0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzQTE5LCAweDAwfSwKPiA+ICvC
oMKgwqDCoMKgwqDCoHsweDNBMUEsIDB4Mzd9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4M0ExQiwg
MHgwMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzQTFDLCAweDM3fSwKPiA+ICvCoMKgwqDCoMKg
wqDCoHsweDNBMUQsIDB4MDB9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4M0ExRSwgMHhGN30sCj4g
PiArwqDCoMKgwqDCoMKgwqB7MHgzQTFGLCAweDAwfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDNB
MjAsIDB4M0Z9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4M0EyMSwgMHgwMH0sCj4gPiArwqDCoMKg
wqDCoMKgwqB7MHgzQTIwLCAweDZGfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDNBMjEsIDB4MDB9
LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4M0EyMCwgMHgzRn0sCj4gPiArwqDCoMKgwqDCoMKgwqB7
MHgzQTIxLCAweDAwfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDNBMjAsIDB4NUZ9LAo+ID4gK8Kg
wqDCoMKgwqDCoMKgezB4M0EyMSwgMHgwMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzQTIwLCAw
eDJGfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDNBMjEsIDB4MDB9LAo+ID4gK8KgwqDCoMKgwqDC
oMKgezB4MzA3OCwgMHgwMn0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMDc5LCAweDAwfSwKPiA+
ICvCoMKgwqDCoMKgwqDCoHsweDMwN0EsIDB4MDB9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzA3
QiwgMHgwMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMDgwLCAweDAyfSwKPiA+ICvCoMKgwqDC
oMKgwqDCoHsweDMwODEsIDB4MDB9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzA4MiwgMHgwMH0s
Cj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMDgzLCAweDAwfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsw
eDMwODgsIDB4MDJ9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzA5NCwgMHgwMH0sCj4gPiArwqDC
oMKgwqDCoMKgwqB7MHgzMDk1LCAweDAwfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMwOTYsIDB4
MDB9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzA5QiwgMHgwMn0sCj4gPiArwqDCoMKgwqDCoMKg
wqB7MHgzMDlDLCAweDAwfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMwOUQsIDB4MDB9LAo+ID4g
K8KgwqDCoMKgwqDCoMKgezB4MzA5RSwgMHgwMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMEE0
LCAweDAwfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMwQTUsIDB4MDB9LAo+ID4gK8KgwqDCoMKg
wqDCoMKgezB4MzI4OCwgMHgyMX0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMjhBLCAweDAyfSwK
PiA+ICvCoMKgwqDCoMKgwqDCoHsweDM0MTQsIDB4MDV9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4
MzQxNiwgMHgxOH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNUFDLCAweDBFfSwKPiA+ICvCoMKg
wqDCoMKgwqDCoHsweDM2NDgsIDB4MDF9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzY0QSwgMHgw
NH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNjRDLCAweDA0fSwKPiA+ICvCoMKgwqDCoMKgwqDC
oHsweDM2NzgsIDB4MDF9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzY3QywgMHgzMX0sCj4gPiAr
wqDCoMKgwqDCoMKgwqB7MHgzNjdFLCAweDMxfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDM3MDgs
IDB4MDJ9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzcxNCwgMHgwMX0sCj4gPiArwqDCoMKgwqDC
oMKgwqB7MHgzNzE1LCAweDAyfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDM3MTYsIDB4MDJ9LAo+
ID4gK8KgwqDCoMKgwqDCoMKgezB4MzcxNywgMHgwMn0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgz
NzFDLCAweDNEfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDM3MUQsIDB4M0Z9LAo+ID4gK8KgwqDC
oMKgwqDCoMKgezB4MzcyQywgMHgwMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNzJELCAweDAw
fSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDM3MkUsIDB4NDZ9LAo+ID4gK8KgwqDCoMKgwqDCoMKg
ezB4MzcyRiwgMHgwMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNzMwLCAweDg5fSwKPiA+ICvC
oMKgwqDCoMKgwqDCoHsweDM3MzEsIDB4MDB9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzczMiwg
MHgwOH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNzMzLCAweDAxfSwKPiA+ICvCoMKgwqDCoMKg
wqDCoHsweDM3MzQsIDB4RkV9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzczNSwgMHgwNX0sCj4g
PiArwqDCoMKgwqDCoMKgwqB7MHgzNzVELCAweDAwfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDM3
NUUsIDB4MDB9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4Mzc1RiwgMHg2MX0sCj4gPiArwqDCoMKg
wqDCoMKgwqB7MHgzNzYwLCAweDA2fSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDM3NjgsIDB4MUJ9
LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4Mzc2OSwgMHgxQn0sCj4gPiArwqDCoMKgwqDCoMKgwqB7
MHgzNzZBLCAweDFBfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDM3NkIsIDB4MTl9LAo+ID4gK8Kg
wqDCoMKgwqDCoMKgezB4Mzc2QywgMHgxOH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNzZELCAw
eDE0fSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDM3NkUsIDB4MEZ9LAo+ID4gK8KgwqDCoMKgwqDC
oMKgezB4Mzc3NiwgMHgwMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNzc3LCAweDAwfSwKPiA+
ICvCoMKgwqDCoMKgwqDCoHsweDM3NzgsIDB4NDZ9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4Mzc3
OSwgMHgwMH0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNzdBLCAweDA4fSwKPiA+ICvCoMKgwqDC
oMKgwqDCoHsweDM3N0IsIDB4MDF9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4Mzc3QywgMHg0NX0s
Cj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNzdELCAweDAxfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsw
eDM3N0UsIDB4MjN9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4Mzc3RiwgMHgwMn0sCj4gPiArwqDC
oMKgwqDCoMKgwqB7MHgzNzgwLCAweEQ5fSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDM3ODEsIDB4
MDN9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4Mzc4MiwgMHhGNX0sCj4gPiArwqDCoMKgwqDCoMKg
wqB7MHgzNzgzLCAweDA2fSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDM3ODQsIDB4QTV9LAo+ID4g
K8KgwqDCoMKgwqDCoMKgezB4Mzc4OCwgMHgwRn0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNzhB
LCAweEQ5fSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDM3OEIsIDB4MDN9LAo+ID4gK8KgwqDCoMKg
wqDCoMKgezB4Mzc4QywgMHhFQn0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNzhELCAweDA1fSwK
PiA+ICvCoMKgwqDCoMKgwqDCoHsweDM3OEUsIDB4ODd9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4
Mzc4RiwgMHgwNn0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNzkwLCAweEY1fSwKPiA+ICvCoMKg
wqDCoMKgwqDCoHsweDM3OTIsIDB4NDN9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4Mzc5NCwgMHg3
QX0sCj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzNzk2LCAweEExfSwKPiA+ICvCoMKgwqDCoMKgwqDC
oHsweDM3QjAsIDB4Mzd9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4M0UwNCwgMHgwRX0sCj4gPiAr
wqDCoMKgwqDCoMKgwqB7MHgzMEU4LCAweDUwfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDMwRTks
IDB4MDB9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4M0UwNCwgMHgwRX0sCj4gPiArwqDCoMKgwqDC
oMKgwqB7MHgzMDAyLCAweDAwfSwKPiA+ICt9Owo+ID4gKwo+ID4gwqAvKiBTZW5zb3IgbW9kZSBy
ZWdpc3RlcnMgKi8KPiA+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBpbXgzMzRfcmVnIG1vZGVfMzg0
MHgyMTYwX3JlZ3NbXSA9IHsKPiA+IMKgwqDCoMKgwqDCoMKgwqB7MHgzMDAwLCAweDAxfSwKPiA+
IEBAIC0yNDMsMjAgKzQwNiw1NiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlteDMzNF9yZWcgbW9k
ZV8zODQweDIxNjBfcmVnc1tdID0gewo+ID4gwqDCoMKgwqDCoMKgwqDCoHsweDNhMDAsIDB4MDF9
LAo+ID4gwqB9Owo+ID4gwqAKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGlteDMzNF9yZWcgcmF3
MTBfZnJhbWVmbXRfcmVnc1tdID0gewo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzA1MCwgMHgwMH0s
Cj4gPiArwqDCoMKgwqDCoMKgwqB7MHgzMTlELCAweDAwfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsw
eDM0MUMsIDB4RkZ9LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzQxRCwgMHgwMX0sCj4gPiArfTsK
PiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGlteDMzNF9yZWcgcmF3MTJfZnJhbWVmbXRf
cmVnc1tdID0gewo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzA1MCwgMHgwMX0sCj4gPiArwqDCoMKg
wqDCoMKgwqB7MHgzMTlELCAweDAxfSwKPiA+ICvCoMKgwqDCoMKgwqDCoHsweDM0MUMsIDB4NDd9
LAo+ID4gK8KgwqDCoMKgwqDCoMKgezB4MzQxRCwgMHgwMH0sCj4gPiArfTsKPiA+ICsKPiA+ICsv
Kgo+ID4gKyAqIFRoZSBzdXBwb3J0ZWQgQlVTIGZvcm1hdHMuCj4gPiArICovCj4gPiArc3RhdGlj
IGNvbnN0IHUzMiBpbXgzMzRfbWJ1c19jb2Rlc1tdID0gewo+ID4gK8KgwqDCoMKgwqDCoMKgTUVE
SUFfQlVTX0ZNVF9TUkdHQjEwXzFYMTAsCj4gPiArwqDCoMKgwqDCoMKgwqBNRURJQV9CVVNfRk1U
X1NSR0dCMTJfMVgxMiwKPiA+ICt9Owo+ID4gKwo+ID4gwqAvKiBTdXBwb3J0ZWQgc2Vuc29yIG1v
ZGUgY29uZmlndXJhdGlvbnMgKi8KPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGlteDMzNF9tb2Rl
IHN1cHBvcnRlZF9tb2RlID0gewo+ID4gLcKgwqDCoMKgwqDCoMKgLndpZHRoID0gMzg0MCwKPiA+
IC3CoMKgwqDCoMKgwqDCoC5oZWlnaHQgPSAyMTYwLAo+ID4gLcKgwqDCoMKgwqDCoMKgLmhibGFu
ayA9IDU2MCwKPiA+IC3CoMKgwqDCoMKgwqDCoC52YmxhbmsgPSAyMzQwLAo+ID4gLcKgwqDCoMKg
wqDCoMKgLnZibGFua19taW4gPSA5MCwKPiA+IC3CoMKgwqDCoMKgwqDCoC52YmxhbmtfbWF4ID0g
MTMyODQwLAo+ID4gLcKgwqDCoMKgwqDCoMKgLnBjbGsgPSA1OTQwMDAwMDAsCj4gPiAtwqDCoMKg
wqDCoMKgwqAubGlua19mcmVxX2lkeCA9IDAsCj4gPiAtwqDCoMKgwqDCoMKgwqAuY29kZSA9IE1F
RElBX0JVU19GTVRfU1JHR0IxMl8xWDEyLAo+ID4gLcKgwqDCoMKgwqDCoMKgLnJlZ19saXN0ID0g
ewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5udW1fb2ZfcmVncyA9IEFSUkFZ
X1NJWkUobW9kZV8zODQweDIxNjBfcmVncyksCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgLnJlZ3MgPSBtb2RlXzM4NDB4MjE2MF9yZWdzLAo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgaW14MzM0X21vZGUgc3VwcG9ydGVkX21vZGVzW10gPSB7Cj4gPiArwqDCoMKgwqDCoMKgwqB7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLndpZHRoID0gMzg0MCwKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuaGVpZ2h0ID0gMjE2MCwKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuaGJsYW5rID0gNTYwLAo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoC52YmxhbmsgPSAyMzQwLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoC52YmxhbmtfbWluID0gOTAsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgLnZibGFua19tYXggPSAxMzI4NDAsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgLnBjbGsgPSA1OTQwMDAwMDAsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgLmxpbmtfZnJlcV9pZHggPSAwLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oC5yZWdfbGlzdCA9IHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgLm51bV9vZl9yZWdzID0gQVJSQVlfU0laRShtb2RlXzM4NDB4MjE2MF9yZWdzKSwK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnJlZ3Mg
PSBtb2RlXzM4NDB4MjE2MF9yZWdzLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oH0sCj4gPiArwqDCoMKgwqDCoMKgwqB9LCB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgLndpZHRoID0gMTkyMCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAu
aGVpZ2h0ID0gMTA4MCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuaGJsYW5r
ID0gNTYwLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC52YmxhbmsgPSAxMTcw
LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC52YmxhbmtfbWluID0gOTAsCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnZibGFua19tYXggPSAxMzI4NDAsCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnBjbGsgPSA1OTQwMDAwMDAsCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmxpbmtfZnJlcV9pZHggPSAwLAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5yZWdfbGlzdCA9IHsKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLm51bV9vZl9yZWdzID0gQVJSQVlf
U0laRShtb2RlXzE5MjB4MTA4MF9yZWdzKSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgLnJlZ3MgPSBtb2RlXzE5MjB4MTA4MF9yZWdzLAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0sCj4gPiDCoMKgwqDCoMKgwqDCoMKgfSwKPiA+
IMKgfTsKPiA+IMKgCj4gPiBAQCAtNTA2LDEwICs3MDUsMTAgQEAgc3RhdGljIGludCBpbXgzMzRf
ZW51bV9tYnVzX2NvZGUoc3RydWN0IHY0bDJfc3ViZGV2ICpzZCwKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IHY0bDJfc3ViZGV2X3N0YXRlICpzZF9zdGF0ZSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHY0bDJfc3Vi
ZGV2X21idXNfY29kZV9lbnVtICpjb2RlKQo+ID4gwqB7Cj4gPiAtwqDCoMKgwqDCoMKgwqBpZiAo
Y29kZS0+aW5kZXggPiAwKQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGNvZGUtPmluZGV4ID49IEFS
UkFZX1NJWkUoaW14MzM0X21idXNfY29kZXMpKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gLUVJTlZBTDsKPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqBjb2RlLT5j
b2RlID0gc3VwcG9ydGVkX21vZGUuY29kZTsKPiA+ICvCoMKgwqDCoMKgwqDCoGNvZGUtPmNvZGUg
PSBpbXgzMzRfbWJ1c19jb2Rlc1tjb2RlLT5pbmRleF07Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKg
wqDCoHJldHVybiAwOwo+ID4gwqB9Cj4gPiBAQCAtNTI2LDE1ICs3MjUsMjIgQEAgc3RhdGljIGlu
dCBpbXgzMzRfZW51bV9mcmFtZV9zaXplKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IHY0bDJfc3ViZGV2X3N0YXRlICpzZF9zdGF0ZSwKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgdjRsMl9zdWJkZXZfZnJhbWVfc2l6ZV9lbnVtICpmc2l6ZSkKPiA+IMKgewo+ID4gLcKg
wqDCoMKgwqDCoMKgaWYgKGZzaXplLT5pbmRleCA+IDApCj4gPiArwqDCoMKgwqDCoMKgwqB1bnNp
Z25lZCBpbnQgaTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChmc2l6ZS0+aW5kZXggPj0g
QVJSQVlfU0laRShzdXBwb3J0ZWRfbW9kZXMpKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gLUVJTlZBTDsKPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoZnNp
emUtPmNvZGUgIT0gc3VwcG9ydGVkX21vZGUuY29kZSkKPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAo
aSA9IDA7IGkgPCBBUlJBWV9TSVpFKGlteDMzNF9tYnVzX2NvZGVzKTsgKytpKSB7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGlteDMzNF9tYnVzX2NvZGVzW2ldID09IGZz
aXplLT5jb2RlKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBicmVhazsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDC
oGlmIChpID09IEFSUkFZX1NJWkUoaW14MzM0X21idXNfY29kZXMpKQo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVJTlZBTDsKPiA+IMKgCj4gPiAtwqDCoMKgwqDC
oMKgwqBmc2l6ZS0+bWluX3dpZHRoID0gc3VwcG9ydGVkX21vZGUud2lkdGg7Cj4gPiArwqDCoMKg
wqDCoMKgwqBmc2l6ZS0+bWluX3dpZHRoID0gc3VwcG9ydGVkX21vZGVzW2ZzaXplLT5pbmRleF0u
d2lkdGg7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgZnNpemUtPm1heF93aWR0aCA9IGZzaXplLT5taW5f
d2lkdGg7Cj4gPiAtwqDCoMKgwqDCoMKgwqBmc2l6ZS0+bWluX2hlaWdodCA9IHN1cHBvcnRlZF9t
b2RlLmhlaWdodDsKPiA+ICvCoMKgwqDCoMKgwqDCoGZzaXplLT5taW5faGVpZ2h0ID0gc3VwcG9y
dGVkX21vZGVzW2ZzaXplLT5pbmRleF0uaGVpZ2h0Owo+ID4gwqDCoMKgwqDCoMKgwqDCoGZzaXpl
LT5tYXhfaGVpZ2h0ID0gZnNpemUtPm1pbl9oZWlnaHQ7Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKg
wqDCoHJldHVybiAwOwo+ID4gQEAgLTU1Myw3ICs3NTksNyBAQCBzdGF0aWMgdm9pZCBpbXgzMzRf
ZmlsbF9wYWRfZm9ybWF0KHN0cnVjdCBpbXgzMzQgKmlteDMzNCwKPiA+IMKgewo+ID4gwqDCoMKg
wqDCoMKgwqDCoGZtdC0+Zm9ybWF0LndpZHRoID0gbW9kZS0+d2lkdGg7Cj4gPiDCoMKgwqDCoMKg
wqDCoMKgZm10LT5mb3JtYXQuaGVpZ2h0ID0gbW9kZS0+aGVpZ2h0Owo+ID4gLcKgwqDCoMKgwqDC
oMKgZm10LT5mb3JtYXQuY29kZSA9IG1vZGUtPmNvZGU7Cj4gPiArwqDCoMKgwqDCoMKgwqBmbXQt
PmZvcm1hdC5jb2RlID0gaW14MzM0LT5jdXJfY29kZTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBmbXQt
PmZvcm1hdC5maWVsZCA9IFY0TDJfRklFTERfTk9ORTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBmbXQt
PmZvcm1hdC5jb2xvcnNwYWNlID0gVjRMMl9DT0xPUlNQQUNFX1JBVzsKPiA+IMKgwqDCoMKgwqDC
oMKgwqBmbXQtPmZvcm1hdC55Y2Jjcl9lbmMgPSBWNEwyX1lDQkNSX0VOQ19ERUZBVUxUOwo+ID4g
QEAgLTU5MSw2ICs3OTcsMjEgQEAgc3RhdGljIGludCBpbXgzMzRfZ2V0X3BhZF9mb3JtYXQoc3Ry
dWN0IHY0bDJfc3ViZGV2ICpzZCwKPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiA+IMKg
fQo+ID4gwqAKPiA+ICtzdGF0aWMgaW50IGlteDMzNF9nZXRfZm9ybWF0X2NvZGUoc3RydWN0IGlt
eDMzNCAqaW14MzM0LCBzdHJ1Y3QgdjRsMl9zdWJkZXZfZm9ybWF0ICpmbXQpCj4gPiArewo+ID4g
K8KgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50IGk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBm
b3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShpbXgzMzRfbWJ1c19jb2Rlcyk7IGkrKykgewo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChpbXgzMzRfbWJ1c19jb2Rlc1tpXSA9
PSBmbXQtPmZvcm1hdC5jb2RlKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBicmVhazsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+ICvCoMKg
wqDCoMKgwqDCoGlmIChpID49IEFSUkFZX1NJWkUoaW14MzM0X21idXNfY29kZXMpKQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGkgPSAwOwoKSWYgSSB1bmRlcnN0YW5kIHRoZSB1
bHRpbWF0ZSBlZmZlY3Qgb2YgdGhpcyBjb2RlIGNvcnJlY3RseSwgd2UgZmFsbGJhY2sKdG8gTUVE
SUFfQlVTX0ZNVF9TUkdHQjEwXzFYMTAgaWYgdGhlIHNwZWNpZmllZCBmb3JtYXQgY29kZSBpcyBu
b3QKc3VwcG9ydGVkLCB3aGlsZSBiZWZvcmUgdGhpcyBjaGFuZ2Ugd2Ugd2VyZSBhbHdheXMgdXNp
bmcKTUVESUFfQlVTX0ZNVF9TUkdHQjEwXzFYMTIuCgpJcyB0aGlzIGludGVuZGVkPyBXb3VsZCBp
dCBiZSBiZXR0ZXIgdG8gbGVhdmUgdGhlIHNhbWUgYmVoYXZpb3IgYXMgdGhlCmN1cnJlbnQgZHJp
dmVyPwoKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBpbXgzMzRfbWJ1c19jb2Rlc1tp
XTsKPiA+ICt9Cj4gPiArCj4gPiDCoC8qKgo+ID4gwqAgKiBpbXgzMzRfc2V0X3BhZF9mb3JtYXQo
KSAtIFNldCBzdWJkZXZpY2UgcGFkIGZvcm1hdAo+ID4gwqAgKiBAc2Q6IHBvaW50ZXIgdG8gaW14
MzM0IFY0TDIgc3ViLWRldmljZSBzdHJ1Y3R1cmUKPiA+IEBAIC02MDYsMTAgKzgyNywxOSBAQCBz
dGF0aWMgaW50IGlteDMzNF9zZXRfcGFkX2Zvcm1hdChzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLAo+
ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbXgzMzQgKmlteDMzNCA9IHRvX2lteDMzNChzZCk7
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgY29uc3Qgc3RydWN0IGlteDMzNF9tb2RlICptb2RlOwo+ID4g
wqDCoMKgwqDCoMKgwqDCoGludCByZXQgPSAwOwo+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIGNvZGU7
Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2soJmlteDMzNC0+bXV0ZXgpOwo+
ID4gwqAKPiA+IC3CoMKgwqDCoMKgwqDCoG1vZGUgPSAmc3VwcG9ydGVkX21vZGU7Cj4gPiArwqDC
oMKgwqDCoMKgwqBjb2RlID0gaW14MzM0X2dldF9mb3JtYXRfY29kZShpbXgzMzQsIGZtdCk7Cgpu
aXRwaWNrOiB5b3UgcHJvYmFibHkgZG9uJ3QgbmVlZCB0aGUgJ2NvZGUnIHZhcmlhYmxlIGFuZCBj
YW4gc2ltcGx5IGRvOgoKICAgaW14MzM0LT5jdXJfY29kZSA9IGlteDMzNF9nZXRfZm9ybWF0X2Nv
ZGUoaW14MzM0LCBmbXQpOwoKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGlteDMzNC0+Y3VyX2Nv
ZGUgPSBjb2RlOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgbW9kZSA9IHY0bDJfZmluZF9uZWFy
ZXN0X3NpemUoc3VwcG9ydGVkX21vZGVzLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBUlJBWV9TSVpF
KHN1cHBvcnRlZF9tb2RlcyksCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdpZHRoLCBoZWlnaHQsCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGZtdC0+Zm9ybWF0LndpZHRoLCBmbXQtPmZvcm1hdC5oZWlnaHQp
Owo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoGlteDMzNF9maWxsX3BhZF9mb3JtYXQoaW14MzM0
LCBtb2RlLCBmbXQpOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoZm10LT53aGljaCA9
PSBWNEwyX1NVQkRFVl9GT1JNQVRfVFJZKSB7Cj4gPiBAQCAtNjE3LDcgKzg0Nyw3IEBAIHN0YXRp
YyBpbnQgaW14MzM0X3NldF9wYWRfZm9ybWF0KHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsCj4gPiDC
oAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmcmFtZWZtdCA9IHY0bDJfc3Vi
ZGV2X2dldF90cnlfZm9ybWF0KHNkLCBzZF9zdGF0ZSwgZm10LT5wYWQpOwo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqZnJhbWVmbXQgPSBmbXQtPmZvcm1hdDsKPiA+IC3CoMKg
wqDCoMKgwqDCoH0gZWxzZSB7Cj4gPiArwqDCoMKgwqDCoMKgwqB9IGVsc2UgaWYgKGlteDMzNC0+
Y3VyX21vZGUgIT0gbW9kZSkgewoKVGhpcyBzZWNvbmQgJ2lmJyBpcyBub3QgdXNlZCBpbiBhbnkg
b3RoZXIgZHJpdmVyLiBJcyB0aGlzIHNvbWUga2luZCBvZgpvcHRpbWl6YXRpb24/CgpJZiB0aGlz
IGZ1bmN0aW9uIGlzIGNhbGxlZCBhZnRlciBwcm9iZSgpIGFuZCBpbXgzMzQtPmN1cl9tb2RlID09
IG1vZGUsCkkgdGhpbmsgdGhhdCBpbXgzMzRfdXBkYXRlX2NvbnRyb2xzKCkgd2lsbCBub3QgYmUg
Y2FsbGVkIGZvciB0aGUKc3BlY2lmaWVkIG1vZGUuIEknbSBub3Qgc3VyZSBpZiB0aGF0J3MgT0sg
b3Igbm90LgoKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gaW14MzM0
X3VwZGF0ZV9jb250cm9scyhpbXgzMzQsIG1vZGUpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAoIXJldCkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGlteDMzNC0+Y3VyX21vZGUgPSBtb2RlOwo+ID4gQEAgLTY0MiwxMSAr
ODcyLDI2IEBAIHN0YXRpYyBpbnQgaW14MzM0X2luaXRfcGFkX2NmZyhzdHJ1Y3QgdjRsMl9zdWJk
ZXYgKnNkLAo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB2NGwyX3N1YmRldl9mb3JtYXQgZm10
ID0geyAwIH07Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoGZtdC53aGljaCA9IHNkX3N0YXRl
ID8gVjRMMl9TVUJERVZfRk9STUFUX1RSWSA6IFY0TDJfU1VCREVWX0ZPUk1BVF9BQ1RJVkU7Cj4g
PiAtwqDCoMKgwqDCoMKgwqBpbXgzMzRfZmlsbF9wYWRfZm9ybWF0KGlteDMzNCwgJnN1cHBvcnRl
ZF9tb2RlLCAmZm10KTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlteDMzNF9maWxsX3BhZF9mb3JtYXQo
aW14MzM0LCAmc3VwcG9ydGVkX21vZGVzWzFdLCAmZm10KTsKClRoZSBuZXdseSBhZGRlZCBtb2Rl
IGlzIG5vdyB1c2VkIGJ5IHRoaXMgZnVuY3Rpb24gaW5zdGVhZCBvZiB0aGUgb2xkCm9uZS4gTm90
IHN1cmUgaWYgdGhpcyBpcyBpbnRlbmRlZCBvciBub3QuCgo+ID4gwqAKPiA+IMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gaW14MzM0X3NldF9wYWRfZm9ybWF0KHNkLCBzZF9zdGF0ZSwgJmZtdCk7Cj4g
PiDCoH0KPiA+IMKgCj4gPiArc3RhdGljIGludCBpbXgzMzRfc2V0X2ZyYW1lZm10KHN0cnVjdCBp
bXgzMzQgKmlteDMzNCkKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqBzd2l0Y2ggKGlteDMzNC0+
Y3VyX2NvZGUpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgTUVESUFfQlVTX0ZNVF9TUkdHQjEw
XzFYMTA6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGlteDMzNF93
cml0ZV9yZWdzKGlteDMzNCwgcmF3MTBfZnJhbWVmbXRfcmVncywKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBBUlJBWV9TSVpFKHJhdzEwX2ZyYW1lZm10X3JlZ3MpKTsKPiA+ICsKPiA+ICvCoMKg
wqDCoMKgwqDCoGNhc2UgTUVESUFfQlVTX0ZNVF9TUkdHQjEyXzFYMTI6Cj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGlteDMzNF93cml0ZV9yZWdzKGlteDMzNCwgcmF3
MTJfZnJhbWVmbXRfcmVncywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBBUlJBWV9TSVpFKHJh
dzEyX2ZyYW1lZm10X3JlZ3MpKTsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiA+ICvCoMKg
wqDCoMKgwqDCoHJldHVybiAtRUlOVkFMOwo+ID4gK30KPiA+ICsKPiA+IMKgLyoqCj4gPiDCoCAq
IGlteDMzNF9zdGFydF9zdHJlYW1pbmcoKSAtIFN0YXJ0IHNlbnNvciBzdHJlYW0KPiA+IMKgICog
QGlteDMzNDogcG9pbnRlciB0byBpbXgzMzQgZGV2aWNlCj4gPiBAQCAtNjY3LDYgKzkxMiwxMyBA
QCBzdGF0aWMgaW50IGlteDMzNF9zdGFydF9zdHJlYW1pbmcoc3RydWN0IGlteDMzNCAqaW14MzM0
KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+ID4gwqDC
oMKgwqDCoMKgwqDCoH0KPiA+IMKgCj4gPiArwqDCoMKgwqDCoMKgwqByZXQgPSBpbXgzMzRfc2V0
X2ZyYW1lZm10KGlteDMzNCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KSB7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2VycihpbXgzMzQtPmRldiwgIiVzIGZhaWxl
ZCB0byBzZXQgZnJhbWUgZm9ybWF0OiAlZFxuIiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX19mdW5jX18sIHJldCk7Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsK
PiA+IMKgwqDCoMKgwqDCoMKgwqAvKiBTZXR1cCBoYW5kbGVyIHdpbGwgd3JpdGUgYWN0dWFsIGV4
cG9zdXJlIGFuZCBnYWluICovCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID3CoCBfX3Y0bDJfY3Ry
bF9oYW5kbGVyX3NldHVwKGlteDMzNC0+c2QuY3RybF9oYW5kbGVyKTsKPiA+IMKgwqDCoMKgwqDC
oMKgwqBpZiAocmV0KSB7Cj4gPiBAQCAtMTAzNyw3ICsxMjg5LDggQEAgc3RhdGljIGludCBpbXgz
MzRfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiA+IMKgwqDCoMKgwqDCoMKgwqB9
Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoC8qIFNldCBkZWZhdWx0IG1vZGUgdG8gbWF4IHJl
c29sdXRpb24gKi8KPiA+IC3CoMKgwqDCoMKgwqDCoGlteDMzNC0+Y3VyX21vZGUgPSAmc3VwcG9y
dGVkX21vZGU7Cj4gPiArwqDCoMKgwqDCoMKgwqBpbXgzMzQtPmN1cl9tb2RlID0gJnN1cHBvcnRl
ZF9tb2Rlc1swXTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlteDMzNC0+Y3VyX2NvZGUgPSBpbXgzMzRf
bWJ1c19jb2Rlc1swXTsKCmlteDMzNF9tYnVzX2NvZGVzWzBdIGlzIE1FRElBX0JVU19GTVRfU1JH
R0IxMF8xWDEwLCB3aGljaCBtZWFucyB0aGF0CnRoZSBkZWZhdWx0IGNvbmZpZ3VyYXRpb24gd2ls
bCBzd2l0Y2ggZnJvbSAxMiBiaXRzIHRvIDEwIGJpdHMsIGRlc3BpdGUKdGhlIGNvbW1pdCBtZXNz
YWdlIHNheWluZyB0aGF0IHRoZSBkZWZhdWx0IGNvbmZpZ3VyYXRpb24gd2lsbCBzdGF5IHRoZQpz
YW1lLgoKPiA+IMKgwqDCoMKgwqDCoMKgwqBpbXgzMzQtPnZibGFuayA9IGlteDMzNC0+Y3VyX21v
ZGUtPnZibGFuazsKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gaW14MzM0X2luaXRf
Y29udHJvbHMoaW14MzM0KTsKCg==
