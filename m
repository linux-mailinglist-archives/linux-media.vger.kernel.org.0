Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 491591D6096
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2020 13:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgEPLxs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 May 2020 07:53:48 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:38473 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgEPLxr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 May 2020 07:53:47 -0400
Received: from [10.0.0.6] ([120.156.36.44]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Ml3ym-1ioWt22sSS-00lWT0 for <linux-media@vger.kernel.org>; Sat, 16 May 2020
 13:53:45 +0200
Subject: Re: [GIT,PULL] Ressurect the atomisp staging driver
To:     linux-media@vger.kernel.org
References: <7fa44621-963f-2d55-ab91-0fee483a94f5@rayment.fr>
 <20200516115459.4a24063b@coco.lan>
From:   Finn Rayment <finn@rayment.fr>
Message-ID: <be10190f-d87a-aa9e-3fd9-747f7715a108@rayment.fr>
Date:   Sat, 16 May 2020 21:53:14 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200516115459.4a24063b@coco.lan>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:n9Zw8WWapqBQDKeU5BCQXdsn0AX7RCtdBj+YhziRQhDiIDYtuHw
 PH99k8xmcGj+VzuEU8uaGKKqDir64q3/bLiWEjUnfEzIb9Yl2zhzUTeR0MSU2FE5tf5g5dy
 rLj6aW8o0c8DWKNV4H++FfBrvsqTOq5cnoOFTCTBRKppPzIx74EcO5l1JDGXeCjdZ/tZ1Fc
 Soq7XHmjgX6bVFhPADkjw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BIq9dvBSAys=:1C/ZNGybz+5UuWY3GfJTYl
 3ojMlYDZgHQWzq+doxMIL+afKug7yhSKJHrslo1cPtOhA+9L8n8TpX3SgkhJdp9gTowr7BtP6
 0lulI2DgoeIgdtHrhggoSdPuYUTutqF8tXrLhRp5mxBPdJ2kC17R3xLXBKwHIqmV9mkPf8RbV
 s4I5l64b8BzO8hgB+np3YZMk+bL01jYOZ0LP65CmN5MYsgcsTWUWi/9mKRDB3lgnbVo3SFyub
 zeR1zy0GuI2a/4sSMjcEaD2ObsoHFhmNwoHFOR55mC6unuquy27CYQ9TVwrXCYpX5LgF0cJQ4
 zZta8Um2ZHD6qZ84MXlkDbGMEtO1X5XX6jimlhiwryIdSTozOrdDU/99MNpDuAdZUEbjHFzw9
 Doi7eljiWOawyYmFu4YwBGhPVpMVzjq3yxlA+0xgKl9e8rQbe/EP/nl6M6XVwe+KMndHK8Im7
 Ii8nIqZdHn5myVI6HrHHQlZ4tibn+FOwcA9EPc5jcqg9SreG1e4cHvm9REQVD1OxXUcNuqph9
 cOFml9q0FlMH8z9OYT1Qlc0z6RhYGxE3k/pBBkOpWcDC9QRqIqNLNaK4r2Xh/2pd1isGW+XFV
 EA8dW121iLKFINdvtrcZsuordYNr8cImkUP6SBvR4o/Cr5goGCwsrPp9D9O23N3I3ChdIxXbI
 VjpVCtgPI2JROqLRRLF4iAlVxaAar5ubaZ32HuK8mdO5e4vOdZpkbJXUj3Cd0Xk2kKuoxJBk/
 xgdDy0kOv0QqjGiKMHit+uUx/KO0Ra5hEoxkNbaNKp07NMlDXCs3rOoxZhKNfmzxSfeuYGPlA
 cnGsf7hKXNpKT1ftaU1iW2MNgJuGWp2ni77ox3x6eGHg6Mg4RxQNvWqVFKj0dNNLb6U/yr1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/5/20 11:54, Mauro Carvalho Chehab wrote:
> Em Sat, 16 May 2020 15:23:57 +0200
> Finn Rayment <finn@rayment.fr> escreveu:
> 
>> Hello,
>>
>> I've cloned HEAD from atomisp_v2 (commit bb1407f0d...), tried to compile
>> it on a T100TA and have received the following error:
>>
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function
>> __kvm_gfn_to_hva_cache_init:
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:2442:42: error: nr_pages_avail
>> may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>
>> Commenting out the third line in arch/x86/kvm/Makefile has solved this
>> for me. Aside from warnings, this is the only error I receive during
>> compilation.
>>
>> After installing the kernel and booting to Arch Linux, it gets stuck at
>> "Loading initial ramdisk" with no extra information even with
>> `loglevel=7` set. I will try to diagnose the issue and ensure I haven't
>> incorrectly installed the kernel - will also try to compile on another
>> computer.
>>
>> Let me know if I can offer any other help or more information, I would
>> love to contribute to the development of these drivers.
>>
>> Regards,
>> Finn.
> 
> Let me enclose the .config file I used here. Perhaps using the same one
> as a starting point would help building it.
> 
> Thanks,
> Mauro
> 

Thank you for the config. I've tried compiling on the T100TA itself and 
a second computer and on both I am receiving this error now:

make[1]: *** [kernel/Makefile:136: kernel/kheaders_data.tar.xz] Error 127
make: *** [Makefile:1722: kernel] Error 2
make: *** Waiting for unfinished jobs....

I am unable to finish generating the modules because of this.

Regards,
Finn.
