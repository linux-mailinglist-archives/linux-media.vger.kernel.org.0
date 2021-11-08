Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1BF447B41
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 08:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236148AbhKHHnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 02:43:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:38054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235686AbhKHHnv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 02:43:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B096761075;
        Mon,  8 Nov 2021 07:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636357267;
        bh=RVK8iyvJlzFHPZCKRlsINEQUkjxXHKinu7hv/cU6no0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bM8tPKMTXtOzLT0n0JcaF3/bbzalw0dSy3V/uc5oZokrGrRNrrnGhV7RdDP/yckuR
         /mOMdXhPbvwRV39Ha+TLmMZr5y4s5HMBGMxL6utF7UckT/SUoRoZaMCxCaqHuGq5DM
         1Qjvu+VAA/z8RGhDFGetpnOTbiph1AsYJ5lOAw9/hazTiOLmYN/FCRyrQBYJhKXkZs
         jcOWUi8v7OOHobJYEj6fSlnRVlkqbP5deoOVHsUwdm3KFD4EYGSkIH1mm+gghpkpYI
         t+jzr2ik91r/jMqNSCBp/is61wzQKLZ9v+vzY3FnpjUVmudPSn5+HwbTfQzaMg9HAM
         iHu1v9eWS8G+A==
Date:   Mon, 8 Nov 2021 07:41:01 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [BUG 5/5] [BUG] media: atomisp: atomisp causes touchscreen to
 stop working on Microsoft Surface 3
Message-ID: <20211108074101.033af4c5@sal.lan>
In-Reply-To: <310ace44-93d5-99a3-bb4c-371b0a13462d@redhat.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
        <20211017162337.44860-6-kitakar@gmail.com>
        <103b5438-9f7c-7e89-28b9-29fe11eb818c@redhat.com>
        <cfad27a4bfdd94417305e1519e2f450a4422844d.camel@gmail.com>
        <310ace44-93d5-99a3-bb4c-371b0a13462d@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 8 Nov 2021 00:39:38 +0100
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi,
>=20
> On 10/21/21 11:52, Tsuchiya Yuto wrote:
> > Thank you for your comment :-)
> >=20
> > First, I need to correct what I said in the previous mail. I later found
> > that loading only "atomisp" (as well as its dependency,
> > atomisp_gmin_platform) does not cause this issue.
> >=20
> > What causes this issue is rather, loading sensor drivers (as well as its
> > dependency, atomisp_gmin_platform).
> >=20
> > These sensor drivers for surface3 are both not upstream, but I made them
> > as similar as possible to the upstreamed ones. So, I guess this issue
> > can still be reproducible on some other devices. =20
>=20
> I've run some test on my own surface3 and the problem is the writing
> of 0x62 (which becomes just 0x02) to the 0x57 register of the PMIC,
> writing 0x00 to that after loading the sensor driver makes things work
> again.
>=20
> I have not had time to investigate this further.
>=20
> I used media-staging + your sensor drivers from:
> https://github.com/kitakar5525/surface3-atomisp-cameras.git
>=20
> Which was enough to figure this out, but I've not actually gotten
> either of the cameras working :|  I get:
>=20
> [user@fedora nvt]$ ./atomisp-test.sh=20
> p0: OPEN video device `/dev/video2'

After the patch that moved the output preview to be the first one,
you should probably use /dev/video0 here:


$ v4l2-ctl -D -d /dev/video0|grep Name
	Name             : ATOMISP ISP PREVIEW output

$ v4l2-ctl -D -d /dev/video2|grep Name
	Name             : ATOMISP ISP VIEWFINDER output


On Asus T101HA, I'm also getting this if I use /dev/video2 with nvt:

	ioctl(3, _IOC(_IOC_WRITE, 0x76, 0xe0, 0x1f0), 0x7ffcf08fe030) =3D -1 EINVA=
L (Argumento inv=C3=A1lido)
	p0: ./v4l2n: ATOMISP_IOC_S_PARAMETERS failed on fd 3: Invalid argument (22)
	p0: CLOSED video device

Regards,
Mauro
