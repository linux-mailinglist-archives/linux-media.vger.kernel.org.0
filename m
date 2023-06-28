Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4E1B74078B
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 03:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjF1BTa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 21:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjF1BT2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 21:19:28 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6619D2103
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 18:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687915167; x=1719451167;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V20PNNzWPI5AfQ3RvwQvzdml0RnohHVRQ0B94VZxHvA=;
  b=dUhqM+XxYCfPIBszrKCPKa7tknkb1H27oPsVb//z1PqTS6fZo4XSyYZX
   Wu+jRL0S27mRI62dt7/Iqe7Lgu8K0Hzlal4izHIXIIcbFFq5vZA9OaLg1
   5u4Q70GkhO/4xOCjyyzOIOhaD+fM7EGGcD2Vski35Hg+1QbicJgqcU+5n
   iDLtAAD5+QtfEsYQGvh7UC+yWRkmtyZ/GyjpA9WdryaT5QKtJFw8WmTJe
   Aai38bGorHtX9Nqg15ISStHFC38QHBeJFTUYRadgCmdkckVQkDVQ5VBSF
   6uoCNlAdfNqyZppMstTY5Ux99cgA48mymA8MT3xQc0CXTa8eY7cVIYkYn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="392397869"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="392397869"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 18:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="694098176"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="694098176"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga006.jf.intel.com with ESMTP; 27 Jun 2023 18:19:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 18:19:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 18:19:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 18:19:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 27 Jun 2023 18:19:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qifksjetv7PcCUyQeWilWnvpNeNjGNn7HkkORlawM+peoMrV4D0E+xBEsG8tzRg5N+SN4J7VDjBCZP8L2OdFlbu4fEEzKclEmeCsgx+g6eRB8WzJ5erEMLjaRXLdKaSI4ulnFI1p1f0TLdiYs3iTQrvE/JFqlbBzJg9wmHA395YiN0acUZTGcxTng9fugxrn5F/4BUzQ5ErR9tTk/dbs9pmtnmAeKvCkHwcEmuqO07MXmDMc/b+E+Nw8FXnkK1TPbs9TwomAz2ruLvgKiduveyTgsmNj9/RlvmkL1FuLptxHXP1G0/qjgFC9Qf9WCxrFrKnK2sMtJ5T834IVQ8fsiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BogmBqEDUmbIGBY962AtA6cvL3j0QI6ti3DrMdQAyo=;
 b=iXx2uIyQh4N7msJ3QI6QMUfj4AlEXdiupwPRrpiQLr9dV5aZR0GRk9aFnFFYCR6Ps5kL90ytW5aEG0nsRQpSWnwv4WftmBMF/w7nGPF15zs19ihuTCRedPF2ZpO0SgDhdeg7LLVt7TEmucfTqIHE6U12iNpndemZKiFD58MP+P+echBn3hEmveHy9+5++NQb8hi7f/ZTsCkok+OlxyHRtRZqVdoN9pLL+CSy/hEydsxLMDR54k2y29Vph/mA39BlAY0VG6IG3/qXY4HCaomryuaULAlhk6qEux3ZM5ltFSdQrlJouAZkaabPscRDbp1V8x1p61h7cR8nKszZG2RluA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SA0PR11MB4560.namprd11.prod.outlook.com (2603:10b6:806:93::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.26; Wed, 28 Jun 2023 01:19:18 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9d26:3f6:8afa:4543]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9d26:3f6:8afa:4543%6]) with mapi id 15.20.6544.012; Wed, 28 Jun 2023
 01:19:17 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        "Yao, Hao" <hao.yao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH 00/12] media: intel-cio2-bridge: Add shared
 intel-cio2-bridge code, rework VCM instantiation
Thread-Topic: [PATCH 00/12] media: intel-cio2-bridge: Add shared
 intel-cio2-bridge code, rework VCM instantiation
Thread-Index: AQHZqSDQj2iupNO4aUWVfBe6TL3XVq+fahTg
Date:   Wed, 28 Jun 2023 01:19:17 +0000
Message-ID: <DM8PR11MB5653A2A59A5858F0880889369924A@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
In-Reply-To: <20230627175643.114778-1-hdegoede@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|SA0PR11MB4560:EE_
x-ms-office365-filtering-correlation-id: 5b3b912a-5fd7-4e50-2e65-08db7775b196
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KSXuWVmmIaVCRQSNRnSyTelhzJkzDuz+uR4yinmTDJ0OhcNGXI2v0fsB0UAKnMRGulej/rhya75hVwTo73Vfj/9PZW680JDfm9feviCuwC39fspfk7TUPPwHc0aZQrdjZtPS4k5GolvGIvKbg0HTWc6JoHTdIQhc1CuaVT68p6zYuaYlbPeSfMo4cYX8qVwFSTfFRfumEsb09vmp2sr+AwOQRMYRm7NYwCKACnRlPq7UpJgLy/9sQoJWQBpspUsp+WGICOAlNDAx96RetZoLjXS8yIBU6AzPowIQ7ZqCPxKAvoXSf1VfLciMvta0TmkmTtFeZOW17nkOWugO5vofVRZpcd3n3oOKIEMMXb5aaW+2ejU7gF16Ri9gpe7XewOmHbLdKnVWRCWaYoIG/m6FcXNHD8SksuFvxGGNGSVY3Do9dFIBeacr5qxpir+Lq4joSlS6rbVcl6RIEQuSDfIhexDyMAvUz373RL6WlCePMTFc2tGPBYYBGh88NCtMIJwe4Aqc1xv8GBqRxLrn73irwN4iLMUfxUvyxjFx5UXatOKts9HR5tIGxLc0aH9blXuASTvYYHIyyc2VEAZ4yUBs8+kLu8Z/p4uJ6vt1LD4d+Sjh1PtDd+cKy5jXQB40lenr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199021)(66446008)(9686003)(2906002)(478600001)(966005)(7696005)(110136005)(54906003)(71200400001)(6506007)(26005)(55016003)(186003)(83380400001)(5660300002)(52536014)(38070700005)(316002)(76116006)(66556008)(38100700002)(122000001)(4326008)(82960400001)(8676002)(86362001)(64756008)(66946007)(33656002)(8936002)(66476007)(41300700001)(8496004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ov7X168cx8kB5rraxCFOFfG2764NZz93YDEAlrGeJhc52x3zH5T6pjleaGJ7?=
 =?us-ascii?Q?nB/vbmB3nuwPfsdIVux5UmLB0OLxxE5BJqO3OfRIc6KcibWQaY0SY85gl/vE?=
 =?us-ascii?Q?gBOD/Dv/kuHaQgxuCZw3nh2gFNWPlYGbas63BVELtwhUT60HQzK5v8L7Qoff?=
 =?us-ascii?Q?kTkFX3AMXbC/BpO2aDarOoiEqxAqZUCtU7i146lGIUursUktOq98a/wKR+o7?=
 =?us-ascii?Q?2Av8I/2LLWFCSgl45LPPrQLnUEXKV428YAv2UzkUgTubAl/nfMvLF9MneTf6?=
 =?us-ascii?Q?jCFZB9Ls6MH43o3z45lwDY9+HuKSscwppOf8R7AbcfAT4wb3x+Ui8+O2MbZE?=
 =?us-ascii?Q?NRJaazTLm3Qx5q4Pbm1T8GWdFtzBB+8b6J7kgGE1cUpJ7SVZrEXtGf04jNa/?=
 =?us-ascii?Q?DMxNdV43mJw/oiSEgSXBIGFNsiFf8fOftF7J61BBhOrY2aZelLTfbdD1k1Gw?=
 =?us-ascii?Q?FckrMqAjeAy3xvFlX14rhwQx1gSklfv7xJsVIpuvyFBEn84nMqELUbfHu3gF?=
 =?us-ascii?Q?r3mWjbAGX8C1ogsZJG9kInTf3Ea4b5h3N6yfvLIn9MAZ/5E/+R49kgJ6tkK5?=
 =?us-ascii?Q?0wlJb8yG5Eemx1GMyrEVX/vmzNf8faq/6OK2ZbaWpXYE4uJ6m7R+xffnJCwj?=
 =?us-ascii?Q?IX+unZaLxMOBpDJp+WILK6+FNfJTVjV3LMkQDVZQ3rkHQ+z0fU66c8WSxLGR?=
 =?us-ascii?Q?wsBU6s3RVKypfrJnMhz6sU/0rV+/t27gyxU1emgz8gGAsO80IckZixpgj4aE?=
 =?us-ascii?Q?Ws3kcir7IQHvIHg+/Zw1lVnz6p3QQmSTSva7fww4M26w3vgHmvLeLnx7IFhp?=
 =?us-ascii?Q?we2KMZfu+mojf4LTMko+QxurmHsijFR1sI7XdnDN+QenYcwbmtXqKdNuWMG8?=
 =?us-ascii?Q?YCbNKN3+eYpMbVVBqUe5MVfITOV+a9NG2YipLTwNGBMLtUMagVd7wII8KmXz?=
 =?us-ascii?Q?0yiS2wGvLFw+ld3o41fx203ue6LDjQ15ZpyTbEmFXCBGRiZPpNHvZGAIyNA4?=
 =?us-ascii?Q?47M+jM8jzOGl3LuKWzE/+yerOMfvZMZRTsve/NzjzrkfBPNbbad4mF7fTnzR?=
 =?us-ascii?Q?P52nK/KabHoWDKIEN9YCY1R5A2qV3hX+5tdohjUqYKzpn0tQNFxA0TTgaii1?=
 =?us-ascii?Q?AOzk/TZt2OAuITKt4ob81WKqLJOzTJBuvAtlhVsw8IwsaVqDM10Qe5P+YW27?=
 =?us-ascii?Q?ah1ITYiyTL1KEfkIvgG7kGgGTlkqw9qcyuv/fW83PH96KA43nzZrOE789xiD?=
 =?us-ascii?Q?Qh5Y7aUHXBum+Rai8klKejOLE7BXnFAIpxsqr5/qfLX/odWwT1FzidaYUhxH?=
 =?us-ascii?Q?ePiXa+UQb3Jz3flrfwnL8P71mpIJl8oTbFn53INA9Y+m2aYYKmmE1fPFv+7F?=
 =?us-ascii?Q?byoSMKi+twsiD9w93sJVC38dGJfW8olHbI96g3MWeaBj2OUnnmhc/H/r274H?=
 =?us-ascii?Q?iWK4Ha1dGr1UlhWFxXDcoNZyN+R19zaMavvKp5zqJlfGdYkc3WVkaoqt0ZHJ?=
 =?us-ascii?Q?QH2fmN80+X7K+Iws7R60Ql73biXHdoh3WzmNVLn5tJU7HemWhcTk7I1gOUDY?=
 =?us-ascii?Q?3PK1YgS7+aRA/xXeS8Wg4dCP61C3LXdx+GnBNaoy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3b912a-5fd7-4e50-2e65-08db7775b196
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 01:19:17.7008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KrcbGOJ/zfaMdo1EqlYWLMlAs5Na2RuSTqs+p3Z4v5RmPl5TYjbZx0fg6vLPB0cuEZR0qJ+6jGhEuPO2sAadNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4560
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans,

Thanks for your patch.

------------------------------------------------------------------------
BRs, =20
Bingbu Cao=20

>-----Original Message-----
>From: Hans de Goede <hdegoede@redhat.com>
>Sent: Wednesday, June 28, 2023 01:57
>To: Sakari Ailus <sakari.ailus@linux.intel.com>; Laurent Pinchart
><laurent.pinchart@ideasonboard.com>; Daniel Scally
><dan.scally@ideasonboard.com>
>Cc: Hans de Goede <hdegoede@redhat.com>; Mauro Carvalho Chehab
><mchehab@kernel.org>; Andy Shevchenko <andy@kernel.org>; Kate Hsuan
><hpa@redhat.com>; Yao, Hao <hao.yao@intel.com>; Cao, Bingbu
><bingbu.cao@intel.com>; linux-media@vger.kernel.org
>Subject: [PATCH 00/12] media: intel-cio2-bridge: Add shared intel-cio2-
>bridge code, rework VCM instantiation
>
>Hi All,
>
>While working on adding (proper) VCM support to the atomisp code I found
>myself copying yet more code from drivers/media/pci/intel/ipu3/cio2-
>bridge.c into the atomisp code.
>
>So I decided that it really was time to factor out the common code (most o=
f
>the code) from intel/ipu3/cio2-bridge.c into its own helper library and
>then share it between the atomisp and IPU3 code.
>
>This will hopefully also be useful for the ongoing work to upstream
>IPU6 input system support which also needs this functionality and currentl=
y
>contains a 3th copy of this code in the out of tree driver.
>
>This set consists of the following parts:
>
>Patch 1     A bugfix for a recent change to the cio2-bridge code
>Patches 2-8 Cleanup / preparation patches
>Patch 9     Move the main body of the cio2-bridge.c code into
>            a new shared intel-cio2-bridge module

Another cio2-bridge patch - https://patchwork.kernel.org/project/linux-medi=
a/patch/20230517103004.724264-1-bingbu.cao@intel.com/
I remember Sakari include it in the latest pull request.=20

>Patch 10    Drop cio2-bridge code copy from atomisp, switching to
>            the shared intel-cio2-bridge module
>Patch 11    Rework how VCM client instantiation is done so that
>            a device-link can be added from VCM to sensor to
>            fix issues with the VCM power-state being tied to
>            the sensor power state
>Patch 12    Example patch to show how patch 11 avoids the need
>            for hacks in VCM drivers caused by the shared power state
>            (not intended for merging)
>
>Regards,
>
>Hans
>
>
>Hans de Goede (12):
>  media: ipu3-cio2: Do not use on stack memory for software_node.name
>    field
>  media: ipu3-cio2: Move initialization of node_names.vcm to
>    cio2_bridge_init_swnode_names()
>  media: ipu3-cio2: Make cio2_bridge_init() take a regular struct device
>    as argument
>  media: ipu3-cio2: Store dev pointer in struct cio2_bridge
>  media: ipu3-cio2: Only keep PLD around while parsing
>  media: ipu3-cio2: Add a cio2_bridge_parse_sensor_fwnode() helper
>    function
>  media: ipu3-cio2: Add a parse_sensor_fwnode callback to
>    cio2_bridge_init()
>  media: ipu3-cio2: Add supported_sensors parameter to
>    cio2_bridge_init()
>  media: ipu3-cio2: Move cio2_bridge_init() code into a new shared
>    intel-cio2-bridge.ko
>  media: atomisp: csi2-bridge: Switch to new common cio2_bridge_init()
>  media: intel-cio2-bridge: Add a runtime-pm device-link between VCM and
>    sensor
>  [RFC] media: dw9719: Drop hack to enable "vsio" regulator
>
> MAINTAINERS                                   |   9 +
> drivers/media/common/Kconfig                  |   4 +
> drivers/media/common/Makefile                 |   1 +
> drivers/media/common/intel-cio2-bridge.c      | 464 ++++++++++++++++++
> drivers/media/i2c/dw9719.c                    |  27 +-
> drivers/media/pci/intel/ipu3/Kconfig          |   1 +
> drivers/media/pci/intel/ipu3/cio2-bridge.c    | 464 +++---------------
> drivers/media/pci/intel/ipu3/cio2-bridge.h    | 146 ------
> drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   7 +-
> drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   7 +-
> drivers/staging/media/atomisp/Kconfig         |   2 +
> .../staging/media/atomisp/pci/atomisp_csi2.h  |  67 ---
> .../media/atomisp/pci/atomisp_csi2_bridge.c   | 307 ++----------
> include/media/intel-cio2-bridge.h             | 105 ++++
> 14 files changed, 723 insertions(+), 888 deletions(-)  create mode 100644
>drivers/media/common/intel-cio2-bridge.c
> delete mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
> create mode 100644 include/media/intel-cio2-bridge.h
>
>--
>2.41.0

