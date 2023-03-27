Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A396C9BCD
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbjC0HRU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 03:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbjC0HRS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:17:18 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D3344BF
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 00:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679901436; x=1711437436;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TqZUJ4Jlz0c/51J9W5z3DXvFUsGKXE/9Zsbg+UzVM4g=;
  b=XzhpjNfm8XTvZvA3z3xQu1wgVNtUZ6VCsEM+/qTPyaV1PM5eBEEHCjgf
   6ph2MQJ6bXIHNF+xhxie1zW57cEet2Rr97h83N7+q5l6gc2gpEoi5b8S/
   znsOqmiTgAIaL3je8mfxpSq5n3EeMscn2xhNDEuD4PYSnLgkrG19wi1cl
   XniHALBGjrA/8sazxkhPgbTWWzS3PZFMNLna3xP80MHKfVdAUTUePnDSe
   D9ZijQSTv11YuzTJiv6zHICmZkyM/E9YC0VDeQkLtHSZhlz/GBVJe7sGK
   kIlAjgKRBBn8hbYqnl/hLt16G6jchXAhmbZORTKL7eY+Do3ZXQyX6ITQZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="319852790"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="319852790"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 00:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="1013000261"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="1013000261"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga005.fm.intel.com with ESMTP; 27 Mar 2023 00:17:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 00:17:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 00:17:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 00:17:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 00:17:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqisyEMVA+ZvRNHISixUivYguoJykDgWg+reaM+ci0jhRmYoMheabqksZ8A+h4SpuaoEooZ/R94G5mnTyDT49oxXogl173rnCh0bMZYd7L8t95F/axYWAZ47Ze1a8xVoJ127AeXuectXYGIknQjUV+zpm/uVvM6a1dI7oD9oRKNJYUneI8MbOtq5RIcioGKYmDHX2PN1AU49JXhE8Ip9VUASocanvQx43clMLQCQoMCGdexK2E3NPZ4iODb791j4gMYuhroS8k9ei0IQ8FcJ78hsdhdyjCBCu7wNjphjii54arpNKo9nwyD17cS4tZiS8l9a/8nqpJl/ZNuTuh24OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGy7I00E7gxfnY3N+PSMDxt1dFZfEvz+P9oqF2uIJL0=;
 b=mKFHErlD90W4/4xiG4XXIi5mRjOPuTWMNKpiLE+X0Yv2r4B+5hKCpRy2UcABIrUxjMehO3zxZbIdxL9DiqfGPEGqxzOZw2yC3dfNsz3Kk5xPOqlJRbudGrrSl7rlKa++2qp81a7JlShevVNJFaJkYk7mEBLFUl5jJ5cAkchlj8BUnpTMe0WEYcbYw09LuoLwybc1x2iO0GFz355ZDCsaCg+HO/Z9z9/eDGKjbVjt2foviaDfUGhE4d9GQtlpUsaJfChC/Ul1g5YXjuaG3JUguVBjcxuz3HhOzP+u6nzVz98TdLHYEsCTzfvCxSwPYu/J5Wz0Yw9ofXIXJfOW4y8NyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4318.namprd11.prod.outlook.com (2603:10b6:208:17a::22)
 by SJ0PR11MB5631.namprd11.prod.outlook.com (2603:10b6:a03:3ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 07:17:13 +0000
Received: from MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5252:a6b2:cfa8:5aee]) by MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5252:a6b2:cfa8:5aee%7]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 07:17:13 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Ye, Xiang" <xiang.ye@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: RE: [PATCH v3 3/3] ACPI: delay enumeration of devices with a _DEP
 pointing to INTC1059 device
Thread-Topic: [PATCH v3 3/3] ACPI: delay enumeration of devices with a _DEP
 pointing to INTC1059 device
Thread-Index: AQHZYHSoIMpybNOzaUmhJ49K1Psa268ONIIAgAABrvA=
Date:   Mon, 27 Mar 2023 07:17:13 +0000
Message-ID: <MN2PR11MB43180EF14AEB08D0969AE8378D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <1679898188-14426-4-git-send-email-wentong.wu@intel.com>
 <ZCFAjoaIG2VxtLJr@kekkonen.localdomain>
In-Reply-To: <ZCFAjoaIG2VxtLJr@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4318:EE_|SJ0PR11MB5631:EE_
x-ms-office365-filtering-correlation-id: 3752e03d-02e5-4c8a-ee0c-08db2e934979
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xfey+vOq7FBHdi5nLN+tKml0Fd2JGu010gUQ1lu2Zxbh0oHi5oT2Loaz+gw7x0jWSmioOCD/UhoMPcZNWWm0Q1yIaiPUZB2cvmTpsPN3Rp7iyU6fNJimFW3V8OJHhMT3o6qQ42TUGeHp44S2oSoDzPRN/uWwnwLGx882s9vsn5EytN6a9Y2wWfL4KybDbFyoUNN5X6zrSpuASP9VMQGIuvLJhLCY4qkFmMs+RWeKKnx8+KpegLX30rsn+WgPsLqtzeP5E3id96x+bCD3XLbfdsGbZJ+5RcT6YCXygJk08RARcYhRPKcVWt+iDoSpFxBocZ8xGUEDTndXAUXj16QZ+a1YpDxlNQhW//0WeXQ88DMvP0yXzBu0bN8icVN0nrV42jTc0bLT+I7l5BEC3MWAOdJyHrgbDAmQef/iR8mD8E0xNObunWxJV7LDm3H0AJtoA2V+tuokEJJyf+xQYeXTA97TTQSax6p1nds0SIfg5am4TZUa8/49KYX75zzhrbAdhR0ulMJUZL+TEP84AJLOtVwGUmUo9z7PrHVALoGSoZAFgqS44sAYvN8v24FPM+suYY6DXcylfM2JCLEjvlkM9zvMOK7O0ZfEj7pzfJyAurgwTInsnFj3nruhiAnFoq0O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199021)(71200400001)(33656002)(54906003)(86362001)(38070700005)(478600001)(7696005)(316002)(6506007)(26005)(9686003)(38100700002)(55016003)(52536014)(186003)(66946007)(66476007)(66446008)(64756008)(76116006)(66556008)(122000001)(4326008)(6916009)(8676002)(82960400001)(41300700001)(8936002)(5660300002)(2906002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uDOmGt3/Uo8bwJpGviVMLUu5mm/UM+IOIsKsNSfRkBJq8YvgrhRNF9H3w3lu?=
 =?us-ascii?Q?inBP8TSrUqFuJTUpQvXM9tcKDfboY9F5VI4+a/IGHBYlZK6eniMItj9ykoEN?=
 =?us-ascii?Q?rCdliiA3JoX7EhA7veV3q0Tqau0KTDXwey8LmAla08Bc+RaubcN5qbkxF3rQ?=
 =?us-ascii?Q?JD0O/r1n9WO0pzBWqML8Z5qrR/WNcRuEyGhluHundi0dpjKXxb/jvUHcBbWF?=
 =?us-ascii?Q?ZXbVrRghnp00YZciYaYE0jtzclzAAPvtn0jUWChEj5SQTsWPHG8YFMWJdwgw?=
 =?us-ascii?Q?lL0ogAXL5exiOepp9+8E1bbSLTqIhHNDS8gTWzzrvhfA7DU5yRAeJ0QwnfbQ?=
 =?us-ascii?Q?JYLk9mzz8yq8Gidr/jeQ/B/RVKPdTs+IeMEgsj8rqbwpDbPgAG0A/e6YT5sL?=
 =?us-ascii?Q?xpeKLgK1FrdTs4/+FBMKlzJkTr1MHyBCw5kgwYK9t1/Ge56pRkq21Hb1PE5q?=
 =?us-ascii?Q?FfhIIHT/pYj2sm4+27sEWy9p24jpaG7C9ttQ9N6bKBG36LxCVHTq/c0YHMvN?=
 =?us-ascii?Q?gJsBpInwrQy1ejeCKrHdzcwpeTOLZJYvyil8zCrkBeMFmzfC2w+DCatgXa0S?=
 =?us-ascii?Q?uRSHjPKDs9JR8+bLJiR4QJm/hBeGBnKgehrfV0kp/IhM5pYUvb4ON0yOVVqq?=
 =?us-ascii?Q?TbBIsvXVShLEZYuiMOFOb4rKbpzbL5Y9PbVDtMV27GXN9CX/4xTPCgG8g+nX?=
 =?us-ascii?Q?jvrJKBUwOpeHjGulYh7xvuVEvZh2FoSr6GZ8ZDwuYlzt0zg4Lk6pmhJpMxst?=
 =?us-ascii?Q?mL1p+2gRF8zGwW2/ihQ1Dd0cbbeMg9YUyEjghTnVH/VzIpa0AYu5EAds89tR?=
 =?us-ascii?Q?yVKJJKr/jJkwZ7vI8Bwz3Mh4B8t4FCrCVXHyjSKoQ2rgHwJzFs6ulW1ygVuy?=
 =?us-ascii?Q?t2D2sQr+/YdG03iw5rA6c89mA94+F1kDNkTM2KUR0Rr2qsaQPH9sjC9tj0fb?=
 =?us-ascii?Q?EuhhjPJ8YdLNLpI5n9C5BOeum2yrkCNvfrw4XJ5usq71Umr/MFAWuCqqFFe/?=
 =?us-ascii?Q?p3wL/lRJ7ntOJUZaC4QbqFTTwC/A9JQ2wg1lTAhJsmJz9yHeiiVFLL2CutKs?=
 =?us-ascii?Q?KE8UahUhz9drisGYv2XbxhPwLMhTwbG7XZiZiY39+JwPAC6iiPtYi+PLAMk7?=
 =?us-ascii?Q?JsRoBdWVFCyLFWKRj6GNUSTJlbzZzp6rCOyFMlyz30ol2sssFM6GABUFpLf7?=
 =?us-ascii?Q?/AtfqLGums9l8uWMT65PeYHNJJIYmodz+AWWOiimR8UghadQWXkA5kNFhKfq?=
 =?us-ascii?Q?zkIUTC9mowLx1CUh8P0UCm6ivJLK/0v+vQDtET+VsXIVvthwi7jAz2Z8d4zw?=
 =?us-ascii?Q?ynT0aRRcl0tQVQNqvi63TZCBuovKHRUppnixX8DbpD2bD1mdJMrXg6Yno/Kp?=
 =?us-ascii?Q?v7XrvLSrmuqmdA7mtWgxINjNBI03b1BnQTLNp2LDDFuMXNllM1hnVyzAOKmZ?=
 =?us-ascii?Q?HmlYUQJxvcQ8nh90bS8gIkPxGVRsO/MIQzouh183BVWEdnmnegWvnoHT+5RC?=
 =?us-ascii?Q?KpbTFlf4mSNHNCGttQcdTtloX5hwS32HAPI6+VvhuIhjT7X+Zf6jMAcyVU+R?=
 =?us-ascii?Q?chsaEFuKlIeWFRmzP1z2L92XtYedYyXg2GtECoAm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3752e03d-02e5-4c8a-ee0c-08db2e934979
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 07:17:13.0542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o8Tzjdo/cF/m21voIOxPj/WCNEuvRxHMC8xKp+PUqxsF1lbNHR6nf00OQU6RmxEghwiYHF5IioRFcUkDrmAHdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5631
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>=20
> Hi Wentong,
>=20
> On Mon, Mar 27, 2023 at 02:23:08PM +0800, Wentong Wu wrote:
> > Inside IVSC, switching ownership requires an interface with two
> > different hardware modules, ACE and CSI. The software interface to
> > these modules is based on Intel MEI framework. Usually mei client
> > devices are dynamically created, so the info of consumers depending on
> > mei client devices is not present in the firmware tables.
>=20
> Ouch.

MEI client devices are not ACPI devices in our case.

>=20
> >
> > This causes problems with the probe ordering with respect to drivers
> > for consumers of these mei client devices. But on these camera sensor
> > devices, the ACPI nodes describing the sensors all have a _DEP
> > dependency on the matching INTC1059 ACPI device, so adding INTC1059 to
> > acpi_honor_dep_ids allows solving the probe-ordering problem by
> > delaying the enumeration of ACPI-devices which have a _DEP dependency o=
n
> an INTC1059 device.
>=20
> What does the INTC1059 device represent?

This is the IVSC device on which camera sensor has _DEP=20

            Device (CVFD)
            {
                Name (_HID, "INTC1059")  // _HID: Hardware ID
                Name (_DDN, "Intel CVF Device")  // _DDN: DOS Device Name
                Method (SID, 1, Serialized)
                {
                    Return (HCID (One))
                }
            }

        Device (LNK1)
        {
            Name (PNIO, Package (0x01)
            {
                "\\_SB.PC00.SPI1.SPFD.CVFD"
            })
            Name (PUSB, Package (0x02)
            {
                "\\_SB.PC00.SPI1.SPFD.CVFD",=20
                "\\_SB.PC00.XHCI.RHUB.HS08.VIC0"
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (L1EN)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                If (L1EN)
                {
                    If ((CVFS =3D=3D 0x02))
                    {
                        Return (PUSB) /* \_SB_.PC00.LNK1.PUSB */
                    }

                    If ((CVFS =3D=3D One))
                    {
                        Return (PNIO) /* \_SB_.PC00.LNK1.PNIO */
                    }
                    Else
                    {
                        Return (CDEP (L1CL, L1BS))
                    }
                }
                Else
                {
                    Return (Package (0x01)
                    {
                        PC00
                    })
                }
            }
>=20
> --
> Sakari Ailus
