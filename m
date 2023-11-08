Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB387E597E
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 15:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbjKHOvB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 09:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjKHOvA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 09:51:00 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B5A1BDD
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 06:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699455057; x=1730991057;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TEXxsejrG1LOacYSzXbb1BthCIxryWT0eBg02pSF0Y8=;
  b=S7iwkJ7+uEwRaXaFv9y7MdzvLkKv6UPtspOYvN9cCl/p9QheBCxi3zGP
   QvEipkKowr5Lc4oQcd5yw4zAhtK546ocXa9/1b58lu247yDe+tCZ4uJiF
   vXcPpn7DL7ozifRSOrFdnhDzEC9zMIcIiHeEhnJfL0RNR1cfv/5TRRsa0
   E3hfoNLaY6k1uHO+iGj28PravklchKMoxaG5y7uxbPxeth/y50Pj9Dxq3
   xyjBu38dwJLjCT0W2+oT1uDEkW5GnztmbrmvzNu3Um7JE3IEv3TvePGvz
   5jd+4TGJgeT+j1XkP8//u2t3tBTvktyCR/+8JhsADSZGubsS+XsZzw2cO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="392651362"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="392651362"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 06:50:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="11212538"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Nov 2023 06:50:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 06:50:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 06:50:49 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 06:50:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWGzGsUrxJy4227B+y80fdNnoONSWTcQKSmP26dcPgY7EiCaJgdTDoAy6npuCrt24E1NyAytBmR74004UU5r7MBPhlozLKO/cMiSHBECPijiJ1cdUXKeE1+msSqPWW+1MaGcjRWqT6BjwD5LC26tsV1TAsv7jC6EvkTJSMRATu15WociKSP5f+lj/RVCRb0r9nGH3t64kLxFSPOP9EvGDQ56sDjUZLVbd1DkSXQfMiGUxoZXosBx+T1XzEBXqK5cEIn1OifN/ozq34XyKsuOg78CvSo4eYhxGGbxxQr2S05yFK0oobTakV5jDmADFEP1zG6A04ILCgCdBOAC/83ONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEXxsejrG1LOacYSzXbb1BthCIxryWT0eBg02pSF0Y8=;
 b=SVU9p/oNj9yGoM6UP/3yxbUt6bhBql/EygOpPk+1C6/bwROhd2LYTuHVkrQhy6RfaY3jCrOX39DosFcDrvq4RMAaIFwIUmjLXR1T5S/+j+EEY2JzXKJD2JP3wUuLkQACHcRctLvc7gJe4bVF+ZAyeFbyU52JJlTyaerAC7NvcJwVslkZ0KDIoWNhBIGMzelcqaKxdqRi1iRPMTdBr/Ftc3+s/HTxhp1PIRr2P+t3YFOKAQgBypFFLksgMVezuhs+ifXbtMYpJB1dotr7zwDfCjqxtLo7MWfD+80MMuF+rhl7mq6EOf6M1g6nZCOtEVvhbgvX+omjD3rh4YkAC9wwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 14:50:45 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 14:50:45 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Andreas Helbech Kleist <andreaskleist@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
CC:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
Subject: RE: [PATCH v2 08/15] media: intel/ipu6: add IPU6 CSI2 receiver v4l2
 sub-device
Thread-Topic: [PATCH v2 08/15] media: intel/ipu6: add IPU6 CSI2 receiver v4l2
 sub-device
Thread-Index: AQHaBmwkb/+agrywMU6toJam65xLl7BwX8aAgAA4eFA=
Date:   Wed, 8 Nov 2023 14:50:45 +0000
Message-ID: <DM8PR11MB565383A795F071F50B04D1BF99A8A@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
         <20231024112924.3934228-9-bingbu.cao@intel.com>
 <7c0a91f986baf62efcf0f021924653a00cdcc503.camel@gmail.com>
In-Reply-To: <7c0a91f986baf62efcf0f021924653a00cdcc503.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|MW4PR11MB7149:EE_
x-ms-office365-filtering-correlation-id: 0a5340d3-2fe1-4877-11b8-08dbe06a1679
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e/H67EKNU/fB60kvN/A5hRXhBKHHpmzB1t7Xuly/DFwL9nmesVzwtFRQ4DOMFp1TX5GGeBL9mgGXXhZT4j55vAVW2t4KnNmLz1vLbDP04/NQzsmp2CWo1wzfIXtYIsH7OE2ZfNd3qUlPFGeVMf/6cM6tZ8QlH6PG9qXiaWdrYvSsVgVwtNLPG/rgShMAIQV05s5bUVRB57JwaTnB2tNaUhiH5bPBll0tI97QXgSQ0umWtVCJmf3dyEK/x5vYRB9oFGpA77VQtdw2jGqhjt3t9XADO+a+mbNVFtpT0jHorHA2YMxdxLw86411foqbmLEg/JjGDMHLevfzQ+r8MOke8V1XKP3QlZmF4ZSrcDypo/QPQ0v8hg9ku/xb/0uUq4JUP0/ImoGOTvjSIJl/8YbeVMIsKk8EzDSm5zXqWhx8sO8x5Qk8AiDC3lrz30qMqv081lghve6cWx01dS/KUoawVqTrxRIlMFmqERJWUOD2r4bIgrBb/+kEtk4ahO4ozpS7FU71UmFIeAQfiENGqyxNDbadPzqgQGmc0rLYwNin5UMBuVgGOs63c90Lg95x+/8706ul9eR85p2JQaja/I2WECEFEN07Nebv7HcM/GxLHQ9AbM5rYHyFF/zTCJUMa2wzlAL/5Rw6afsB+QQq1c6YIX0UNTtwVn1K+c34s4/Bsbs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(366004)(136003)(376002)(230922051799003)(230273577357003)(230173577357003)(186009)(1800799009)(64100799003)(451199024)(83380400001)(316002)(38100700002)(122000001)(66946007)(6506007)(110136005)(82960400001)(7696005)(71200400001)(966005)(66556008)(66446008)(76116006)(64756008)(66476007)(9686003)(26005)(54906003)(7416002)(5660300002)(478600001)(8676002)(52536014)(86362001)(33656002)(4326008)(41300700001)(8936002)(38070700009)(2906002)(4001150100001)(55016003)(8496004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODZpcWFZS2RJSU9KMXFtbGY2K0c4RzdjbExHVFBZQ1owL2EwS29VcHVza3c4?=
 =?utf-8?B?eTJNZnlhQUJieWg0TlFGcEJLeG1DSWhzNGNxUmI1TFhxS2gxckZiajF5TTE4?=
 =?utf-8?B?bmxiQ0kvOTRtRmNqRUx1QUFrZnpZWGhSQlRzK2ZIMWVhb2tQV2VuLzdJb0JP?=
 =?utf-8?B?LzJ2ell3bGRmY1V0OFNOOXBQY3F2eFdVTTV2S2VmNUMrQUlZRG9BQkVIM0Ra?=
 =?utf-8?B?aFRFK05SVXlrZzl2VEZYUUNVcTU1OXRUQ3NTaDZERG5nc29OSzhDLzY4Qlhj?=
 =?utf-8?B?REpwWERySW1sVmxmU014Z0RzZ250OFRVUXlsZmVia1U5b3N5YlRyTmN3ai9l?=
 =?utf-8?B?NHNrQXNzUndrakc0K3huZzQ5THdKU0tmRTgwNDZ6S2R1bmcwOVYwa3BhWDBN?=
 =?utf-8?B?MU5iLyt0cXRQOWxuQ1MrRFBZR3hxMVh4Z01EWFJTY2QyNTk3NjlrdFNlTE5Z?=
 =?utf-8?B?VWVxdFhHUnBKNTdSR3lpRlNzdGpIbWh5YVBxWm0zd1hQaDl2S0E0NUFORW5m?=
 =?utf-8?B?ZkRLTnNnMmM0WTdSRDlUYmtUajJrUHBacTZYTVFuQ1VKSXZGV1VFQU55M0pk?=
 =?utf-8?B?YUJESlhuUFVCL2FtVXlySGN0c3VvMU1oQklxZStYcGtkdGhVc0RjS2x0ZVNV?=
 =?utf-8?B?cmo0TGxrN3JaZklGS0JPSU80aVVvNTIrN21nRVRSOVo3VVV1d2JTOGZ2M1o2?=
 =?utf-8?B?WWVueXRxWG85M0xwLzdQS2wyb2VMSGxNRTlxYnhJRjlQVlFkSytrYndBNFZR?=
 =?utf-8?B?VnNRUHp2ckpYYVBVSGV0a0xJSlNOeVlZWGlVa2xiRXZkYXVWeStaV2pQMGNT?=
 =?utf-8?B?eHBLV3JvMGszd3Z6NzAxRkYvMkEvVkk5YzJEancwaDJ2ZHlMT0NFMGhlK0Rp?=
 =?utf-8?B?U2lSd0tRNTZxOWtXbzdVdk9iTmNxOUZFVkpoWHF2OGtyNWxRdStqUUR6cjRs?=
 =?utf-8?B?TktEeENwcUZQKzFBQmpUKzVVdmcxMEM3UHlrQnZsejFJUWxRaWN1ckdNcFVJ?=
 =?utf-8?B?TEpkemxxRll1WDFDcDBZR2pJRmNyVmlLQmROSTU4dm91STQweGg0cVVRK2cy?=
 =?utf-8?B?TDdQN1Mrbm1XWUR4ZjdJSm53UVZleEl0eDA5Y2lqLzRNeDB1dVc0ZGpyc2p0?=
 =?utf-8?B?aE8zT0RwRG9JOENWWVJ1SDlPVmk2VmhHejVFeWwvME9YbGVrRHlNSllvbnV0?=
 =?utf-8?B?NEZhNzA0OUJuQ2pxMG5yZ21CN1pFOGdGRU84Wnk0Vk1lRjY0RE1RTGcyMHdO?=
 =?utf-8?B?ZGFudkdYeXBqMkxxbThRYlc5VWhUWUZJUklwOHAxU3hieXRid0N4b0tNTjkr?=
 =?utf-8?B?bkcvS0NOTmlycmcwMSt3MjVJelE1NTJwbUYybVJGWmc1a04xMHhHckFGMi84?=
 =?utf-8?B?c0JhSVpBbEpZR1RVNFJoQUltcmFzU3FaVmJyb0dPTmVmR2dPTkdZczJ2aUkr?=
 =?utf-8?B?TXJKUXo2b0Npa0wzZXZBc010MXh5NVV3LzJ5SEg1T2NYenp3eWEvblJrQmgr?=
 =?utf-8?B?eWt2V0tYNXRZNnRZcTh1Z2JZb3FXV09rUmEzK1hlSnFMUE1JVkpscXdRZldW?=
 =?utf-8?B?UmIwdzZrem5iR0IweTFwZHc2NDFBSzBrUExob2NwTG01OUo1cU11cFRSNTRz?=
 =?utf-8?B?ODFsWHR2ZDVVS21kekdNbTZCZ3lsYTlPK3BTdm5RQmxNRUlGRjBGdE81NExu?=
 =?utf-8?B?aDVUZHVuTGZrUFRjbzdxbFh2NGN4Q1NzWTF2emhRYUVpQ21IS1pjQXlDLzZi?=
 =?utf-8?B?VmphWW9WWnhHeXk2QXBldkgrQUswMzdrK1ZjVzFDUlU0c2dhajBrTzFPNzha?=
 =?utf-8?B?L2UyaUxxSExHbXJPM3ZyUkhaa1BRRkV0eVppeE5aSEdqOTMxQnBqUUl5a2c5?=
 =?utf-8?B?dkswK0pZVFpBNTBwZzMxc201TVpWWnowM2kzaG1YamFmSkhnNlBRZVpLODhn?=
 =?utf-8?B?a2F1S092VHVVQ095cjdHVHhzaHkyT3d3YVZ4MWNYVkpXMVhKU2J4SzZVWFpY?=
 =?utf-8?B?dHNENWNSd3FZTGtCVGNqb1dxdDBVUWdKTkFaUGFUK0dldHloU1NlSUh2b2dL?=
 =?utf-8?B?dVFJRGZZdWVMckN3U1pLQVZ6TUNuSFN6UmttcXRrWk5CaWxGaFFhajE2ZlFB?=
 =?utf-8?Q?PvffG7r0Qv9GdZuyPZmabRh2P?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5340d3-2fe1-4877-11b8-08dbe06a1679
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 14:50:45.0771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pb3HP9o+BDm8kwXEsBzc3C03weYrKZFSAwRTTOlVvBP8/uw0ca4IxqjNZfi0sj6ZRdeoDQcY33TAemqtovGz+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7149
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QW5kcmVhcywNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpCUnMsICANCkJpbmdidSBDYW8gDQoNCj4tLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEFuZHJlYXMgSGVsYmVjaCBLbGVpc3QgPGFu
ZHJlYXNrbGVpc3RAZ21haWwuY29tPg0KPlNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgOCwgMjAy
MyA3OjI2IFBNDQo+VG86IENhbywgQmluZ2J1IDxiaW5nYnUuY2FvQGludGVsLmNvbT47IGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj5zYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tOyBs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20NCj5DYzogYW5kcml5LnNoZXZjaGVua29A
bGludXguaW50ZWwuY29tOyBoZGVnb2VkZUByZWRoYXQuY29tOw0KPmlscG8uamFydmluZW5AbGlu
dXguaW50ZWwuY29tOyBjbGF1cy5zdG92Z2FhcmRAZ21haWwuY29tOw0KPnRmaWdhQGNocm9taXVt
Lm9yZzsgc2Vub3poYXRza3lAY2hyb21pdW0ub3JnOw0KPnRvbWkudmFsa2VpbmVuQGlkZWFzb25i
b2FyZC5jb207IGJpbmdidS5jYW9AbGludXguaW50ZWwuY29tOyBRaXUsIFRpYW4gU2h1DQo+PHRp
YW4uc2h1LnFpdUBpbnRlbC5jb20+OyBXYW5nLCBIb25nanUgPGhvbmdqdS53YW5nQGludGVsLmNv
bT4NCj5TdWJqZWN0OiBSZTogW1BBVENIIHYyIDA4LzE1XSBtZWRpYTogaW50ZWwvaXB1NjogYWRk
IElQVTYgQ1NJMiByZWNlaXZlcg0KPnY0bDIgc3ViLWRldmljZQ0KPg0KPkhpIEJpbmdidSwNCj4N
Cj5PbiBUdWUsIDIwMjMtMTAtMjQgYXQgMTk6MjkgKzA4MDAsIGJpbmdidS5jYW9AaW50ZWwuY29t
IHdyb3RlOg0KPj4gRnJvbTogQmluZ2J1IENhbyA8YmluZ2J1LmNhb0BpbnRlbC5jb20+DQo+Pg0K
Pj4gSW5wdXQgc3lzdGVtIENTSTIgcmVjZWl2ZXIgaXMgZXhwb3NlZCBhcyBhIHY0bDIgc3ViLWRl
dmljZS4NCj4+IEVhY2ggQ1NJMiBzdWItZGV2aWNlIHJlcHJlc2VudCBvbmUgc2luZ2xlIENTSTIg
aGFyZHdhcmUgcG9ydCB3aGljaCBiZQ0KPj4gbGlua2VkIHdpdGggZXh0ZXJuYWwgc3ViLWRldmlj
ZSBzdWNoIGNhbWVyYSBzZW5zb3IgYnkgbGlua2VkIHdpdGggSVNZUw0KPj4gQ1NJMidzIHNpbmsg
cGFkLiBDU0kyIHNvdXJjZSBwYWQgaXMgbGlua2VkIHRvIHRoZSBzaW5rIHBhZCBvZiB2aWRlbw0K
Pj4gY2FwdHVyZSBkZXZpY2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQmluZ2J1IENhbyA8Ymlu
Z2J1LmNhb0BpbnRlbC5jb20+DQo+PiAtLS0NCj4+IMKgZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwv
aXB1Ni9pcHU2LWlzeXMtY3NpMi5jIHwgNjU0DQo+PiArKysrKysrKysrKysrKysrKysNCj4+IMKg
ZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtY3NpMi5oIHzCoCA4MSArKysN
Cj4+IMKgLi4uL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5cy1zdWJkZXYuY8KgwqAgfCAz
NzkgKysrKysrKysrKw0KPj4gwqAuLi4vbWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLXN1
YmRldi5owqDCoCB8wqAgNTggKysNCj4+IMKgLi4uL2ludGVsL2lwdTYvaXB1Ni1wbGF0Zm9ybS1p
c3lzLWNzaTItcmVnLmjCoCB8IDE4NyArKysrKw0KPj4gwqA1IGZpbGVzIGNoYW5nZWQsIDEzNTkg
aW5zZXJ0aW9ucygrKQ0KPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wY2kv
aW50ZWwvaXB1Ni9pcHU2LWlzeXMtY3NpMi5jDQo+PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5cy1jc2kyLmgNCj4+IMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLXN1YmRldi5j
DQo+PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lw
dTYtaXN5cy1zdWJkZXYuaA0KPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9w
Y2kvaW50ZWwvaXB1Ni9pcHU2LXBsYXRmb3JtLWlzeXMtDQo+PiBjc2kyLXJlZy5oDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLWNzaTIu
Yw0KPj4gYi9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5cy1jc2kyLmMNCj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjBkZWRmM2Y1MTg1
MA0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1
Ni9pcHU2LWlzeXMtY3NpMi5jDQo+Li4uDQo+Pg0KPj4gKw0KPj4gKyNkZWZpbmUgRElWX1NISUZU
wqDCoMKgwqDCoMKgOA0KPj4gKyNkZWZpbmUgQ1NJMl9BQ0NJTlbCoMKgwqDCoDgNCj4+ICsNCj4+
ICtzdGF0aWMgdTMyIGNhbGNfdGltaW5nKHMzMiBhLCBzMzIgYiwgczY0IGxpbmtfZnJlcSwgdTMy
IGFjY2ludikgew0KPj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGFjY2ludiAqIGEgKyAoYWNjaW52
ICogYiAqICg1MDAwMDAwMDAgPj4gRElWX1NISUZUKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvIChpbnQzMl90KShsaW5rX2ZyZXEg
Pj4gRElWX1NISUZUKSk7IH0NCj4NCj5JIHRoaW5rIGFjY2ludiBzaG91bGQgYmUgczMyIGhlcmUu
IFdoZW4gYWNjaW52IGlzIHVuc2lnbmVkLCB0aGUgZXhwcmVzc2lvbg0KPihhY2NpbnYgKiBiKSBi
ZWNvbWVzIHVuc2lnbmVkLCBhbmQgdGh1cyBuZWdhdGl2ZSB2YWx1ZXMgb2YgYiBnaXZlcw0KPmlu
Y29ycmVjdCByZXN1bHRzLg0KDQphY2NpbnYgaXMgYWx3YXlzIGFuIHVuc2lnbmVkIHZhbHVlLCBz
byBJIHRoaW5rIHdlIGRvbid0IG5lZWQgY2hhbmdlIHRoZQ0KdHlwZSBvZiBhcmd1bWVudC4gRm9s
bG93aW5nIHVzdWFsIGFyaXRobWV0aWMgY29udmVyc2lvbnMsIEkgdGhpbmsgaXQgbmVlZHMNCmEg
c2lnbmVkIGludGVnZXIgY2FzdCBoZXJlLiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KDQo+DQo+VGhp
cyBpcyBkaWZmZXJlbnQgZnJvbSBlLmcuIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9pcHU2LWRy
aXZlcnMuDQo+DQo+L0FuZHJlYXMNCg==
