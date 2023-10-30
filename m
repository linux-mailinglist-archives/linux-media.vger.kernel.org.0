Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5AD07DB335
	for <lists+linux-media@lfdr.de>; Mon, 30 Oct 2023 07:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbjJ3G3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Oct 2023 02:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjJ3G3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Oct 2023 02:29:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DD4AC
        for <linux-media@vger.kernel.org>; Sun, 29 Oct 2023 23:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698647345; x=1730183345;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4wwtbTCjb326WVXy8AJh/zYDMFawP2DmwZTNYG7Pa7w=;
  b=mUwzC20BqgOJaEj2AoGveMApQdNMzFs6/89viWuP6VJhb+WPxiqhSlE2
   I44pclbo6A7knLmMGQlAS+PVzNb8ucfqhvXHu6+MRZWs11IRX55n/uUnF
   00M2sz5krJ5Lb6UzxXBhNiVWSjuCSpT9TicAEsI+wqtVPtdaPedj/vJ3F
   tyOrhcNNtF3+esNqqV7MMdNu7GgPZiC1BYEe9PoL5qPp/Tn79Q7vnOGWf
   Oe16vItut40Z4oowuNNyC7+yD4b81FAvgHMOkL3d2dn3mp4KjKHFSNQ7y
   fGCGXUj00SytZ54Z9GauNWTAjrVLKZPsYPD+pDhdxbXXJrZgB9liqXPYY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="856405"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="856405"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 23:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="795175729"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="795175729"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Oct 2023 23:29:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 29 Oct 2023 23:29:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 29 Oct 2023 23:29:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 29 Oct 2023 23:29:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMjLfdC239N6SVhBsOQ7lb1/d8imLY7xka8eefFD/3V9hUQ072TBaFQJpaQ27svkHA+dhE0L1TFg3PpA2imPRnLNwiTxCJwmqomy/Kj4SUUOjj7IR21r4e1/sv35TT2qXJ4EIyyfOFd/Df06gTXqiCg6bULVd/i+EwIIuplX7AO7f2zz63htOv6bsJ8rE0eve5wxBy2efASSlBPlW6aCqs7i8/gi4ruYHgo+8Z8ZGYgrNs7LmS7Fnn/Ng7qg1hVKY0p7gx0S/PoAGzcsUXRwRTgswLKlUgd9ogP4t+7mUxoQUvUVd9EJATWC5Wcpm6dY2ZBMo1FxQtewfEVXmWLVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wwtbTCjb326WVXy8AJh/zYDMFawP2DmwZTNYG7Pa7w=;
 b=CRlmN1ILK3rMyopQ7drpWYy4Px2vDf/3gYD6P3/N3W9rU3Gw0BbFMT46huoEDVJXLfW9d3UdPK83n+YC8q1ZcCM87P8iE5WtP7WlePLVXHFEaYYmX8WjGCbYH69tDo6D0OoEo7QQlDWBUDjnqjPrwhL5wnDNYdNlddvlQgx6KppCONRdBQwZXYLlJLAsY56y8cxaXkztDPVHiDaU/XYQ09bGFQ4UcBM6lFmk2cCyjrPoEVbNxqRWLJlD9bFrvdKVglzM7gJWBYb9lrM5yO1Po8i0gtlrQOw5+Gc3zUmUo9eqN2FGIbLDTL/FmZLiCCpXT0gLsTOfMMohUxOunCpzfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22)
 by SJ0PR11MB7701.namprd11.prod.outlook.com (2603:10b6:a03:4e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Mon, 30 Oct
 2023 06:29:00 +0000
Received: from DS0PR11MB7459.namprd11.prod.outlook.com
 ([fe80::222f:4742:8c64:bcc4]) by DS0PR11MB7459.namprd11.prod.outlook.com
 ([fe80::222f:4742:8c64:bcc4%4]) with mapi id 15.20.6933.019; Mon, 30 Oct 2023
 06:29:00 +0000
From:   "Chen, Jason Z" <jason.z.chen@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     "Yeh, Andy" <andy.yeh@intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Zhang, Qingwu" <qingwu.zhang@intel.com>
Subject: RE: [PATCH v1] media: ov08x40: Add Signal Integration Adjustments for
 specific project
Thread-Topic: [PATCH v1] media: ov08x40: Add Signal Integration Adjustments
 for specific project
Thread-Index: AQHaAwtv2oX6JiI7XkS5hMYNCLfGbLBSpxaAgAV6rICACY4wEA==
Date:   Mon, 30 Oct 2023 06:28:59 +0000
Message-ID: <DS0PR11MB74593A4B30FCAD69EAF750C9CCA1A@DS0PR11MB7459.namprd11.prod.outlook.com>
References: <20231020040908.2706654-1-jason.z.chen@intel.com>
 <169780733955.3350128.8191848389476305605@ping.linuxembedded.co.uk>
 <20231024004921.GA27390@pendragon.ideasonboard.com>
In-Reply-To: <20231024004921.GA27390@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7459:EE_|SJ0PR11MB7701:EE_
x-ms-office365-filtering-correlation-id: f9714ca4-9ff9-4cdc-30bc-08dbd9118065
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4YJ+zxoAS7K1Hm2ipIJFy/Wyc59SqjVHbyFYK7MplgWBta5Zgdp9NtONlZJhSsncKRACRIvyJeyMEZ3rzWxU9Gq6yjtnBAaMEZv9BUO9fhSwEVPNVjfSRy8LBy1uyQBW4OLRsEjzROJaE+x8diM3pVMufH+Jfu1a6oH7erKFQCLRACGrmWCbBOXKp7Q2DsH+QNzg1TUsqJQ69EgQCrY7Iy2fQVCpjZ8xMDhECJHP1Lfe8lxaTCtF7+tMaPfApzbOSRTS3MAcziEVQH/3U5KBFiV6Mo9L7dHfZkL5HW7fuywzRJjMjJv30QkvT3ZjM3kD0iNTES71z28IgVv4ecvuorreIyUGlX/lhhWQXl1CMcFBeCdvdGlCii424NqbVtnx0FXQf9FdHuykysCQ3m4kYU0sxyRxxjzFc66uvFlhOpzVRORkRbwBFGpoTDDv03Ey3WfquFRYTJNEQ8+pp0jwe90smcncAO+6nvOxngeyLfTsVEonljR8aSybgY3E2on/fNh01nV7mP2B58jTprhFz3moLp7lnJl1e+kdnjJE8r/Es1NhFOw0cVUQSjt5P4hPNR4XtLotOWMhc0wRYr3NHbRhgsjKA3A/ypuJMM9tiIWaZGaRkmed5c821A+UNpqK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7459.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(38070700009)(55016003)(110136005)(2906002)(4001150100001)(86362001)(33656002)(8936002)(4326008)(8676002)(66556008)(53546011)(9686003)(478600001)(6506007)(71200400001)(66476007)(54906003)(38100700002)(82960400001)(122000001)(316002)(76116006)(66446008)(64756008)(7696005)(41300700001)(5660300002)(66946007)(52536014)(26005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1BMREJSUHQ4MEtndTR3dkhiUzFlSTNtU0RuaTlPdFVLaHFLOGVWL3d6SGRH?=
 =?utf-8?B?U3hpS1I5UVZkSlFOUWxXVVJzSWQwL0ZDK3VxNXJUYnRZSHRRd0ZTYkg5Yytx?=
 =?utf-8?B?aVNPS3ZCTTk4WFVMNzBHZ0ZXSDJmc1k0VXlBUVdLY2lyc2p2T3RGWlBHUTdE?=
 =?utf-8?B?WFd0MXhyUWVDZ01uRGNhRU1manNuTVBJRFp0ZzBINjliWGVJMHByTmJrTXVL?=
 =?utf-8?B?TjZvaXd3WlFIS3NEYWVPWDNpNFpjTmJEVTNsTTRqYUtabU41TWtSUlNCUlNm?=
 =?utf-8?B?VU1XdlNyb0tjdVluZlhBSnZJa3ZQOUJDeUs3RHJ3ZEVvS0tlNWNUVXRmeUdF?=
 =?utf-8?B?c3BpRTRRelNWcnpSRXlCWkliaVdqSTFtUVV5cnNSTUF2QktTekphUlYybkQx?=
 =?utf-8?B?cTVUc3dROFFDbEp6OHBFOWowVUZkMXU4OFZNeDljMXUyeTdXck1jMzUrVXRl?=
 =?utf-8?B?VTVJMTZYUHlrcTNXc3VXeGVjSzkxNC83ZDZCVkpGbjZnZ21ybnhKcWdtM1JK?=
 =?utf-8?B?bDNWRVNtWnJPa3ArazJtdDZZU2ZsdThyZzdhT0UvdVY3NkpXQWtZaC8zK0Jz?=
 =?utf-8?B?UU9IM2FDeTU4dzlma1lpRnNHOEhUUHVQQWhRSVl4SzBLQnk3Q1E5UUpMMUZl?=
 =?utf-8?B?TVRqcFhJL1d3TDM0bUNwdzNvQWYrMzVXOWtZRm9kb3RXeG4wQUcybnRyMWhy?=
 =?utf-8?B?QVFxdTVrNCtlQ1BTb1JCNTlzdXFJSmNGaks3V0w5dFV6bkIvbCsycVdMOWNN?=
 =?utf-8?B?VTJqcUZreGZxdWVUemw5WjZCWXBGNXhJbitUMEFTYVRWcTNsSHhFc3RyazhZ?=
 =?utf-8?B?UFlWejg0MFZiRFhrNDNyTFFiVGx0MzJMSm9TdDVydkJ5Vlo4QTRINk8yU3BY?=
 =?utf-8?B?STZPdkxwT1BzenE0NzZYOGZpOHAxM3ZTazNKRGRnQjl3OVloVitCR0JtQUUv?=
 =?utf-8?B?a0FrTVZUSkt2d2JnRWV5eENMb2hrV0xpeTJUOXhwekhmcklTN01mb2pkUmxB?=
 =?utf-8?B?WnQwV2gyOVN5cHVWRkk3bHF5enZqWXpXTldFRksvUUZwbEFrQ2M1dmlJZ2lD?=
 =?utf-8?B?bkoxdlcrUkduM0QxcUZzcDQ2NE1kZFdJTGt0WElKcHMyTkVMRFlSNkEyMXR0?=
 =?utf-8?B?dUFJUlNCMFA2UXpXOHNTaG4wMUw1RmF5dk00Ung3b21UTEErYytLdmV6YVd3?=
 =?utf-8?B?YW95S3JITXBrdGhtSTFFaDRiWWRqd094NGRMdmNGTXEvUDRqMEpwS3BPOVZh?=
 =?utf-8?B?WFVKVmQrS2l4MVVJb05PamMrNEdiVFNTN0V4S2w1QloyUlQxL3l5TFZJVmdN?=
 =?utf-8?B?am5OUFpDRGlVOFo3ajhDVHdIaXJxYUFGdjBvY05CZW41eUpNR2sxWUpUQVNs?=
 =?utf-8?B?OXNOUHJHdFRidlVEZ2grbU11ZUI1WDhpOFdlYjh4dGpkSHd6NjhuNlIyQlp0?=
 =?utf-8?B?dGxFWkpsNC9vN05VbE02T2VkbkpuK3ZCWmZWVXFDODlaNmZpSVBDcEh2dmQ2?=
 =?utf-8?B?NVFRTUxvQnNPQStnVFJaTGx0UFpTTm93bWhlRVAyMnlQTmV4Q2NQSFZ2a2JT?=
 =?utf-8?B?N2djcjkraklFY1BPZ3pLWGpHbnVSd05acDZCK3ppYTBMOGZkOWhubVNlUXBB?=
 =?utf-8?B?V2xYcGRlWm9IeDYxY0wreVprOVhEWWh4bTVLSFVPS2tXSS9yRWFlSmcvL2pm?=
 =?utf-8?B?NFpFYW90ZkVRRFZqTzRoeFlXR2ZiMTFyeDMwaCswdFkzTFQyeVJZZ2JzNXVo?=
 =?utf-8?B?L0I2T3kvb1R2OFdQTjVVZ1g1QWtyZHY2akhlRWdIMytieVp4cVRLY2cva3Bn?=
 =?utf-8?B?eTFHY245bWNOd0dCUjVJcW1BdEphVkhBb3h2ZEtwQW5lQUIvbGo1dUVEeTZk?=
 =?utf-8?B?VVoxOFQrcEUvVUFwUlhOOGxZZmVWVEVva1JpbExMT242aFhtcWQzM2Y4eXVG?=
 =?utf-8?B?YjliQnYvVVhwYWh1VUNHbm9SSWpKUitzRFhnczVqTHVFK0t0dUIvelNlVFRL?=
 =?utf-8?B?Yndla1JrdjN0alhkNmxlTklUVndKQ0J1NjN3blRJTDJNZnFNQm95MzFPcXlr?=
 =?utf-8?B?NEZrUFJoVXEyZmRHY25ibWdRNmFtdWFaTmppS3UzWEovRmVBY2daL0tLc2Mw?=
 =?utf-8?Q?cuyKP75jmMSb9hskA2p1RRSVo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7459.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9714ca4-9ff9-4cdc-30bc-08dbd9118065
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 06:28:59.4548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GxGlLtwq0DX+6FiFQ9fozgi9BQqL2fIiBv9TmJ+wGO8Mu/VmD1AkQEj04SdLPrNvpOrxVRIEFNqSBVHXYlFkkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7701
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhhbmtzIGZvciB0aGUgcmV2aWV3LCBMYXVyZW50IGFuZCBLaWVyYW4NCg0KPiBGb3IgYSBzcGVj
aWZpYyBwcm9qZWN0PyBXaWxsIHRoaXMgbm93IGFmZmVjdCAnYWxsJyBwcm9qZWN0cyB1c2luZyB0
aGlzIA0KPiBzZW5zb3I/IFdpbGwgdGhhdCBiZSBhZHZlcnNlIGluIGFueXdheT8NCg0KVGhpcyB3
YXMgbXkgaW5pdGlhbCBjb25jZXJuIHdpdGggdGhlIHBhdGNoIHZlcnkgZmlyc3QsIHNvIEkgaGF2
ZSBhZGRlZCB0aGUgcXVpcmsgaW5mcmFzdHJ1Y3R1cmUgdG8gZGlzdGluZ3Vpc2ggaXQgdXNpbmcg
YGRtaV9jaGVja19zeXN0ZW1gLg0KSG93ZXZlciwgdGhlIHNlbnNvciB2ZW5kb3IgcmVwbGllcyB0
aGF0IGlmIGFub3RoZXIgcGxhdGZvcm0gdXNlcyB0aGUgc2FtZSBjbG9jayBmcmVxdWVuY3ksIGl0
IHNob3VsZG4ndCBwb3NlIGEgc2lnbmlmaWNhbnQgaXNzdWUuDQoNCj4gRG8gJ3Nob3J0JyBjYWJs
ZXMgc3RpbGwgZnVuY3Rpb24gd2l0aCB0aGlzIHBhdGNoPw0KDQpZZXMsIHRoZSBjaGFuZ2Ugb25s
eSBzbGlnaHRseSBtb2RpZmllcyB0aGUgSFMgVHggVEVPVC9UUkVPVCBwYXJ0Lg0KVGhlIHZhbHVl
IHJlbWFpbnMgd2l0aGluIHRoZSBEUEhZIHRvbGVyYW5jZS4NCg0KPiBBcmUgdGhlc2UgY2hhbmdl
cyAncmVsYXRpdmUnIHRvIGFscmVhZHkgd3JpdHRlbiB2YWx1ZXM/DQoNCkl0J3MgbW9zdGx5IHJl
bGF0ZWQgdG8gRFBIWSB0aW1pbmcgY2hhbmdlcywgYXMgSSBtZW50aW9uZWQgaW4gdGhlIGNvbW1l
bnRzLg0KVGhlcmVmb3JlLCBpdCdzIGluZGVwZW5kZW50IG9mIG90aGVyIHNlbnNvcidzIGNhcGFi
aWxpdGlsZXMgbGlrZSBleHBvc3VyZSB0aW1lLg0KDQo+IExvb2tzIGxpa2UgaXQncyB0aW1lIHRv
IGFkZHJlc3MgTUlQSSBQSFkgdGltaW5ncyBwcm9wZXJseSwgYnkgc3RhbmRhcmRpemluZyBEVC9B
Q1BJIGRldmljZSBwcm9wZXJ0aWVzIHRvIGNvbnZleSB0aW1pbmcgaW5mb3JtYXRpb24sIGFuZCBp
bXBsZW1lbnRpbmcgaGVscGVycyB0byBwYXJzZSB0aG9zZSBwcm9wZXJ0aWVzIGFuZCBjYWxjdWxh
dGUgdGltaW5nIHBhcmFtZXRlcnMgZm9yIGRyaXZlcnMuDQoNClRoaXMgaXMgYSBwb3NpdGl2ZSBk
aXJlY3Rpb24uIEhvd2V2ZXIsIEknZCBsaWtlIHRvIHByb3ZpZGUgc29tZSBjb250ZXh0Lg0KVGhp
cyBwcm9qZWN0IGVuY291bnRlcmVkIGlzc3VlcyBsaWtlIGluc3VmZmljaWVudCBkcml2aW5nIHN0
cmVuZ3RoIGFuZCBpbmFkZXF1YXRlIEhTIHByZXBhcmluZyB0aW1lLiBUaGUgc2Vuc29yIHZlbmRv
ciBvbmx5IHByb3ZpZGVkIHJlbGF0aXZlIHJlZ2lzdGVycyB0byBhc3Npc3QgaW4gZGVidWdnaW5n
IHN1Y2ggaXNzdWVzLg0KVGhlIGRldGFpbCBhcmUgZGVwZW5kZW50IG9uIHNlbnNvciB2ZW5kb3Ig
d2lsbGluZ25lc3MgdG8gc2hhcmUgdGhpcyBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24uDQpTbyBJ
IGFtIG5vdCBzdXJlIGlmIG90aGVyIHNlbnNvciB2ZW5kb3JzLCBsaWtlIFNvbnksIHdpbGwgcHJv
dmlkZSBzdWNoIGluZm9ybWF0aW9uIGZvciBjcmVhdGluZyBhbiB1bml2ZXJzYWwgQVBJIHRvIGFj
Y2VzcyBEUEhZIHRpbWluZy4NCg0KPiBUaGlzIGxvb2tzIG9kZC4gV2h5IGlzbid0IHRoaXMganVz
dDoNCg0KVGhhbmsgeW91IGZvciB0aGlzLiBJJ2xsIG1ha2UgdGhlIHVwZGF0ZS4NCg0KDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IA0KU2VudDogVHVlc2RheSwgT2N0b2JlciAyNCwg
MjAyMyA4OjQ5IEFNDQpUbzogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtQGlkZWFzb25i
b2FyZC5jb20+DQpDYzogQ2hlbiwgSmFzb24gWiA8amFzb24uei5jaGVuQGludGVsLmNvbT47IFll
aCwgQW5keSA8YW5keS55ZWhAaW50ZWwuY29tPjsgc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNv
bTsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBiaW5nYnUuY2FvQGxpbnV4LmludGVsLmNv
bTsgWmhhbmcsIFFpbmd3dSA8cWluZ3d1LnpoYW5nQGludGVsLmNvbT4NClN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjFdIG1lZGlhOiBvdjA4eDQwOiBBZGQgU2lnbmFsIEludGVncmF0aW9uIEFkanVzdG1l
bnRzIGZvciBzcGVjaWZpYyBwcm9qZWN0DQoNCk9uIEZyaSwgT2N0IDIwLCAyMDIzIGF0IDAyOjA4
OjU5UE0gKzAxMDAsIEtpZXJhbiBCaW5naGFtIHdyb3RlOg0KPiBRdW90aW5nIENoZW4sIEphc29u
IFogKDIwMjMtMTAtMjAgMDU6MDk6MDgpDQo+ID4gRnJvbTogSmFzb24gQ2hlbiA8amFzb24uei5j
aGVuQGludGVsLmNvbT4NCj4gPiANCj4gPiBEdWUgdG8gY2VydGFpbiBNSVBJIGhhcmR3YXJlIGRl
c2lnbnMgdXNpbmcgb3Zlcmx5IGxvbmcgY2FibGVzLCB0aGVyZSANCj4gPiBpcyBhIGxvc3Mgb2Yg
c2lnbmFsIHN0cmVuZ3RoLCByZXN1bHRpbmcgaW4gZmFpbGVkIHNpZ25hbCBpbnRlZ3JhdGlvbi4N
Cj4gPiBUaGUgcGF0Y2ggaW5jbHVkZXMgY2hhbmdlcyB0byBhZGp1c3QgdGhlIGRyaXZpbmcgc3Ry
ZW5ndGggaW4gdGhlIA0KPiA+IHJlZ2lzdGVyIHNldHRpbmdzIGZvciBhIHNwZWNpZmljIHByb2pl
Y3QuDQo+IA0KPiBGb3IgYSBzcGVjaWZpYyBwcm9qZWN0PyBXaWxsIHRoaXMgbm93IGFmZmVjdCAn
YWxsJyBwcm9qZWN0cyB1c2luZyB0aGlzIA0KPiBzZW5zb3I/IFdpbGwgdGhhdCBiZSBhZHZlcnNl
IGluIGFueXdheT8NCj4gDQo+IERvICdzaG9ydCcgY2FibGVzIHN0aWxsIGZ1bmN0aW9uIHdpdGgg
dGhpcyBwYXRjaD8NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gQ2hlbiA8amFzb24uei5j
aGVuQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZWRpYS9pMmMvb3YwOHg0MC5j
IHwgMTcgKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvb3YwOHg0MC5j
IA0KPiA+IGIvZHJpdmVycy9tZWRpYS9pMmMvb3YwOHg0MC5jIGluZGV4IDBiM2I5MDZlYmVmLi40
ZjEzZTIzYjMyNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9vdjA4eDQwLmMN
Cj4gPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjA4eDQwLmMNCj4gPiBAQCAtMTYwLDYgKzE2
MCwxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG92MDh4NDBfcmVnIG1pcGlfZGF0YV9yYXRlXzgw
MG1icHNbXSA9IHsNCj4gPiAgICAgICAgIHsweDYwMDIsIDB4MmV9LA0KPiA+ICB9Ow0KPiA+ICAN
Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvdjA4eDQwX3JlZyBtaXBpX3NpX2NoYW5nZWRfcmVn
c1tdID0gew0KPiA+ICsgICAgICAgezB4NDgxYiwgMHgyY30sIC8qIEhTIEV4aXQ6IERhdGEgVHgg
VEVPVCAtIHJlZHVjaW5nIDhucyAqLw0KPiA+ICsgICAgICAgezB4NDgyNiwgMHg0Mn0sIC8qIEhT
IEVudHJ5OiBEYXRhIFR4IFRSRU9UIC0gcmFpc2luZyA4bnMgKi8NCj4gPiArICAgICAgIHsweDQ4
MjksIDB4NTR9LCAvKiBIUyBFeGl0OiBEYXRhIFR4IFRSRU9UIC0gcmVkdWNpbmcgOG5zICovDQo+
ID4gKyAgICAgICB7MHg0ODg1LCAweDFmfSwgLyogZHJpdmluZyBzdHJlbmd0aCBjaGFuZ2UgKi8N
Cj4gDQo+IEFyZSB0aGVzZSBjaGFuZ2VzICdyZWxhdGl2ZScgdG8gYWxyZWFkeSB3cml0dGVuIHZh
bHVlcz8NCg0KTG9va3MgbGlrZSBpdCdzIHRpbWUgdG8gYWRkcmVzcyBNSVBJIFBIWSB0aW1pbmdz
IHByb3Blcmx5LCBieSBzdGFuZGFyZGl6aW5nIERUL0FDUEkgZGV2aWNlIHByb3BlcnRpZXMgdG8g
Y29udmV5IHRpbWluZyBpbmZvcm1hdGlvbiwgYW5kIGltcGxlbWVudGluZyBoZWxwZXJzIHRvIHBh
cnNlIHRob3NlIHByb3BlcnRpZXMgYW5kIGNhbGN1bGF0ZSB0aW1pbmcgcGFyYW1ldGVycyBmb3Ig
ZHJpdmVycy4NCg0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RydWN0IG92MDh4NDBfcmVnX2xpc3Qg
c2lfcmVncyA9IHsNCj4gPiArICAgICAgIC5yZWdzID0gbWlwaV9zaV9jaGFuZ2VkX3JlZ3MsDQo+
ID4gKyAgICAgICAubnVtX29mX3JlZ3MgPSBBUlJBWV9TSVpFKG1pcGlfc2lfY2hhbmdlZF9yZWdz
KSwgfTsNCj4gPiArDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb3YwOHg0MF9yZWcgbW9kZV8z
ODU2eDI0MTZfcmVnc1tdID0gew0KPiA+ICAgICAgICAgezB4NTAwMCwgMHg1ZH0sDQo+ID4gICAg
ICAgICB7MHg1MDAxLCAweDIwfSwNCj4gPiBAQCAtMjkxNyw2ICsyOTI5LDExIEBAIHN0YXRpYyBp
bnQgb3YwOHg0MF9zdGFydF9zdHJlYW1pbmcoc3RydWN0IG92MDh4NDAgKm92MDh4KQ0KPiA+ICAg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICAgICAgICAgfQ0KPiA+ICANCj4gPiArICAg
ICAgIC8qIEFwcGx5IFNJIGNoYW5nZSB0byBjdXJyZW50IHByb2plY3QgKi8NCj4gPiArICAgICAg
IHJlZ19saXN0ID0gJnNpX3JlZ3M7DQo+ID4gKw0KPiA+ICsgICAgICAgb3YwOHg0MF93cml0ZV9y
ZWdfbGlzdChvdjA4eCwgcmVnX2xpc3QpOw0KPiA+ICsNCj4gDQo+IFRoaXMgbG9va3Mgb2RkLiBX
aHkgaXNuJ3QgdGhpcyBqdXN0Og0KPiANCj4gCW92MDh4NDBfd3JpdGVfcmVnX2xpc3QoMHYwOHgs
ICZzaV9yZWdzKTsNCj4gDQo+ID4gICAgICAgICAvKiBBcHBseSBkZWZhdWx0IHZhbHVlcyBvZiBj
dXJyZW50IG1vZGUgKi8NCj4gPiAgICAgICAgIHJlZ19saXN0ID0gJm92MDh4LT5jdXJfbW9kZS0+
cmVnX2xpc3Q7DQo+ID4gICAgICAgICByZXQgPSBvdjA4eDQwX3dyaXRlX3JlZ19saXN0KG92MDh4
LCByZWdfbGlzdCk7DQoNCi0tDQpSZWdhcmRzLA0KDQpMYXVyZW50IFBpbmNoYXJ0DQo=
