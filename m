Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C747E33A9A2
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 03:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbhCOC2C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Mar 2021 22:28:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:41266 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229821AbhCOC1m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Mar 2021 22:27:42 -0400
IronPort-SDR: 68LK2kXlNXiFAQmkXW7IrIjEu5SGm5Ryy3Cl/FDsmoxpCz7fRUnEPjqw3GVasm1XPmnwIAqtqp
 rnM/qXBe1rLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="250391793"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="250391793"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2021 19:27:41 -0700
IronPort-SDR: BQ5c6NrrOEyUuGl+9xKlnbeMs5AzLS1Ni29XH0v5dvrn8gQC7+FoBzZZw5qF5GBAiurGfVaE0T
 W+uKQR3Pgv2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="378359145"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga007.fm.intel.com with ESMTP; 14 Mar 2021 19:27:41 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 14 Mar 2021 19:27:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 14 Mar 2021 19:27:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sun, 14 Mar 2021 19:27:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyNEw7CqphSGOIBaQBor23OsSeKCvjwOGea+eI96inDibONp6vIT2fEwsAPNSQsW3p8qCi1/xijz2TPtFEvKeaGpAVxocQkjWdXBrDi72O/QDZRJ/pcHa1fGy9nHKk91wU9f7huGNpZOr63nQJTlpHZ5vntPsSlqr8WtxNfml6quZ/jJaKbM7NfyJn4bS30AX1xs6XUiOBK6jTeD0AoqaDFUuduBdpBR8AFF2e2pyJt5oH3m43rNaO0NAbDFBer/dE/8gmnzNzNkc6oSnDKUzfQqvqQWN3EuluDtaUc38Pfhj7FLXqv05wvdmHQM/a2z3Sbo9Y0U1PqBHzIEClChPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGv9Fh7mBXP8wQmfeOa9hfRksekrutfj0DElFl6Z174=;
 b=Y8gLpkuq9OvcrFwvQIiDqB4bfamFM0tX37jPdQVsLxnx7Sdz/wy31Ojp4JqWsrT8RHcXjgMN/YKQdPaoLEDlOnzX09RMD/xwzSza7QZ9xqw1I8Y6zZMS6dYBE89r3QoDq7vuzA8GlLLdgEH6c/eeqkY3qo5YCrM+rOSBxFpD2XKD4Uopb7T9kxh73Nq+rJp3qjeZrjXQfTSiorsTpKuMQb6MB7Ch89CVYEt7NLXX+MVAMQbx19XdQgxQv5Y753CzjnbFPgd8qxOMf1JbpxXI6WSTRf/N422fRf3r0tGT98UtjmYVmMBnbHIW23KbfwDN75BktQZWJuGrG5hzwCdRpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGv9Fh7mBXP8wQmfeOa9hfRksekrutfj0DElFl6Z174=;
 b=i0WNYBiPqUmE9mCbVgOJWFx0ybkfZa4ZBVjYyckRP19Nj/P7YV/9nBsNoM9ktZnQ/t3M9xCLiSWc7hrF3vXufNQWPFMedTrF3uPVskLz+tFcVq4WlvpRAZL75U3kDBCvVJe7rUm3swLWcejLoCKvVNL4Bodac1RH7m6kYOSOEHY=
Received: from BN7PR11MB2786.namprd11.prod.outlook.com (2603:10b6:406:b3::27)
 by BN6PR11MB2052.namprd11.prod.outlook.com (2603:10b6:404:4a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 02:27:37 +0000
Received: from BN7PR11MB2786.namprd11.prod.outlook.com
 ([fe80::167:12a:8fe3:6c10]) by BN7PR11MB2786.namprd11.prod.outlook.com
 ([fe80::167:12a:8fe3:6c10%2]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 02:27:37 +0000
From:   "Zhang, Tina" <tina.zhang@intel.com>
To:     Gerd Hoffmann <kraxel@redhat.com>,
        "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
CC:     "Kim, Dongwon" <dongwon.kim@intel.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "Vetter, Daniel" <daniel.vetter@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Topic: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Index: AQHW+gCk3TCT77lQ30iwmT355cnajapJvNWAgAQvWACAABw/AIAA95oAgACLo4CAAVAJAIAASy+AgAMTfACAAC6CAIAwJvKA
Date:   Mon, 15 Mar 2021 02:27:37 +0000
Message-ID: <BN7PR11MB2786D648DB8252151CE5E5F6896C9@BN7PR11MB2786.namprd11.prod.outlook.com>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
 <2ef01dc941684a15a4f30e6239ae42df@intel.com>
 <20210210091641.ahjtgcdalw7viuei@sirius.home.kraxel.org>
 <bad576177eb24085a73570e8ad03d2cc@intel.com>
 <20210212110140.gdpu7kapnr7ovdcn@sirius.home.kraxel.org>
In-Reply-To: <20210212110140.gdpu7kapnr7ovdcn@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.193]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c364b4b4-fee9-4adc-597a-08d8e759e671
x-ms-traffictypediagnostic: BN6PR11MB2052:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB20521D94F166EEBC0DF753E4896C9@BN6PR11MB2052.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:174;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v96Lp8pR+L3Kw6pQ1NV657zwYOqnKmKx3CDdfGUkDEZh/XD89n+ASzzPCLxL+0IqIlpdVyMk3R7OKHkfKeOljSMLuOwTgRXgpUYQGi53d4tRh40OjEzRBihUpWjacLh3cq6HwbiAzI5HNdGMiFPxXIrmcgFpsl17oKwhlSNA7xEL8gtzcsYyzRLBP/+Gmxb78rCVWuXstyJsETnbqDBHgypbDZ7dWoU+eZNo4GrqN1PIKAOhenJGDkfK68lNwYFsw2sOAlI17extONcX9D3pV2VTB8eoGje02ZQYFoJTu77LGkykX4Yke+vV+bWY0fMRl5UUSfg5jNazmKOBcD5/qFK8Dr6VtIO4+dA2AB9lxggTlmch+PyjnK1f8g3hfSAvWfSJ46Popb81nuPWXwMtACLU5KRMkNKPDJcHRQweHnSI9kZBGiMtmNENw+VdTKumFs8/Dz3n204Uwm6vHCbo/X5ew7spaJ8jum3Ll+YyywLIWZq4h2NyuEjwlM7toFVVy9BH0YYA9yVQhENiqI/71N2A4A7XmIqLyvFGvjzL9tUcyJZecDjdC/t04yMukZI30iiZd02uKTjrsPwTag5r3wA23rRKYfpU3aevVl6SiOQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2786.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(39860400002)(136003)(366004)(71200400001)(54906003)(478600001)(55016002)(52536014)(7696005)(86362001)(6506007)(53546011)(66476007)(64756008)(9686003)(110136005)(66446008)(66556008)(66946007)(5660300002)(8676002)(4326008)(966005)(186003)(76116006)(8936002)(26005)(83380400001)(6636002)(33656002)(2906002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?PQ2Hp1e870IBr5xpFYDNF9DoNMiBoqQXA1EEWz2p7BrNbVmB92zG+xagkRxB?=
 =?us-ascii?Q?MQ1LFEdjuo5UGmy5RYxa3PTMBGe77B2+uv0h6o0YOBAO2S7qvBQBQub1X5Qz?=
 =?us-ascii?Q?lvMC3TWaldrJgks/y7ZIDPcJxajGD45O1q4PAncq7qYd+6NpGZ8RO6CiweUK?=
 =?us-ascii?Q?X8f0fhSAddK8HUeU00fghuJQvEPdlK8IlUKugzv9lrQx79ojcl782m8EecJu?=
 =?us-ascii?Q?gYZr1/evNJ+sM3YhsiSye2Hf+Uuo6FquGAIqAxPFmS/oxRWaIBqLqLfBrZVd?=
 =?us-ascii?Q?5NknDh741GmNMgpr6UNwl5wTTM+GuqozzI/J22HjDo/Mfrp1wK0YVlCmoO/V?=
 =?us-ascii?Q?gSwGSecTeqqKVPhVWasaS9oXtrGn4oXSptfI1KYlH+uJxsnpGCCA04EN1RdW?=
 =?us-ascii?Q?CloltxKgrYJfaJK52WrhuJe6jKx/AZO9nR07W5JdSKbcEiqo1syPdGqbOs7n?=
 =?us-ascii?Q?64K/dAmvbtf7MxQgYJfWyeZYBVvw0YEoiqHFt/w68Jb8midrynePm5xIzfCC?=
 =?us-ascii?Q?1Xny1RacwvFTaD3yjnnHuA540a4+Xuxmk+lCxHBaic0M7gHjOowPCm/xhm47?=
 =?us-ascii?Q?yvq84+vd3gndFm9rxtX5Ci8crDkGKTMtbljtlgJeTsCOKEr2fGaTRjuMt+yZ?=
 =?us-ascii?Q?S+G3/eli9zs+xOuoVNmAZ45eXrM6kDqYKhqQ0vpkqFJXQ8DmwqB6acDTbpru?=
 =?us-ascii?Q?brMGQSyIqfjQB3EnySPJ2ebpxDRRcEQwK6QgrwV/7+bNZMCRWib7lKE1Ot+R?=
 =?us-ascii?Q?RlOZfS9uP37J+xF6+aKfjFgqnIgK3mWmNQdbdIbELNtjkXpb13lv09RhZ2Yu?=
 =?us-ascii?Q?QVs8aub8C8OtiqY5lTSTN3Wvbn2sd08gdX7hQmZhMDea0UEZOEB5KBhHF29Y?=
 =?us-ascii?Q?Arh+/19ycTm8a+6n8PBeinT9FBS+LaDtkV1AdsetluxzqXepmEa+/zLsXsAW?=
 =?us-ascii?Q?kPc9LP70n3enGINZL3EpeQALTuLTjcg25NTpKKUqwESrDEPcedgpWci8Wg3V?=
 =?us-ascii?Q?qoAPEfZjSSW+0EOSFms7unujTD++3pVG1m7szR4XnqBPRMMamT668HIq3Tac?=
 =?us-ascii?Q?mgMyM3tpMn4KOZ5gW4dbJShGZHEkzxt8lpFFD4FMsnAmge3amNUZ5YDW8oSF?=
 =?us-ascii?Q?oJtzBjjqySjVBaRXZHejFL8j8OL2rsoc60nwpsFd5pbg9nrWnYCadY751b8K?=
 =?us-ascii?Q?Jbffke0i12ePrKIWYzD1hCq6Lk0gVuKE8p9duRm6BAEQpjJGfirVeNwRqnN/?=
 =?us-ascii?Q?7TAu5jvg9SgM0f06+wCDd3jCBoA+vJ0u3BZl4oLAYaW5cFztVrd3a6VZ48cr?=
 =?us-ascii?Q?ljLE9Br+8cPW+sOx5+xdwF7V?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2786.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c364b4b4-fee9-4adc-597a-08d8e759e671
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 02:27:37.6249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Z16eGi54EQR8+EogU7R/WiHfRspI4ziBwbS7enUDpYkvKT2n/FT6PRK6lIe8Ka11FlKU0vSO5zqgheBmvOWMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2052
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ge=
rd
> Hoffmann
> Sent: Friday, February 12, 2021 7:02 PM
> To: Kasireddy, Vivek <vivek.kasireddy@intel.com>
> Cc: Kim, Dongwon <dongwon.kim@intel.com>; christian.koenig@amd.com;
> daniel.vetter@ffwll.ch; dri-devel@lists.freedesktop.org;
> virtualization@lists.linux-foundation.org; Vetter, Daniel
> <daniel.vetter@intel.com>; linux-media@vger.kernel.org
> Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
>=20
> On Fri, Feb 12, 2021 at 08:15:12AM +0000, Kasireddy, Vivek wrote:
> > Hi Gerd,
> >
> > > > > You don't have to use the rendering pipeline.  You can let the
> > > > > i915 gpu render into a dma-buf shared with virtio-gpu, then use
> > > > > virtio-gpu only for buffer sharing with the host.
> > [Kasireddy, Vivek] Just to confirm my understanding of what you are
> > suggesting, are you saying that we need to either have Weston allocate
> > scanout buffers (GBM surface/BO) using virtio-gpu and render into them
> > using i915; or have virtio-gpu allocate pages and export a dma-buf and
> > have Weston create a GBM BO by calling gbm_bo_import(fd) and render int=
o
> the BO using i915?
>=20
> Not sure what the difference between the former and the latter is.
>=20
> > > Hmm, why a big mode switch?  You should be able to do that without
> > > modifying the virtio-gpu guest driver.  On the host side qemu needs
> > > some work to support the most recent virtio-gpu features like the
> > > buffer uuids (assuming you use qemu userspace), right now those are o=
nly
> supported by crosvm.
> > [Kasireddy, Vivek] We are only interested in Qemu UI at the moment but
> > if we were to use virtio-gpu, we are going to need to add one more vq
> > and support for managing buffers, events, etc.
>=20
> Should be easy and it should not need any virtio-gpu driver changes.
>=20
> You can use virtio-gpu like a dumb scanout device.  Create a dumb bo, cre=
ate a
> framebuffer for the bo, map the framebuffer to the crtc.
>=20
> Then export the bo, import into i915, use it as render target.  When rend=
ering is
> done flush (DRM_IOCTL_MODE_DIRTYFB).  Alternatively allocate multiple bo'=
s +
> framebuffers and pageflip.

Hi,

We've got a MR(https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/95=
92) for this suggested implementation. Comments are welcome. Thanks.

BR,
Tina

>=20
> Pretty standard workflow for cases where rendering and scanout are handle=
d by
> different devices.  As far I know not uncommon in the arm world.
>=20
> Right now this will involve a memcpy() for any display update because qem=
u is a
> bit behind on supporting recent virtio-gpu features.
>=20
> take care,
>   Gerd
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
