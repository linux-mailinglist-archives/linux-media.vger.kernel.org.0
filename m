Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31A756EC63B
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 08:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjDXGXE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 02:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbjDXGW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 02:22:56 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E990A1726
        for <linux-media@vger.kernel.org>; Sun, 23 Apr 2023 23:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682317374; x=1713853374;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XfGTEn6YGvzxrUGHefPfzft3Ds86wvTy46F3rnLE0V4=;
  b=fJSdEFfEyzEvjjNVlKDaKY/PpkhrnYd5qQINAWjw8vBKCkBVQUHlfd7i
   OEsIKP2xXLkAcyIupa5ZsYG5t+IQ8MDLyGdkeT8J65cF9gECgGF55iVvF
   gOEkJMysqnfavmgXr4ngopl4U6jBtolMyWNnyC2cd7HIyiy4dBaghJrLc
   pc8gd/mfJtA35ZRCVy8xMb5VCR2EITvZUPed/67czNgHPqgsD8ej3xyy/
   RqwMwO6mU6tkq01Ax2GYZH+Ivm9SvljTySHijxLCwfGdp7X5UMo+asIZ0
   X9DvC9wJ//Kt+ns/9xk3SuvJS85C5KKvlW29tEMB9F14ZxHNnSVNUgTWz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="343854163"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="343854163"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 23:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="723464449"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="723464449"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga008.jf.intel.com with ESMTP; 23 Apr 2023 23:22:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 23:22:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 23:22:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 23 Apr 2023 23:22:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 23 Apr 2023 23:22:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KACuPKA2GdZfJGOVXnjXa4XHldckCYLZglrvdoYX7zV2AbdhLZbcp99QT51GayqqAd89MixjPkSnzML6Ou4wY8E74M0ozHAMVh53RAw7f/vdJl9LOE0A6pflvA3pQ5RzrDVCzNcCIYTsLcK1rd0ylwqjIYydbWvOc1M9PcFRo8koNHtjQb8Z4hKoPttJ0w/juOl32xEfoQrbhD/hJ/DbS1Fl5iE4udV9erF6IlinFlbR26iWR3RKCpjpY2lIb95chto2sxi3XwD4695HTs+HINMJPF43eAJ8lciYhvGzhe/CvxlgKHWDuspgXtoP69J92Aa/zseNedDXNmNIkgkGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quMWGs6wx/sHJgxGhO81TVMSybVt7s74vfhpc0HI7zE=;
 b=oFypE2fdF+aLT/uwnNzeMVVuzD7uGWQzU6wqpheEHOkeDbDqyCkzI6I4vdacLAORpp8EJKlh0Dr8bEcFEFguTjtXtvF5VfHRqp8c5xcu2Wm0wWYoa0OHnq8Yx+lVu96IGu2ZHHNWmvEs8VUZf0aTWq2bzrxA/qQeRSSHnMFzkHgcFtLtPlO0BDSPPPfPRUvJaF10q8cGel/euYm91oCSDr5gei4lLvp37SvobQoMkDvpJHplO5nxXIsqUwRsFX5V9IczKpLpEnpnZM5DANaskcldaNrDwHiilYyOYM8lqxKviCkk5S1nRaQKsDZBZHhq0snGFfQ9LunwNmItju1+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by MW4PR11MB5910.namprd11.prod.outlook.com (2603:10b6:303:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 06:22:41 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::7caa:b0e7:d0fb:c905]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::7caa:b0e7:d0fb:c905%5]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 06:22:41 +0000
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
Subject: RE: [PATCH v5 2/3] media: pci: intel: ivsc: Add ACE submodule
Thread-Topic: [PATCH v5 2/3] media: pci: intel: ivsc: Add ACE submodule
Thread-Index: AQHZa1qeraqyrgdb+UGRKD/+nIb53q85W/GAgABpmGA=
Date:   Mon, 24 Apr 2023 06:22:41 +0000
Message-ID: <DM6PR11MB4316535169350E2C92984FF28D679@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
 <1681096465-17287-3-git-send-email-wentong.wu@intel.com>
 <ZEWGGem5Ea/AFBYC@kekkonen.localdomain>
In-Reply-To: <ZEWGGem5Ea/AFBYC@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|MW4PR11MB5910:EE_
x-ms-office365-filtering-correlation-id: a0308e6a-ee17-4b7c-b110-08db448c4eca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bt1Va89PZGTTnPoQqdG7azw63LO3ea13Yr47g5emJeVtsoX4KGFV2tcJcGSWEyL7U+fbprVd0kelhDZs5eXVyNNTG23ERP57blAwQlFrCZvLWZhg+wkxWqG1HjRWss7LT6aUlJSJGD+miQ2jqlitUUOYunhERmQOdND0BxDNFWtx+Cj8rl9P1vM4+I7wbn0SH5g+RDASp2mRNuRNqWWHLMXm9Bd3WEah23iW9BG9Tk1IDHSwCvUYJW3rBMa8LfnO7RtirZ8rOjkCaHI2IcZISiFO+yCCX2GOdsW8K7Qn0LmCKWQRIaT1S55NBR7h0zQYC+cELT3OnEuxzO/SdM5X16Cz8hb8JDk24rngnKz7OZZGzkON6k3a/15Lv+mFCkSdsgQK5Cal/BQcOdxwsQTg8pVvbvRdzcNi+b/A30nl8/f0vXWqT8jDhyxNkmLJadYSHMDw3PwBZJO2DeEyeQa1mPkD0FD4lLAY5Ub+593C6C2wYMhQzetrBi2nS6TuG1PEZViYxDK1WwF7atlH6ax4IVBupD4pyDT8jGAZnDnruhcBZjFrjQbykBlcEVDSV8I1Q/BIcJuyg902DlAi6cE1rwLBUjJwZIyrBu5o0lvKMUR1nRilbVy+OJQNUHxtWw84
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(9686003)(53546011)(6506007)(26005)(38070700005)(55016003)(83380400001)(186003)(82960400001)(38100700002)(122000001)(66946007)(478600001)(76116006)(86362001)(6916009)(64756008)(66556008)(66476007)(66446008)(8936002)(8676002)(54906003)(52536014)(5660300002)(71200400001)(7696005)(41300700001)(2906002)(4326008)(33656002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cVonWKf1lZBY2P0/8G/JTiMpwT6YuFjhFaLrZBHeowv8EVaKSIXPuMF9F/DS?=
 =?us-ascii?Q?RFMtCONR1nKyqvmoL/vMn+P6EHSfg/J7kk6v+KzC0wWss6CWGv6dLKZniFBH?=
 =?us-ascii?Q?9CF3hxew8GlxKAGAXdIfDR7IkTRku3WE4DXomtgMqmMnaZpQuuIWuwWIIXYv?=
 =?us-ascii?Q?+e3/g+95A8EADSmSQBeIiuKeiWMrhwO+VwuPUtL+bt5xkM4VVJn/hisI0G7z?=
 =?us-ascii?Q?cxBALe2tsgd/dgIuY/qeu5i0FIR+1dzi7mHsCjkdVcp+jTTQM6Xn06agHcn2?=
 =?us-ascii?Q?VB3JO6kbs0Z9PCC/u8+ZPKH3qn/KvBLe6W9RHi3VDnWPvx/B+cADtkveal5s?=
 =?us-ascii?Q?iTO//ZF0QVxGxqevjtxcUu9sQTzppaY1oKbB+0oy6Hfjtt7SKCA+Htv1mDL9?=
 =?us-ascii?Q?bfjr5eUtUxN1j9F4KQTQNvVCt6IpTAHE4hFLzjV3gBjDCbBZ5AKXKPijV2Ty?=
 =?us-ascii?Q?WDGtlJImSiyFEO3XGeFY8NtaMcnHlvjude+9ubDycaCL3SKErMSWFfmvrUQE?=
 =?us-ascii?Q?OBHBMtCMQvRv0lH48r+9PrmznO7odl6R5iBbFMy0x+gkRfVbeBIbi0JZOtjN?=
 =?us-ascii?Q?zRA2QtGjhaZXvSB/d+cSFBoN7iHvWvEkgqJC9qRmDP15E+bqV46xdicATj8l?=
 =?us-ascii?Q?KP1uWWJKOQiqiAA5s9FTf1IXjmk2eEBLmKpqCGuukvKSuobkIjdsqNGnQ35n?=
 =?us-ascii?Q?p913SCps40gJ/fmdWH48iqPRH1FgmYVO69e/HSwNYAIC6hcB0np9tcf5M9tr?=
 =?us-ascii?Q?2ZzRHPJFYXNSq/L1jRo5q2/H8BGqWHDdnXMY4w/G7XtFce6hLDmpD9ta7Xsg?=
 =?us-ascii?Q?Zzub5I2V+lrh1vYp10+GLScA0Y/yHMjowqG1aVGqihfCAUxRR7ULw3u6yek9?=
 =?us-ascii?Q?Ss1W2x3EN9Sof+Fp3NnYgNMJ447MsqXBDitD/ZsW/lG27m5EIKAz+jalp+NS?=
 =?us-ascii?Q?wDXe88GjedBfL+hIquPohzg5zSzgDPdSZYodXLom2XgMPjbqN/FNP/bVGmk9?=
 =?us-ascii?Q?d1ulHAoCbTYGTd9Hjm7QRkzfrxY4tf0gurqrw9WkycmuWDPsEdYpLQEbvmeN?=
 =?us-ascii?Q?WsGA7gzEIcrhScFpIt8j6My40kEWo6CM1BTLl8ePEjyGbEdEP2iL5wO0MTc5?=
 =?us-ascii?Q?lJMksHXkYX34o6qQ7Q3R611XKQ9r0MKDQ/voSSVUUzQ3a29XSGbWsHy7jjEy?=
 =?us-ascii?Q?hjY2lgicYF67PqmY/K1FX+6dyOsDdFl8sPAqTWnG9014qH57YhCUO30Eplsp?=
 =?us-ascii?Q?/gQywTInWe4R+JVyI3XEtUh9PL/y+obtkp7PmDyORCO7wnNcvNi4/MyXbGVu?=
 =?us-ascii?Q?ZEU7YrD4DMDLjmmE5y3pOFFXeYbvjj+31GH6ra61LyzRgp1dMGqGcBcWEGlq?=
 =?us-ascii?Q?WDlZuVvXJy8YyKqob/nQ8VzDJu9jpP3aaDB6xmV6SX81VWH40mTOroJrwrRU?=
 =?us-ascii?Q?GPFaY/PKYVb/Ivf12gZ9IsORpbF/idMAHhAJKp5srvfDZgUVtBuoMUMsTJHD?=
 =?us-ascii?Q?Fdg5FLsuZ0OEjUcfzLQX5yKEb7jkaOLMgfxaO4FCSA872k+1yH2xoLZ/SR3n?=
 =?us-ascii?Q?TlLxI5n52tgy5DYWsCd1TmyG9aikWRcwdodnblJ4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0308e6a-ee17-4b7c-b110-08db448c4eca
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 06:22:41.0659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f52Eh4ixNoZbUwCyEpEx22DWNCDw1qu7TVoNt350ay04/0b8zOgKpL8nazg5se69Gqh/OFYz+9ItGeBRib/4jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5910
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for your review

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, April 24, 2023 3:25 AM
> To: Wu, Wentong <wentong.wu@intel.com>
>=20
> > +
> > +static int mei_ace_setup_dev_link(struct mei_ace *ace) {
> > +	struct device *dev =3D &ace->cldev->dev;
> > +	uuid_le uuid =3D MEI_CSI_UUID;
> > +	struct acpi_device *adev;
> > +	struct device *csi_dev;
> > +	char name[64];
> > +
> > +	snprintf(name, sizeof(name), "%s-%pUl", dev_name(dev->parent),
> > +&uuid);
> > +
> > +	csi_dev =3D device_find_child_by_name(dev->parent, name);
> > +	if (!csi_dev)
>=20
> Note that you'll need to put csi_dev if probe fails. Same for driver's re=
move.

Thanks

>=20
> > +		return -EPROBE_DEFER;
> > +
> > +	/* sensor's ACPI _DEP is mei bus device */
> > +	adev =3D acpi_dev_get_next_consumer_dev(ACPI_COMPANION(dev-
> >parent),
> > +					      NULL);
> > +	if (!adev)
> > +		return -EPROBE_DEFER;
>=20
> Good, the devices can be found here.
>=20
> > +
> > +	/* setup link between mei_ace and mei_csi */
> > +	ace->csi_link =3D device_link_add(csi_dev, dev, DL_FLAG_PM_RUNTIME |
> > +					DL_FLAG_RPM_ACTIVE);
> > +	if (!ace->csi_link) {
> > +		dev_err(dev, "failed to link to %s\n", dev_name(csi_dev));
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* setup link between mei_ace and sensor */
> > +	ace->sensor_link =3D device_link_add(&adev->dev, dev,
> DL_FLAG_PM_RUNTIME |
> > +					   DL_FLAG_RPM_ACTIVE);
> > +	if (!ace->sensor_link) {
> > +		dev_err(dev, "failed to link to %s\n", dev_name(&adev->dev));
>=20
> Please add error handling --- remove created links if probe fails.

ack, thanks

>=20
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
>=20
> --
> Regards,
>=20
> Sakari Ailus
