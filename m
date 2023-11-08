Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0747E5885
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 15:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232360AbjKHOTL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 09:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232286AbjKHOTK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 09:19:10 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D631716
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 06:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699453148; x=1730989148;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZhwNuF8NC9sANo22b9QTuS1996Ee6OBR5haXo83qBUM=;
  b=lztzzgUZuz1H50ZWd30cteieTvFp0O7S6UooPZTB0LvM9VPl+8Ej8S2t
   VXDi87XfRBTH5MyXkswVfIc9jtHOScvJMXz2v46/V7t9akt8io6xbKOEt
   77SVaiww607nUlnwubWNujsL8d24kxoNqyJh0+5JksOhg9bS2ffQtANKI
   q6n5Fdcc8s2L7wrpfamXI19LqGpbBWfOsIX8cZyrdfKjN82ra9dwWmjZT
   uXNpkZbeiHx6Py7B8xz+beR31sF6JyLnR08fIRtm11ElbQrlJ9Hsnph4R
   L0WGNCuHk0l0OUPB3vAbFxpWMoq6fBW4bSHXzxBSEz7y/R6GQlqGjzIc3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="369973864"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="369973864"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 06:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="712942832"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="712942832"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Nov 2023 06:19:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 06:19:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 06:19:04 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 06:19:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ky9R707JG4kGeTaz1vGCKZtPbkA7hJ65v/9xOVvxrorg0KcsdxQ+yTxzYen7gwOASpMnruRjK5u/Maog+wawJBuJNjeGkm58mRdcu4Z91obko8d/+ZekCAbGI9H90CLmGmIlBaUImZDbt2dQX5G/kXqarYecyUze8vk/f0RWUld/g0hpQuX9zs7TeahE2n024V4g0dxtk82jl9mUQ4AFH24nnX7pPV/7B6I6AIBzpk4Hg7fD1QGvta7mVnuNAcew3iZuO4d0+TZnRMpfAsnOH8DGunPR2RTJbRKJ75k3wMOPAdY3TXBj3KrWB9kFn66FkGY+EAnvM8heTo6/TRhKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhwNuF8NC9sANo22b9QTuS1996Ee6OBR5haXo83qBUM=;
 b=VBNTwYqZqqhgMXOAANUmBnqE8LFDcx9ucMUr18kIBsMEYGFqKxq2hfRh8FUQE3zAfsMHwzy7dlmXD/jYjVZinRZAagoYMjieatg7DOn7bL8DsFt2eZJaFD+3clylDd+Q5cUzKxUCqj1D6V+tY57rXwrT3JT1vAtpGL9cy6bX7prk/cqlxoojHXxrSTIgzJKBxHVLhfCd/Bai3mxnhXXls1qRRBM1SxJbn41knfwQImJUCdhc0i7T0GRZvcTClASs3ja3xWJbQl5IeiAJdp3vFiPNJgBKHoBBOywpkcmvl5Fotw+BulVFvlDqn73Yaw4Qu8FgdikmPuuAz6IZYgUMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 BN9PR11MB5227.namprd11.prod.outlook.com (2603:10b6:408:134::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.18; Wed, 8 Nov 2023 14:18:57 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 14:18:56 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Hans de Goede <hans@hansg.org>,
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
Subject: RE: [PATCH v2 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
Thread-Topic: [PATCH v2 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
Thread-Index: AQHaBmwVwftvpJgotkScVOSeyT0ebLBwX6mAgAAuQ4CAAAGK8A==
Date:   Wed, 8 Nov 2023 14:18:56 +0000
Message-ID: <DM8PR11MB5653B651E179EA0A17EF66B699A8A@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
         <20231024112924.3934228-2-bingbu.cao@intel.com>
         <a3184b70-e0b3-4227-94af-2412fd565724@hansg.org>
 <d9fa902626486899929202f56f3e924b4ba27a73.camel@gmail.com>
In-Reply-To: <d9fa902626486899929202f56f3e924b4ba27a73.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|BN9PR11MB5227:EE_
x-ms-office365-filtering-correlation-id: 657042c1-7264-48d7-dd58-08dbe065a515
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rWM53JslZIB4on+qnOPjtMUM35ARw37nbEEGueXSMQ2JLDjo/QysFTsLvVRQ/dfIuDDRAJfJYfpl7LzrJLdZGIZUhX0DgD0zC+SC3VQRGdvgZQbJbvruUCp6dsiDIer1c5MkCbcRkdMy4bvdaqRm97s+DIclZZSeJYmwKxeKoRtrozNANZOaN6wfjj1/2NgaXws8m95dbG0Pl0ujw/09VGrN1w1GjmlI+ZvZKJwBUvSxlkGFTPHNyEffrzjPZP7h4nUrF2O85oZPyoA3kZrunwdxkE8tdqpfpz4HjAp3mXoLkradHMwGxxMEujpUDd6S2RuTPG+ppBqPUX+6b/Zs/pPeS3G7xnq3pfU5MHPhEaSyOeZnvTz3/MPTcfi9+LOxNQQqu6C69ADf75zOQJ5ZwoTk77u/QCxc2ZItlhtRA6oH6o/bdeMafbDyAwrcM8Te0t5vjNnBLXtjPBq6j0bVUcfCh1xLKPmWGxAWOs8DrqL9Kt+1sw2FP4HXMPodrbTMuTH+2VZ+O06JIAks9KB+dCZywFT006jwLD9uMKpVU9Br3UXKFcoi+75w9K0e/9Hr8/OTwEl6pWBuB5tkM85v01Qnbl/aTkNJNE76dGWH1XpOM0Ytms7z9/IwjLAfGZpVfUJsUzT/zxeFjQuIaqa2RQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(2906002)(5660300002)(7416002)(55016003)(86362001)(64756008)(66946007)(66476007)(66556008)(54906003)(66446008)(33656002)(316002)(122000001)(82960400001)(38100700002)(110136005)(26005)(76116006)(9686003)(71200400001)(6506007)(7696005)(53546011)(478600001)(83380400001)(52536014)(41300700001)(38070700009)(4326008)(8936002)(8676002)(8496004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUZMTHRuUGQ1MDBRbGpDazZJZE1NU2E0eFB6L05LVGY4SDBZQlBvaXZ6OVNN?=
 =?utf-8?B?eXEySVRWd1A3T0RDMElCQTMya2s0NDE0QnhoZk5qZXIwTzcxemRkcCtRc2Nu?=
 =?utf-8?B?RDgxTWVsNjBqYjJTWmJJZEgxVytPNkxRc3MvUE5DbGhTcFJxaEo4N29nMXhX?=
 =?utf-8?B?d1ZRMU01aHhCUGN3SEQrb1MxczdEbm1FOGN2aUIzcDllNUZRY0VYUGtaWE42?=
 =?utf-8?B?QWlPYU9CTHpaRm5nUDF4VWJ1WCtKdmtpeGY5WENKekFGUnM1SzZJRHNYWWJq?=
 =?utf-8?B?L2JKT09wUzdvczVXUnZ0em9Na3VFSUtwVWtFZXEyQnZwNzBBdTdlTDRjU2py?=
 =?utf-8?B?UzhMR0pxdWwxU2tSbGl2eVZiaWp6WHRYVnBsVXFXU2FnVTVHTHZhb2tkVXBT?=
 =?utf-8?B?TEdWdHlNTmVOdm1DNml0NkJoWWFha3E5cFBXTXoxYTR0T1dpMHBPd0hMVmpr?=
 =?utf-8?B?SEUzT3Vab3RncHZLa2djTkFpTWErWk9TYklmYWsrZVYwcjZRL3N6Y2NnZ3VW?=
 =?utf-8?B?dHdjcGV4ck1OdnNSTzNIa2M0MjdUY0I4clhBTGZ6YTkyaHdJcEFBbUh4aVo0?=
 =?utf-8?B?TFd6cERyVnNRak1ZNE5BY2pBVWhOUGlndjV3ekR2dDdSZnBvWFNEbnREbHJv?=
 =?utf-8?B?ZkpzNjBid21Nd2F3Z2x2ZDdjOGhoQUFkdG9vQWY3U2ozdzBIUEdxR1lReFVD?=
 =?utf-8?B?N2FiWVVEL1JINUExZjduZGszaVl0cDAzUkdmblphcVphckFYb2J6cEF3dlB0?=
 =?utf-8?B?Z1kyeFJEUDQ5bk40NWthTGZYWXVwUGFjNzhtTjFMQzFhZS9PMGVMV2N4dWpU?=
 =?utf-8?B?NWpRdm9xRFRoMjVacjRTS2p1YnpMeVZ0SHJYVkgvZ2pnTy8wSVJYM3RhVThh?=
 =?utf-8?B?a1lMK1NkR3djVHNRUE1qMzFTdnVnTGFuSUhIK0VEMVNOVWsvVGxpSnBpaTBp?=
 =?utf-8?B?SWQxb0ZnV3NlcUVTYVVTUXRmTHd2U1B6aWJXcHBuVU1qMlZsRU4zMXQzdnF3?=
 =?utf-8?B?TUFwbTNUOGY4S1FFWXRyYUVpalA3RFBZZWhYNVdVZzdFNG1EUUpNK3NTeDVa?=
 =?utf-8?B?cVNGUmhNL2Q5RTBOZllUc3pHQ3c5RE85bnNtMUlHYUZESlJ2RU9LTHlVWXVV?=
 =?utf-8?B?UkpCQ2dDTTY0QjRzc0RJVVlZQmVmSW4yL3h3ZkxFUEg0bUdRcmk5RElqdGJq?=
 =?utf-8?B?MGhYWXc0RnYxdmJKOVhETWdRblU1dG5VM2lOTHBrbnF5ZjZieGJzcGF1RG1k?=
 =?utf-8?B?cmpYNkhHOE5GTitaUkJteDUwNzAvTEN0TUdxV1FudFJWSGpFV1lrNzQ3RHFo?=
 =?utf-8?B?MkVmVXoyOXlzZVFKRENZVXhaL0hwV0FoRmhUQTJ5QTdXWlIvTk5jaExaRTZ2?=
 =?utf-8?B?WlR6dm5pbWhCUzRzaHE3Tk9ObE00S0t0NmkranNuU0hzTkg0NUpjRm5lRGxF?=
 =?utf-8?B?U0JKTEpqNDg5WE1xY1pnUis0TUNUUEZHTEVZVURNSVZGcll2KzFSVVd4RkRY?=
 =?utf-8?B?STN2WWI5azl1TlNCWWJBUEZFYlR4K0NpV3VyRzNaK3VXUElWNmNlRVJzZk1s?=
 =?utf-8?B?R0lKQlJVR3N5OVA5YUhGS2FEMk9KbnNJY3F5dXdpNG1aMjUwZTRhZm4rdElB?=
 =?utf-8?B?dzBkYVJlTU90cFFXMWxYQ2poMlE4T3N4MTRhSnpSVmwrWGtzZmxNSVlxYmxo?=
 =?utf-8?B?VWRrMTBBNUhlRE0yS3RqYmVJRXZTSkdkR2hzZEtwaHdpcTFYOVBSN0tFdTBz?=
 =?utf-8?B?b20zVm1jK3FHblIyb0JSYkZCZ01rdms0ZUtOdXlWK0lyRG91b0I2NStKanJy?=
 =?utf-8?B?NE5yRUNjRmNXSml6b1lYNmxET0FlT3YyblczMjRnK3FOS0FCVGtXSHZ4OE1V?=
 =?utf-8?B?eHNIVForRHdKRGVuN1JNRkFabWxyRkhrZk56VXhiT3ZTbXR1VkdCb2N5REFG?=
 =?utf-8?B?N0hTbUljL0JrY1kwWVFSSFJVK0I0WUFOL0RpNm1IZ3hhQWRwdlRFU0d6ODFW?=
 =?utf-8?B?dXdFVVJ2aE04cVk5OHlnK2NrbUhwbDdlLzVtc01uRTkveklxbG93bk9FdEdC?=
 =?utf-8?B?MzQzbzRKdmcwTjJ6TmFoeWx2UG5hN1gwMDVxbnE1Zmh2WllDKzIydFNCN2FM?=
 =?utf-8?Q?i9ayaxQN/IwxqcnO9yBlBhZwq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657042c1-7264-48d7-dd58-08dbe065a515
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 14:18:56.8581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C4ZvQExqdvTr5uNerpDtdz6sJVr9i6sTY1kLTgshw5NYJHVRG7pm6b0dSBCGoi2Y6mQuMizw50byX9CLL/PQZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5227
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QW5kcmVhcywNCg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkJScywgIA0KQmluZ2J1IENhbyANCg0KPi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQW5kcmVhcyBIZWxiZWNoIEtsZWlzdCA8
YW5kcmVhc2tsZWlzdEBnbWFpbC5jb20+DQo+U2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciA4LCAy
MDIzIDEwOjExIFBNDQo+VG86IEhhbnMgZGUgR29lZGUgPGhhbnNAaGFuc2cub3JnPjsgQ2FvLCBC
aW5nYnUgPGJpbmdidS5jYW9AaW50ZWwuY29tPjsNCj5saW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmc7IHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb207DQo+bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tDQo+Q2M6IGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbTsgaGRl
Z29lZGVAcmVkaGF0LmNvbTsNCj5pbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbTsgY2xhdXMu
c3RvdmdhYXJkQGdtYWlsLmNvbTsNCj50ZmlnYUBjaHJvbWl1bS5vcmc7IHNlbm96aGF0c2t5QGNo
cm9taXVtLm9yZzsNCj50b21pLnZhbGtlaW5lbkBpZGVhc29uYm9hcmQuY29tOyBiaW5nYnUuY2Fv
QGxpbnV4LmludGVsLmNvbTsgUWl1LCBUaWFuIFNodQ0KPjx0aWFuLnNodS5xaXVAaW50ZWwuY29t
PjsgV2FuZywgSG9uZ2p1IDxob25nanUud2FuZ0BpbnRlbC5jb20+DQo+U3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAwMS8xNV0gbWVkaWE6IGludGVsL2lwdTY6IGFkZCBJbnRlbCBJUFU2IFBDSSBkZXZp
Y2UNCj5kcml2ZXINCj4NCj5IaSBIYW5zLA0KPg0KPk9uIFdlZCwgMjAyMy0xMS0wOCBhdCAxMjoy
NSArMDEwMCwgSGFucyBkZSBHb2VkZSB3cm90ZToNCj4+IEhpLA0KPj4NCj4+IE9uIDEwLzI0LzIz
IDEzOjI5LCBiaW5nYnUuY2FvQGludGVsLmNvbcKgd3JvdGU6DQo+PiA+IEZyb206IEJpbmdidSBD
YW8gPGJpbmdidS5jYW9AaW50ZWwuY29tPg0KPj4gPg0KPj4gPiBJbnRlbCBJbWFnZSBQcm9jZXNz
aW5nIFVuaXQgNnRoIEdlbiBpbmNsdWRlcyBpbnB1dCBhbmQgcHJvY2Vzc2luZw0KPj4gPiBzeXN0
ZW1zIGJ1dCB0aGUgaGFyZHdhcmUgcHJlc2VudHMgaXRzZWxmIGFzIGEgc2luZ2xlIFBDSSBkZXZp
Y2UgaW4NCj4+ID4gc3lzdGVtLg0KPj4gPg0KPj4gPiBJUFU2IFBDSSBkZXZpY2UgZHJpdmVyIGJh
c2ljYWxseSBkb2VzIFBDSSBjb25maWd1cmF0aW9ucyBhbmQgbG9hZA0KPj4gPiB0aGUgZmlybXdh
cmUgYmluYXJ5LCBpbml0aWFsaXNlcyBJUFUgdmlydHVhbCBidXMsIGFuZCBzZXRzIHVwDQo+PiA+
IHBsYXRmb3JtIHNwZWNpZmljIHZhcmlhbnRzIHRvIHN1cHBvcnQgbXVsdGlwbGUgSVBVNiBkZXZp
Y2VzIGluDQo+PiA+IHNpbmdsZSBkZXZpY2UgZHJpdmVyLg0KPj4gPg0KPj4gPiBTaWduZWQtb2Zm
LWJ5OiBCaW5nYnUgQ2FvIDxiaW5nYnUuY2FvQGludGVsLmNvbT4NCj4+ID4gUmVwb3J0ZWQtYnk6
IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+PiA+IFN1Z2dlc3RlZC1ieTog
QW5kcmVhcyBIZWxiZWNoIEtsZWlzdCA8YW5kcmVhc2tsZWlzdEBnbWFpbC5jb20+DQo+PiA+IC0t
LQ0KPj4gPiDCoC4uLi9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LXBsYXRmb3JtLXJlZ3MuaCB8
IDE3OSArKysrDQo+PiA+IMKgZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LmPCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDk1Mg0KPj4gPiArKysrKysrKysrKysrKysrKysNCj4+ID4gwqBk
cml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MzUyICsrKysrKysNCj4+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDE0ODMgaW5zZXJ0aW9ucygrKQ0K
Pj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lw
dTYtcGxhdGZvcm0tDQo+PiA+IHJlZ3MuaA0KPj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYuYw0KPj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYuaA0KPj4NCj4+IDxzbmlwPg0KPj4N
Cj4+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni5jDQo+
PiA+IGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LmMNCj4+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi44NDk2MGEyODNkYWYNCj4+ID4g
LS0tIC9kZXYvbnVsbA0KPj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lw
dTYuYw0KPj4gPiBAQCAtMCwwICsxLDk1MiBAQA0KPj4NCj4+IDxzbmlwPg0KPj4NCj4+ID4gK3N0
YXRpYyBpbnQgaXB1Nl9wY2lfY29uZmlnX3NldHVwKHN0cnVjdCBwY2lfZGV2ICpkZXYsIHU4IGh3
X3Zlcikgew0KPj4gPiArwqDCoMKgwqDCoMKgwqBpbnQgcmV0Ow0KPj4gPiArDQo+PiA+ICvCoMKg
wqDCoMKgwqDCoC8qIGRpc2FibGUgSVBVNiBQQ0kgQVRTIG9uIG10bCBFUzIgKi8NCj4+ID4gK8Kg
wqDCoMKgwqDCoMKgaWYgKGlzX2lwdTZlcF9tdGwoaHdfdmVyKSAmJiBib290X2NwdV9kYXRhLng4
Nl9zdGVwcGluZyA9PQ0KPj4gPiAweDIgJiYNCj4+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIHBj
aV9hdHNfc3VwcG9ydGVkKGRldikpDQo+PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBwY2lfZGlzYWJsZV9hdHMoZGV2KTsNCj4+ID4gKw0KPj4gPiArwqDCoMKgwqDCoMKgwqAvKiBO
byBQQ0kgbXNpIGNhcGFiaWxpdHkgZm9yIElQVTZFUCAqLw0KPj4gPiArwqDCoMKgwqDCoMKgwqBp
ZiAoaXNfaXB1NmVwKGh3X3ZlcikgfHwgaXNfaXB1NmVwX210bChod192ZXIpKSB7DQo+PiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBsaWtlbHkgZG8gbm90aGluZyBhcyBtc2kg
bm90IGVuYWJsZWQgYnkgZGVmYXVsdA0KPj4gPiAqLw0KPj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcGNpX2Rpc2FibGVfbXNpKGRldik7DQo+PiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4+ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPj4gPiArDQo+
PiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHBjaV9hbGxvY19pcnFfdmVjdG9ycyhkZXYsIDEsIDEs
IFBDSV9JUlFfTVNJKTsNCj4+DQo+PiBUaGlzIGRvZXMgbm90IHdvcmsgb24gVEdMIHN5c3RlbXMg
KGFuZCBpcyBub3QgcmVhY2hlZCBvbiBBREwgYW5kIFJQTCkuDQo+Pg0KPj4gVGhlIG91dCBvZiB0
cmVlIGRyaXZlciBpbnN0ZWFkIHVzZXM6DQo+Pg0KPj4gwqDCoMKgwqDCoMKgwqAgcmV0ID0gcGNp
X2VuYWJsZV9tc2koZGV2KTsNCj4+DQo+PiBhbmQgdGhhdCBkb2VzIHdvcmsgY29ycmVjdGx5IG9u
IFRHTC4NCj4NCj5EaWQgeW91IHNlZSBteSBwcmV2aW91cyAoMjUvLzEwKSBjb21tZW50IG9uIHRo
ZSBzYW1lIGxpbmVzPw0KPg0KPnBjaV9hbGxvY19pcnFfdmVjdG9ycyByZXR1cm5zIG51bWJlciBv
ZiBpcnFzLCBzbyB0aGUgImlmIChyZXQpIiBjaGVjaw0KPmZvbGxvd2luZyB0aGUgcXVvdGVkIGxp
bmUgaXMgd3JvbmcuDQoNCkFuZHJlYXMsDQoNCllvdSBhcmUgcmlnaHQsIHRoZSBhY3R1YWwgcHJv
YmxlbSBpcyB0aGUgcmV0dXJuIHZhbHVlIGNoZWNraW5nIGlzIHdyb25nLg0KDQpIYW5zLCB0aGFu
a3MgZm9yIHlvdXIgcmVwb3J0LiBJIGRvbid0IGhhdmUgVEdMIGRldmljZSBub3cuIOKYuQ0KSSB3
aWxsIGZpeCBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCg0KPg0KPi9BbmRyZWFzDQo=
