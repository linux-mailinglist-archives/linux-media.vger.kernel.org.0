Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7917D066C
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 04:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346834AbjJTCVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 22:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346758AbjJTCVP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 22:21:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9536124
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 19:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697768473; x=1729304473;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8EyRK9cD7xw/vc69WgLXxhUGavYpXPoMjtudqGrH0hs=;
  b=BVThDu44G5NLYzMigtncWYDHsYEImAXBHKI3oQrcXV0u0CIlanHQ0XOl
   ITBKgM5hxbwSFPQMGewGDWXB7ofpdcbqWDLEhT03uizUDTyEEj50oj2d3
   bm2xUDobbD4RN99+z9hkey60IgVui+eCtwGXBRE1cMMbuDBccDUBKGG9A
   zz6WQI7kU7+Vt6qIuVRNg19MN6Fk/io8EE8D98+hbD7Txh/rV0peBIJJU
   JjcJtkFXF9vA/5l2xdC64NSk5YXNomt4lWkTrD68knJtLm6/r+SQau8ZT
   PClOeLrJN3i2hmdcW3LFDnUTDR4uL8J2OFnH6dWU01uNW/mUS/pV19raZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452894160"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="452894160"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 19:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="707086958"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="707086958"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Oct 2023 19:21:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 19:21:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 19:21:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 19:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8DDFwigTX+/ObGvA/U/5p3T/eO6oCuTbqgwF1I+PIvJq5hn/kgzjyrWO9rBok7d3kBLi4kZhTYGZ+3ejOdcu9MfChO/nb06l+oKJv4FP0v3mVZzq3Yg5bLPco1BOLQhJErCW2fRuhjUMbuDsuH0A0m4dxgMAAgTls+Eq0c30Y++ocuX1oZW3tC+miYBz1ZSnHJoZsSPfYqY0ULtl+/ZbK++BMlxxJyLn8+SpMFPALP/IEr4pXL6iYess9W/dTGVTtKFjNxiN1w31PHQOve6gY/F7fGsNI482uLQYFKizCepH23gozF5rKI0ljwPSFxX0/sOQPZ6rpEIN5lebgWWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RltA/1TwPAfA9vYeo49WfQPJ8UvW5Au5PPfx9Kl8p6c=;
 b=Qqz8kdRaZjRNZSxH1+//SjB795aqLy355P3yVoBqE07cLeD1FNiTmUeCvFuyn5ArE/Y9bRsWnmOen4FFBGHAvlzq5hiSYGklTHhe+SKYcqaTeEPE6IoUwPg7T8afwNkNoNxONziYjSMAh38Po47/IGsir2HoHc2VQzaIlXhXtK2I9xUcJ/vEBF26kcoCbr3ParcqvgzsMDJcX1YkvWxlMZ+bSc9SgQh42zi3QlgKldM5BYYGKaSYMLTFio2Ib36KxbRslSne2ir23VjtkHzE81/6+ob2RgGJg/FWcCZpBjwrRySN9b7bYJIu3sVW5jwzXb0G+tBqc1Pj9UXaCalIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.37; Fri, 20 Oct
 2023 02:21:10 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::ed72:3971:abcd:9852]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::ed72:3971:abcd:9852%4]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 02:21:10 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
CC:     Andreas Helbech Kleist <andreaskleist@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
Subject: RE: [PATCH 10/15] media: intel/ipu6: add input system driver
Thread-Topic: [PATCH 10/15] media: intel/ipu6: add input system driver
Thread-Index: AQHZwFiriqtOnWADWka/MvEuC+mvALA4Q7SAgBkIBACAAEFugIAA6V4A
Date:   Fri, 20 Oct 2023 02:21:09 +0000
Message-ID: <DM8PR11MB5653B677FD2888FB530B728A99DBA@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-11-bingbu.cao@intel.com>
 <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
 <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
 <ZTEfg8+sNGf0KU+a@smile.fi.intel.com>
In-Reply-To: <ZTEfg8+sNGf0KU+a@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|SN7PR11MB8262:EE_
x-ms-office365-filtering-correlation-id: 54013de8-1da4-4477-448d-08dbd113395f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K/G23rZcMGxmTtot3ZQrhLuxIlkShPWEcYUc2A37kGLLGrLHnvm/ZstUjLLDvroGE4bfRM03F9/BeKpXSzO4eoSOqEKpGnm5Z0BzC+4xb+82CxZnWwOKIHI9txR5kZqnFyt4teE00aoJFjbG83a0OwT0B0dvQ+yziDzYzG72W/kegCDH8M4gBvLS1LJzCQLXSi0dglqT9X/g037cn8LYG20sWo+NyJOME3YpHgZAFXJRdhrgHGMXTt/GmLp067TcVEvuaI224SScMG2ZsaLpWlZPr6r21BpGQzOCA7PfNIySymlzb0De008ktaiqH7oINwbptVTS+U2bX6M6BqXNxaKKlebl5G88/4KKsJrUTBdOaWZX7jlRbGb0P3Vn2Cc0HAXg79WNxkT7K9t2upxXTKH6vzuMgPV37QzzqT21GccwXlzWlMweooR/i/B0//47wW/Ah1eOThQKOHD+idotQioe95ojw2hK2miI94S44j0VX3oXTB5gnrz1VX/Pk/lzfFUPg5DfXDPXDGNBW62HueHo/sGl3XOW2l4ZNjsOEHZ7r1aK829+R43Q229HsB4yQXVo4ZnQck56Lyp4zTPKisBVXWzg4u6vKpHFWilJ39qRTzecjq37vTpwtI9HegIwozynz7vKxpn7jwKl2DA36A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(8936002)(33656002)(9686003)(55016003)(38070700009)(66946007)(64756008)(110136005)(38100700002)(54906003)(66476007)(86362001)(7696005)(122000001)(82960400001)(66556008)(76116006)(66446008)(26005)(83380400001)(316002)(6506007)(71200400001)(52536014)(2906002)(478600001)(53546011)(41300700001)(7416002)(8676002)(4326008)(5660300002)(8496004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GLm617GUeYeoPu5OmcMnOxcB8zvUuCdoVqrUysZCwbNM1jCdvm/NoxDU9zJS?=
 =?us-ascii?Q?X8DrLN1AiuejmZGepF5b+BpYefR1Zcf0V4plG2Bph2U4l++7AldDlGC68CI5?=
 =?us-ascii?Q?U4+P0WI6z/tkRWVQVh6wsuodLZZyo5xLX4VJm+TP+KBBE9wilZ1xSh27ec2B?=
 =?us-ascii?Q?0SfANEzx3cittRj24Ghcd/945jYQQbPD3/J03lN9ERZ/oD0E+AkV+Nw2oRLm?=
 =?us-ascii?Q?vjxvH6nfKjEnfclm804mNHVN5G7f0JybTDFiWGby4t/J/v5a/VEMP6oSOzhy?=
 =?us-ascii?Q?9pm3HRbrHp+NMvVPGFZtPTuYM4JtWC9HTDlxKsJqJqM7Ojw0x6qB3j0QjVaj?=
 =?us-ascii?Q?p4G3j5yT4YxHu3SASt7CaToldAnOXi6OsgOnH9xTq8ZwH/zR73u/NMhtrQZx?=
 =?us-ascii?Q?Xcz4ixnYiGoNYOWeb9HYBskeMcbppcKUNEqBEFXEtJuzFfPteO+k+nntyywE?=
 =?us-ascii?Q?fA1AwZxA8l6VklvUad9NzFjUMGCiSYm87Mc7s94vK+bosQOwcmuqCSTy9M5o?=
 =?us-ascii?Q?vP28D1qw5YoM5PnWo6mhU9r9BJ6xOA2KQenUSFinnGmjbernFZDXn/Cgn3bW?=
 =?us-ascii?Q?2+dahV6EQMHb0beIYUbQV6843dWBFhY4mpJQ3BfZ0trwbEaUiI1km4U2LyEO?=
 =?us-ascii?Q?vSw0PDh4irSyTLZPBwYJ67I3TiU5fDxOO/nSorp58yVp/3lFPb+5kkwSMhxH?=
 =?us-ascii?Q?rELHZ4BtsGegxf7Qc8iLjrsjBcrPKw9eDTL3dpDZepfI/bszpu1q41nLmFy/?=
 =?us-ascii?Q?4ROUWv19L4wkyp+Yzk7CEEuU2xMAYkC2XvA52kyxPDWlM/hwq7CM7QPE2Njl?=
 =?us-ascii?Q?illC5C8P4FeTZNHD9R7IupwNv2B/7jCUj0nipLhC6h5OCXj+w8eVF7RZ9ZJw?=
 =?us-ascii?Q?k2wXXg2w2zWs/ujqJLd4HDbbPMu6FK2p7bADQV3Qpa8H+zIr3bHTDWI/1J42?=
 =?us-ascii?Q?k7QE2cbk8/x9+iijYjyuDDpe4fiCcmx31+4/WqnxjLUW+1qn2q5EU7gTbjgi?=
 =?us-ascii?Q?BTwqaLd7URluTDln1cfn2N4LAhskritFYMubKPXVxPrTcJ8wOxXyie26ixWN?=
 =?us-ascii?Q?QCxrr5lHfngG0BbK+BWaehx9c7+8EpPyx6hpPLDbHz7xDYM9AN6dYa4tNH6s?=
 =?us-ascii?Q?J88oNhiBfUQFqHVj/igR2qFZ8tbHXWqc8aAoYPRRDjRjNwpBi29bERbxLeaz?=
 =?us-ascii?Q?aghU/tUZ4HuX8ybEK0s+50PpiW1NQp5/SW+BiVL0Rv0ESmIKSaAgwCjxtw4I?=
 =?us-ascii?Q?PbPAuNn3pQ69GUPvoffR/C5SxOyUP0D/G7/uKcRa0m+wGzL3j0ZkATxURG+k?=
 =?us-ascii?Q?AeUYDdQWTSDHZB7reVY+CGFGmBY5WXlC80Wmh171o+ClsRCddo9ovUMIQ2ZS?=
 =?us-ascii?Q?8cWI4F/riZA3/9oDpYcmJm6P6hFo10b2cP8d9mvjeHL/DXz/vkTdwLPTiwg2?=
 =?us-ascii?Q?DhKNI9y57OqSTG3kJS5r7FPuTzLdRdHrGBOsjUwMtzvRds/RT5E7QaIeiN+o?=
 =?us-ascii?Q?VoEtEcFCQwMVTWKynfg1F6uukpkrBaK9PGg2+dfWw4Wq5SGbomOVdKZMOsow?=
 =?us-ascii?Q?la8QtoF+OPjzSUk/o4v9NM4qSwYbF0fyQLUfzrRQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54013de8-1da4-4477-448d-08dbd113395f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 02:21:09.9973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jfIaHv44eHjmiO5kb8Su09TqcHgXxefyyizdSawuXM8lIwdIf/8kBpZ6qcqaHjb4/3kn/pWGw1UwdC2lTJpA2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8262
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

Andy,

------------------------------------------------------------------------
BRs, =20
Bingbu Cao=20

>-----Original Message-----
>From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>Sent: Thursday, October 19, 2023 8:22 PM
>To: Bingbu Cao <bingbu.cao@linux.intel.com>
>Cc: Andreas Helbech Kleist <andreaskleist@gmail.com>; Cao, Bingbu
><bingbu.cao@intel.com>; linux-media@vger.kernel.org;
>sakari.ailus@linux.intel.com; laurent.pinchart@ideasonboard.com;
>ilpo.jarvinen@linux.intel.com; tfiga@chromium.org; senozhatsky@chromium.or=
g;
>hdegoede@redhat.com; tomi.valkeinen@ideasonboard.com; Qiu, Tian Shu
><tian.shu.qiu@intel.com>; Wang, Hongju <hongju.wang@intel.com>
>Subject: Re: [PATCH 10/15] media: intel/ipu6: add input system driver
>
>On Thu, Oct 19, 2023 at 04:28:16PM +0800, Bingbu Cao wrote:
>> On 10/3/23 6:13 PM, Andreas Helbech Kleist wrote:
>> > On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com wrote:
>
>...
>
>> >> +static const struct pci_device_id isys_pci_tbl[] =3D {
>> >> +       { PCI_VDEVICE(INTEL, IPU6_PCI_ID) },
>> >> +       { PCI_VDEVICE(INTEL, IPU6SE_PCI_ID) },
>> >> +       { PCI_VDEVICE(INTEL, IPU6EP_ADL_P_PCI_ID) },
>> >> +       { PCI_VDEVICE(INTEL, IPU6EP_ADL_N_PCI_ID) },
>> >> +       { PCI_VDEVICE(INTEL, IPU6EP_RPL_P_PCI_ID) },
>> >> +       { PCI_VDEVICE(INTEL, IPU6EP_MTL_PCI_ID) },
>> >> +       { }
>> >> +};
>> >
>> > Unused
>>
>> Have you tried that whether isys driver can be auto-loaded w/o this
>> pci id table? It cannot on my side.
>
>But where is the respective MODULE_DEVICE_TABLE()?

It is at the end of this source, someone snip it in mail.

+static struct auxiliary_driver isys_driver =3D {
+	.name =3D IPU6_ISYS_NAME,
+	.probe =3D isys_probe,
+	.remove =3D isys_remove,
+	.id_table =3D ipu6_isys_id_table,
+	.driver =3D {
+		.pm =3D &isys_pm_ops,
+	},
+};
+
+module_auxiliary_driver(isys_driver);
+
+MODULE_DEVICE_TABLE(pci, isys_pci_tbl);

>
>--
>With Best Regards,
>Andy Shevchenko
>

