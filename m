Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33D9A7869A1
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 10:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbjHXIJ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 04:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235849AbjHXIJg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 04:09:36 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579441732
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 01:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692864540; x=1724400540;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nqDqzjtxGBBQonDt7YQzzYcRBmMGMxJyWDsnl5jr2e0=;
  b=I3k4pSr8bqjaQHJ30/Cu3n7lB+tlTaUyat9wYprN7tyK84PIpqfRRqt2
   zzb88+F9GviL33hRsUdhLdZW6kyacIE3jGRmehJqvrVuV9pLibse8kH9w
   WO3vqulLlDtvR1c84e0Oc4IPFbKqxfUu6kETMIBqCeI/pjQxR1eR2Empl
   igBa88EE1Nzo91oHjAq7KHOnsvVwzuaZr2oLbN4UwocVDonVqpKT9kAyS
   JLmLY/Dx8cpom3XkahHshYSwyoRmtNn4kl1N647SkelDez6dIuX7htjAH
   FgCoTB9pfCFu/29xhB6MYWWTR9aPwfGZ0Mh8KIEbF7eiFKiV+2lPdLBKX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378129111"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="378129111"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 01:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="910812656"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="910812656"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga005.jf.intel.com with ESMTP; 24 Aug 2023 01:06:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 01:06:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 01:06:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 01:06:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 01:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiugqqeTbHN4k0XNJYrWQt15MT1G59yPBYRuSd1Sb6HFxjsjLwU2hIzlPf3u6pXoE3zX2v4cVICwIWWeOUHoZ40h84CL/KYDx1D4ETLy2mYs76ImCN+j7jErXbJ4RBH+YI99OVzBlHuvPDmmXvJZ/1HLf6pWVUtTQmVl0JC1FyD3aXa0f+TuTAmtSXQhfdgmLQ0CZ5WQinE41gD6NExK+wIn0/FXUVxfQjIcS0ki0DWNONv0V2xkmdE3pE7aF47okB7C7ZFPMXPqVChod4PZWU0XH9upInA7F/pQxQVec6xlORBfxjceErKM6NZF7MilHI+nzWadqsUYkzxh6KeZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QiJus4Eiooxlj1zPC1fm4EeBf6W0hHLmw2TvkdH4zo=;
 b=OlFBx8slEbEa0X3kRinBxjaURPfRSn7l1Uhb0UBpZvZWxKwFlYRpxsGzi4mNXSiil/kd+K29HfwyLY6xRGLInOa6vbP6vB5gifXh/QPlKCaHtNxP2WVlckNL3DjmwSWXf2U9/iDiSuzY7XjxfEsKYkK8W5aY3j+NZxPNZwiPzJJYmjD89vc/Z+UJ7zY5u6P8XuEgxDJwuJOskWGl0K8HzHl3GLj/7l80iqCTN/UzIH4gTkQgYt2kwu7Al/lHD+ZLTpHgQf5trxMyLRISK/4q2dzKArv+5ZSB+4mm7JjaTBHOyhg8RYje/gJ69c89DBr+5I9NB2Jf8c34HeXGAKeBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Thu, 24 Aug
 2023 08:06:25 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%6]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 08:06:24 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] media: ivsc: ace: probe ace device after init IPU
 bridge
Thread-Topic: [PATCH v2 3/3] media: ivsc: ace: probe ace device after init IPU
 bridge
Thread-Index: AQHZ1joOswbnyeiiVEKYi+W2f+ELo6/5ApwAgAAUL8A=
Date:   Thu, 24 Aug 2023 08:06:24 +0000
Message-ID: <DM6PR11MB43161EB05CA9B52300DCA5E68D1DA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1692847262-31790-1-git-send-email-wentong.wu@intel.com>
 <1692847262-31790-3-git-send-email-wentong.wu@intel.com>
 <ZOb+JhDzOd1+lM/v@kekkonen.localdomain>
In-Reply-To: <ZOb+JhDzOd1+lM/v@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|CY5PR11MB6344:EE_
x-ms-office365-filtering-correlation-id: 47f07d12-2dfc-4077-da73-08dba47902cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y4lr/cdHgIruiNMZTxxJBz7CTnF3IEqGFjxcL7p4PsI5pr0SP9sxA6uJgJuHj9kJoBlwzXZdpUDi34BiZyLfsJnVYLXqEQrJ6eNkHm1f3VP8mJwqm8FeYbtvPd1sCZsjFgLt88+lgVXl2QSDGOtfFdKKmh7dDeLChwufdx6Kjmnx2fU6Y7gJirvCJ9NWZEhIMPSv/eefFx/i7UZ1l/BSt+h2ajJXo9IlpjonSH22A4gsdGwf/KeVs+mdUdgAtDmiBS93nV+q61nu1PBFwr067+/4qlILxpVdBoZKQc3E9xfb2vjNgr9i9JjwxB8eVAlMtts7cSuTFnvNtoE+dpbkq3zMrkwGwQVcpcPMR9Ynb17gHGCXuSe25yZybxRPOVUk8wpzSCS1xLjYiukLEdmRCpdVlytNzgEmtmYzoWKMrtcaqNO1kOdncOLBUXvHMVkPJroO3vmCrSX4XT+EyYRpp13HzAlcDZ4zP7WhQYLrpoXjP57F9TT0TzJLdOSnrwhJrV21P7xc4gZn8N/LfaBeJUCxjQXoR+2SsYVxnVSWdaucyEISm+yFmB6SnWEXykRgTdGyj06knyWtTKkwywXEK6pYWkFvC6814No+bdzbTOWzFBrcXxH8KuNrrIvEpV9Z
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199024)(1800799009)(186009)(66946007)(64756008)(66446008)(66476007)(76116006)(66556008)(5660300002)(41300700001)(316002)(6916009)(2906002)(8676002)(478600001)(52536014)(86362001)(4326008)(8936002)(122000001)(38070700005)(38100700002)(71200400001)(9686003)(6506007)(7696005)(82960400001)(53546011)(33656002)(55016003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?61Q58dtRSfeEymX1q8JR0Ci5AdE6Orm2OoZF5A8DO7V5QXgmqqZOO6CLD2Xv?=
 =?us-ascii?Q?0emlIO6N79FNLSFVyE1/8i2H5ONYL7vOvCYKcwogsRw5v7N97lp/4E8BvGJC?=
 =?us-ascii?Q?SgAGPj9ocwkif8v35xtwpyXvVseaHNhw94KYKE1U/Mv3nb++3sbMFH7wmRDp?=
 =?us-ascii?Q?Iwb9j8Wc4fOIVnGGLp/YS52wmrvIioAbul9qZgQ5+PtPx9EulhvBaNFZPWsU?=
 =?us-ascii?Q?d3NuGZRo3QeTkWgvkBmG7Ih4SDEx4U9CfHv6+8LFJ9R2UFVhk5ZPjcLjK5pc?=
 =?us-ascii?Q?9YioHsgvZ3n2JTb1tk4tm1pBu+tSt61txoihyH+r+iPjyS8Pm5KZbfhA1N7p?=
 =?us-ascii?Q?lEUgWCo+0h7Fx6vnX8BFK/cR5MKOSrRXCBZA4jH6yK8HUpb86a4+vLs5FAai?=
 =?us-ascii?Q?a2LXZZQmxnFe2LpQG4eKNoCUKCZuAg//btO3lYjeuWM1cZhhuHamAn4be/Zp?=
 =?us-ascii?Q?kHJT1lSADwX8KaA/y5xDwaoCvsIHtX2ubc6bDAUWheX3zhA+btvT6Ud2hvGd?=
 =?us-ascii?Q?jiCP9l8lSLmDWvB29ADvgD67lTa3atr0gb1vguBbN+Ut6uaemdd10xajN9AS?=
 =?us-ascii?Q?xCepX+qwPiBJ68zk59va0Q5qpjaPV5U4CVvDvR48YNPsrNDJ6TWJaTJraqnr?=
 =?us-ascii?Q?QGXuMnMyUJl1/JYmY/Rcnm2qpYbIoKRljdSK6l5UzO7fg02NAHPj4ZyxMED6?=
 =?us-ascii?Q?yRlllilR97QCzGEFRInhzm3ixEyaNEKVciJcUh8WlxigozziiEJvUPetxY4w?=
 =?us-ascii?Q?vcc+pJy7AtlJiT77KObO5fsz529/i1h879ZarRjVQRlP/xE3Z/TsvV9UK72P?=
 =?us-ascii?Q?dPtTYpuz8NuskedHgAMW2pDrXC5nnP9dVBlPWclH0QHcWQ+nsMCSblXklyMz?=
 =?us-ascii?Q?pxMwgtBN4WXr3DVe+j5kZwpg/pUm+GyL8mz+Bt9IInoks4wFk67hgps8eJJr?=
 =?us-ascii?Q?RoyzBs19R6+lnMsqtzrx9SEXNZ5mN/7hCaHp7DWN3PSo/IfXjuFRtF3euEfN?=
 =?us-ascii?Q?nkp+dUveq+OVLIcSG7qp8nVaqfX6QORkCq0pHdXTDZzrcB1RNhRmJHd1/OA/?=
 =?us-ascii?Q?2Yt+9ouK2G6+Cl8du9c6ZawW9zuivlmObrZyuJ+so11UactxjHrqAbUW3w+4?=
 =?us-ascii?Q?uriKBKifc4lwkpqwfjHRUOwNaAYqkCyQx/ox3/7Dpg/Om+RREaAOOSnrc89e?=
 =?us-ascii?Q?//UDaIwtEf+j8N3POfLOYPYzU4bYwbIViIPLkhQwv7tPPUkSa8KKRdICC94q?=
 =?us-ascii?Q?Lg/bjwgHnMndGu+ATvxG7udHvq3Gb1WCxdjtpszlqb9ACjkBuiFhOXaG/mwb?=
 =?us-ascii?Q?UigU5YAg8cZ0s0mwjaW3wRR5DamUyhZvB3+qJcUc5biqsB7uAjprVE2TCtea?=
 =?us-ascii?Q?gZXFW/z9fKvx2yz3YOgok7+85beYZztHrr8SyR8I0Ppu21aXPIXleuTmtISz?=
 =?us-ascii?Q?vA7OLUFBkEy8hlrZPvA8Ny92FUNEEdgFQrm9RfGZgXOh2Zbk/9uejQoWgDpC?=
 =?us-ascii?Q?K7hNBd2aSH+E57Ev72YeKFGqRtDBpKhzvAS2niADit5baoxk+Iy+FX1fTA?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f07d12-2dfc-4077-da73-08dba47902cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 08:06:24.7507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uEMPmhxvUhoWGNkWO8xzPfQD1kqORvIiO6AadgDbmIZLsg3364x89LvOV+Pw7sBSK0pGzb6noyTt/zNAqFuiDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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

Hi Sakari,=20

Thanks for you review.

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Thursday, August 24, 2023 2:52 PM
> To: Wu, Wentong <wentong.wu@intel.com>
> Cc: linux-media@vger.kernel.org
> Subject: Re: [PATCH v2 3/3] media: ivsc: ace: probe ace device after init=
 IPU
> bridge
>=20
> Hi Wentong,
>=20
> Thanks for the patch.
>=20
> On Thu, Aug 24, 2023 at 11:21:02AM +0800, Wentong Wu wrote:
> > Probe ivsc ace device after IPU bridge has been initialized.
>=20
> This doesn't really match what the patch does: it puts csi_dev device if =
the
> device doesn't have a fwnode. Could you provide a better commit message
> please?

How about below commit message:

    media: ivsc: ace: probe ace device after IPU bridge is initialized.
   =20
    When probe ivsc ace device, acpi_dev_clear_dependencies() will clear
    the consumer and supplier relationship between camera sensor device
    and ivsc device. But the IPU bridge will setup the connection swnodes
    for ivsc device and camera sensor device based on this consumer and
    supplier relationship. This patch defers ivsc ace's probe to make
    sure IPU bridge is initialized before this consumer and supplier
    relationship between camera sensor device and IVSC device is cleared.

If acceptable, I will push the v3 patch. Thanks

BR,
Wentong
>=20
> >
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > ---
> > v2:
> >  - call put_device() if IPU bridge hasn't been initialized
> >
> >  drivers/media/pci/intel/ivsc/mei_ace.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c
> > b/drivers/media/pci/intel/ivsc/mei_ace.c
> > index 7879f1f..627ec40 100644
> > --- a/drivers/media/pci/intel/ivsc/mei_ace.c
> > +++ b/drivers/media/pci/intel/ivsc/mei_ace.c
> > @@ -406,6 +406,9 @@ static int mei_ace_setup_dev_link(struct mei_ace
> *ace)
> >  	if (!csi_dev) {
> >  		ret =3D -EPROBE_DEFER;
> >  		goto err;
> > +	} else if (!dev_fwnode(csi_dev)) {
> > +		ret =3D -EPROBE_DEFER;
> > +		goto err_put;
> >  	}
> >
> >  	/* setup link between mei_ace and mei_csi */
> > --
> > 2.7.4
> >
>=20
> --
> Sakari Ailus
