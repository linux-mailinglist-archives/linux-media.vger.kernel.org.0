Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182A02C746C
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 23:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388544AbgK1Vtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 16:49:40 -0500
Received: from mout.gmx.net ([212.227.17.22]:55003 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729478AbgK1S1X (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 13:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1606587951;
        bh=xxIgQTR2VpmL987Hp2uw8jdeUWSV0iHHx5xMHabUevM=;
        h=X-UI-Sender-Class:From:Subject:To:Date;
        b=joy/uFg/2v2oXvHRNkN7Ui1PtHRaBlaC75jD09IgM24ne/8CWDi99mqdeVHy48IpA
         RauaM8u3CwSHKiy5xAD0JxyENPmT+ub4PvywCotCQO78nMS0vjauf8kiR2bSrVdDGi
         oo0PQfAq2qA8Gmp/eEizw3Uf4WCjxF2zqiWQTbqU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.3.33] ([217.225.83.13]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MnakX-1kJwte2CEX-00jVuk for
 <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 19:25:51 +0100
From:   Elmar Psilog <epsi@gmx.de>
Subject: create V4L2 Sensor driver (stream/triggered)
To:     linux-media@vger.kernel.org
Message-ID: <1c1ac976-70f1-2071-469c-c84320434469@gmx.de>
Date:   Sat, 28 Nov 2020 19:25:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:DqUMSn11tgDnErpVM29UI4LmTeFBPED7tUfEcWqDfasoTQ+x+Cr
 gqUrwQjseY5jEYelOd7v9387AptBJa0rsnXVjwGappwSL+xtKLUEu2Xpf3dHgg/GRWi80gr
 yAgGoYtXxtQfvTPwJamVKk0N0WSb17DF804uReKXAgmbIQ/HDeTZQhXiiZgDl5a1phFsNv8
 5ebHkBms++5fCjTClh5dA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PAPkQgaDt90=:P40pzvIzWvCz7Mdxp/McWa
 /5S9KZJWlJjERCf92cBcqi9lZ3XgResurTboxyW4GpbTrJCUKQKjIA03sDFkuY+VVk121SQ17
 xglIX7VgdYFEfGISY0dzwpgQB8oJpi8EXKXz8lFdl66dnDArvKmzWLHcSKQQlPyRwlyG5rPuS
 1VNclodXqONE9BTl4j2gJFMwgpLrcgGjmfxNRHihjzfxEV4xlEmnrmQ3gz+nAhq6Nu+ytAOWI
 KzMwX3yvCW/tSH2MUbiebhTmn3rlcSR8zFgBnDgyuJiVsSWj1jf006C/J60YMdno08bScL7wF
 JFffka7EaAsEWgc9toreNfStgKOoRacXgSHX5gPPFXpxDnQobHqwMoKuu6CaP3HNY7AWtHwhc
 fOxjPL5Zxdys8CZboKwE5ZYTd9KT2khrHjggJNNt3mEfuy7V5720Q1P8zNJ1YEptltdLNTahG
 EoSEzzSGmSpm67UmljvYaZGdVbBYus+jPuOm3uMr340zoBw+F9nyI0qaeutf66o5T5QuzRdup
 Djf7Ko6yPDkat6bKJN3+YE8wVta9km/oWR/VuGOR2deMM1wxpGl45JQBhsnT274+Q8yEZK+b4
 aHLdoVRGIvmkbGUtQLKq02wkn/DbWQgPctw8Ov+rz3ra5aRNHcOu9BrRy7hvOPjtF06US42mg
 54TOHNI20Z12Z/tDy3NeR3BO1q7BIzK4INXGHPkhgWAVV1yZusaJ0Zb9yXC7mVsIWP7BimQn6
 pLbrhywURUuMp8FA4oY77KraOh7c8wxt3tcEf9yQLIsx8PQm9JrtoOKBUfNzyZIUavoPKWU56
 9nHZL4Mixw7Wu17aCrJCdS9C9gHOckqVawWjR2hPQFqvw2Oc5QKEMi3BTTaktb/Z74ugrTjTc
 JhTjuGUG18z8Ja8BxD2w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Would like to write a (minimal) V4L2 driver for a (mipi) camera sensor.
I didn't find some kind of template that contains the stuff that is same
in almost all kind of this. So probably I have to learn from what is in
kernel already, right?

This is what I found:

https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/camera-sensor.ht=
ml

http://www.thedirks.org/v4l2/v4l2dwg.htm

https://www.kernel.org/doc/html/v4.16/media/uapi/v4l/v4l2.html

https://01.org/linuxgraphics/gfx-docs/drm/media/kapi/v4l2-subdev.html

But what I didn't found, neither in any docs nor in one of the existing
drivers:

I don't find a single one that seems to support TRIGGER. Is there a
special reason for that? Can someone give me a hint why this is like
that? In the real world many of the cameras have this.

Thanks

