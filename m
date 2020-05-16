Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D88FE1D5EE6
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2020 07:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgEPFY0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 May 2020 01:24:26 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:56293 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgEPFY0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 May 2020 01:24:26 -0400
Received: from [10.0.0.6] ([120.156.36.44]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MnItm-1iqpzQ26q4-00jLLz for <linux-media@vger.kernel.org>; Sat, 16 May 2020
 07:24:25 +0200
To:     linux-media@vger.kernel.org
From:   Finn Rayment <finn@rayment.fr>
Subject: [GIT,PULL] Ressurect the atomisp staging driver
Message-ID: <7fa44621-963f-2d55-ab91-0fee483a94f5@rayment.fr>
Date:   Sat, 16 May 2020 15:23:57 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:gnzipYFh/+dsXczJ+lvfdjzkDZzDShHWrswt1dI1b9GVR3pKi0B
 866Df6IvscbVGGwr/sekOTG7OPq3mxu6f/++a3dAvf8WtriIyTdj5WhNCt6Egk0SbjfHUQa
 x/4rgzwg6pK9VPVsr7Vx1gzzzXQz3eRpmJli1L5odnSaaFRzW+p7XpCVPSS58UFOzO4En8j
 inqVsrz+Qj67Z3kUQG66w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xbsDBycmjJo=:bT1i6OZ8P3RztnfRV7xvHt
 5Njq4vQ+XOucx7lcv6JVZyjb3X7WAfre6lfxKL7tBgUnM1VO47nyuS6RD955N2TJmfEz/Y623
 d9+UKoAXaPRH104CVoV9m5AAzhAo+zBFUPLHObBTUMNRRe3fz+JLGeWHHTdy0b8gt1FE+upzG
 qH1jdKYvluagXBVec4oZSULA9V34DgDqNeOIzh8bN34T4NPAwnlO1abZHeKVEahBcq9CBUGqs
 +9QQfK1cRl6juNNHJ+vljADycVtQpd/4hz1NW3rgbxTDLFRqxvTncVdhEX6rDcasE4b0jPFWx
 sjqNSjRia40lntEGwdp/mJTGH/SZZrOcIBNXYB292J2pU9y3hp3gtVgGDzOdCMkQLaygKL2rF
 O9QXR12gvMbJwnDP9sHL/MbFHW5mg7qplMv1CBrsqy3zGWHVcrEc97sQo1VgOj3zBBNMEsW0u
 S215Pe076m53y08OihYepnEZG8F7uzYEX+KeXH+aZddvS5W6It0lU789DvktkBx/LXitjd2jP
 9q+RFQEQ9f0X9QlTpXYONTYZjWxDETFM6qFUMGhVpp18XveWzCGiwx/GSiZ69yc9d1KlDEN/o
 bAXYPzySJPEk/DIV38pObhjInmFwd+SMQvlkQyxts0mvP0aNncTr90e7X2y6Fvfhw+O4XKTSl
 uW6Ppwuf5PxNQfhSd4e/UQKWhoEJq3FJrCJW3rLdg25R9JDKov96NHmJczKrBYFz3TeQ+zZve
 /ZXjIOpXcCzzZ3hDqzzHCkGuPj/6BT2ftnhZhCshXi/vJFlvpDsGjTVhTWILGZ6xt1BGO40Fd
 9Jk3VUAHg1wOoNJgDd6zhAsdDDuU2SYcG385R6wOOVpRMtqviENWQdpIk7CF1qNM6OYooIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I've cloned HEAD from atomisp_v2 (commit bb1407f0d...), tried to compile 
it on a T100TA and have received the following error:

arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function 
__kvm_gfn_to_hva_cache_init:
arch/x86/kvm/../../../virt/kvm/kvm_main.c:2442:42: error: nr_pages_avail 
may be used uninitialized in this function [-Werror=maybe-uninitialized]

Commenting out the third line in arch/x86/kvm/Makefile has solved this 
for me. Aside from warnings, this is the only error I receive during 
compilation.

After installing the kernel and booting to Arch Linux, it gets stuck at 
"Loading initial ramdisk" with no extra information even with 
`loglevel=7` set. I will try to diagnose the issue and ensure I haven't 
incorrectly installed the kernel - will also try to compile on another 
computer.

Let me know if I can offer any other help or more information, I would 
love to contribute to the development of these drivers.

Regards,
Finn.
