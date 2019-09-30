Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26CD6C2108
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 14:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730802AbfI3M5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 08:57:34 -0400
Received: from mail-eopbgr60060.outbound.protection.outlook.com ([40.107.6.60]:41952
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730769AbfI3M5d (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 08:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USp/qlFSQOazI9QsvjgI5381RR+OS6ck15PFpYy+uQ4=;
 b=dmjZr3YqADMirePygpObaB2T5b7avNE0QrDiEtAUS5St3lTwJssdSXWFzoLtc3QCLDiyvNOG3FWGry4SlJtOEpHMpMUK0buP9/kdyV3beEv+2VmOnInGwx5X0zBzMQ3yKEnmbaSDH2KFBst7psrj5CMic+cnoNNfdc1leCXdqwI=
Received: from AM4PR08CA0049.eurprd08.prod.outlook.com (2603:10a6:205:2::20)
 by AM6PR08MB5064.eurprd08.prod.outlook.com (2603:10a6:20b:e6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Mon, 30 Sep
 2019 12:57:22 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by AM4PR08CA0049.outlook.office365.com
 (2603:10a6:205:2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15 via Frontend
 Transport; Mon, 30 Sep 2019 12:57:22 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 12:57:19 +0000
Received: ("Tessian outbound 081de437afc7:v33"); Mon, 30 Sep 2019 12:57:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 658172648fde7548
X-CR-MTA-TID: 64aa7808
Received: from 6ec6039c0c8e.2 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.13.52])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2A987AD6-F5B5-43A4-B63F-0FCF2E162C24.1;
        Mon, 30 Sep 2019 12:57:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6ec6039c0c8e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
    Mon, 30 Sep 2019 12:57:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYOiB3r8/4a5Vfanp4BMv7fimgNKKXkGBFozyIZCvnfxrRBBFOKs0oyGLZLmZ7f0xy5Kw7/TMuSa0+c954VtN3ZAI83zDZ4L0Yqih+wpJMeehjL40apIvBB+5CIn7dRyfJEZ/Dir0BcdZfW1KL/mdDWsHPr9o+3SaWgVL5LTxdgyxcA8gwet//j8lu/gJJiMaj9HfiM6TDr5nlVMdK5vnwBSiDXf+n6rXDAn9+w3ILSaDGXQkDMNtM4zSdNVlezb7Gp2XtQ/xdOZbKJu1u0KQMooasBun7YnM/3c9nsc3BL3OzEh/Givbk1F3Zj8T3XyBVphPbILElrKHrMri28Jog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USp/qlFSQOazI9QsvjgI5381RR+OS6ck15PFpYy+uQ4=;
 b=J2ypG7TTXsDwcX8Azu6gHW5VUgzDZmse9wZhZnq4gu1GZ7djmMtojZJFOtzXMwLsAaLXerOgOR7s0BgMCMtKdZRgoqNhlx73R0DYA4vUJeuBkOXe7bOXixNdrwFkXC/9FYeBbZdAHdD82/Cir3fMzvmrTYVU+CgeOKjl6eG7/Yrt52H92EvSTXkhXRhN+EaLxGUazsFjQqi//1rQmlAEBCoMiRuOf0DFGn4b9RDjiNHEMxU52WkZzOhe43MYMJ83gl0WmzuJXozlZRzxriZZPLNoyezmOZkAY2K4JiWbDDaaXUsmTv3B9ReJKyCZ3pxcub7A5m6oRA3vsK3Fh+pJ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USp/qlFSQOazI9QsvjgI5381RR+OS6ck15PFpYy+uQ4=;
 b=dmjZr3YqADMirePygpObaB2T5b7avNE0QrDiEtAUS5St3lTwJssdSXWFzoLtc3QCLDiyvNOG3FWGry4SlJtOEpHMpMUK0buP9/kdyV3beEv+2VmOnInGwx5X0zBzMQ3yKEnmbaSDH2KFBst7psrj5CMic+cnoNNfdc1leCXdqwI=
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com (10.141.172.139) by
 AM7PR08MB5334.eurprd08.prod.outlook.com (10.141.172.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 12:57:02 +0000
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::1c78:bb51:3634:9cf0]) by AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::1c78:bb51:3634:9cf0%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 12:57:02 +0000
From:   Ayan Halder <Ayan.Halder@arm.com>
To:     Brian Starkey <Brian.Starkey@arm.com>
CC:     Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>,
        "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexdeucher@gmail.com" <alexdeucher@gmail.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        nd <nd@arm.com>
Subject: Re: [RFC PATCH] drm:- Add a modifier to denote 'protected'
 framebuffer
Thread-Topic: [RFC PATCH] drm:- Add a modifier to denote 'protected'
 framebuffer
Thread-Index: AQHVZxR6T7KOwVbC3kmqPMMH1PUhIKcv34OAgAA2VwCAAAJLAIAAFqWAgBPsV4CAADPPgA==
Date:   Mon, 30 Sep 2019 12:57:02 +0000
Message-ID: <20190930125701.GA13998@arm.com>
References: <20190909134241.23297-1-ayan.halder@arm.com>
 <20190917125301.GQ3958@phenom.ffwll.local>
 <20190917160730.hutzlbuqtpmmtdz3@e110455-lin.cambridge.arm.com>
 <11689dc3-6c3e-084b-b66d-e6ccf75cb8fb@baylibre.com>
 <CAKMK7uF7oKV4609Ca4mLj7gYC1rkWnWAV7_hM5Z48Ez1cBoMqA@mail.gmail.com>
 <20190930095134.xjcucw2rrij5f4np@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190930095134.xjcucw2rrij5f4np@DESKTOP-E1NTVVP.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0297.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::21) To AM7PR08MB5352.eurprd08.prod.outlook.com
 (2603:10a6:20b:106::11)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a343bc6c-6092-4300-f1f7-08d745a5ba79
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:|AM7PR08MB5334:|AM6PR08MB5064:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50648A60448A08C945D5D5EFE4820@AM6PR08MB5064.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(199004)(189003)(476003)(6506007)(36756003)(386003)(76176011)(186003)(52116002)(5660300002)(30864003)(66066001)(26005)(66556008)(2906002)(66446008)(64756008)(66476007)(66946007)(2616005)(99286004)(54906003)(86362001)(53546011)(102836004)(316002)(37006003)(3846002)(11346002)(446003)(6116002)(1076003)(44832011)(6246003)(14454004)(486006)(6636002)(33656002)(7416002)(7736002)(81166006)(8936002)(305945005)(25786009)(8676002)(6306002)(4326008)(71190400001)(81156014)(6862004)(71200400001)(6436002)(6512007)(6486002)(5024004)(14444005)(256004)(587094005)(478600001)(229853002)(966005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM7PR08MB5334;H:AM7PR08MB5352.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rryBQIJ6ZaCQr6mBRCqxkhDF7ori6dp04AHgNnRznKfiTI0kWTjoDvRu3u85WYKYUHL2OeACQHl50iLzSwQZlrOufg31Z3KjtR9y4NGSHlFqo7JeXvwI0ae/pnm3G8jyMp7cwLF4FJOnlu8z1JJ830O9HQQSVrp4qV0orf4LF5+J2DHc3szrehJsGC4sfzZl2P8Ey97yDgxXymVnTpbY8GW6tbJJWF27GKRgf8FbbuVWrpfd66MKIx7DOWQn49vjrpBn0KkekJF34l0quxip1gurlfK0ZHb6NLbvP0kw4mmorv+yfg1x8RRkdPzp2QrJCkZn8fHWHQ7rbU6QC9jrI09l0hV4+QYiziNdmDeUGFU0wUnf1+7r+EDh4qe7aQ7QmYb5xLBdZI+9wCh1gcH8k70JNQTmRBliD7MZy4lGM4mwzHiZkHyxHOtM8BMN9yD9A/nztfKNvqnS5xrRT9VYXQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9568E100547F3741B9126710B9C45687@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(189003)(199004)(26005)(102836004)(50466002)(6636002)(53546011)(316002)(81166006)(6306002)(81156014)(386003)(6512007)(6246003)(22756006)(6862004)(97756001)(229853002)(33656002)(2906002)(7736002)(14454004)(6486002)(8676002)(66066001)(305945005)(4326008)(86362001)(26826003)(478600001)(6506007)(446003)(11346002)(3846002)(6116002)(5660300002)(63350400001)(186003)(23726003)(54906003)(2616005)(476003)(46406003)(30864003)(76176011)(8936002)(37006003)(486006)(126002)(336012)(8746002)(14444005)(99286004)(587094005)(36756003)(25786009)(450100002)(70206006)(5024004)(966005)(76130400001)(356004)(70586007)(47776003)(1076003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR08MB5064;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3b2dca0f-0023-4135-dcf6-08d745a5b00d
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vmmen7mj7FZWcaVlxlXcgO+Iu/c6X6bDFqSXd8t64wpqNj94TzWOKs1kr1eZ3U7BeduX55bpSV67ylyAYJ/SMuIyOiWEJAiiaGQlB4pKwWu01+uz6ZZ1UtAW6r7SIUDRKn/DJ+yoKArYoEDlascXWXsQTHHd9yDHnVTS38vNexIJEFlmM2P3buqXlMGYHMHlrCuOmxoYH+WzN/taNBjAnaljYIBUCXqUvXKkd3mc8x0biECo6a1lEgiE353XlBGZr7XpnRyzbEaFg5pNGYtR0m3j8NZI6vcgATryo0X6HQF0FnljXk8TLGGJQCleW2WKVX+02J1dWwgUecuQZgtilDoRoT0fmKWRY6YCWcBIBLy06E2yw4gt10jvq0QkvjSyfsogv3lesac5iqpU6u+vfzmTbyNxBLEiMW0Ab10kFcfaFWzIETX2Z958U3ZjkJF2dxuCJq1NzI808yHDLoq1Iw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 12:57:19.5598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a343bc6c-6092-4300-f1f7-08d745a5ba79
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5064
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 30, 2019 at 09:51:35AM +0000, Brian Starkey wrote:
> Hi,
>=20
> On Tue, Sep 17, 2019 at 07:36:45PM +0200, Daniel Vetter wrote:
> > On Tue, Sep 17, 2019 at 6:15 PM Neil Armstrong <narmstrong@baylibre.com=
> wrote:
> > >
> > > Hi,
> > >
> > > On 17/09/2019 18:07, Liviu Dudau wrote:
> > > > On Tue, Sep 17, 2019 at 02:53:01PM +0200, Daniel Vetter wrote:
> > > >> On Mon, Sep 09, 2019 at 01:42:53PM +0000, Ayan Halder wrote:
> > > >>> Add a modifier 'DRM_FORMAT_MOD_ARM_PROTECTED' which denotes that =
the framebuffer
> > > >>> is allocated in a protected system memory.
> > > >>> Essentially, we want to support EGL_EXT_protected_content in our =
komeda driver.
> > > >>>
> > > >>> Signed-off-by: Ayan Kumar Halder <ayan.halder@arm.com>
> > > >>>
> > > >>> /-- Note to reviewer
> > > >>> Komeda driver is capable of rendering DRM (Digital Rights Managem=
ent) protected
> > > >>> content. The DRM content is stored in a framebuffer allocated in =
system memory
> > > >>> (which needs some special hardware signals for access).
> > > >>>
> > > >>> Let us ignore how the protected system memory is allocated and fo=
r the scope of
> > > >>> this discussion, we want to figure out the best way possible for =
the userspace
> > > >>> to communicate to the drm driver to turn the protected mode on (f=
or accessing the
> > > >>> framebuffer with the DRM content) or off.
> > > >>>
> > > >>> The possible ways by which the userspace could achieve this is vi=
a:-
> > > >>>
> > > >>> 1. Modifiers :- This looks to me the best way by which the usersp=
ace can
> > > >>> communicate to the kernel to turn the protected mode on for the k=
omeda driver
> > > >>> as it is going to access one of the protected framebuffers. The o=
nly problem is
> > > >>> that the current modifiers describe the tiling/compression format=
. However, it
> > > >>> does not hurt to extend the meaning of modifiers to denote other =
attributes of
> > > >>> the framebuffer as well.
> > > >>>
> > > >>> The other reason is that on Android, we get an info from Gralloc
> > > >>> (GRALLOC_USAGE_PROTECTED) which tells us that the buffer is prote=
cted. This can
> > > >>> be used to set up the modifier/s (AddFB2) during framebuffer crea=
tion.
> > > >>
> > > >> How does this mesh with other modifiers, like AFBC? That's where I=
 see the
> > > >> issue here.
> > > >
> > > > AFBC modifiers are currently under Arm's namespace, the thought beh=
ind the DRM
> > > > modifiers would be to have it as a "generic" modifier.
> >=20
> > But if it's a generic flag, how do you combine that with other
> > modifiers? Like if you have a tiled buffer, but also encrypted? Or
> > afbc compressed, or whatever else. I'd expect for your hw encryption
> > is orthogonal to the buffer/tiling/compression format used?
>=20
> This bit doesn't overlap with any of the other AFBC modifiers, so as
> you say it'd be orthogonal, and could be set on AFBC buffers (if we
> went that route).
>=20
> >=20
> > > >>> 2. Framebuffer flags :- As of today, this can be one of the two v=
alues
> > > >>> ie (DRM_MODE_FB_INTERLACED/DRM_MODE_FB_MODIFIERS). Unlike modifie=
rs, the drm
> > > >>> framebuffer flags are generic to the drm subsystem and ideally we=
 should not
> > > >>> introduce any driver specific constraint/feature.
> > > >>>
> > > >>> 3. Connector property:- I could see the following properties used=
 for DRM
> > > >>> protected content:-
> > > >>> DRM_MODE_CONTENT_PROTECTION_DESIRED / ENABLED :- "This property i=
s used by
> > > >>> userspace to request the kernel protect future content communicat=
ed over
> > > >>> the link". Clearly, we are not concerned with the protection attr=
ibutes of the
> > > >>> transmitter. So, we cannot use this property for our case.
> > > >>>
> > > >>> 4. DRM plane property:- Again, we want to communicate that the fr=
amebuffer(which
> > > >>> can be attached to any plane) is protected. So introducing a new =
plane property
> > > >>> does not help.
> > > >>>
> > > >>> 5. DRM crtc property:- For the same reason as above, introducing =
a new crtc
> > > >>> property does not help.
> > > >>
> > > >> 6. Just track this as part of buffer allocation, i.e. I think it d=
oes
> > > >> matter how you allocate these protected buffers. We could add a "i=
s
> > > >> protected buffer" flag at the dma_buf level for this.
>=20
> I also like this approach. The protected-ness is a property of the
> allocation, so makes sense to store it with the allocation IMO.
>=20
> > > >>
> > > >> So yeah for this stuff here I think we do want the full userspace =
side,
> > > >> from allocator to rendering something into this protected buffers =
(no need
> > > >> to also have the entire "decode a protected bitstream part" imo, s=
ince
> > > >> that will freak people out). Unfortunately, in my experience, that=
 kills
> > > >> it for upstream :-/ But also in my experience of looking into this=
 for
> > > >> other gpu's, we really need to have the full picture here to make =
sure
> > > >> we're not screwing this up.
> > > >
> > > > Maybe Ayan could've been a bit clearer in his message, but the ask =
here is for ideas
> > > > on how userspace "communicates" (stores?) the fact that the buffers=
 are protected to
> > > > the kernel driver. In our display processor we need to the the hard=
ware that the
> > > > buffers are protected before it tries to fetch them so that it can =
1) enable the
> > > > additional hardware signaling that sets the protection around the s=
tream; and 2) read
> > > > the protected buffers in a special mode where there the magic happe=
ns.
> >=20
> > That was clear, but for the full picture we also need to know how
> > these buffers are produced and where they are allocated. One approach
> > would be to have a dma-buf heap that gives you encrypted buffers back.
> > With that we need to make sure that only encryption-aware drivers
> > allow such buffers to be imported, and the entire problem becomes a
> > kernel-internal one - aside from allocating the right kind of buffer
> > at the right place.
> >=20
>=20
> In our case, we'd be supporting a system like TZMP-1, there's a
> Linaro connect presentation on it here:
> https://connect.linaro.org/resources/hkg18/hkg18-408/
>=20
> The simplest way to implement this is for firmware to set up a
> carveout which it tells linux is secure. A linux allocator (ion, gem,
> vb2, whatever) can allocate from this carveout, and tag the buffer as
> secure.
>=20
> In this kind of system, linux doesn't necessarily need to know
> anything about how buffers are protected, or what HW is capable of -
> it only needs to carry around the "is_protected" flag.
>=20
> Here, the TEE is ultimately responsible for deciding which HW gets
> access to a buffer. I don't see a benefit of having linux decide which
> drivers can or cannot import a buffer, because that decision should be
> handled by the TEE.
>=20
> For proving out the pipeline, IMO it doesn't matter whether the
> buffers are protected or not. For our DPU, all that matters is that if
> the buffer claims to be protected, we have to set our protected
> control bit. Nothing more. AFAIK it should work the same for other
> TZMP-1 implementations.
>=20
> > > > So yeah, we know we do want full userspace support, we're prodding =
the community on
> > > > answers on how to best let the kernel side know what userspace has =
done.
> > >
> > > Actually this is interesting for other multimedia SoCs implementing s=
ecure video decode
> > > paths where video buffers are allocated and managed by a trusted app.
> >=20
> > Yeah I expect there's more than just arm wanting this. I also wonder
> > how that interacts with the secure memory allocator that was bobbing
> > around on dri-devel for a while, but seems to not have gone anywhere.
> > That thing implemented my idea of "secure memory is only allocated by
> > a special entity".
> > -Daniel
>=20
> Like I said, for us all we need is a way to carry around a 1-bit
> "is_protected" flag with a buffer. Could other folks share what's
> needed for their systems so we can reason about something that works
> for all?

To make things a bit more specific, we are thinking of the following
patch :-

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index ec212cb27fdc..36f0813073a2 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -279,6 +279,7 @@ struct dma_buf_ops {
  *         kernel module.
  * @list_node: node for dma_buf accounting and debugging.
  * @priv: exporter specific private data for this buffer object.
+ * @is_protected: denotes that the buffer is
secure/protected/encrypted/trusted.
  * @resv: reservation object linked to this dma-buf
  * @poll: for userspace poll support
  * @cb_excl: for userspace poll support
@@ -306,6 +307,7 @@ struct dma_buf {
        struct module *owner;
        struct list_head list_node;
        void *priv;
+       bool is_protected;
        struct dma_resv *resv;
=20
        /* poll support */

@all, @amdgpu-folks :- Is this something you can use of to denote
secure/protected/encrypted/trusted buffers ?

The way 'is_protected' flag gets used to allocate
secure/protected/encrypted buffers will be vendor specific.

Please comment to let us know if it looks useful to non Arm folks.
>=20
> Thanks!
> -Brian
>=20
> >=20
> > >
> > > Neil
> > >
> > > >
> > > > Best regards,
> > > > Liviu
> > > >
> > > >
> > > >> -Daniel
> > > >>
> > > >>>
> > > >>> --/
> > > >>>
> > > >>> ---
> > > >>>  include/uapi/drm/drm_fourcc.h | 9 +++++++++
> > > >>>  1 file changed, 9 insertions(+)
> > > >>>
> > > >>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm=
_fourcc.h
> > > >>> index 3feeaa3f987a..38e5e81d11fe 100644
> > > >>> --- a/include/uapi/drm/drm_fourcc.h
> > > >>> +++ b/include/uapi/drm/drm_fourcc.h
> > > >>> @@ -742,6 +742,15 @@ extern "C" {
> > > >>>   */
> > > >>>  #define AFBC_FORMAT_MOD_BCH     (1ULL << 11)
> > > >>>
> > > >>> +/*
> > > >>> + * Protected framebuffer
> > > >>> + *
> > > >>> + * The framebuffer is allocated in a protected system memory whi=
ch can be accessed
> > > >>> + * via some special hardware signals from the dpu. This is used =
to support
> > > >>> + * 'GRALLOC_USAGE_PROTECTED' in our framebuffer for EGL_EXT_prot=
ected_content.
> > > >>> + */
> > > >>> +#define DRM_FORMAT_MOD_ARM_PROTECTED       fourcc_mod_code(ARM, =
(1ULL << 55))
> > > >>> +
> > > >>>  /*
> > > >>>   * Allwinner tiled modifier
> > > >>>   *
> > > >>> --
> > > >>> 2.23.0
> > > >>>
> > > >>
> > > >> --
> > > >> Daniel Vetter
> > > >> Software Engineer, Intel Corporation
> > > >> http://blog.ffwll.ch
> > > >
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >=20
> >=20
> >=20
> > --=20
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
