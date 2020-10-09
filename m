Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDE82883AF
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 09:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732087AbgJIHgb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 03:36:31 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4401 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgJIHgb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 03:36:31 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8012c60000>; Fri, 09 Oct 2020 00:35:34 -0700
Received: from [10.2.48.215] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 9 Oct
 2020 07:36:25 +0000
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
To:     <christian.koenig@amd.com>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
        <chris@chris-wilson.co.uk>, <airlied@redhat.com>,
        <akpm@linux-foundation.org>, <daniel@ffwll.ch>,
        <sumit.semwal@linaro.org>
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <b6b77e60-f93d-efe4-e267-983a2bdbbe71@nvidia.com>
 <747e1832-0341-9029-95f6-638f0f1a6f76@gmail.com>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <0e3a8483-2b51-b9a4-30b9-360e761c95e4@nvidia.com>
Date:   Fri, 9 Oct 2020 00:36:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <747e1832-0341-9029-95f6-638f0f1a6f76@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602228934; bh=VXLiMZEGbVvifru0A9n+AHL9u+yHK4EKYT0uGJrjxIc=;
        h=Subject:To:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=nFxSHOJN7Xduujj/wHrzlj1+fNv/rRDDGf4os16G9AgCTVgbLDjigoPl7sizqUqsA
         34D9i+FaLs3iLpwBHPE0vbFuoyV3d9sdx9EQMtgufgoHAXAFvNrz0mfPUCXSxiCLjb
         6Nbx8kCGWai06yAQGP5uxEg/HDub6jmVvSBrhFYjEYhPONuVxSbxesVtvVwCpi+E2Z
         B4TcJOl/pda9XWJVqDrBJ9QaxOpbxQwG1V72WRzrj7t+jvxJdEz1oNYNKbX6VW8+Do
         MacCNNNXVFF3oSf04Urmz4h8OlbMkaC7Yt9eIAPLliqQbDWywnXjVcYJst6AU1eBEI
         wAA4ZOryDim+Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/9/20 12:33 AM, Christian K=C3=B6nig wrote:
> Am 08.10.20 um 23:49 schrieb John Hubbard:
>> On 10/8/20 4:23 AM, Christian K=C3=B6nig wrote:
>> ...
>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm=
/i915/gem/i915_gem_mman.c
>>> index 3d69e51f3e4d..c9d5f1a38af3 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> @@ -893,8 +893,8 @@ int i915_gem_mmap(struct file *filp, struct vm_area=
_struct *vma)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * requires avoiding extraneous ref=
erences to their filp, hence why
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we prefer to use an anonymous fi=
le for their mmaps.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0 fput(vma->vm_file);
>>> -=C2=A0=C2=A0=C2=A0 vma->vm_file =3D anon;
>>> +=C2=A0=C2=A0=C2=A0 vma_set_file(vma, anon);
>>> +=C2=A0=C2=A0=C2=A0 fput(anon);
>>
>> That's one fput() too many, isn't it?
>=20
> No, the other cases were replacing the vm_file with something pre-allocat=
ed and also grabbed a new=20
> reference.
>=20
> But this case here uses the freshly allocated anon file and so vma_set_fi=
le() grabs another extra=20
> reference which we need to drop.
>=20
> The alternative is to just keep it as it is. Opinions?
>=20

I think just a small comment for these cases, is probably about right.

>> ...
>>
>>> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android=
/ashmem.c
>>> index 10b4be1f3e78..a51dc089896e 100644
>>> --- a/drivers/staging/android/ashmem.c
>>> +++ b/drivers/staging/android/ashmem.c
>>> @@ -450,9 +450,8 @@ static int ashmem_mmap(struct file *file, struct vm=
_area_struct *vma)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma_set_anonymou=
s(vma);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (vma->vm_file)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fput(vma->vm_file);
>>> -=C2=A0=C2=A0=C2=A0 vma->vm_file =3D asma->file;
>>> +=C2=A0=C2=A0=C2=A0 vma_set_file(vma, asma->file);
>>> +=C2=A0=C2=A0=C2=A0 fput(asma->file);
>>
>> Same here: that fput() seems wrong, as it was already done within vma_se=
t_file().
>=20
> No, that case is correct as well. The Android code here has the matching =
get_file() a few lines up,=20
> see the surrounding code.
>=20
> I didn't wanted to replace that since it does some strange error handling=
 here, so the result is=20
> that we need to drop the extra reference as again.
>=20
> We could also keep it like it is or maybe better put a TODO comment on it=
.
>=20

Yeah, I think a comment is a good way to go.


thanks,
--=20
John Hubbard
NVIDIA
