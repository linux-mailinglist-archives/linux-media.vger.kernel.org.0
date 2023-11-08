Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7B77E5908
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 15:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbjKHOcc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 09:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbjKHOc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 09:32:29 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995F51FD7
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 06:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699453948; x=1730989948;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2KjvrSCEIejtC4r3TIC7XDnSsJ2MESXEq1wjKzqaUOc=;
  b=UnKB6hQ2Lr2F/srtj7z/YShetvgUJFaou3knsEutSrKzLNOsHFArk06u
   OqHdrtVDcpJ7Qz0/zrIGGBgwW9ogyQ/9lriBSloTf8qBvyz+qcOZvClWp
   1IQ3pc9tnEtt8d937Yf4TVdFPkzVpS3sSNOFMvMXML88jqG5mJIJ/0pk+
   D3pK1vxbj3+ICtIXl2PWZTSMGnSFBeGvE/iVU2K8vYWnmpDERc16Kux3N
   Wvy8+Q65sLoPtm7jz6ECIF+ZIpl7HVf9oRHl9HmtS8vd9A2knzM/6M0Gs
   7BkKXLfGCVIWezl7rzlwj008AM/5JC5ve7OwzCkQcimQZRr7LV35niw20
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2723201"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="2723201"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 06:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="763078059"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="763078059"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Nov 2023 06:31:39 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 06:31:38 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 06:31:38 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 06:31:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0qeip6IFnx9Rn+kzp36KNc2rqz4KW+LCmb7CXi5Y0puoKFoWHkq0NSLIwj2fx+28Ernm85jnxcdv1/TZ/vbFaB9fAsJ1kh0+baI0N8w0eU/eAoAxKE0ircssqTGAQDJz7fkTY+ghdVwf5MH7TVcapzIFnWsEh/a4LAoNp/q1gfUANOWuaM1Z3ePLokj0PwIoxz/mfOr2VwyO08hRU5BWUgyTQ2RzaqL/USOorDehwqwGeXsHq7vasSFckdLrf1wWqKziUnhlbQXSo9/Vda0RJdKMUtpDuZ3G91Bl1pSjvK8OM6cGRMBUHNiGLs2ay5ee0N3eQjESKuLBxFjLU/zmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KjvrSCEIejtC4r3TIC7XDnSsJ2MESXEq1wjKzqaUOc=;
 b=W5eAvwMN5WUf6cUsBfNgAlQy3kvgiIPqd+QFa2SnmtG3elCZLRtmWzsSqPqciU3SvrdBNIxRM49opWXezWAXrk83MxvSrKGYuDlscAQ+WtEy6da3nUh9j9U0tqXivAIK/r3RSQvnhmhV2oSrd7ec0uritt+8xwjSAxIoWq3FGRdfQ7OjU+syoWnPCVW8KoOl+LiFWmMwjV4fk+Nxg9KnMC3jwEHEwuBayHoor2NM/W6VpH0zF9X42rVbxf+L0KEjbj8kQpcu30qVER+VSb2HSFplNx/h9r70lAxu6hDpQTOWY2Zi+HdwolWNL0TsQR2rT1nslr5HSbzR2xGWx/SCEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SJ2PR11MB8323.namprd11.prod.outlook.com (2603:10b6:a03:53f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 14:31:29 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 14:31:29 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Hans de Goede <hans@hansg.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
CC:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "andreaskleist@gmail.com" <andreaskleist@gmail.com>,
        "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
Subject: RE: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
Thread-Topic: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
Thread-Index: AQHaBmwQvlcUXD3XokqEOAUxF397rLBwaUuAgAApYRA=
Date:   Wed, 8 Nov 2023 14:31:29 +0000
Message-ID: <DM8PR11MB56531D32CC21715B696C961199A8A@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
In-Reply-To: <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|SJ2PR11MB8323:EE_
x-ms-office365-filtering-correlation-id: 99afae5a-6d95-4883-96e5-08dbe06765b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ScGvUl1sg63Xv4GFU1lYy5K2CHeCysA318PFmyVhhtQ1b/x+0cf32x8MEFqRFUJswUC80Avpjwv79UnCHPNNHchix1IDvguUicxdiyQe/g1eAY3LRwi2tqacVtMcMPAQYPntIdVdbaPG8YXlOcvJJo5QQQxqDz88pX4AfFTrDIFXCwqZT++xKadQ/2QfJ+f1dPUPx4CcAOpSZ7OZPMOjX0T2AMUasaH6TgaLqZ41njCwiIUvo1OYfDF5DShrGmPvnoX7TAx+GQrU7RG9qxGSflscVmx2RQVap8b5DJyjCtSZACptaaE8Jj6Jfcngb6E/1zD1MCvJOeCqG/8R3gzCWkpBgkZfbVJQUsRszHVHUygAsZNrt1kBQwqLNzTnWybZnsRRXi+7WZeUfwduKhI55u8udn+W5KUSQ2bF3Q3NtVH06LoNnk36qM3LMU6L/yO/HRX9jFrRl/hbQGyV3Mo9S4Ej+RkzjxaSbCc4biYv+/ZfyOX0TRG+h8zbLjLrgAZ0cxDwdVR1VO8T3RIEzqphAm1cGAU9M/3nKHd2bjFGqdbeeD3zdcBRZEG1eTe+2J4IiS1ioIuk0gCX9sh6oLvpTPGBMsrc8HIHZZ1gYiiAG/LGmn9pZXvKLOILk/smoFJM4JJMvBO/ZV0jSg3FROVtYg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(376002)(136003)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(55016003)(26005)(9686003)(83380400001)(71200400001)(478600001)(6506007)(7696005)(2906002)(4326008)(64756008)(66946007)(110136005)(66476007)(66446008)(54906003)(66556008)(76116006)(316002)(5660300002)(122000001)(82960400001)(41300700001)(86362001)(52536014)(8676002)(33656002)(8936002)(38100700002)(7416002)(38070700009)(8496004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmJUNjlFQzRLcURiTDRZVzJrRUVqZm04V0tIbnpUZzlyYWMrUE9zS1IwajJD?=
 =?utf-8?B?SXRWN1JLaGNzZlJBazFLZmh0eU51ZUhMTHpzU3Y4YVZCTC9iZ1BNMEVDWTBN?=
 =?utf-8?B?T005SGNjSmEzWSsxcGZsb3NVQ1VHZXZ3ZFdHTlV5a1VIdURBQnpBbTVWbDB4?=
 =?utf-8?B?UlIyV0NsdkZGY3Z2c2lFUnUySkdUYzdla3AwRTRiRVFZd1dhOFVyeVJ2empw?=
 =?utf-8?B?bXEzcE55VTM1Uyt2ODQ0endJNEVYMGRXNFRPeUlhcXZFZ3lVMGFLOFZ1UlJk?=
 =?utf-8?B?YnRGbHA1Y1lUTDZySWt0MEQ3bEJ4ZnlnbEtxZlZNcklUT3ZkNFFkMFNBbyt5?=
 =?utf-8?B?bVNRR05DeHcxOFI1VXhjZVJ6MGZkeDkwYUFkOGQ1dVZLdFZhMzM1VHM5b0th?=
 =?utf-8?B?OVovQzVTN0kxcnVQYnVZWmJ3TEdFYjFFeldlNmpSbFdlMjF4OWtDd1V3RWEx?=
 =?utf-8?B?WVkySWhBTnpmT2hhNG9WbVBNa0ZKMG5rRFk2d1pic0wyQXNwN0VrSUIyKzNh?=
 =?utf-8?B?ZnMxYldON3RQdVpVLzlBa2ErZ3NUMHl4ZDA0QmZ0dE1FUjg5SHNyMUFjSW03?=
 =?utf-8?B?QzZyOXFxeVFoWTFzUWRNK3pJMGZpNE53ZHZwYk5KYWUwbWNQZlZlQ0VGelY2?=
 =?utf-8?B?d1ExdHpoMHF5YWxoM2w1bFpTZXFJNjdZTHhSa1JYMGIya1BGYnB5Nmo0Tkly?=
 =?utf-8?B?YVYzVG5xMGlPY3NWaVBMTG84WmxDdi9vbEUwbnZVaFk1cjhKUTk0WG9RZTVP?=
 =?utf-8?B?RHZPRHNVMVVKYmJtR2RDME9saG16VlNBUTIvOEhlTXV4THlhN1hIbXhLTG9o?=
 =?utf-8?B?R0J1a1RxaGhYemtERk4xQ1pNOEJyZk9GTFRqYUVkNGtZbEZ2cGcrWHpzN0wy?=
 =?utf-8?B?R3k5K2VqM0Y5cUt0RS8rUGxoRTA2OG5wem5uMFJzcnN2ckJJRTh1cUs4YUxr?=
 =?utf-8?B?RFlucFlYdW85K0hZcEVqMkZEdkVRNDJOM09oUXNqejNtc2V3RTY5cERETHVO?=
 =?utf-8?B?RTdIeU83WjJIcXJNWGpTc1piNlBUcytKUWVhREZHUThDZlMzUUV0R0hTQ0sw?=
 =?utf-8?B?MkhMN1V5Z2FUNjJwVzZTYnBlb1hvUnBZN2ROck1JYWUvUElwZUorQjU4NUpw?=
 =?utf-8?B?RFgyRTRId1RUQnBHb3Noa1kwc0JBeUxOZDFWaWRhcXo2U0VyNVJxemowN1VB?=
 =?utf-8?B?QkZQbm14dXl5dC9wT1BkZTU4d3M5MVhWa0Z4eGs4YXJpbHVGTFNNUzBQU0NX?=
 =?utf-8?B?bXJObHROaGNud1NCa0dHWnd3UlczdlZIaHFHd0l1NWkyVS9qc2pXWE1VV0k2?=
 =?utf-8?B?ajFzM25WeVI0c3BFREEzQWtacU1TcklJdWNCdnNmMXZhL1dnc0FiTHZpSEFG?=
 =?utf-8?B?eVJPRkZtUUprWFZkNWdYQWtvSEhTVzkxaTVXZHhxUUt3d1dvZFR2WENrcHI2?=
 =?utf-8?B?L0tRZ0ZFSTFrT2M4R0ZxbmtFTlZNS2pEdmpwbFRxSFZ1c2RtRWtESEFWb1pV?=
 =?utf-8?B?dWVHVlQ5Y2QvdzZXSHdBcktrZjZIL095NjRMOGdoR09DQ29PajVLT2FwVk5E?=
 =?utf-8?B?VGlDNFhOaTVEV0U0R2dvbEhzajVQMGxTaFJVNmxRY2dIZmVaTUhyWmZZWUJ0?=
 =?utf-8?B?TEtZQ01SaDAzVGJtbUMyTTVVaEg2RERGamNGd0pnbkk2NldZNmpFUFF6b1kx?=
 =?utf-8?B?NjdndzJ4OEQwdWZuc1N0SVVIemwrL3JWdlFudDBMbVdDWjRxa2RXNVhaNlRN?=
 =?utf-8?B?Ym9wZlRFYzN6OXdpOTlLMWpEZVVyTFNNRjFOVk1HNHcwUGtIQitNR3pCU0Vh?=
 =?utf-8?B?dkxydU05YmljdjVuVkZvNXdTSDh5OVhnanQ2QVdGTU5pRnc3WTQxcGdYZ2dI?=
 =?utf-8?B?TFIxK2dtTkJqZmhhTUovelpIVEd0LzVLNlRIVWIzQ0dBd2Rnelp1T2ZKZjFw?=
 =?utf-8?B?VHk0aXRXRlptN25VYy9KVmY2eTJITy8yVzhKYlpTUGs3eWhrK2tQSkZqcExj?=
 =?utf-8?B?Tjd0WEloeFdGUituM2lFUjBRSW50Vk9ya2JrYXo3NlJYbmRGcmkrSHlKcHdM?=
 =?utf-8?B?a2VWMXJHV1BTajN0SU8yMStvbEJTRzNKditLRXhJZmM1NjdTZU1KNGE1SWwv?=
 =?utf-8?Q?xnb0RqY7hLLebBtl9NuK6VUgB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99afae5a-6d95-4883-96e5-08dbe06765b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 14:31:29.5567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o83boptGI84+N36107DSgDnXtaiNWoawgPjQrmFBNa3v5UHRkCJnr7Wkw/8W9HkIVMV35x/sDhDEZiG4yFqMtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8323
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGFucywNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpCUnMsICANCkJpbmdidSBDYW8gDQoNCj4tLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEhhbnMgZGUgR29lZGUgPGhhbnNAaGFuc2cub3Jn
Pg0KPlNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgOCwgMjAyMyA4OjAwIFBNDQo+VG86IENhbywg
QmluZ2J1IDxiaW5nYnUuY2FvQGludGVsLmNvbT47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9y
ZzsNCj5zYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tOyBsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20NCj5DYzogYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOyBoZGVn
b2VkZUByZWRoYXQuY29tOw0KPmlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tOyBhbmRyZWFz
a2xlaXN0QGdtYWlsLmNvbTsNCj5jbGF1cy5zdG92Z2FhcmRAZ21haWwuY29tOyB0ZmlnYUBjaHJv
bWl1bS5vcmc7IHNlbm96aGF0c2t5QGNocm9taXVtLm9yZzsNCj50b21pLnZhbGtlaW5lbkBpZGVh
c29uYm9hcmQuY29tOyBiaW5nYnUuY2FvQGxpbnV4LmludGVsLmNvbTsgUWl1LCBUaWFuIFNodQ0K
Pjx0aWFuLnNodS5xaXVAaW50ZWwuY29tPjsgV2FuZywgSG9uZ2p1IDxob25nanUud2FuZ0BpbnRl
bC5jb20+DQo+U3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMC8xNV0gSW50ZWwgSVBVNiBhbmQgSVBV
NiBpbnB1dCBzeXN0ZW0gZHJpdmVycw0KPg0KPkhpIEJpbmdidSwNCj4NCj5PbiAxMC8yNC8yMyAx
MzoyOSwgYmluZ2J1LmNhb0BpbnRlbC5jb20gd3JvdGU6DQo+PiBGcm9tOiBCaW5nYnUgQ2FvIDxi
aW5nYnUuY2FvQGludGVsLmNvbT4NCj4+DQo+PiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIGEgZHJp
dmVyIGZvciBJbnRlbCBJUFU2IGlucHV0IHN5c3RlbS4NCj4+IElQVTYgaXMgdGhlIHNpeHRoIGdl
bmVyYXRpb24gb2YgSW1hZ2luZyBQcm9jZXNzaW5nIFVuaXQsIGl0IGlzIGEgUENJDQo+PiBkZXZp
Y2Ugd2hpY2ggY2FuIGJlIGZvdW5kIGluIHNvbWUgSW50ZWwgQ2xpZW50IFBsYXRmb3Jtcy4gVXNl
ciBjYW4gdXNlDQo+PiBJUFU2IHRvIGNhcHR1cmUgaW1hZ2VzIGZyb20gTUlQSSBjYW1lcmEgc2Vu
c29ycy4NCj4+DQo+PiBJUFU2IGhhcyBpdHMgb3duIGZpcm13YXJlIHdoaWNoIGV4cG9zZXMgQUJJ
cyB0byBkcml2ZXIsIGFuZA0KPj4gY29tbXVuaWNhdGVzIHdpdGggQ1NFIHRvIGRvIGZpcm13YXJl
IGF1dGhlbnRpY2F0aW9uLiBJUFU2IGhhcyBpdHMgTU1VDQo+PiBoYXJkd2FyZSwgc28gdGhlIGRy
aXZlciBzZXRzIHVwIGEgcGFnZSB0YWJsZSB0byBhbGxvdyBJUFU2IERNQSB0bw0KPj4gYWNjZXNz
IHRoZSBzeXN0ZW0gbWVtb3J5Lg0KPj4NCj4+IElQVTYgaW5wdXQgc3lzdGVtIGRyaXZlciB1c2Vz
IE1DIGFuZCBWNEwyIHN1Yi1kZXZpY2UgQVBJcyBiZXNpZGVzIFY0TDIuDQo+DQo+SSBoYXZlIGJl
ZW4gdGVzdGluZyB0aGlzIG9uIGEgVGlnZXJMYWtlIHN5c3RlbSwgYSBEZWxsIExhdGl0dWRlIDk0
MjAgd2l0aA0KPm92MDFhMXMgYW5kIHRoZSBwYWNrZWQgMTAgYml0IGJheWVyIHBpeGVsIGZtdDog
VjRMMl9QSVhfRk1UX1NHUkJHMTBQLCB3aGljaA0KPmxpYmNhbWVyYSB0b2dldGhlciB3aXRoIChX
SVApIHNvZnR3YXJlIGRlYmF5ZXIgc3VwcG9ydCBwaWNrcyBieSBkZWZhdWx0DQo+ZG9lcyBub3Qg
d29yay4gVGhlcmUgYXJlIG1hbnkgbWFueSBDU0kgZXJyb3JzIGluIGRtZXNnIGFuZCBvbmx5IHRo
ZSBmaXJzdA0KPjEwIG9yIHNvIGxpbmVzIG9mIHRoZSBpbWFnZSBzaG93Lg0KPg0KPkRpc2FibGlu
ZyB0aGUgcGFja2VkIGZvcm1hdCBieSByZW1vdmluZyBpdCBmcm9tIGlwdTZfaXN5c19wZm10c1td
LCBtYWtpbmcNCj5saWJjYW1lcmEgcGljayB0aGUgdW5wYWNrZWQgKGV2ZXJ5IDEwIGJpdHMgcGVy
IHBpeGVsIGRhdGEgc3RvcmVkIGluIGEgMTYNCj5iaXQgd29yZCBpbiBvdXRwdXQgYnVmZmVyKSBm
aXhlcyB0aGlzLg0KPg0KPkFyZSB0aGUgcGFja2VkIGJheWVyIGZvcm1hdHMgc3VwcG9zZWQgdG8g
d29yayBvbiBUaWdlciBMYWtlLCBvciBpcyB0aGlzIGENCj5rbm93biBpc3N1ZSB3aGljaCBJbnRl
bCdzIG93biB1c2Vyc3BhY2Ugc3RhY2sgYXZvaWRzIGJ5IGFsd2F5cyBwaWNraW5nIHRoZQ0KPnVu
cGFja2VkIGZvcm1hdCA/DQoNClRoYW5rcyBmb3IgdGhlIHRlc3QuDQoNCkkgcmVtZW1iZXIgSSB2
ZXJpZmllZCBTR1JCRzEwUCBmb3JtYXQgb24gbXkgQURMIGRldmljZSBiZWZvcmUsIGJ1dCBJIGhh
dmUNCm5vdCB0ZXN0ZWQgdGhhdCBmb3IgYSB3aGlsZSwgZ2l2ZSBtZSBzb21lIHRpbWUgdG8gdGVz
dCBhZ2FpbiBhbmQgY29tZSBiYWNrLg0KDQo+DQo+UmVnYXJkcywNCj4NCj5IYW5zDQo+DQoNCg==
