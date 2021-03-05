Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E8632EEE7
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 16:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhCEPde (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 10:33:34 -0500
Received: from mail-mw2nam10on2084.outbound.protection.outlook.com ([40.107.94.84]:59041
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229642AbhCEPdV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Mar 2021 10:33:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dp/unaJtMuydSjj3Fjma7WlL0phqkLBt28R6CIWhPGEIfMW0aAJnkUue+l+MfeOj26gQXLqscVxVm8YUtUUcAfnVwXtjhPCRVbtYk08PnjVoU1hTSZEDq81R/TIhJid2ElmIuFgLiIGe1CDScFWVcmdVrlOjMGp4gWI6qPsiRy5HWEPSVci7qRVRSFuKs9IhlDE7jZV4bcWXYUeZTGD5m9XMgD9Fo+rG05i5potetbXqH5kRCM2LeMaW8Lvwm+wNu7tBNO1eIXkC2kp9BkKw0pJI9jm3p8Him0ew2Xb/2si3od6FdNjPCLvzBlZbdNB465eoSnbuo64f0UiH1yeN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvMtROSUQXU/cDEeD6TjEkNp+thd3pBUitxuZY+3kM4=;
 b=N8s/s6rAFV1jVIbGX904iT7idiVkZ1KjqEb3VTBp0hbMdXfacMlTXGkqmqaSo7CBi0HTAm1YyF1H43k1mHJKNsJXXUSToBi5tfI2QRrbI4Le12GCzuh9IPnC0e1wpfikC8OZGDhl/4zVH6O0dOgUCNIcjhZ6wkqAWJIMF4RrsPRHoNdfvh2r3AJ7tYOGCvrn42lJmnDXKuLOrhr7uuR59qX9ZXF3tzEAhRpDKqZa8jbqsLgsc4/V2isRFGBYLbXA4UY0az9P2UyJKvpyqimfotQhBRaNRQUyaUMhvDDGZz+/37t0+Gar1uqffBamDGQ3OadHMOBqDXRx438+KcVxPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvMtROSUQXU/cDEeD6TjEkNp+thd3pBUitxuZY+3kM4=;
 b=lDOwHscU6/Ar+6mkgxBMxdalaLGYU2WfVg/9S2dc05k4XgKeDX0xrsbFNZ+cUFmSdSwNjhjMkNjxuPYUffcc+eALNfHwGKu71DxAsSf8IPNzjMP0lCxgVOjVAESceny1j0T/4FuHX1fLM7aiYjs3LaTe1HThGupyUZYtJnF0pNg=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=vmware.com;
Received: from SN6PR05MB5759.namprd05.prod.outlook.com (2603:10b6:805:103::19)
 by SN7PR05MB7616.namprd05.prod.outlook.com (2603:10b6:806:107::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9; Fri, 5 Mar
 2021 15:33:16 +0000
Received: from SN6PR05MB5759.namprd05.prod.outlook.com
 ([fe80::24ea:f168:e288:980a]) by SN6PR05MB5759.namprd05.prod.outlook.com
 ([fe80::24ea:f168:e288:980a%5]) with mapi id 15.20.3912.023; Fri, 5 Mar 2021
 15:33:15 +0000
Subject: Re: [RESEND 00/53] Rid GPU from W=1 warnings
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        Jeremy Kolb <jkolb@brandeis.edu>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        nouveau@lists.freedesktop.org,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rob Clark <rob.clark@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Zack Rusin <zackr@vmware.com>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
From:   Roland Scheidegger <sroland@vmware.com>
Message-ID: <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
Date:   Fri, 5 Mar 2021 16:33:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
X-Originating-IP: [46.126.183.173]
X-ClientProxiedBy: GV0P278CA0067.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:2a::18) To SN6PR05MB5759.namprd05.prod.outlook.com
 (2603:10b6:805:103::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.125] (46.126.183.173) by GV0P278CA0067.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2a::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 15:33:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86d4ed48-28f4-4b55-6714-08d8dfebfc4d
X-MS-TrafficTypeDiagnostic: SN7PR05MB7616:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN7PR05MB7616376745FD6DF5AEB10A49C6969@SN7PR05MB7616.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FPAlYZdaQOpmA2U+rMMMcxHvtBW0VshuuhRzGHfRSPxRtDkdDJAI3CF2+W1GwmkXWTGm1Iw5rNdbNdnzdymREWShRMUIyMua0alrhdZoaVIis4SrToywjXeLohIHXKuveJNwv/krmvBW9bvkD+G9wg6y0Q/d5nxh0A0P1ND+A1Xu05mm//cBQPpJdTpxQwEnJ20dCTO8zPaJ07bVQHknki1EdDmE+eBwvDDVzucKg3niHk2rgfiHNUu2YJRgeAqhK7KDbwEKoVUXKpPnUxu9kr0k8IY96L/6b3/ULl9k9zVQXzoRj79GvhFxpzffPBGwRzf2NuzWe8/tVddsWFRPiYmZlHCDEQ69j8PjZSgUStD/nBQgw/QrFL9ifOtkfsJur2yMwt1Q4f2Mfp1cPZydwkwmz/yle5+OPN4LdmnEKFaWpWM/x1LqnGNz8EbVlx3QU80ZXovOScMkbl7kv4T3AWdnwI3TfRrAiNY2Aey2074uJHITJRk+oGEHsM67AcDJ4hD/6onC0lZig3FALsMepCL7AXeHSzV9YAB5eKgsDp08/Wb/ywGiL6AYyFlVJyfPpYTp3p+rwp3pUmesSzH5M8kBXeu8f7CIX0jWeQDy510=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR05MB5759.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(54906003)(107886003)(26005)(2906002)(316002)(8936002)(8676002)(16576012)(53546011)(86362001)(478600001)(4326008)(2616005)(16526019)(186003)(956004)(6666004)(83380400001)(7416002)(6916009)(31696002)(31686004)(6486002)(36756003)(66946007)(66574015)(66476007)(5660300002)(66556008)(7406005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cm9uNzVFSU5meDVydnJNdHpkQXNDZ0RkNVBHV2tYZDRSdDJZTlRnc3p1bk91?=
 =?utf-8?B?NS9CbGVSemZBWlExU2ZhUGFoOUkyN2lvZmZTSkxCNE1YTTRRN2JIbStFL3JJ?=
 =?utf-8?B?Z0VwR01aRmZmVHp1NXkvY2pNdGcyS1pTTmdKYit3eGkxRGVUMVBGTEFsTUVh?=
 =?utf-8?B?cmtBOVRoWVhXRG9uRzFiNDFuN1p3dTRmdnIzRnppaDQ3aDVsd0NBV1ZuemNP?=
 =?utf-8?B?eEVPY3ZTT09zcU9qaVROYTEwY2F4Zk5KNVpta2VqSEZFSSsrV0ZzNUwwcFJv?=
 =?utf-8?B?WXdJbkRpSWxBOXNDSnNQamE0b29pakRkMjFDQ0R4empWWXVLOHJ2MGRrNlhi?=
 =?utf-8?B?VUpNeldjVTZNbFQrQU92dXp5RDJvOVdaTVlZL29LYlpBVWlRdjlJYXBjWTBq?=
 =?utf-8?B?WDN0TUozOUxHNWtyeUtRKzhRVCtaY2IxVnRBdUFwWnlUMkUyZ3FVNEM2Qmc0?=
 =?utf-8?B?V09UL3o4Ynd1bTdvQ3RoQWpVRThtaklNQlV5czVzSjdwd1NjcmJVRTV6dzBl?=
 =?utf-8?B?Q1FUNm9IS1VNcitvcU9VOGN3NEFkV3FmVXBCSXhvRTJkVUl0WTJZU3Z1Yjdk?=
 =?utf-8?B?ZnJvbmFPTGgrZ1RENWJLeG9zRTBuOHlONEVJMTlzSFFSZ3pGV01iaktabEZu?=
 =?utf-8?B?OTlTTE1GTDdSVURyQVNuenIyTHU1Z2dQbHBHV1EweUMxWFJ3b2lGUk5TclIw?=
 =?utf-8?B?OEZmbkovVTU4RXhEN0FVQkdQQS9QaVNmbWFEUnY3VnFWNVpzWEQ1bFJJUUto?=
 =?utf-8?B?bU5lemYxYVpkbVB1cWtkMzJ1MVRHVFNnU0c4Zy9LZFIwQ3hMK0hFdWtYNzRs?=
 =?utf-8?B?SWJyTmhVL3c5MzBBUXRLeHl4SUxSYXdKdjJHZ2hKOTN0RkJaQXJ2dHZ6b2lw?=
 =?utf-8?B?QnFSdjQvMFBmL1Boa3RjN0xMWGNZQ1JFSEkwaEQ0Q1pYRXQ5M0VVc3phYjhh?=
 =?utf-8?B?NGhsS1VQbFZuV3M3WURiTm03T05wbS9yVEdVbFMrMnhKUzBBRi9BS1lISVUy?=
 =?utf-8?B?amxic2R3MTRLVWtpTW5LNnVNUjl0U0tJTllDWFpKWjFsSytyci9rNUF3eERj?=
 =?utf-8?B?RUdzVTZUWEl3bVB0WHdzL0J1Q1VsZENOc3NhSmZuVXJ1Tm0wVElYZHpsZUVN?=
 =?utf-8?B?MUptdXV6TXhuMmVmOUc5V3pmU3FuWGFrUjJlTS9IdUlua3JObUFwa3dxNFB2?=
 =?utf-8?B?WGo0YVVCd3ViUFNpb09DSFVWb1Y0RnoxckZ3aWlVbnNYM0Fob21SbW5RWFFS?=
 =?utf-8?B?aTZndGpQb2dJUmNPME1zWTdmbmJ2dUpsRFJsc0x0YUV3Mnl0SSsvQW11eTFP?=
 =?utf-8?B?aXFuQjMzRFI0cnpDNVVZb3F6NjVIM1NmN2R0bGoxUHVKSVdHbHJsK0RsTDFH?=
 =?utf-8?B?ckRJYUY3d2IwbVN5UW9lRVdnODdMcDIrZktucG02NnlyaFE5RmZrMDE1RXFp?=
 =?utf-8?B?M3FJY1ltNXlTMy93N2dUcnJCSU5la1lsRzJpOHVHYjRtTENvdjRVampjdi83?=
 =?utf-8?B?RTN2UWJrY0s0WVU3YWt2WWZUZEhOTXNmR1VlQk1pQmJ5TU5LNlJWbkl3cGJx?=
 =?utf-8?B?ckM2YmlCZFp5VmcxUUh6YkwveG54ZGRDU0NvcW9XNnN6Y2lEWUl2K2llMnJx?=
 =?utf-8?B?SEFkNzI5N1VxSGJ5U2F3ZUhqTFlYYXdRSnkxMHV5ZjdrLzNFQTU3bTZ6SThi?=
 =?utf-8?B?UWJTRm82aTd6dFRlVXltK2ppZnc1ZTdNOTJ1VXlIUHF5RnFvdFc5bm5VUno2?=
 =?utf-8?Q?4nJZjCW3UIXCS/kRc7vWyqvqnJ/59+gRWL6ObzJ?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d4ed48-28f4-4b55-6714-08d8dfebfc4d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR05MB5759.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 15:33:14.9815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+zYzSKNIyb4rKtJB7jm1X68fdxnQ976Noz/bHg36j6+Jln4yzsaTin1lx7G6EH6oSKQNSQLssyiKdCezqDn1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR05MB7616
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vmwgfx ones look all good to me, so for
23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
That said, they were already signed off by Zack, so not sure what
happened here.

Roland

On 03.03.21 14:42, Lee Jones wrote:
> This is a resend.  All of these patches have been sent before.
> 
> The vmwgfx ones were even applied, but were dropped for some reason.
> 
> Lee Jones (53):
>   drm/nouveau/nvkm/subdev/bios/init: Demote obvious abuse of kernel-doc
>   drm/nouveau/dispnv50/disp: Remove unused variable 'ret'
>   drm/msm/dp/dp_display: Remove unused variable 'hpd'
>   drm/amd/display/dc/bios/command_table: Remove unused variable
>   include: drm: drm_atomic: Make use of 'new_plane_state'
>   drm/nouveau/nvkm/subdev/volt/gk20a: Demote non-conformant kernel-doc
>     headers
>   drm/amd/display/dc/bios/command_table: Remove unused variable and
>     associated comment
>   drm/amd/display/dc/calcs/dce_calcs: Move some large variables from the
>     stack to the heap
>   drm/amd/display/dc/calcs/dce_calcs: Remove some large variables from
>     the stack
>   drm/amd/display/dc/dce/dce_aux: Remove duplicate line causing 'field
>     overwritten' issue
>   drm/amd/display/dc/dce80/dce80_resource: Make local functions static
>   drm/nouveau/nvkm/engine/gr/gf100: Demote non-conformant kernel-doc
>     header
>   drm/nouveau/nouveau_bo: Remove unused variables 'dev'
>   drm/nouveau/nouveau_display: Remove set but unused variable 'width'
>   drm/nouveau/dispnv04/crtc: Demote non-conforming kernel-doc headers
>   drm/nouveau/dispnv50/disp: Remove unused variable 'ret' from function
>     returning void
>   drm/nouveau/dispnv50/headc57d: Make local function 'headc57d_olut'
>     static
>   drm/nouveau/nv50_display: Remove superfluous prototype for local
>     static functions
>   drm/nouveau/dispnv50/disp: Include header containing our prototypes
>   drm/nouveau/nouveau_ioc32: File headers are not good candidates for
>     kernel-doc
>   drm/nouveau/nouveau_svm: Remove unused variable 'ret' from void
>     function
>   drm/nouveau/nouveau_ioc32: Demote kernel-doc abuse to standard comment
>     block
>   drm/vmwgfx/vmwgfx_execbuf: Fix some kernel-doc related issues
>   drm/vmwgfx/vmwgfx_kms: Remove unused variable 'ret' from
>     'vmw_du_primary_plane_atomic_check()'
>   drm/vmwgfx/vmwgfx_kms: Mark vmw_{cursor,primary}_plane_formats as
>     __maybe_unused
>   drm/vmwgfx/vmwgfx_drv: Fix some kernel-doc misdemeanours
>   drm/vmwgfx/vmwgfx_ioctl: Provide missing '@' sign required by
>     kernel-doc
>   drm/vmwgfx/vmwgfx_resource: Fix worthy function headers demote some
>     others
>   drm/vmwgfx/vmwgfx_ttm_buffer: Supply some missing parameter
>     descriptions
>   drm/vmwgfx/vmwgfx_fifo: Demote non-conformant kernel-doc header
>   drm/vmwgfx/vmwgfx_ldu: Supply descriptions for 'state' function
>     parameter
>   drm/vmwgfx/vmwgfx_kms: Update worthy function headers and demote
>     others
>   drm/vmwgfx/vmwgfx_overlay: Demote kernel-doc abuses to standard
>     comment blocks
>   drm/vmwgfx/vmwgfx_fence: Add, remove and demote various documentation
>     params/headers
>   drm/vmwgfx/vmwgfx_bo: Remove superfluous param description and supply
>     another
>   drm/vmwgfx/vmwgfx_context: Demote kernel-doc abuses
>   drm/vmwgfx/vmwgfx_scrn: Demote unworthy kernel-doc headers and update
>     others
>   drm/vmwgfx/vmwgfx_surface: Fix some kernel-doc related issues
>   drm/vmwgfx/vmwgfx_cmdbuf_res: Rename param description and remove
>     another
>   drm/vmwgfx/vmwgfx_shader: Demote kernel-doc abuses and fix-up worthy
>     headers
>   drm/vmwgfx/vmwgfx_cmdbuf: Fix a bunch of missing or incorrectly
>     formatted/named params
>   drm/vmwgfx/vmwgfx_cmdbuf_res: Remove unused variable 'ret'
>   drm/vmwgfx/vmwgfx_stdu: Add some missing param/member descriptions
>   drm/vmwgfx/vmwgfx_cmdbuf: Fix misnaming of 'headers' should be plural
>   drm/vmwgfx/vmwgfx_cotable: Fix a couple of simple documentation
>     problems
>   drm/vmwgfx/vmwgfx_so: Add description for 'vmw_view's 'rcu' member
>   drm/vmwgfx/vmwgfx_binding: Provide some missing param descriptions and
>     remove others
>   drm/vmwgfx/vmwgfx_msg: Fix misspelling of 'msg'
>   drm/vmwgfx/vmwgfx_blit: Add description for 'vmw_bo_cpu_blit's 'diff'
>     param
>   drm/vmwgfx/vmwgfx_validation: Add some missing struct member/function
>     param descriptions
>   drm/vmwgfx/ttm_object: Demote half-assed headers and fix-up another
>   drm/vmwgfx/vmwgfx_thp: Add description for 'vmw_thp_manager's member
>     'manager'
>   drm/vmwgfx/ttm_object: Reorder header to immediately precede its
>     struct
> 
>  .../drm/amd/display/dc/bios/command_table.c   |   16 +-
>  .../gpu/drm/amd/display/dc/calcs/dce_calcs.c  | 1151 +++++++++--------
>  drivers/gpu/drm/amd/display/dc/dce/dce_aux.h  |    1 -
>  .../drm/amd/display/dc/dce80/dce80_resource.c |   16 +-
>  drivers/gpu/drm/msm/dp/dp_display.c           |    3 -
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c       |    4 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |   10 +-
>  drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.c          |    4 -
>  drivers/gpu/drm/nouveau/nouveau_display.c     |    8 +-
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c       |    4 +-
>  drivers/gpu/drm/nouveau/nouveau_svm.c         |    5 +-
>  drivers/gpu/drm/nouveau/nv50_display.h        |    3 -
>  .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    |    2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   |  204 +--
>  .../gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c  |    4 +-
>  drivers/gpu/drm/vmwgfx/ttm_object.c           |   25 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_binding.c       |    9 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c          |    1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |    2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c           |    2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c        |   14 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c    |    8 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_context.c       |    6 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c       |    3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |    8 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       |   20 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c         |   18 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         |    2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |   16 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |    4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |    4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_msg.c           |    2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c       |   16 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |   10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |   10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_shader.c        |   10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_so.c            |    1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |    9 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       |   17 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           |    1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    |    2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |    5 +-
>  include/drm/drm_atomic.h                      |    3 +-
>  44 files changed, 818 insertions(+), 847 deletions(-)
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Anthony Koo <Anthony.Koo@amd.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Colin Ian King <colin.king@canonical.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Jeremy Kolb <jkolb@brandeis.edu>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: nouveau@lists.freedesktop.org
> Cc: Qinglang Miao <miaoqinglang@huawei.com>
> Cc: Rob Clark <rob.clark@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Roland Scheidegger <sroland@vmware.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Zack Rusin <zackr@vmware.com>
> 

