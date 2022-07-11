Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE82A570AFD
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 21:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbiGKTyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 15:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiGKTyW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 15:54:22 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB916413;
        Mon, 11 Jul 2022 12:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657569261; x=1689105261;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hGj/UVJnV1LQ4YeGPM8GzZx2HF+vUMD9n9FAyTAtipU=;
  b=ggj4S0SWJ5L+tR/vw44aAcJaw3bsO9bA8BRlvLgIqxuarcZ0BsAxgYEg
   Wmx/sDd91J+E9S/uWLL8ax73auvO49Tk4ffjEJHTHjF4XxshnDYfSOFsY
   uWgJmJhuyQrGCba32hJp/iYz2mY8U0wBCQwwUGc8xlG8CGP7JGm47rjDw
   JF0heH6oFZ39L4tqAsvYcFlqvQJENWdcRkmqP5eGCDTIWYj3zZEAdHxd8
   e9IrNtk8fTSE3Mvht6CIlGhGvUwiayL894o1uxNpFUdbdRRdV6RaSRQ/g
   aai7m6pwH6pdZqfhUx09gLf4BH8FZjnqbUvMQ/Wc53pfJo9kq6w77ow9T
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="267795185"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="267795185"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 12:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="622214541"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP; 11 Jul 2022 12:54:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 12:54:20 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 12:54:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Jul 2022 12:54:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Jul 2022 12:54:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avALXMeG96qPxkIgQpQvTkKXpZ9eDXiWagJUjYXsa3tNBZ47t0STY3Pj8EJvwoSmI2Lq43KbCOJxtWY386M3qb6qbjJO9aIqHWIcxsoOVZkBX5hOMG8GgntskjQgG6vcTmENp4kmqAQM7IVBMWoAFVZpZcoNxUeuFhOP+cTzUW+lwbNPNDlSLm3Soo3PKefv4ujiGXh+wBsq/Y0YerjZBpQosrZkYVxScrMyQNK/UtP0fD7kQR491qsCtZsJcZb0giB/OEs2u3bbg6TW5RFToSUXqpodEhMbhUBNwY4zgseBxrE0F1Yl7DJ7KSVtrOX0CPBuk0rzQKuRY9AvwLguHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGj/UVJnV1LQ4YeGPM8GzZx2HF+vUMD9n9FAyTAtipU=;
 b=TcZ2SZPh5KVpEOyf9OhWkE5YhIt2zyBjb4i6D7XwBFVh17I8iQfL+xG0zYCkPjCdOK7XG7P4b/CUzWpU18Q0p4WEA7XiNZfL/7R8WWHjc3WbLsQFAFic0iBZYxaj/mQxpPX2z28URrIR+6Icr9g53PlNnRG43oC1XRpePwfLFgAy4VQEe3gCCsMgltnQ/ks9EJfQDf0AAw7oGXDOkMykVdFiTbte2vIkdTOSONnwu6B3ItGdCbXP81iaK1XugtJ4yyHe23NYoU14BVd/RKt3Kv5gnWGpaQUp/PJdY4B17Z22SHiKBWG1522nd6OunXFuyLifF9ImJEKh8yXUUSFVGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 by BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Mon, 11 Jul
 2022 19:54:08 +0000
Received: from SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::dd4e:b4a9:f7ca:1b5b]) by SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::dd4e:b4a9:f7ca:1b5b%7]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 19:54:07 +0000
From:   "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>
To:     "Murphy, Paul J" <paul.j.murphy@intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 5/6] media: i2c: ov9282: Add regulator support
Thread-Topic: [PATCH 5/6] media: i2c: ov9282: Add regulator support
Thread-Index: AQHYlP6YoEYOWX4KyUiD6dSwfMY+wK15lfaA
Date:   Mon, 11 Jul 2022 19:54:07 +0000
Message-ID: <a52e4b5e6c83371b7ad41290566a632b87ebe34f.camel@intel.com>
References: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
         <20220711081639.150153-6-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220711081639.150153-6-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23d63283-b8c3-4cb1-b1e4-08da63771dd5
x-ms-traffictypediagnostic: BN6PR11MB3908:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r8meRPXUoBL0+7XfzqVbPKd6g1LIgfYtWth22QeXAPJBBuh0NCVKwaMQTRBzVhaqFsnqH7G2w+QHjLeOxIXzlPDNtpJXnWUuIdreqoHM8a2WiNEkeXImzcM4YSSGyqvBxExQlazGB3/62F1SEj2RJbVpSC9nPqzoHFHqSJYUhlHWRep6BSfEi9JuQgRbmvOfUT59lh/x/rSdjgr/rkfHwUwuEuHb4A6/PKbyxHyZLL49ymrMb1Zl1+bA5PZ279NePX1JN6a9KwhcHv54Os3Xl8UZXm7mvgWtURntrx3J52E7AsnVZ2k1p15JOexKpLd4WUUl0OgRtxSMp1Gmm7D1+qCMs1BpS4r8LOZQ5/79egOh5283F7WtaVLkV+pg17HEMsfdnAGA/Q6Zun24Ip5rCo13VsbYRWC/v+SiCoJY1SL7Upkyvdt6PBMBjlComUs5QyxSsqwJM6qz8C8yLiqkhnRNiVQ955thA/8hMfQmlLHp0MpGPsE82oLYPvkX+6bLCmmZpB6s1BgQG1zXuuZhkkPkeAPH9/TW6RI789K0I3Rjk3CqOJ39UsnAJKq5hza9eK4QNPDXI4RR5H2lSZUvX26Ccsoe5Ac/kRyEtgHDvqMkXHoxfwJhvF50cS/jQvqGuTBMYxJ7Mw25rj2HUUzMlwMEfPvznjgAaMAHy80RJoMhSs7yPaXNtppmfKlfUQ6xk1MFAioPiajYcSkuS9NCH7DtCHNFjSuL+HB2uHplc1DfV6tmN2TqkfpmRTBTGwaEZO0PUc4OQjlgvlrVhaHHt2NdMBtp9JivpPNFtHvrDTvA7nNaxgS3VQKj7ggRA0gW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3055.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(376002)(136003)(396003)(346002)(66946007)(4326008)(41300700001)(66446008)(66476007)(66556008)(8676002)(76116006)(91956017)(71200400001)(64756008)(110136005)(54906003)(6486002)(83380400001)(316002)(6506007)(2906002)(8936002)(5660300002)(478600001)(38070700005)(122000001)(82960400001)(86362001)(36756003)(38100700002)(6512007)(2616005)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3pGeEZKMjhIeEh1NkJEaWpIWTdsbEVtWExTODZBMVNxUE1zc1VJR1FoNE03?=
 =?utf-8?B?NmwzZkRzdVlCK0g2aHZTdWUyalR6QnhZZ09rbklHTEk1TU5mYzBWOTJ5K2Jr?=
 =?utf-8?B?NW9ZYnVGMS83V3hGQlVuak1TSUxhSjZUL3kvRjNSR2tJdWVIVjY2blZva1pk?=
 =?utf-8?B?RmFQdyt6bkxQay9xZkZPRWNVZzlCNHlBcnFKbnNxNHpYUTNCYzBxTGE1UWdT?=
 =?utf-8?B?WjJXU29YdWNSeWRBaEtFYTJmb21tdDFncGc2emw4QlhTbWdVdmFuNVlzTm93?=
 =?utf-8?B?TTcxNWZ5TUpIZnUwMVR0anlCQUpBRDNKUVBLT2hBMm83QUxuak50RzMrdnhW?=
 =?utf-8?B?cXV3cUtSWEp2VDZiM3NRVFZWeC9KTnkyaS8vb0tMdU92K1NpMkR3NTA4QjVK?=
 =?utf-8?B?ajdTSmxlTnZPb0JKY0pEbXhmbXpwY256MTdZL2p2SXNFcWFtblp3ZXRpU2li?=
 =?utf-8?B?RUVxVEhjNzZndlY5UEV2T3VTY1l3dzg4THY3UjRWWWdyNFAzNEc0RzBzNGpz?=
 =?utf-8?B?QzRWbTRLY0FFYmxyYkVpdnh3aGZuUFk0Qkdyb01LVElxa212MEhUZGM5RUwz?=
 =?utf-8?B?NWlKTzYzOTgzUTdoV3czNnJvajBMTmZKYVpCcHFMckxTNEx1Mk5xbjFuS0VY?=
 =?utf-8?B?SjZGZlVaaEIzcTh6QW5sNlN0VnJ1SDZ4aERPelc2b1FzL01iRUM1UEFzRDhp?=
 =?utf-8?B?TEdWTzZNeHIvQzU4U2dZV2lpVnhsZllkNDRpcFhXSCtzSjZmV2g3OXhVSzBO?=
 =?utf-8?B?dDFnYmtKNUNvaTZQWG9saUNKRzdITS84bVkvRkpVcUExMTl0Z20xdVoxOTRn?=
 =?utf-8?B?NFVSR1p6U0hvWndaTG1ldTlUMjZKNkdWRjVqU0w5Ykx6WFkvV2lWc3N5NDJl?=
 =?utf-8?B?MnlxMUR3aVI3VTFkdGpMUTByQkZ3cGxyMlQ5UDlSbDBRclFvTTM4ZnRMSTlv?=
 =?utf-8?B?WU8vRG5icnZiMlpmTklEUGZCc0t6YjN4U2J6MEFtdW1MM0luNWkrYlB1YWhl?=
 =?utf-8?B?YWNKUWhQTlFuUEovTjJlZWdVZmYvN1FRSVFMRE4vN3VGb09CYXFSVEVqZE8v?=
 =?utf-8?B?WjlPZ1JyL0NxVHVQN25QQ05OMHVEL1NaNW44NHRDMmh5Z0w0MjRFR3d6Z3FJ?=
 =?utf-8?B?bFRlZjdlVTJyUVJuT0E4c2JSMXpRS3AzOGlDeEVyc1RrVkZhSERIM3BINTNX?=
 =?utf-8?B?NE05bCtLNlN5S3JLOXNlOWI3TXlncExNQmdNSkp3MFRYUHJMcFNiUC9IT0RG?=
 =?utf-8?B?ZmwrT20vQWwwRzBvY3FFUTk4TUM4MmxrL2pSNmxMN0ZDQXV6L2NtRVNMK1FK?=
 =?utf-8?B?VTJHYUJRd0VOVFpER3ZjRFNmbGo4N2g5ZUlJNjBXUDJ3aEhLaTZwVTlsdzBX?=
 =?utf-8?B?VWd6TFJJN2lwRXViNXVjdGZoZFNCaTY5ZUxZRlhsWjR4RHcxczUxYmpRakdm?=
 =?utf-8?B?ZkFxSVlXbmtHMktodmhvVk8wZEl0VUdOaFBTQzhsZ3F0bExYc2M2TzhtRERh?=
 =?utf-8?B?ZHBBY2J6SlFBQStHcFZFbWVDeU5iOWs0Ui94ZHRacG1NYWl4UU8xTGRrbVdI?=
 =?utf-8?B?UExFSWZCQVVHdXRMK1ZNbjdIVDMvNDIyT2Jib1lTNHlxTHVVS2MrRVliMUVl?=
 =?utf-8?B?WEs4WVpITXgzK3A2VG5HWmg4MDVjZkxlZnlHWVVuVElwVGZrWFlmOEE2ZjBM?=
 =?utf-8?B?aXBMMk1jRHJFSWQxaFpnZHFiR3lreGs3dXNBSTNFaWs2Q0JiU2xYamV0cXNw?=
 =?utf-8?B?Tyt1TUw3SXR1SW8zQ0NEZmwyQUJQTSs1TktwTlQ0VEdXZTBsZFhUMTcrTWtr?=
 =?utf-8?B?ZWZiQmFLYVcvYldwK2RyNWYrazRxbEtiUU9zN1lIY09VSlllb3NhTjJhZ1B4?=
 =?utf-8?B?VzNQVU9qa0tpQXJiVG5nSDErbkJIVnl0aHV3aU5tS0RKVi9jT3ZQS3Fua0Rs?=
 =?utf-8?B?L0I1THZEb2tKRmVJRGFoRGQvWHVvZ1NkYWM2Ymt1eE84QWhHZzllWWxXYkR4?=
 =?utf-8?B?a3JKSnNSQ1Z5S01TZVVwam9MSTZNMEsrbVFBOHB2UGZtNytSZzNqV0JTbUtU?=
 =?utf-8?B?WnpxUkR2N0x5cmRJbVR1YmNjSm8vbFVRSDlGaU4rTWZmNDB4aDhGOU50Rk9M?=
 =?utf-8?B?NGlhWnFzemFsNFBVNlZxQ1VPZVl0Q3AybDRkWjVkSDErOVNKa2MyaWJ2SnRU?=
 =?utf-8?Q?RSWg2y9tzYsfmtyP5z7cOJQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37D5CB1378B0324CB61BDC35F372702B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3055.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d63283-b8c3-4cb1-b1e4-08da63771dd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 19:54:07.8679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JYPI7KW4euO/MYC7si2YhLdjl+0TRibAoLLqMOwHVrpYlW8bISpN4v/HXayrlEg/HYbbXLw/1QmNoJiqR1YR5ghebj1o1bMnao2Z3tCGF3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3908
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIyLTA3LTExIGF0IDEwOjE2ICswMjAwLCBBbGV4YW5kZXIgU3RlaW4gd3JvdGU6
Cj4gTmVlZCBpbiBjYXNlIHRoZSBzZW5zb3JzIGlzIHN1cHBsaWVkIGJ5IGEgc3dpdGNoYWJsZSBy
ZWd1bGF0b3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFN0ZWluIDxhbGV4YW5kZXIu
c3RlaW5AZXcudHEtZ3JvdXAuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9tZWRpYS9pMmMvb3Y5Mjgy
LmMgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+IMKgMSBmaWxl
IGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRp
YS9pMmMvb3Y5MjgyLmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjkyODIuYwo+IGluZGV4IDA0ZmRh
ODIyMmUwNy4uYzNmYWYxMWE5OWI1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL292
OTI4Mi5jCj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y5MjgyLmMKPiBAQCAtMTEsNiArMTEs
NyBAQAo+IMKgI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L3JlZ3VsYXRvci9jb25zdW1lci5oPgo+IMKgCj4gwqAjaW5jbHVkZSA8bWVkaWEvdjRsMi1jdHJs
cy5oPgo+IMKgI2luY2x1ZGUgPG1lZGlhL3Y0bDItZndub2RlLmg+Cj4gQEAgLTU1LDYgKzU2LDE0
IEBACj4gwqAjZGVmaW5lIE9WOTI4Ml9SRUdfTUlOwqDCoMKgwqDCoMKgwqDCoMKgMHgwMAo+IMKg
I2RlZmluZSBPVjkyODJfUkVHX01BWMKgwqDCoMKgwqDCoMKgwqDCoDB4ZmZmZmYKPiDCoAo+ICtz
dGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG92OTI4Ml9zdXBwbHlfbmFtZXNbXSA9IHsKPiArwqDC
oMKgwqDCoMKgwqAiYXZkZCIswqDCoMKgwqDCoMKgwqDCoMKgLyogQW5hbG9nIHBvd2VyICovCj4g
K8KgwqDCoMKgwqDCoMKgImRvdmRkIizCoMKgwqDCoMKgwqDCoMKgLyogRGlnaXRhbCBJL08gcG93
ZXIgKi8KPiArwqDCoMKgwqDCoMKgwqAiZHZkZCIswqDCoMKgwqDCoMKgwqDCoMKgLyogRGlnaXRh
bCBjb3JlIHBvd2VyICovCj4gK307Cj4gKwo+ICsjZGVmaW5lIE9WOTI4Ml9OVU1fU1VQUExJRVMg
QVJSQVlfU0laRShvdjkyODJfc3VwcGx5X25hbWVzKQo+ICsKPiDCoC8qKgo+IMKgICogc3RydWN0
IG92OTI4Ml9yZWcgLSBvdjkyODIgc2Vuc29yIHJlZ2lzdGVyCj4gwqAgKiBAYWRkcmVzczogUmVn
aXN0ZXIgYWRkcmVzcwo+IEBAIC0xMjcsNiArMTM2LDcgQEAgc3RydWN0IG92OTI4MiB7Cj4gwqDC
oMKgwqDCoMKgwqDCoHN0cnVjdCBtZWRpYV9wYWQgcGFkOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgZ3Bpb19kZXNjICpyZXNldF9ncGlvOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgY2xrICpp
bmNsazsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcmVndWxhdG9yX2J1bGtfZGF0YSBzdXBwbGll
c1tPVjkyODJfTlVNX1NVUFBMSUVTXTsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHY0bDJfY3Ry
bF9oYW5kbGVyIGN0cmxfaGFuZGxlcjsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHY0bDJfY3Ry
bCAqbGlua19mcmVxX2N0cmw7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB2NGwyX2N0cmwgKnBj
bGtfY3RybDsKPiBAQCAtODgzLDEwICs4OTMsMTggQEAgc3RhdGljIGludCBvdjkyODJfcG93ZXJf
b24oc3RydWN0IGRldmljZSAqZGV2KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Z290byBlcnJvcl9yZXNldDsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgCj4gK8KgwqDCoMKgwqDC
oMKgcmV0ID0gcmVndWxhdG9yX2J1bGtfZW5hYmxlKEFSUkFZX1NJWkUob3Y5MjgyLT5zdXBwbGll
cyksIG92OTI4Mi0+c3VwcGxpZXMpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQpIHsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZW5hYmxl
IHJlZ3VsYXRvcnNcbiIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGRp
c2FibGVfY2xrOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4gwqDCoMKgwqDCoMKgwqDCoHVzbGVl
cF9yYW5nZSg0MDAsIDYwMCk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gwqAK
PiArZGlzYWJsZV9jbGs6Cj4gK8KgwqDCoMKgwqDCoMKgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG92
OTI4Mi0+aW5jbGspOwo+IMKgZXJyb3JfcmVzZXQ6Cj4gwqDCoMKgwqDCoMKgwqDCoGdwaW9kX3Nl
dF92YWx1ZV9jYW5zbGVlcChvdjkyODItPnJlc2V0X2dwaW8sIDApOwo+IMKgCj4gQEAgLTkwMyw2
ICs5MjEsMTEgQEAgc3RhdGljIGludCBvdjkyODJfcG93ZXJfb2ZmKHN0cnVjdCBkZXZpY2UgKmRl
dikKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHY0bDJfc3ViZGV2ICpzZCA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgb3Y5MjgyICpvdjkyODIg
PSB0b19vdjkyODIoc2QpOwo+ICvCoMKgwqDCoMKgwqDCoGludCByZXQ7Cj4gKwo+ICvCoMKgwqDC
oMKgwqDCoHJldCA9IHJlZ3VsYXRvcl9idWxrX2Rpc2FibGUoQVJSQVlfU0laRShvdjkyODItPnN1
cHBsaWVzKSwgb3Y5MjgyLT5zdXBwbGllcyk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2VycihvdjkyODItPmRldiwgIkZhaWxl
ZCB0byBkaXNhYmxlIHN1cHBsaWVzOiAlZFxuIiwgcmV0KTsKCkknbSBub3Qgc3VyZSB0aGF0IGNo
ZWNraW5nIHRoZSByZXR1cm4gdmFsdWUgaXMgbmVlZGVkLgoncmVndWxhdG9yX2J1bGtfZGlzYWJs
ZSgpJyBhbHJlYWR5IHByaW50cyBhbiBlcnJvciBtZXNzYWdlIGluIGNhc2Ugb2YKZmFpbHVyZS4K
ClRoZSBtYWpvcml0eSBvZiB0aGUgZHJpdmVycyBpbiAiZHJpdmVycy9tZWRpYS9pMmMiIGRvbid0
IHNlZW0gdG8gY2hlY2sKaXQuCgo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGdwaW9kX3NldF92YWx1
ZV9jYW5zbGVlcChvdjkyODItPnJlc2V0X2dwaW8sIDApOwo+IMKgCj4gQEAgLTk5Niw2ICsxMDE5
LDE4IEBAIHN0YXRpYyBpbnQgb3Y5MjgyX2luaXRfY29udHJvbHMoc3RydWN0IG92OTI4MiAqb3Y5
MjgyKQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiDCoH0KPiDCoAo+ICtzdGF0aWMgaW50
IG92OTI4Ml9jb25maWd1cmVfcmVndWxhdG9ycyhzdHJ1Y3Qgb3Y5MjgyICpvdjkyODIpCgpJIHdv
dWxkIGNhbGwgdGhpcyBmdW5jdGlvbiBzb21ldGhpbmcgbGlrZSAnb3Y5MjgyX2dldF9yZWd1bGF0
b3JzKCknLgoKPiArewo+ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGludCBpOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShvdjkyODItPnN1cHBsaWVzKTsg
aSsrKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBvdjkyODItPnN1cHBsaWVzW2ld
LnN1cHBseSA9IG92OTI4Ml9zdXBwbHlfbmFtZXNbaV07Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJl
dHVybiBkZXZtX3JlZ3VsYXRvcl9idWxrX2dldChvdjkyODItPmRldiwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgQVJSQVlfU0laRShvdjkyODItPnN1cHBsaWVzKSwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
b3Y5MjgyLT5zdXBwbGllcyk7Cj4gK30KPiArCj4gwqAvKioKPiDCoCAqIG92OTI4Ml9wcm9iZSgp
IC0gSTJDIGNsaWVudCBkZXZpY2UgYmluZGluZwo+IMKgICogQGNsaWVudDogcG9pbnRlciB0byBp
MmMgY2xpZW50IGRldmljZQo+IEBAIC0xMDIyLDYgKzEwNTcsMTIgQEAgc3RhdGljIGludCBvdjky
ODJfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+ICvCoMKg
wqDCoMKgwqDCoHJldCA9IG92OTI4Ml9jb25maWd1cmVfcmVndWxhdG9ycyhvdjkyODIpOwo+ICvC
oMKgwqDCoMKgwqDCoGlmIChyZXQpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ZGV2X2VycigmY2xpZW50LT5kZXYsICJGYWlsZWQgdG8gZ2V0IHBvd2VyIHJlZ3VsYXRvcnNcbiIp
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+ICvCoMKgwqDC
oMKgwqDCoH0KPiArCj4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X2luaXQoJm92OTI4Mi0+bXV0ZXgp
Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHJldCA9IG92OTI4Ml9wb3dlcl9vbihvdjkyODItPmRl
dik7Cgo=
