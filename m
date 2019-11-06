Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3C5F1157
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 09:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730107AbfKFInu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 03:43:50 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36715 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729881AbfKFInu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 03:43:50 -0500
Received: by mail-wm1-f66.google.com with SMTP id c22so2329383wmd.1
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2019 00:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v31fEkgwXp8SELPxnFeI+H2hYH5lK/wUKHznRj7SoXE=;
        b=c3SW8mXxTeconF1fXD7u6ricZNPaxRyUxnO+uMSqcOFrydx6GO/EGz6pxVCS58TXGQ
         bs551aj/5w8VPaMIaH9iFWFrb6Z63FugVMEAgbcnkU67/FC8LIodqWh9OCg6eT4GXqEV
         Bwls671N/Hz5OrlM0FwGW6bkL3RI7sZ7ZNJqWFBORrgSdlSw9enXh9FYVTJysQpkYeeU
         9bXJMj9Yd8XjGSyAQq2FLgpM9pzqevN1Rgetf80vtdoaWRwdE3e7mu3HmXSuZTRceFaF
         aAGL7fV4ILBgAEsW2Kcq++1NJ6oSxLB31twMSTSDVp/h4bAvnSXMU6nELlMEM9SqXEez
         ValQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v31fEkgwXp8SELPxnFeI+H2hYH5lK/wUKHznRj7SoXE=;
        b=tcQ3c3k1udiCugouA3LJDHBEIRb1EzK1tya5iLsK26x55UsQziGY7Tgv3Ycqcz2ML9
         PHNHOFrQss9GOakpyYZ3/pTtrGpVR6Gsk8CVsv105+ENr/Z/7UtEvXjKKa+W8SjhBRsQ
         mjMB5f/yHo8vvZJ1Io9MPOqtievtaGqw/mmvXq4Qcylx0O414O5HcmonPLk3RsE5jx0s
         7vHV11Ea8WifSbtjyOAqKmWSU7tYODmOEvOQ013CGJwWpA2DaFl/9phgQPnBWSmC+dvc
         rW41J6fEpXM0j9rNXqdEj2zzQYarmEHbroQb+gMeCH+fB/UnpGIqbU+oO8uujq8zj3EH
         +tgA==
X-Gm-Message-State: APjAAAWJ1kfm9s3VCUbdG2b21n90CW0E8v4ZLlVc+XsYBXVote2bqbBM
        2bgaH7f/QYopXtH2HAmc11c=
X-Google-Smtp-Source: APXvYqxstNgqeFH+RzorSCme69eWeZGQKPmZ8MdpufkRDxMeu9YnCs6VaiQXcAg84+zJnAS040B0KA==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr1361258wma.38.1573029827418;
        Wed, 06 Nov 2019 00:43:47 -0800 (PST)
Received: from localhost (178.165.129.116.wireless.dyn.drei.com. [178.165.129.116])
        by smtp.gmail.com with ESMTPSA id d11sm19336229wrn.28.2019.11.06.00.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 00:43:46 -0800 (PST)
Date:   Wed, 6 Nov 2019 09:43:44 +0100
From:   Stefan Hajnoczi <stefanha@gmail.com>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>, geoff@hostfission.com,
        virtio-dev@lists.oasis-open.org, Alex Lau <alexlau@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel@nongnu.org, Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        David Stevens <stevensd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: guest / host buffer sharing ...
Message-ID: <20191106084344.GB189998@stefanha-x1.localdomain>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline
In-Reply-To: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2019 at 11:54:56AM +0100, Gerd Hoffmann wrote:
> The issue of sharing buffers between guests and hosts keeps poping
> up again and again in different contexts.  Most recently here:
>=20
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg656685.html
>=20
> So, I'm grabbing the recipient list of the virtio-vdec thread and some
> more people I know might be interested in this, hoping to have everyone
> included.
>=20
> Reason is:  Meanwhile I'm wondering whenever "just use virtio-gpu
> resources" is really a good answer for all the different use cases
> we have collected over time.  Maybe it is better to have a dedicated
> buffer sharing virtio device?  Here is the rough idea:

My concern is that buffer sharing isn't a "device".  It's a primitive
used in building other devices.  When someone asks for just buffer
sharing it's often because they do not intend to upstream a
specification for their device.

If this buffer sharing device's main purpose is for building proprietary
devices without contributing to VIRTIO, then I don't think it makes
sense for the VIRTIO community to assist in its development.

VIRTIO recently gained a shared memory resource concept for access to
host memory.  It is being used in virtio-pmem and virtio-fs (and
virtio-gpu?).  If another flavor of shared memory is required it can be
added to the spec and new VIRTIO device types can use it.  But it's not
clear why this should be its own device.

My question would be "what is the actual problem you are trying to
solve?".

Stefan

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3Ch8AACgkQnKSrs4Gr
c8jJkQf+OXfiNkWYIcdcWyI1Jb83nIWtxUvep2NE3eZ1qcZk4MgmN5D4fAnr3T0n
vOLAaJvryIB62LxqUhpKkvL1Bjs/U4xo7n3R4Nr2x6/Tu3KHMYNrWGeEIRHnz+Kb
CnK9LiO8Y7JRmQ2CjlBCCBshO8CDFrxAA2VLkGcqU95yxxvrAAZ2rzpRmn16pBth
rhCLUHsNB8hKaJof0ITCFexJFcwLELATD/YmPZioJu2E/mcV5qKjm89gz/7VdlE3
ke/a0WFC2BIh/wm3MaAPKyn7hgd9yOafmEEVl+qCE86K1j+jzv8K4dvB5FdPOW2A
ayt+fhrKECTHRXvWoZ1AD1V5gtUs2g==
=AAPk
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
