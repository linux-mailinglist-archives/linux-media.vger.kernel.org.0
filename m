Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1485771B83
	for <lists+linux-media@lfdr.de>; Mon,  7 Aug 2023 09:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjHGHaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Aug 2023 03:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjHGHaQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Aug 2023 03:30:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E9910F4
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 00:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691393415; x=1722929415;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3UROURjzfOzXjgoW0wUOB6d8LzSkiRjX0S8H50wUQ4g=;
  b=GVizBQwP/LRq8b0yHh9GhVyJsg4YzBtA356M+ece4Ll5+HA8xmqzOy9i
   q6ltBHSEPGkmPKe8MsQ2vofHBBz9AsQA0J1fH4GJhUTjIqNsdtLVigafP
   ZNl1hr/0s+xHsqD56cq3GBKwdq7WVJ6xb9ARJW7d7oDXwepSgk//+SX5h
   om1q8Lwb/C+HuTmMRFOY0MokOzklR6tr1epz+qw7hAEk3dt2LQbJclHKP
   KiywlQzzGHK/KRfTvId706DhfF6Q0MIZTKQ94t1xs2T18vnjRgpTXz0h+
   7WY2YmUWf50aAjH1k20VxpcalUSqTXznLD7ZDFHmj9HYbWj7lEbogfH1k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="369377436"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="369377436"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 00:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="796197814"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="796197814"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 07 Aug 2023 00:30:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 00:30:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 00:30:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 00:30:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 00:30:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsvYmMYHWR2UNGNjn2LQ0n2XAyUg7FVHZ1E6BBhNfe/Fgdrin3Nz16BZMgqcbc4ghkaQ0N5O3bPaMpMLD6aQEaM4eyDRvusLTsZEJ8E9S8khu04eWAaI3sGVJb6q+GpHExf3GDxoMCRBQAz+HFi+VMmuRPVwcRpbZArQBvvgdE1Cio+kUwTxcHstX7cHEdYu8D9aRvbJ8s4q2iIGCF+o+1f2gqHtHfbl13GuVHq9ueV+YzYObp9GTf6KtwTZRXrS1EyP423lX3GwCXv4FZP+47JcOJfF+1HdWAVW+cXD4yK337zVYYTH6fZ5mOP6mk1unv8ephfuyH5wfOiLNQsiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UROURjzfOzXjgoW0wUOB6d8LzSkiRjX0S8H50wUQ4g=;
 b=QT615zQz4ViYasLzgdqJ8fUzxa7kOjyWg6xZNiklI+IOeBbxJgzT6F8MEE2/djp5mm8S01iQULhhQx3bHj1cHuki7+5XmX8taDg7SYM1SU9Xj4LnI1gEKZYYYFJX+fxPZRBwNAaKoMVUH9AeKHZP3cj7mWfED/TEJzmT7uITDJH6zUKitBmVOkhXbyYV9TP7RuZNXt6mybyr08+MPNuHgMoLrUJRXCFPxEymLOFc0i4H0SBJpMNfFSXTrO8yn+GnevVg+hhmTvx638peWV4uFyo5MG45bmd5MjogT/oDrAxTOJA88UPPvGxm/ZZWYJ9jzu4L2RsLjbyoKLHSoJHMXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DS7PR11MB6151.namprd11.prod.outlook.com (2603:10b6:8:9c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 07:30:11 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::3dc:446f:8474:1710]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::3dc:446f:8474:1710%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 07:30:11 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH 1/1] media: ivsc: Improve Kconfig help text
Thread-Topic: [PATCH 1/1] media: ivsc: Improve Kconfig help text
Thread-Index: AQHZxsPCS8W6RGafpkyMlTM2klhIdq/aJyaAgARMXPA=
Date:   Mon, 7 Aug 2023 07:30:10 +0000
Message-ID: <DM6PR11MB431651204A5C5F6880BAED7D8D0CA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <20230804105226.3022473-1-sakari.ailus@linux.intel.com>
 <20230804134825.GF12951@pendragon.ideasonboard.com>
In-Reply-To: <20230804134825.GF12951@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DS7PR11MB6151:EE_
x-ms-office365-filtering-correlation-id: 80bec099-6545-4620-6702-08db971821fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q1E78OLTJRYWMheMufFlX1TmL1hvyxlVCTwsmdCIFrhE4X0DKZvcTK3lQJvfSzBY9W35XoFcmbBZG401CMncVhhkIkij24qYUTSL4iNmiLcVW0CLZVFS+0VirfGastlYkYx+6Qmg/rD9IWFI/0k8OTKjZoPUbotipj3RjYkdPQZLJyQqfLt4S0J5kHiHiIzwBN7EFbAYQnoVZtutXOYDnU7RDh6/c86XnuKZfb5i0bdhnQdEJQ3S97H+Qx5vPj1ZdT8yqyOS7V8AZUNd2IG5pYxQxanOhvQy0HyAFhaLEEcHj1FOzSJ1U0lR/0xrIDHk+cd+OTcA/Xl9Nm6SCkQonzD6+NZG4Xk3Md6WUHUJNox5zSHQV26kxFapqyAnEEfKoyfHjEgr7NlGdh1Qxlp+q5FID5DNZ5K3rNPh5tBdyQRkIpJl3u7JUbS39S4nBN1yeUfZL3kFJVsceWCXqwDTrB91mP7Mdf+MnTM24dQaaG+fyri0Cn6qWiyIk4JL8IzB81+KG0GaI016ZUkB44b+4Lz9Yzk2O0pHWfhxqSISNilQ2asE30mfqsL2ZTV+hYp/tpiOdD+J0vco92wWvb2q30T/MFCueSP/P4/ISZONddeqUUpWR6lD31SJpOVv5sPK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(346002)(376002)(136003)(186006)(1800799003)(451199021)(83380400001)(55016003)(110136005)(2906002)(4326008)(5660300002)(8936002)(316002)(38070700005)(52536014)(8676002)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(38100700002)(86362001)(33656002)(478600001)(82960400001)(122000001)(71200400001)(9686003)(7696005)(41300700001)(6506007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWVNTW9KU254TVJRQzF6Z1lzV1UxcDN3VVRrRFBoblZBeVRDZytlcHN2MXNG?=
 =?utf-8?B?WGlRTmo1UVNzOGJvZmRkU3FHNnBrNEdSdWZsUnNSVHFyN2l4UkM5anRFN3JS?=
 =?utf-8?B?ZE8rVFoyUERac3hWNGdYZC9CYWlDZ3VYbjBmL1ZPVzA3TTRiYkN3N0l3MExJ?=
 =?utf-8?B?U2xEbWdQYmtMZmpzVVRLY01KUU1hUCtNMVJCdXM3SlpFSUxIVEJ5RmRLU3BP?=
 =?utf-8?B?ZVkyTUZYUENnVXI0Z3lDSXBJTlBUZ0JjbU50aWxSK1dCUklvSmhNZEdJWTBU?=
 =?utf-8?B?c242ejlFSGNERWpTbVFVbitZcVZvSDZCRWppYVVhTVNyN0ljcjBYTkRUV2pX?=
 =?utf-8?B?aDBCM0Z6aHoxZFJBNHU2ZWdkd1c2SHoxT3RkbWdLZFRTTTh6TVRZNDdPRWlP?=
 =?utf-8?B?VzAyRTdZdFBqOGZhZ25haU9MRVNrRFBuREtwYmZPSmhybnB4Y2NvS3JXd1pZ?=
 =?utf-8?B?TUp4STkrRGc0cmMvemVWa1hrOVRncDhTVWE0SXdVSU41Tk5FeVhjS1J1UXhB?=
 =?utf-8?B?SnM5OVhscWVWc0RsSGFwbjFkcWdYS3huZlBIdEpKYnlwcm5ELzNqZHV1dG1i?=
 =?utf-8?B?Z3Y4d0NBTnNqcWNaM2JZSk42cWhabGVVN0pqaExFb2hRS1NoNjF2c3VnSUI2?=
 =?utf-8?B?djJGMnA2TG9FRzZXNWc3Y1ZGS2EyeFlJL3NRRGxvcUY4Ym9WWFUzRlExUGxq?=
 =?utf-8?B?eHZGNXRkd3Q2QXlPL3o3aEU1QjluUGliY0E5WXA4cmFFaUpVRmxGdWxYK1JY?=
 =?utf-8?B?WTZDZXFXTi9rR2QrRitpYzBDZWhBNEdya09tQko3eWZpM3lPRUVkalBnSGwv?=
 =?utf-8?B?Umt2MDhTcGljbThzTDRPVUxXdUZmU0J2aXJJeDJvMlMrRytucW5XbWpNbm40?=
 =?utf-8?B?ZG5lQ3ZiZTMxdTJHSmNFV3lmWGRHYlJBL01DMG5jT0xMblRId2VSamdqS2dY?=
 =?utf-8?B?TlhwMUh5SlJDV3VvN3hKcHNBb0xUVXNMa1krVkdIOWhTZEpVRkU4UlY3V0Z2?=
 =?utf-8?B?cmljWlpOR0p3RytoSE9rTUpDbW9LdnZEWU9lL2pYME5DQXZMRk9XVk9FRUZt?=
 =?utf-8?B?eE5oR1hTSHpKN1g2NlJrM2FkSU81SVFKcW1XOUxvWWlmU0RyUzBZeXljUWI1?=
 =?utf-8?B?bEVaQ2pjQnNKN2lQcFgraW1OYmVtZEhSNmoyenllUHR2TkNOZU04dEdERERE?=
 =?utf-8?B?U21tbmZjSlVjMVJjTDRFa3ZRaFZXVDBlR05RcGZMNUNoNVRRNVZrbUtrWFM0?=
 =?utf-8?B?U1U3dlF5YWtsL05pZ2dhbXpSdU41TTgxNlMxanVaVGRNMGVIbzJPM2RMZGN4?=
 =?utf-8?B?SHBKSDZId0VVdDVJOWxvcU5vVDNjWGE1aWVVRFJGMkgwOTVqc2ZYeUxMakdH?=
 =?utf-8?B?L1BOU21qSmlKUFUzK0ROT0RkYVJiVkN1MXF4WG1tckRaak1UNVBJTjllVHJF?=
 =?utf-8?B?aFVRaHQ5UmFOSW40V2NOYXJ5c2tUWXp4RkxJZ09RTDJSbHRjTEIrcFEvZnVn?=
 =?utf-8?B?dDEvcWVVUkZiNStuUG9rbXB4VTd2ckx2b1ZFdkFkeWN1aDRnS1gzZFhRUVdT?=
 =?utf-8?B?QWh3YVZJTHVRcGtqRGxxUnA0VFNUUlFhbUFnL0gvZUVOOGlzTytJWDBEUUF2?=
 =?utf-8?B?Z3dmNWlsVmhna0doZDJDeVBzQW9XN2xTcENpTnZUeXRQckR0d0taWU9TK0tT?=
 =?utf-8?B?cUhWUzVtQm15NlFPMEV1UTVEY2hidGsyZGVvc0YzSEdEYVNkR0liTy9mbVFY?=
 =?utf-8?B?bkRWb3dySzcyMUZNVVdqclBiVFhxVEJZbCtxSVdtYXN5aTdsYVRqUUJRYTcr?=
 =?utf-8?B?ZGtyQXZLWTBhV25oUy96L3pLaWdKUFNOWkxZTi9xb293cHdWRG1vcXp6LzNB?=
 =?utf-8?B?ekZaQjVIWURZakVmMXliN012WkdWWUlCc2xVbDNZc21zWnh5aWo0R3FGTVZm?=
 =?utf-8?B?ZllUME02VmcvN0VsYjZ1eWNyTGRzdnNUMTlqMXhLT1VVZ3NVZHNpTTM2SnBN?=
 =?utf-8?B?N29OeUVqc0FiRlNValpmQ0MzSmpiOUxTU2tQaTl2dXBORVFQMDdLSEtXbStp?=
 =?utf-8?B?S2FoVVVPNkYxREMvb2JhK3l0N2UwUmRWVDJQVUVvbityZXhXOWpGS1o4Z2RZ?=
 =?utf-8?Q?8Z4hRM6PIAe7Dn2k+N0Im/eS+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bec099-6545-4620-6702-08db971821fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 07:30:10.8157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C5ezg9BpP5YOry68TE3BUVh26Kmhlo8ERC8JyEgGIIwDc6X4dr14MfEEEYALy4ZUjsdU4ZxtwKZu8Ng1SuySjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6151
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IA0KPiBI
aSBTYWthcmksDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIEZyaSwg
QXVnIDA0LCAyMDIzIGF0IDAxOjUyOjI2UE0gKzAzMDAsIFNha2FyaSBBaWx1cyB3cm90ZToNCj4g
PiBJbXByb3ZlIHRoZSBLY29uZmlnIGhlbHAgdGV4dCB0byBjb252ZXkgdGhlIEFDRSBpcyBmb3Ig
Y2hhbmdpbmcgY2FtZXJhDQo+ID4gc2Vuc29yIG93bmVyc2hpcCBhbmQgQ1NJIGZvciBjb25maWd1
cmluZyB0aGUgQ1NJLTIgcnggYW5kIHR4Lg0KPiA+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBMYXVyZW50
IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gU2lnbmVk
LW9mZi1ieTogU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPg0KPiA+
IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pdnNjL0tjb25maWcgfCA4ICsrKysr
Ky0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXZzYy9LY29u
ZmlnDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pdnNjL0tjb25maWcNCj4gPiBpbmRl
eCA5NTM1YWMxMGY0ZjcuLmU5ZDk0ZGJiNDMwNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21l
ZGlhL3BjaS9pbnRlbC9pdnNjL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BjaS9p
bnRlbC9pdnNjL0tjb25maWcNCj4gPiBAQCAtOCw1ICs4LDkgQEAgY29uZmlnIElOVEVMX1ZTQw0K
PiA+ICAJICBUaGlzIGFkZHMgc3VwcG9ydCBmb3IgSW50ZWwgVmlzdWFsIFNlbnNpbmcgQ29udHJv
bGxlciAoSVZTQykuDQo+ID4NCj4gPiAgCSAgRW5hYmxlcyB0aGUgSVZTQyBmaXJtd2FyZSBzZXJ2
aWNlcyByZXF1aXJlZCBmb3IgY29udHJvbGxpbmcNCj4gPiAtCSAgY2FtZXJhIHNlbnNvciBvd25l
cnNoaXAgYW5kIENTSS0yIGxpbmsgdGhyb3VnaCBJbWFnZSBQcm9jZXNzaW5nDQo+ID4gLQkgIFVu
aXQoSVBVKSBkcml2ZXIgb2YgSW50ZWwuDQo+ID4gKwkgIGNhbWVyYSBzZW5zb3Igb3duZXJzaGlw
IGJldHdlZW4gSVZTQyBhbmQgaG9zdCBDUFUgKEFDRSkgYXMgd2VsbA0KPiANCj4gV2hhdCBkb2Vz
IEFDRSBzdGFuZCBmb3IgPw0KDQpCZWxvdyBpcyBmcm9tIGNvdmVyIGxldHRlciBvZiBteSBJVlND
IHBhdGNoLCBob3BlIHRoYXQgYW5zd2VyIHlvdXIgcXVlc3Rpb24uDQoNCiIiIg0KU3dpdGNoaW5n
IG93bmVyc2hpcCByZXF1aXJlcyBhbiBpbnRlcmZhY2Ugd2l0aCB0d28gZGlmZmVyZW50IGhhcmR3
YXJlIG1vZHVsZXMgaW5zaWRlIElWU0MuDQpUaGUgc29mdHdhcmUgaW50ZXJmYWNlIHRvIHRoZXNl
IG1vZHVsZXMgaXMgdmlhIEludGVsIE1FSSAoVGhlIEludGVsIE1hbmFnZW1lbnQgRW5naW5lKSBj
b21tYW5kcy4NClRoZXNlIHR3byBoYXJkd2FyZSBtb2R1bGVzIGhhdmUgdHdvIGRpZmZlcmVudCBN
RUkgVVVJRHMgdG8gZW51bWVyYXRlLiBUaGVzZSBoYXJkd2FyZSBtb2R1bGVzIGFyZToNCiAtIEFD
RSAoQWxnb3JpdGhtIENvbnRleHQgRW5naW5lKTogVGhpcyBtb2R1bGUgaXMgZm9yIGFsZ29yaXRo
bSBjb21wdXRpbmcgd2hlbiBJVlNDIG93bnMgY2FtZXJhIHNlbnNvci4NCkFsc28gQUNFIG1vZHVs
ZSBjb250cm9scyBjYW1lcmEgc2Vuc29yJ3Mgb3duZXJzaGlwLiBUaGlzIGhhcmR3YXJlIG1vZHVs
ZSBpcyB1c2VkIHRvIHNldCBvd25lcnNoaXAgb2YgY2FtZXJhIHNlbnNvci4NCiAtIENTSSAoQ2Ft
ZXJhIFNlcmlhbCBJbnRlcmZhY2UpOiBUaGlzIG1vZHVsZSBpcyB1c2VkIHRvIHJvdXRlIGNhbWVy
YSBzZW5zb3IgZGF0YSBlaXRoZXIgdG8gSVZTQyBvciB0byBob3N0IGZvciBJUFUgZHJpdmVyIGFu
ZCBhcHBsaWNhdGlvbi4NCiIiIg0KDQpCUiwNCldlbnRvbmcNCj4gDQo+ID4gKwkgIGFzIGNvbmZp
Z3VyaW5nIHRoZSBDU0ktMiBsaW5rIChDU0kpIHRvd2FyZHMgdGhlIEltYWdlIFByb2Nlc3NpbmcN
Cj4gPiArCSAgVW5pdCAoSVBVKSBkcml2ZXIgb2YgSW50ZWwuDQo+IA0KPiBJZiBJIHVuZGVyc3Rh
bmQgdGhpbmdzIGNvcnJlY3RseSwgdGhpcyBpcyBhYm91dCByb3V0aW5nIHRoZSBkYXRhIGZyb20g
dGhlIHNlbnNvciB0bw0KPiB0aGUgSVZTQyBvdXRwdXQgdG93YXJkcyB0aGUgaG9zdC4gSXMgdGhh
dCByaWdodCA/IElmIHNvLCBsZXQncyBtYWtlIHRoYXQgZXhwbGljaXQuDQo+IA0KPiA+ICsNCj4g
PiArCSAgVGhlIG1vZHVsZXMgd2lsbCBiZSBjYWxsZWQgaXZzYy1jc2kgYW5kIGl2c2MtYWNlLg0K
PiA+ICsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
