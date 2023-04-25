Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53ED56EDDBA
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 10:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233558AbjDYINL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 04:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233573AbjDYINK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 04:13:10 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1784DAF
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 01:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682410387; x=1713946387;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nuc0I4xrX01L166oQ2Fofoo7/FpSBE+yI6AOVKBVILo=;
  b=gHjroRL3HYrM5g8DxGGf0dWMCk7VzHuEZIdj5PwGqIlJt0Y351ZOot/k
   ZVeU0dQluEHBo4YM+7vSQ7DFcWRA8ygA7IY2jTMO4gAmSv6NLDoa+ursi
   ChT/nX0k+fovYucMZkXxSSLR3Fud1peykFrAVwffDXwanYFcDMtmoDGCX
   f04iQBgsupfYSo5+4p5JJNmckIfYtJ2i/yGIKKuFpOnbPJsowqU/pgJ2q
   O5BBoVCwLFfDh/W9mwMBjiQQhjplVcJDCLKstxRfMTFksySBInKFldJRa
   OPPGjU3pHAOogH8b6MB6kB0M26UoMdshHloxGvR0d/7Fz6uzNdcWGlEbt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="348606523"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="348606523"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 01:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="817582471"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="817582471"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP; 25 Apr 2023 01:13:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 01:13:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 01:13:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 01:13:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 01:13:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfr/owB4vdx1AVO94fga8P1p+XgCy48ygnLF6bjlxeSM6bvlUl3t8eZSbfY+6oJCs6xYYTSvtYrGd5iWL6COFiRUJwXOJeJd5hPPaV52e4itxtRMQgsSAgtn5sEU4fDXzHLocjCwgYuagRAeSSvENzGVOhRJOhyO0HIBkfLEsl+aa3RBd3QavA9nvuDT+JT1kcS3k4xoWbdaTnCkXzKnFB+pDpLFpdfeK+SWGrC4D4zJeWi5USAQwnFBDv0sVbJP1cRoNxtYGr2Aw1jiQkL89aLgnhrtfxeseQCIOLorfmDkP+CQz7qAgfv/K3DP2fZP4597orOJXXICDum1VsFp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuc0I4xrX01L166oQ2Fofoo7/FpSBE+yI6AOVKBVILo=;
 b=CM4EQtSkaot7EPcKO8RmHFhVtKbe8M7t6R4iFmM1HlyJ02XcZcEybm4wtMYF4PmzjocqcNgxDeb8ZEp9p4MomFpoh0Hm7K9Rb0/zTuLiagKddranoJo7eEXj4crTvglZCrNTX/ZUm0gnLtQ1I1rEKk0UGPodK6Gj3V7bO7WAVssOHemK5B0mzVz8Ffo0KP6AzDtg2ZhxQAqZxWlEJeQ54mXEygRab0GP0aFb3h3R7NB1kmiyMNS5a9uu7/9Hw9RY8q6LTf2CS+pmxPEmdWtBHO5Utpb3NFDDFMCAtTQNpubRm5zDFjHtQ8TJXpWuukINj5LW71tcB6sET34cldGvDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.32; Tue, 25 Apr 2023 08:13:02 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::7caa:b0e7:d0fb:c905]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::7caa:b0e7:d0fb:c905%5]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 08:13:02 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Ye, Xiang" <xiang.ye@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: RE: [PATCH v6 3/3] ACPI: delay enumeration of devices with a _DEP
 pointing to IVSC device
Thread-Topic: [PATCH v6 3/3] ACPI: delay enumeration of devices with a _DEP
 pointing to IVSC device
Thread-Index: AQHZdxeS2bElrfr26Em8ykMR09vOca87qzgAgAABrFA=
Date:   Tue, 25 Apr 2023 08:13:01 +0000
Message-ID: <DM6PR11MB4316CD3220E6DE5416166C088D649@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1682387039-16674-1-git-send-email-wentong.wu@intel.com>
 <1682387039-16674-4-git-send-email-wentong.wu@intel.com>
 <d8da36f6-0796-ceef-8ea5-0ade836acda4@redhat.com>
In-Reply-To: <d8da36f6-0796-ceef-8ea5-0ade836acda4@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DS0PR11MB6424:EE_
x-ms-office365-filtering-correlation-id: 403a08c8-7791-4d13-4f0b-08db4564e36c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cOiVEKk6Ey15N4X+7vi8VX2rWYCoZTe8b3uDi/emNQP9E3losHl2v8RSTNYl4Q+eg9rBuzkBnikrHJG6S3xs3cJQohRE6OmTl8doI0T88e3SqJegyQJEej6J36SiRjm6Q+22lJvY5CZJFEi0I+yVgsFN6PHa7tooVmA3xL/yo/ACZu24giRTtr+8p2e9E87cP36yHDO2lFTnw/R2aVhglsk7ubWK5bNNccOPvsvFQJ2Fw5nKM3aSjEHOjjbhjkrM7mfzU0sEXBK4t96IkiLvuATAmRP3WmXo3gECOmpXH0YTyp0vRI1XiuEtl79vSf8ozvNGCxci2qafybXbIiGMFUAbeeo+doyQmTXTEpDcDkKV6Y5ooAYoUez+rslDSahy/XLPg5hTkoKLTjjJjNBaNrPu7TEvPatr40MBVErnScxEpZFPJUnDSBWn2HhZ0jt9b/1Ms5kNRlQNlYD1PU/VGX6XIzcZdcDaczE8vVrTFTppMjcg3wuRw+SNqAaqMqRH/WeivrnGj9M5B5HSqIfilE5Io33iGNwk7xmUAzTFBCjkisNp5mZQxZSQLBiabCwgTi7N3u9EVEifb4bRF+839IcLy8sWLo3oLOdjcOkNwwj8FJ5iALr+CirHNcjdm0Dz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(6506007)(26005)(53546011)(9686003)(33656002)(5660300002)(38100700002)(52536014)(86362001)(186003)(83380400001)(7696005)(71200400001)(478600001)(54906003)(110136005)(38070700005)(41300700001)(2906002)(8936002)(8676002)(82960400001)(64756008)(66446008)(66476007)(55016003)(66556008)(66946007)(4326008)(122000001)(316002)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVM0cjBXWmE4cW1abGNEdlNLMCtuU1kyTjRaM2YvY2g5VzhZR3VXRytCT3dr?=
 =?utf-8?B?bHhYYmt3Q1E2MHZKWEZyYk1mSkhIYy8zUjhINCtpTEpKSk9jWVRlQUdKcHhS?=
 =?utf-8?B?RzlmN2VYOXJKRmdLOXMzMXpZR1hCc3hraFlvdytrVXJSbEpmYXYxRXNBaVdm?=
 =?utf-8?B?UkdnbFlmeWs0UDR0cWQ5Z3ZIcnJlaDJMNyswdmlWalpPQ09Sc2toVTNaZFlC?=
 =?utf-8?B?N2tYa0FFaW82Ni9vVkh5QzJXWHV6QTlYaTZMZlYxb1hGcTdjbFV3UWQzdWx1?=
 =?utf-8?B?Ny9TeTQ2b0VwQVE4c2VVcklRMlJULzdheHFoK0ZmdTJqV3JyWUFkc2E2MkZq?=
 =?utf-8?B?V1lEYWZMWmpyYTFLT3BqQ29SWVVaSTRqdktwVVZodjRCdDlLYm5aUGNONkV2?=
 =?utf-8?B?aEdKbDRNcE1KQnh6REt4d0pTR2x5UWVOd0RHdW5Va3BHdWh2WFRSYVJRSGxq?=
 =?utf-8?B?RkUwQnM5UHpubUhkQ3JkK3BXRklTMHVoN0FrSzlZY25sMFFORlBLdEkremhq?=
 =?utf-8?B?a0pQMmV6MUhOak1HWGxFdjk1WURCSDYybS9YOHd1a1RhVmliZ3MzcjJiTk94?=
 =?utf-8?B?VUZRa1NiVWhlMTM5ZXFQWDdrekJvVVAzQll3ekhxNHl1amd4OXJMY0RRdEMv?=
 =?utf-8?B?QWJZM1AvdWpxeFZlSjgybUI4NUJRcForTHNZSHhBNGdkOURHU25NZzVXL3lY?=
 =?utf-8?B?aWQ1UEJyVzBmajdhTW5Feld5NGVkNlUxeGZsMExnZ1ZTMUJEUldqQzRVcGFZ?=
 =?utf-8?B?R3J0RmwvOWF6Yys5dUhob05EQVk0aHdHUU03OXR5M0J2STBaUXEvb29YVERR?=
 =?utf-8?B?MFFjNVd3WWpzRzV4VGdDSjJjOEc1c3VjWlpTemZKWW82dkVTVUlRTGFpU09H?=
 =?utf-8?B?QjMydzAvb1I0TzBrQ0dCR1p0YldqdmtuMHdPOGJhMHlDaDBPYWM4cVNBemJF?=
 =?utf-8?B?VFlNNWlPbEtjYjBxYk1GZnc0R0tuRStSQ21QT0VkbGE5bVQzcXVqTGdTZnJv?=
 =?utf-8?B?RUcvZGpQZlExeW1GeTVodUtyZmdDZ3NwMy94NFJTQnpsWXNRTElrNFJyRTV5?=
 =?utf-8?B?MzFUWWRUNG5NUzNLMy9zUTd3ZmJON2NjcUE4QW16czQxY0kzOUMrSkhRejdi?=
 =?utf-8?B?ZEFaeFFCUzdKS0l6WmwveUF1T0gyOUg0YkpEQ3BmdE14L3A1bFc5QVFLYUE5?=
 =?utf-8?B?RURsTW9Vcll3cDZUb2gwajMyUVJQdDEyRTF6Lys3WUtUQi9Hb0MzSDJWQVli?=
 =?utf-8?B?bGU5Wlh3MkFSVmNVVllqdlpMQnRxVFM5UFF2dTdqeElVeTJQNXRzaWpCVmMv?=
 =?utf-8?B?anVNKysyYU9mVFFrMWtJLzVjUmRaeFBFV0ZQWVF1RjlLMDh0QmxmdWllVTRs?=
 =?utf-8?B?MENhdlpqNFRtaWdYdlkrWXVET3d3UE5KNWJFeHV4YmRUbXkvYXUxRGgvNG1R?=
 =?utf-8?B?Nkk0cnY4N2dLSEJ3cUZWMjZUOVl0a1hrSHlzS01tYlQrT0FBNlVmbU1ya0Zo?=
 =?utf-8?B?cEg2RmY3V0ZpWkFlenNOZWZkVm50UkFkTVl2R0EySmk3UDdFM2lNM1hCMXJh?=
 =?utf-8?B?eHVhdlY1UW9FYVJBYzlKbXpuaVhoaHNlNUZRT3VhbWtBUDVmUEtCVWNYcWR4?=
 =?utf-8?B?aC9jSXlGaWIxbng5eE1CRG1haHQ3SUw2bkRmMXdlSnRXYXFDNG1QRDVJKzFQ?=
 =?utf-8?B?ZGRCSGNzWjF0bXl6Vm5iekg0SDl3S3JvYVBxa09oejZoU0NRVU41MTUzYVNN?=
 =?utf-8?B?aGRuT0ZXcUdKMGtIcktUZkRtUG1FZ1B5ekdCbktaWXRQaFlVVlowNVNtV1FT?=
 =?utf-8?B?Q2w2MktuVzl5NUJmVTV4eEVncXpDSUpSdFZSZGFEY09jS2puWVlOUFVocUdI?=
 =?utf-8?B?Z2VTUXZqbnZraUlSK2tLT09rKy8yQ0tYM08vdHFpeHVyVUM0TURZOFp4MGJI?=
 =?utf-8?B?b3EzN1BLeFlaVjBTUXJORFJTQ0NOc2IrbEZNMkI3V1FGVDFtUVRuUU4xMXFD?=
 =?utf-8?B?YUs4OGwrWnhZWk9wOExPWHlSQkNxR2w3QkM3ZGk0OWlxNkdBelpuQlFoWHRu?=
 =?utf-8?B?RHplRlpORjY0aWZtLzFDMjdJMytkM3RnVTZJUE1Pc055YjNMN0xtZkkyUjNM?=
 =?utf-8?Q?3RkoWV+k9n93PTh3gOWJQdRQ7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403a08c8-7791-4d13-4f0b-08db4564e36c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 08:13:01.7393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O4UXhD6wBkbkDXh4SBHAQlQH6YSu/t2cYP6j4K5Rm0VqfHHHySGEhXFJDLl/2Vn5ZTIOXsMU3oEzQ1vFEL9xzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6424
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucywNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+
IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDI1LCAyMDIzIDQ6MDYgUE0NCj4gDQo+IEhpIFdlbnRvbmcs
DQo+IA0KPiBPbiA0LzI1LzIzIDAzOjQzLCBXZW50b25nIFd1IHdyb3RlOg0KPiA+IEluc2lkZSBJ
VlNDLCBzd2l0Y2hpbmcgb3duZXJzaGlwIHJlcXVpcmVzIGFuIGludGVyZmFjZSB3aXRoIHR3bw0K
PiA+IGRpZmZlcmVudCBoYXJkd2FyZSBtb2R1bGVzLCBBQ0UgYW5kIENTSS4gVGhlIHNvZnR3YXJl
IGludGVyZmFjZSB0bw0KPiA+IHRoZXNlIG1vZHVsZXMgaXMgYmFzZWQgb24gSW50ZWwgTUVJIGZy
YW1ld29yay4gVXN1YWxseSBtZWkgY2xpZW50DQo+ID4gZGV2aWNlcyBhcmUgZHluYW1pY2FsbHkg
Y3JlYXRlZCwgc28gdGhlIGluZm8gb2YgY29uc3VtZXJzIGRlcGVuZGluZyBvbg0KPiA+IG1laSBj
bGllbnQgZGV2aWNlcyBpcyBub3QgcHJlc2VudCBpbiB0aGUgZmlybXdhcmUgdGFibGVzLg0KPiA+
DQo+ID4gVGhpcyBjYXVzZXMgcHJvYmxlbXMgd2l0aCB0aGUgcHJvYmUgb3JkZXJpbmcgd2l0aCBy
ZXNwZWN0IHRvIGRyaXZlcnMNCj4gPiBmb3IgY29uc3VtZXJzIG9mIHRoZXNlIG1laSBjbGllbnQg
ZGV2aWNlcy4gQnV0IG9uIHRoZXNlIGNhbWVyYSBzZW5zb3INCj4gPiBkZXZpY2VzLCB0aGUgQUNQ
SSBub2RlcyBkZXNjcmliaW5nIHRoZSBzZW5zb3JzIGFsbCBoYXZlIGEgX0RFUA0KPiA+IGRlcGVu
ZGVuY3kgb24gdGhlIG1hdGNoaW5nIG1laSBidXMgQUNQSSBkZXZpY2UsIHNvIGFkZGluZyBJVlND
IG1laSBidXMNCj4gPiBBQ1BJIGRldmljZSB0byBhY3BpX2hvbm9yX2RlcF9pZHMgYWxsb3dzIHNv
bHZpbmcgdGhlIHByb2JlLW9yZGVyaW5nDQo+ID4gcHJvYmxlbSBieSBkZWxheWluZyB0aGUgZW51
bWVyYXRpb24gb2YgQUNQSS1kZXZpY2VzIHdoaWNoIGhhdmUgYSBfREVQDQo+ID4gZGVwZW5kZW5j
eSBvbiBhbiBJVlNDIG1laSBidXMgQUNQSSBkZXZpY2UuDQo+ID4NCj4gPiBPbiBUR0wgcGxhdGZv
cm0sIHRoZSBISUQgb2YgSVZTQyBtZWkgYnVzIEFDUEkgZGV2aWNlIGlzIElOVEMxMDU5LCBhbmQN
Cj4gPiBvbiBBREwgcGxhdGZvcm0sIHRoZSBISUQgaXMgSU5UQzEwOTUuIFNvIGFkZCBib3RoIG9m
IHRoZW0gdG8NCj4gPiBhY3BpX2hvbm9yX2RlcF9pZHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBXZW50b25nIFd1IDx3ZW50b25nLnd1QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9hY3BpL3NjYW4uYyB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9zY2FuLmMgYi9kcml2ZXJzL2Fj
cGkvc2Nhbi5jIGluZGV4DQo+ID4gMjc0MzQ0NC4uODkzNjhkNyAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2FjcGkvc2Nhbi5jDQo+ID4gKysrIGIvZHJpdmVycy9hY3BpL3NjYW4uYw0KPiA+IEBA
IC03OTYsNiArNzk2LDggQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBhY3BpX2lnbm9yZV9k
ZXBfaWRzW10gPQ0KPiA+IHsNCj4gPiAgLyogTGlzdCBvZiBISURzIGZvciB3aGljaCB3ZSBob25v
ciBkZXBzIG9mIG1hdGNoaW5nIEFDUEkgZGV2cywgd2hlbg0KPiA+IGNoZWNraW5nIF9ERVAgbGlz
dHMuICovICBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGFjcGlfaG9ub3JfZGVwX2lkc1tdID0g
ew0KPiA+ICAJIklOVDM0NzIiLCAvKiBDYW1lcmEgc2Vuc29yIFBNSUMgLyBjbGsgYW5kIHJlZ3Vs
YXRvciBpbmZvICovDQo+ID4gKwkiSU5UQzEwNTkiLA0KPiA+ICsJIklOVEMxMDk1IiwNCj4gDQo+
IENhbiB5b3UgcGxlYXNlIGFkZCBhIHNob3J0IGNvbW1lbnQgYWZ0ZXIgdGhlc2UgdG8gZXhwbGFp
biB3aGF0IHRoZXkgYXJlIGZvciwNCj4gZS5nLjoNCj4gDQo+IAkiSU5UQzEwNTkiLCAvKiBJVlND
IChUR0wpIGRyaXZlciBtdXN0IGJlIGxvYWRlZCB0byBhbGxvdyBpMmMgYWNjZXNzIHRvDQo+IGNh
bWVyYSBzZW5zb3JzICovDQo+IAkiSU5UQzEwOTUiLCAvKiBJVlNDIChBREwpIGRyaXZlciBtdXN0
IGJlIGxvYWRlZCB0byBhbGxvdyBpMmMgYWNjZXNzIHRvDQo+IGNhbWVyYSBzZW5zb3JzICovDQo+
IA0KPiA+ICAJTlVMTA0KPiA+ICB9Ow0KPiA+DQo+IA0KDQpZZXMsIEkgd2lsbCBhZGQgY29tbWVu
dHMgaW4gbmV4dCB2ZXJzaW9uIHBhdGNoIHNldCwgdGhhbmtzDQoNCkJSLA0KV2VudG9uZw0KDQo+
IFJlZ2FyZHMsDQo+IA0KPiBIYW5zDQo+IA0KDQo=
