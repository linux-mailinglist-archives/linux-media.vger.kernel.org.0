Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8AA6EC6D0
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 09:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjDXHJm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 03:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbjDXHJl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 03:09:41 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC8FA0
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 00:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682320179; x=1713856179;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qEEa5v+ZwHqu4C4YBDv5KaxcTU2lTzEUvByPcyFxThA=;
  b=jLaoPi0eT/qfpyiJfRTDsSLvCUK2BD801fvUjOXThSVlvm/s28ysORIv
   +AbsAC8/FJ0VV358SNPCk+fkeH6b6mh/cECgR7XI3gaZLDlhhW4E0Rt+Q
   5a5Rz0BaAJTatXFQ2QzjILKhTHmzyzBDAM7SbIEq3IPmEnVseS1jOvkOj
   OAx+ql3S0aqswcx54u9c/LArpGE8qmF815IIwttGwq+FaoTvGEGGj2ViW
   GUoNALfBIy1GWlczVk39ojpoKeeyRhe/2qkNNOWwj70Km0esqVgWL0Q/F
   WGcyRP2lG/zwYk/QQjnXUauGdFKnpiH+n8qhsPUHAOVE/PprJBmRM1bfd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="326699467"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="326699467"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 00:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="817151164"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="817151164"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP; 24 Apr 2023 00:09:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 00:09:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 00:09:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 00:09:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 00:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOXvGHWNE/CyXYa5q9Wibxs0+WN+9HH2XqXsfZ/Mfz83yH+mtErxrGo7Dycwg4PcCEAl4MGqL7uzPtaqGqgn7Z0PtU6MwOoWvEG4Ds7ai19EbvOoi/eTkNnjLypyIW+mHcMygJEeV8LJAbfb4jAVjYLRll9giUN4adR6Z08Xfhknzg3wuPdGwKBdoXJJAIXQdtJ78N6c5ajNBDJdOvmnSiuPDmpWHZETJYJAt5nGZ0kAWLhhMmc+8qlJclsEj5FUI+Sse14dMpsqGPrgGF3FcuBGPj7HIVzkWhvBnwU1eOZVkwcQ3wIAvLmFIQBgwmCwJzT3O0pvQ9tzZV4LtmumIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2o0CWFLFMO2qEYA1dAIOgGJEpnLG8BDN5/U0JndaHA=;
 b=F6RjOqnsF8M9+KKQpvk93Ct7Bfdsqr9J/Q1XZ5IGngcjleaGc8bXkrI7qxbNBRKtNvgkeh6fp0NQX8EdRsqZEEakQYyvhYvkH767Ti3BCPGeUFeRdfSED48rE7P6dkzQXQbjFXjGH5CJNBTPLMeWROoxjEmvb6XcOdbTrj1y2HxP8Rg7IcqFIYNE2PLKQ7Vou1ueWZ2VuDlES7CHlA5J4RuQRKc5ycFSkcda4IgLnbvRNxf8aE9UJ4SV0VMQOf7dPajOgrxKNBbY1cON5lhkFyJUKisj+j6Mi2gNZjJXW7D9XcUYNihEa1EcB+J9qidwnvcf2D22brFRczIZots58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 07:09:35 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::7caa:b0e7:d0fb:c905]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::7caa:b0e7:d0fb:c905%5]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 07:09:35 +0000
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
Subject: RE: [PATCH v5 1/3] media: pci: intel: ivsc: Add CSI submodule
Thread-Topic: [PATCH v5 1/3] media: pci: intel: ivsc: Add CSI submodule
Thread-Index: AQHZa1qb83vOHs0GwUmrsoEqBYfnoq85MxwAgACGYOCAAGOoAIAAAK2g
Date:   Mon, 24 Apr 2023 07:09:34 +0000
Message-ID: <DM6PR11MB431640E716F14528ACA35F5C8D679@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
 <1681096465-17287-2-git-send-email-wentong.wu@intel.com>
 <ZEVj2Je9sNKDcBXn@kekkonen.localdomain>
 <DM6PR11MB4316D6790B4795647537A2E08D679@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZEYoKq4yaj0B//0u@kekkonen.localdomain>
In-Reply-To: <ZEYoKq4yaj0B//0u@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DM4PR11MB7328:EE_
x-ms-office365-filtering-correlation-id: 8bcbfabc-107f-4051-df4b-08db4492db82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sNmxyJgnJyr+nkfjDLc4h8S+1TKqUSdHDOJrhZALJZF2piq3/9ZlW+IAcsFPlFG59qOoEU6lygsBMUDW7KQ/Z4pl80XCOAeOuOoyQNcSj99CERdyfUj5ghbWomn7npNFNJfXp5APtgjDjI9y0eSfuqbOgeqvo4NmBmJWxIOGcTnAwLGfyTb5ljTf3Ie7gpiCEC9o/hhGZaICQ5UW5h42YCsiqyzyfds0QrfARKQ8CXnW4ggenqafTTHKnO7i9iPngHnSj1/wXv2QVh9iyZAy4se4HBg8rrKz5GwRSAiZfmAzAbr4+E2fBkwVm1JsBaFV6p8GoUmlJX/P8gMX2HkZ3sFARwmW3DeP6py4JQ/nt/rblGfEbATFT3NhM/ty7JRFRcbjEyMmbwze4rGY9yG5UYsYVCANBYvN5X6Ue8i8BTveOrmCSSV5Q1K9VqQSIwre3YyBmm5eq8zqXuZe4n2lJgOIybA8FH8hrb/5OhbjSyhd7USXdqKI7f1HvN4Lh1dBMdX5mEma4AKVFmFh+K1O3us800W2XBnxQPPraQbCUG/zYsEsaPRqYff9+eOhnnMWyb3tIAg91KG3Ain6L04sjaLLLzaNSwdqY/V87iVpeYXrheieowT3o3HiduAd6ZtO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(7696005)(71200400001)(55016003)(9686003)(6506007)(26005)(53546011)(186003)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(8936002)(316002)(41300700001)(6916009)(4326008)(478600001)(5660300002)(52536014)(54906003)(38070700005)(82960400001)(38100700002)(122000001)(86362001)(33656002)(83380400001)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qMYJ8w73j1Ue3QV0mSM7j8wTSggx1dVkmeUZRiki+nHfok8IKPIp6VIKjESD?=
 =?us-ascii?Q?iTqkXNcANOfqcPGdJUkzjqNgAOhlvxGU+BF0/rnfbNL1bHUKUjVFt7wHzae0?=
 =?us-ascii?Q?Y/tYrnw+kK5n8hcBacaHJl1+OX/0cNFSug79pqRmvQsSLxC3vPqUraBqrreU?=
 =?us-ascii?Q?DC+5NWuXf3v45q3OQ/yBgj9A7B0czFs37+MEqAfm9k/++pRQe9FJ6ofhAomu?=
 =?us-ascii?Q?embZMCIDA33iEb6zyVHYjf7f885yIsZkKq4gQRLQme/mJMlejhHdRTdyD2d7?=
 =?us-ascii?Q?Qb/TE3VrQPc4WYyOHNjpCmWCt52EXUDiAwaC8a4t9Fy7sJrUwadeubLAkuy4?=
 =?us-ascii?Q?tI7bCGGQl+vh00m7UzQ1iyMpEiznY4zfUMjopTLHpCVXMrQAn1dTJ1bM/lnp?=
 =?us-ascii?Q?hOmXbAoOulj3K+DruDVlPWdsLigiYKyQ06JxVsGR5CtX1n3pn0ynv3xsxfEX?=
 =?us-ascii?Q?PHKpTbUTee2w56ZhDwH2sYHdoUS3jTTsX0jo4suD9ErsGAy6iCRirTHxp1Ak?=
 =?us-ascii?Q?A15y53GtMAPwSOu4g3NdBmOSK3aSWLVToy1FrZW/z1wkFHb1ub8Tm2aINgWF?=
 =?us-ascii?Q?YJZH+oF/7M6RaqFGe7WzJB7rh7gbyq9yuycDQIPze49jne0O6iA3HwjnrnLS?=
 =?us-ascii?Q?qfIGU/IE7KadQQHP9OZoQfwG1xeZmIKETH2HQsFRoFDNNixBvKmkvXKuGZlo?=
 =?us-ascii?Q?4KXwJ/t9XQbXIGlAlpe8whkmL554sQ2Twi+p3jqoRnSPFnMlv7Ql5PrHNJah?=
 =?us-ascii?Q?YNjDZDlLhn2Gh+UDWWHan5Y+JoyAp9Bewbtxoy/RujO1l4RusinbLWoUcWQP?=
 =?us-ascii?Q?D/JFfJdQ6CB3E4Nb0anSTwBrI4GqRbXrM4f7+MyoooMEWc9mV3aXUhrVLJ45?=
 =?us-ascii?Q?MsUN/p3QzqSCXB0qxy5H5VuWmUltYRc01sTZ6+a2jPXjLKeGulkf4Jz5tvnC?=
 =?us-ascii?Q?qeSHUL0sHCZxFWf3K0Fcx7u3N3pNNbNM/jjfYfAcUtsfEs2qPOzdoJC+JwlY?=
 =?us-ascii?Q?hxdwrxmof/mj8/JpZzY19IErq5/3x2HsDmOmfdxF2syWLBKcCndrFeWYCMfh?=
 =?us-ascii?Q?fg1cVxE0kCdmH72gC2HIR0MKetfMZOWGmCShCSG5IgRMdR0JRinfGEENijsP?=
 =?us-ascii?Q?gKT5s9VH7OPpyJ7S1sTkYH88OBqYNbTZOsBatQ+dRmvRXGYq0FvwfB6X0boB?=
 =?us-ascii?Q?mHJ699ZERd/PCqcJ+0emqL3gT1gPkdCjQdB9XbSm8NFDDdjaBCaNfnJwp3Bj?=
 =?us-ascii?Q?rHd8HlCo5fkTy7TVZN5yrFkvU8pxCg029cJCTRMkE+TSsEfFEYmpWi3D6a0+?=
 =?us-ascii?Q?MDAyX6hspAHfcu1mSRx1S/PbMp1dsMimsMIHRL/Yihxir7oSoE/MmBbUuYna?=
 =?us-ascii?Q?6MMUnuZhJcgm/9i/zyyMm6p25lPpLX8Prwwz5i360h/+GXPgH+7jfjvOyAFQ?=
 =?us-ascii?Q?9dtViA5J6nmdQ7pN5uKmAIoCWSoyRNa748REeYivOsMGoxMeuGylW60ODi1U?=
 =?us-ascii?Q?Ju6oVPxMdLba5Irk6elwXZw3PUK1o8QLTlX7U1cXL5DfDD8Krak4NUqnv2U+?=
 =?us-ascii?Q?+lbp3t3g08rybvG6zXwOMs7g9fd9xRjA8VF4NV+I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcbfabc-107f-4051-df4b-08db4492db82
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 07:09:34.1616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fvxI/C5hqjWdclRmpQQ+jJ6e5jlDEjV8hlkE9mnmfGlr7Pdm/gU0k2jCNd0E9ixtzwmzsqb84RyJFiA/TUVKpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7328
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

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, April 24, 2023 2:57 PM
> To: Wu, Wentong <wentong.wu@intel.com>
>
> > > > +
> > > > +/* configure CSI-2 link between host and IVSC */ static int
> > > > +csi_set_link_cfg(struct mei_csi *csi) {
> > > > +	struct csi_cmd cmd =3D { 0 };
> > > > +	size_t cmd_size;
> > > > +	int ret;
> > > > +
> > > > +	cmd.cmd_id =3D CSI_SET_CONF;
> > > > +	cmd.param.conf.nr_of_lanes =3D csi->nr_of_lanes;
> > > > +	cmd.param.conf.link_freq =3D CSI_LINK_FREQ(csi->link_freq);
> > > > +	cmd_size =3D sizeof(cmd.cmd_id) + sizeof(cmd.param.conf);
> > >
> > > Could you initialise this in variable declaration as I requested earl=
ier?
> > > The same for other similar cases.
> >
> > I believe we have discussed this on v3 patch set as below:
> >
> > 	> > > In some cases you're using memset and in others not. If you don'=
t
> need memset,
> > 	> > > I'd prefer assigning the fields in variable declaration instead.
> > 	> >
> > 	> > The declaration will be like below, but it will break reverse x-ma=
s
> tree style.
> > 	> >
> > 	> > struct csi_cmd cmd =3D { 0 };
> > 	> > size_t cmd_size =3D sizeof(cmd.cmd_id) + sizeof(cmd.param.param);
> > 	> > int ret;
> >
> > 	> It's not a problem if you have a dependency.
>=20
> Yes, I meant the non-Christmas tree (reverse or not) ordering is not an i=
ssue.
> Dependencies of course are of higher priority.

Thanks,=20

>=20
> >
> > >
> > > > +
> > > > +	mutex_lock(&csi->lock);
> > > > +
> > > > +	ret =3D mei_csi_send(csi, (u8 *)&cmd, cmd_size);
> > > > +	/*
> > > > +	 * wait configuration ready if download success. placing
> > > > +	 * delay under mutex is to make sure current command flow
> > > > +	 * completed before starting a possible new one.
> > > > +	 */
> > > > +	if (!ret)
> > > > +		msleep(CSI_FW_READY_DELAY_MS);
> > > > +
> > > > +	mutex_unlock(&csi->lock);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static int mei_csi_pre_streamon(struct v4l2_subdev *sd, u32 flags)=
 {
> > > > +	struct v4l2_querymenu qm =3D { .id =3D V4L2_CID_LINK_FREQ, };
> > > > +	struct mei_csi *csi =3D sd_to_csi(sd);
> > > > +	struct v4l2_ctrl *ctrl;
> > > > +	int ret =3D 0;
> > >
> > > No need to initialise this, it is always set.
> >
> > ack, thanks
> >
> > >
> > > > +
> > > > +	if (!csi->remote)
> > > > +		return -ENODEV;
> > > > +
> > > > +	ctrl =3D v4l2_ctrl_find(csi->remote->ctrl_handler, V4L2_CID_LINK_=
FREQ);
> > > > +	if (!ctrl)
> > > > +		return -EINVAL;
> > > > +	qm.index =3D v4l2_ctrl_g_ctrl(ctrl);
> > > > +
> > > > +	ret =3D v4l2_querymenu(csi->remote->ctrl_handler, &qm);
> > > > +	if (ret)
> > > > +		return ret;
> > >
> > > Please use v4l2_get_link_freq() as already discussed.
> >
> > ack, thanks,
> >
> > >
> > > Didn't we also discuss that you could do this in the s_stream() callb=
ack?
> >
> > We don't need configure CSI2 link if call s_stream with enable =3D 0,
> >
> > But I'm ok to get this in s_stream, thanks
>=20
> Yes, you should only query this if streaming is being enabled.

Can we just query the link freq in mei_csi_notify_bound and record it?

>=20
> >
> > >
> > > > +
> > > > +	csi->link_freq =3D qm.value;
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +
> > > > +static const struct v4l2_async_notifier_operations mei_csi_notify_=
ops =3D {
> > > > +	.bound =3D mei_csi_notify_bound,
> > > > +	.unbind =3D mei_csi_notify_unbind, };
> > > > +
> > > > +static int mei_csi_init_control(struct mei_csi *csi) {
> > > > +	v4l2_ctrl_handler_init(&csi->ctrl_handler, 1);
> > > > +	csi->ctrl_handler.lock =3D &csi->lock;
> > > > +
> > > > +	csi->privacy_ctrl =3D v4l2_ctrl_new_std(&csi->ctrl_handler, NULL,
> > > > +					      V4L2_CID_PRIVACY, 0, 1, 1, 0);
> > > > +	if (csi->ctrl_handler.error)
> > > > +		return csi->ctrl_handler.error;
> > > > +	csi->privacy_ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > >
> > > You should also add the LINK_FREQUENCY control. Make it U64 and and
> > > VOLATILE, too. This way the driver's g_volatile_ctrl() gets called
> > > when the control value is read.
> >
> > ack, thanks
> >
> > >
> > > > +
> > > > +	csi->subdev.ctrl_handler =3D &csi->ctrl_handler;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int mei_csi_parse_firmware(struct mei_csi *csi) {
> > > > +	struct v4l2_fwnode_endpoint v4l2_ep =3D {
> > > > +		.bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > > > +	};
> > > > +	struct device *dev =3D &csi->cldev->dev;
> > > > +	struct v4l2_async_subdev *asd;
> > > > +	struct fwnode_handle *fwnode;
> > > > +	struct fwnode_handle *ep;
> > > > +	int ret;
> > > > +
> > > > +	ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > > > +	if (!ep) {
> > > > +		dev_err(dev, "not connected to subdevice\n");
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	ret =3D v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
> > > > +	if (ret) {
> > > > +		dev_err(dev, "could not parse v4l2 endpoint\n");
> > > > +		fwnode_handle_put(ep);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	fwnode =3D fwnode_graph_get_remote_endpoint(ep);
> > > > +	fwnode_handle_put(ep);
> > > > +
> > > > +	v4l2_async_nf_init(&csi->notifier);
> > > > +	csi->notifier.ops =3D &mei_csi_notify_ops;
> > > > +
> > > > +	asd =3D v4l2_async_nf_add_fwnode(&csi->notifier, fwnode,
> > > > +				       struct v4l2_async_subdev);
> > > > +	if (IS_ERR(asd)) {
> > > > +		fwnode_handle_put(fwnode);
> > > > +		return PTR_ERR(asd);
> > > > +	}
> > > > +
> > > > +	ret =3D v4l2_fwnode_endpoint_alloc_parse(fwnode, &v4l2_ep);
> > >
> > > It seems you're parsing the remote endpoint properties here. This
> > > shouldn't be needed for any reason.
> >
> > We need sensor's lane number to configure IVSC's CSI2
> >
> > >
> > > > +	fwnode_handle_put(fwnode);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +	csi->nr_of_lanes =3D v4l2_ep.bus.mipi_csi2.num_data_lanes;
> > >
> > > Instead the number of lanes comes from the local endpoint.
> >
> > The lane number of IVSC follows sensor's lane number, why local endpoin=
t?
>=20
> Because you shouldn't access other devices' endpoint properties in driver=
s.
> They are outside of the scope of the device's bindings.

Ok, in v3 patch set, it was trying to get the lane number as below:

	+	ret =3D v4l2_subdev_call(csi->remote, pad, get_mbus_config,
	+			       csi->remote_pad, &mbus_config);
	+	if (ret)
	+		return ret;
	+
	+	if (mbus_config.type !=3D V4L2_MBUS_CSI2_DPHY)
	+		return -EINVAL;
	+
	+	csi->nr_of_lanes =3D mbus_config.bus.mipi_csi2.num_data_lanes;

Can we use above subdev_call in mei_csi_notify_bound to get lane number?

BR,
Wentong

>=20
> >
> > >
> > > > +
> > > > +	ret =3D v4l2_async_subdev_nf_register(&csi->subdev, &csi->notifie=
r);
> > > > +	if (ret)
> > > > +		v4l2_async_nf_cleanup(&csi->notifier);
> > > > +
> > > > +	v4l2_fwnode_endpoint_free(&v4l2_ep);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static int mei_csi_probe(struct mei_cl_device *cldev,
> > > > +			 const struct mei_cl_device_id *id) {
> > > > +	struct device *dev =3D &cldev->dev;
> > > > +	struct mei_csi *csi;
> > > > +	int ret;
> > > > +
> > > > +	if (!dev_fwnode(dev))
> > > > +		return -EPROBE_DEFER;
> > > > +
> > > > +	csi =3D devm_kzalloc(dev, sizeof(struct mei_csi), GFP_KERNEL);
> > > > +	if (!csi)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	csi->cldev =3D cldev;
> > > > +	mutex_init(&csi->lock);
> > > > +	init_completion(&csi->cmd_completion);
> > > > +
> > > > +	mei_cldev_set_drvdata(cldev, csi);
> > > > +
> > > > +	ret =3D mei_cldev_enable(cldev);
> > > > +	if (ret < 0) {
> > > > +		dev_err(dev, "mei_cldev_enable failed: %d\n", ret);
> > > > +		goto destroy_mutex;
> > > > +	}
> > > > +
> > > > +	ret =3D mei_cldev_register_rx_cb(cldev, mei_csi_rx);
> > > > +	if (ret) {
> > > > +		dev_err(dev, "event cb registration failed: %d\n", ret);
> > > > +		goto err_disable;
> > > > +	}
> > > > +
> > > > +	ret =3D mei_csi_parse_firmware(csi);
> > > > +	if (ret)
> > > > +		goto err_disable;
> > > > +
> > > > +	csi->subdev.dev =3D &cldev->dev;
> > > > +	v4l2_subdev_init(&csi->subdev, &mei_csi_subdev_ops);
> > > > +	v4l2_set_subdevdata(&csi->subdev, csi);
> > > > +	csi->subdev.flags =3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > >
> > > Please add V4L2_SUBDEV_FL_HAS_EVENTS for control events.
> >
> > ack, thanks
>=20
> --
> Kind regards,
>=20
> Sakari Ailus
