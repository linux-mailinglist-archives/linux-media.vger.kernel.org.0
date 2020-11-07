Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1492AA4F2
	for <lists+linux-media@lfdr.de>; Sat,  7 Nov 2020 13:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgKGMTV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Nov 2020 07:19:21 -0500
Received: from mail-bn8nam08on2046.outbound.protection.outlook.com ([40.107.100.46]:56673
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727298AbgKGMTH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Nov 2020 07:19:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npZWfFJggzoNG2/mgEEROeHrZzbBf5No43SuwSJ2exunPvWFuC8Unnu27brJ8TYLApy6UVyE5SaladH52qGdj5D7KUFTELT39+OmcAAtopuHZldfAov07UzceA0hHqVuckCovB9ktEpxPA5VKh9tFu/mDbp4kdlXppWE2zDzljPv2AMQMorxDEValJIfHvONq8/djJ8oOKBmONtJSIXreHCOe17wvCuykH2QM/TGc85WoRqmxWnIR6lYMAcDw4Wx/En1HUSeVy7Je+rSs17qdSgiasyZiKXMH+/weKEj9DOw56wxZlnLSDWhZvxjiR/QQEtPtScIakX/NbNQRdzH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMOqGh7e1a3RLvnni3JcnMpd1EMAD9XhJMOiKtUcJ68=;
 b=iq0pNVf6f+flda5/akimRUht00+RoCrZaUkwHB06cLAwwqlXZaaoeuekgcp2aIrNsugbMKmpRvcjzuJddnnTVDoZntHCq8Ze3s+Q3LZ/9IHkYnjrKL0tByidWvQAEjbeItxOO0b94lT+XX+dijJF/a7WKiZbBIm0sXjVb+10+g03tonIkPJGVJQd89QIhTkAkSdoZsnIlPF4iflUogSnovNGEQQ+BdP4QplRE5MM7BJy3jgKoWBHxFYfLYnuLoAoinu9TkgxUpMbopC8FodgqtUlW2yRb4fPj75iebfsMTNW03Ig+r99L5ZNiiMRFzeOj7cy09cve4vzaZkCX0ehsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMOqGh7e1a3RLvnni3JcnMpd1EMAD9XhJMOiKtUcJ68=;
 b=Pvwkk0c3JJvRfvkz+MUj9u8EHhjRJNk8SgAD0jVxsivg7b9QQNcadxO9GupTXNinDwGLGIGwRvHdSSplfBDHCnFFrmEuI9oNPK1YtYrfLML/+d391yHZTZkJiW2FDbHwY0oMaKp1w5c8oM9exCCXcjkO66WhRbNuEFv6fap4FYw=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4565.namprd12.prod.outlook.com (2603:10b6:208:26b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Sat, 7 Nov
 2020 12:19:01 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.032; Sat, 7 Nov 2020
 12:19:01 +0000
Subject: Re: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Andy Gross <andy.gross@ti.com>,
        by <jhartmann@precisioninsight.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Faith <faith@valinux.com>, Gareth Hughes <gareth@valinux.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Jeff Hartmann <jhartmann@valinux.com>,
        Keith Whitwell <keith@tungstengraphics.com>,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <rob.clark@linaro.org>, Rob Clark <rob@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9d4be6a4-4f39-b908-4086-2b6adb695465@amd.com>
Date:   Sat, 7 Nov 2020 13:18:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0178.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR01CA0178.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Sat, 7 Nov 2020 12:18:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 74dc98c9-a0f1-4475-3572-08d883174f53
X-MS-TrafficTypeDiagnostic: MN2PR12MB4565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4565ABF321A6C1996F1300CB83EC0@MN2PR12MB4565.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y8Pa0TO4IuM0mnFnr3iWszzdEl4Injo8reSTnHK/qvKNAMssFxKnED2Ph66huA0igbhiFniUeQsBiBgyPnmjDZSCgIFcpM9gN49iMAEroUpqEKUfghJry9ImhTR4oOHl8m53Qxg2rZoQn6UMolk40ybiN15OYGVAQoIDlhxFd4j6BnkxMQLwyh8ZbHuW3jc4xZzQnaIvqdq7zf5Wzwbl/+hqIvjvnuD9OFcOP0zDi0GaK6ERgv3N0tOoErbR5APlzrz2sSygDIdF2NiwxQE+FlKI4gvlSLdfhZdct3mtZkj/STVqSLYD91a5GcCRKDbuxAEvSfgPW5xsL77Cdn0wGxLLxJ3SqY1Kasn6YZkD02EgeL1ApmYOKjmaKzrJ5DYe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(36756003)(31696002)(8936002)(316002)(86362001)(6666004)(52116002)(2906002)(7416002)(6486002)(4326008)(478600001)(186003)(8676002)(16526019)(6916009)(2616005)(66556008)(66476007)(54906003)(66946007)(31686004)(83380400001)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: f5TydOyqfkJbpMYv5zP8irehHA7/l8UkGNZK3Ffz/ZuK1eD077K4xcMXw3InAnYh1N4uWQTf/wWdRY8YXHBOKcDUXpPrHvzamev8KvZavHV80Zit6cygCcfFMYsQMeOCcXPs/5iB6FgLt+HWFEHqA9Fe+KgqoMQu5gtTC20YhKAcmrYbMwYI1pNJ+bSLDHdnQCwQY9nh1NX5gDslDqZ6wcZWWcrGItOqnFbD1nBNELf6qBSvOeC0LgSEFhfxi2YxYnOIQpJHTw+/7oqn0ODoH1Rl7cc7tfstUR9SulDFxFGrZx6srBipM+C33P7Lzaz1YTEff6NTCDwn59RkADJEhXwPiD2uN5zy3Fc05W/EDJKTr9RPG5Sl2eVmmmKpqdghO+JdX5AGhcq/UEUPtqNSQkG8YuZ+rs+wJO85sixsTcLV3N4FvMrD+2o1c4VUHhpHhjnBcnMrLsy7eHjS3lGUOrRT6b2JuOI6Z1tWJwZQU0ETmThHIwLMrzXTjOcSxvsNB+ktQxo1Z+5YLrAHtU+bwkSHOD5XKqfKjhY7uCrhpsysdyupeueAWOo/fFytMP1uiN1CHhCnJMzaVtMigjN1UhD52SzM8wllScx76CyskLkevBkXM9u1sRVu9KrJ0bsuMUUXUvgLsIku3f2FjBlcejipLTIslCAKCsjuxCGALHBorGDAKVqVdzfEP3ebOnXua/K/Yu/e9deVqsZZ0MjYPw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74dc98c9-a0f1-4475-3572-08d883174f53
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2020 12:19:01.6811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAyixC4PhZDb0f+pP6jOY6gYI1dzpIJCRZkKrHj8hHyHyV7Uoj3e9StcN4Q+ldzE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4565
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Well that's quite a patch set.

First of all can you separate this a bit more by driver? I'm assuming we 
maintainers are supposed to pick that up and apply it.

radeon and amdgpu can stick together since that is mostly Alex and me, 
but I'm not sure if we want to do some of the suggested changes to radeon.

Going to pick up the single TTM change for upstreaming.

Thanks,
Christian.

Am 06.11.20 um 22:49 schrieb Lee Jones:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
>
> There are 5000 warnings to work through.  It will take a couple more
> sets.  Although, ("drm/amd/display/dc/basics/fixpt31_32: Move
> variables to where they're used") does take care of 2000 of them!
>
> Lee Jones (19):
>    drm/ttm/ttm_range_manager: Demote non-conformant kernel-doc header
>    drm/r128/ati_pcigart: Source file headers are not good candidates for
>      kernel-doc
>    drm/selftests/test-drm_dp_mst_helper: Move
>      'sideband_msg_req_encode_decode' onto the heap
>    drm/mga/mga_dma: Demote kernel-doc abusers to standard comment blocks
>    drm/mga/mga_state: Remove unused variable 'buf_priv'
>    drm/radeon/atom: Move prototype into shared location
>    drm/radeon/radeon_kms: Include header containing our own prototypes
>    drm/omapdrm/omap_gem: Fix misnamed and missing parameter descriptions
>    drm/omapdrm/omap_dmm_tiler: Demote abusive use of kernel-doc format
>    drm/radeon/radeon: Move prototype into shared header
>    drm/radeon/radeon_drv: Source file headers are not good candidates for
>      kernel-doc
>    drm/amd/display/dc/basics/fixpt31_32: Move variables to where they're
>      used
>    drm/radeon/radeon_drv: Move prototypes to a shared headerfile
>    drm/amd/amdgpu/amdgpu_device: Provide documentation for 'reg_addr'
>      params
>    drm/radeon: Move prototypes to shared header
>    drm/amd/amdgpu/amdgpu_kms: Remove 'struct drm_amdgpu_info_device
>      dev_info' from the stack
>    drm/radeon/radeon_kms: Fix misnaming of 'radeon_info_ioctl's dev param
>    drm/radeon/atombios_crtc: Remove description of non-existent function
>      param 'encoder'
>    drm/v3d/v3d_drv: Remove unused static variable 'v3d_v3d_pm_ops'
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 104 +++++++++---------
>   .../drm/amd/display/dc/basics/fixpt31_32.c    |   5 +
>   .../gpu/drm/amd/display/include/fixed31_32.h  |   6 -
>   drivers/gpu/drm/mga/mga_dma.c                 |  10 +-
>   drivers/gpu/drm/mga/mga_state.c               |   2 -
>   drivers/gpu/drm/omapdrm/omap_dmm_tiler.c      |   6 +-
>   drivers/gpu/drm/omapdrm/omap_gem.c            |   3 +-
>   drivers/gpu/drm/r128/ati_pcigart.c            |   2 +-
>   drivers/gpu/drm/radeon/atom.h                 |   6 +
>   drivers/gpu/drm/radeon/atombios_crtc.c        |   1 -
>   drivers/gpu/drm/radeon/atombios_encoders.c    |   4 -
>   drivers/gpu/drm/radeon/radeon.h               |   6 +
>   drivers/gpu/drm/radeon/radeon_device.c        |   1 +
>   drivers/gpu/drm/radeon/radeon_device.h        |  32 ++++++
>   drivers/gpu/drm/radeon/radeon_display.c       |   4 -
>   drivers/gpu/drm/radeon/radeon_drv.c           |  11 +-
>   drivers/gpu/drm/radeon/radeon_drv.h           |   7 ++
>   drivers/gpu/drm/radeon/radeon_kms.c           |   3 +-
>   .../drm/selftests/test-drm_dp_mst_helper.c    |  11 +-
>   drivers/gpu/drm/ttm/ttm_range_manager.c       |   2 +-
>   drivers/gpu/drm/v3d/v3d_drv.c                 |  36 ------
>   22 files changed, 138 insertions(+), 126 deletions(-)
>   create mode 100644 drivers/gpu/drm/radeon/radeon_device.h
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Andy Gross <andy.gross@ti.com>
> Cc: by <jhartmann@precisioninsight.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Faith <faith@valinux.com>
> Cc: Gareth Hughes <gareth@valinux.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Jeff Hartmann <jhartmann@valinux.com>
> Cc: Keith Whitwell <keith@tungstengraphics.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-media@vger.kernel.org
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Clark <rob.clark@linaro.org>
> Cc: Rob Clark <rob@ti.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>

