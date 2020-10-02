Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08449281E80
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 00:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgJBWjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 18:39:21 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10697 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgJBWjV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 18:39:21 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f77ac0c0001>; Fri, 02 Oct 2020 15:39:08 -0700
Received: from [10.2.58.214] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 22:39:19 +0000
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
CC:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>, <linux-mm@kvack.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-media@vger.kernel.org>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
Date:   Fri, 2 Oct 2020 15:39:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201002175303.390363-2-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601678348; bh=qTcrCkJDzdT8SfyK7qNOOJqSlCcdoBOSPBld3HipaxE=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=CkmG7p3e1gAyMtXXHaHX1wOW1NQeTx5EUso+tbSgFhrSp+8QrJgqKgpGph1U/WlJ9
         qjs7wfNjzCdFazLpm35kI8ryUb4HAhQGO1YhRDZHuawuF1n/XklWptr0Oh+AMQAUjy
         jneLP0a9LWrTfebX3/q5vKRWI7xVqEgLJba7x3/ynwdacCPjlPBn92WcwSu6Cw0YiT
         eKgU9+6RSW0XQZenBoBjewsXMxc+aP2u4J0XqZOj1Y5gz6t/S5sXbW56buv0moU6ab
         JNDEx6uK4fFAQ92xLXRbzenGuHOo4jN8MNmfnLJi/k09pKguinMXh3euJYAOLgkYOa
         zfT3EJXtIkeRQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/2/20 10:53 AM, Daniel Vetter wrote:
> For $reasons I've stumbled over this code and I'm not sure the change
> to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
> convert get_user_pages() --> pin_user_pages()") was entirely correct.
>=20
> This here is used for long term buffers (not just quick I/O) like
> RDMA, and John notes this in his patch. But I thought the rule for
> these is that they need to add FOLL_LONGTERM, which John's patch
> didn't do.

Yep. The earlier gup --> pup conversion patches were intended to not
have any noticeable behavior changes, and FOLL_LONGTERM, with it's
special cases and such, added some risk that I wasn't ready to take
on yet. Also, FOLL_LONGTERM rules are only *recently* getting firmed
up. So there was some doubt at least in my mind, about which sites
should have it.

But now that we're here, I think it's really good that you've brought
this up. It's definitely time to add FOLL_LONGTERM wherever it's missing.

thanks,
--=20
John Hubbard
NVIDIA

>=20
> There is already a dax specific check (added in b7f0554a56f2 ("mm:
> fail get_vaddr_frames() for filesystem-dax mappings")), so this seems
> like the prudent thing to do.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> ---
> Hi all,
>=20
> I stumbled over this and figured typing this patch can't hurt. Really
> just to maybe learn a few things about how gup/pup is supposed to be
> used (we have a bit of that in drivers/gpu), this here isn't really
> ralated to anything I'm doing.
>=20
> I'm also wondering whether the explicit dax check should be removed,
> since FOLL_LONGTERM should take care of that already.
> -Daniel
> ---
>   mm/frame_vector.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> index 5d34c9047e9c..3507e09cb3ff 100644
> --- a/mm/frame_vector.c
> +++ b/mm/frame_vector.c
> @@ -35,7 +35,7 @@ int get_vaddr_frames(unsigned long start, unsigned int =
nr_frames,
>   {
>   	struct mm_struct *mm =3D current->mm;
>   	struct vm_area_struct *vma;
> -	unsigned int gup_flags =3D FOLL_WRITE | FOLL_FORCE;
> +	unsigned int gup_flags =3D FOLL_WRITE | FOLL_FORCE | FOLL_LONGTERM;
>   	int ret =3D 0;
>   	int err;
>   	int locked;
>=20

