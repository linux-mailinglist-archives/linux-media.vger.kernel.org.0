Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4D7E356744
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 10:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbhDGIyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 04:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349704AbhDGIxV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 04:53:21 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22A3C06175F
        for <linux-media@vger.kernel.org>; Wed,  7 Apr 2021 01:44:09 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u4so19707537ljo.6
        for <linux-media@vger.kernel.org>; Wed, 07 Apr 2021 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version;
        bh=4bTaiDwmqBTnEflRm+TP+kkpf+ay+Nd+JO4SZ3Ru8eM=;
        b=O49zkVzmobonu9+zunLNvLRmoDNdVNsyLfOgLk57hCHLVutq7llgHc3tbCESUDwZGr
         +TGox+LE8hqSAf1UenvBObjy38H7s2LrnKblewq7TmlaYTJgN1MEcb/Rde5PikBUjU7k
         s2tm+VZyKyaLYF5LtkUJkLLvlvc3xatmc53SSmLDWfKCR/eYE2mO+w901z58tyaBliET
         I5LRMkGzXAWi3UtS7JIXWg4ylkqkPr2InPEW7JOMOiXQpVyvIPd5jhCUTW7OUtHvnKWl
         8hAFOcAoa9+pG9bl/0eS3+Vaffigk3hc5j6QgrpozDyjU6bF/MXTzBQZjAlv3dkPyEzS
         6k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version;
        bh=4bTaiDwmqBTnEflRm+TP+kkpf+ay+Nd+JO4SZ3Ru8eM=;
        b=Q7CXootGnpnUyRc/scOmoeAGYYB83fGOJ4XVnWV4l642340mqRcngE22QtC/6TADNf
         UvJT0Tu6HgSkuMY+aIXiy04IEnACSdVMJ0eQkXolAm/qy1kub4EadZh94pMrK48u5rsI
         trZZKtPI3q5/xA1gEpsvxGtl5Wd7GylkogbkHn/eFPJeMkVqVUiZlxEdBEcJTM/y7+wd
         Iya6POgREFF71EgLjxD7L4G+Hjb1sZTffIhlM0D3mg3G3HsdCtL7R7phc+GcPX3RqGZq
         CyoSDATzTos8x83BggIrACIambTCkwISdtk/yVzHzIgkyQ5CzhKuRA+vsgDnxkQDm/ue
         7NtA==
X-Gm-Message-State: AOAM531gG0YMGNYnvr4lk7DFC9HAGAJj3dU2hDNJWG973gRTAEn85hXw
        0O2P2AQ2u406q4RZ4t6Ia4k=
X-Google-Smtp-Source: ABdhPJyvkkOWzJKow+hsJRhKuqv54jiR6gNwpHsnJGGDOH5yE+wIMgQLuNrXTE+HN0FjT0vikkY86Q==
X-Received: by 2002:a05:651c:1206:: with SMTP id i6mr1511762lja.426.1617785048223;
        Wed, 07 Apr 2021 01:44:08 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id 200sm2406228lfm.215.2021.04.07.01.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 01:44:07 -0700 (PDT)
Date:   Wed, 7 Apr 2021 11:44:04 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     dri-devel@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org, xorg-devel@lists.x.org,
        linux-media@vger.kernel.org
Subject: Call for an EDID parsing library
Message-ID: <20210407114404.13b41822@eldfell>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FXt.H9K20.aPyXYsUGYZgbK"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/FXt.H9K20.aPyXYsUGYZgbK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

with display servers proliferating thanks to Wayland, and the Linux
kernel exposing only a very limited set of information based on EDID
(rightfully so!), the need to interpret EDID blobs is spreading even
more. I would like to start the discussion about starting a project to
develop a shared library for parsing EDID blobs. This is not the first
time either, other people have suggested it years and years ago already,
but apparently it didn't quite materialise as far as I know.

Right now, it seems that more or less every display server and other
KMS application is hand-rolling its own EDID parsing code, even for the
most trivial information (monitor make, model, and serial number). With
HDR and color management support coming to Wayland, the need to parse
more things out of EDID will only increase. These things are not
exposed by the kernel, and most of these things have no use for the
kernel either.

My personal motivation for this is that I don't want to be developing
or reviewing yet another partial EDID parser implementation in Weston.

I recall ponderings about sharing the same EDID parsing code between
the kernel and userspace, but I got the feeling that it would be a
hindrance in process more than a benefit from sharing code. It would
need to live in the kernel tree, to be managed with the kernel
development process, use the kernel "standard libraries", and adhere to
kernel programming style - all which are good and fine, but maybe also
more restricting than useful in this case. Therefore I would suggest a
userspace-only library.

Everyone hand-rolling their own parsing code has the obvious
disadvantages. In the opposite, I would expect a new shared EDID
parsing library and project to:
- be hosted under gitlab.freedesktop.org
- be MIT licensed
- offer at least a C ABI
- employ mandatory Gitlab CI to ensure with sample EDID blobs that it
  cannot regress

Prior art can be found in various places. I believe Xorg xserver has
its battle-tested EDID parsing code. Ajax once played with the idea in
https://cgit.freedesktop.org/~ajax/libminitru/ . Then we have
https://git.linuxtv.org/edid-decode.git too which has code and test
data but not a C ABI (right?).

It does not necessarily need to be a new project. Would edid-decode
project be open to adding a C library ABI?

edid-decode is already MIT licensed and seems to have a lot of code,
too, but that's all I know for now.

Would there be anyone interested to take lead or work on a project like
this?

Personally I don't think I'd be working on it, but I would be really
happy to use it in Weston.

Should it be a new project, or grow inside edid-decode or something
else?

I believe MIT license is important to have wide adoption of it. C ABI
similarly. Also that it would be a "small" library without heavy
dependencies.

What do you think? Could anyone spare their time for this?

Who would be interested in using it if this library appeared?


Thanks,
pq

--Sig_/FXt.H9K20.aPyXYsUGYZgbK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBtcNQACgkQI1/ltBGq
qqeBWRAAroBsuzq2/qamsMSdK0OFn8qC/fHTH48Tt12tdCkC8bHZ27GXx0zSRlQn
j320Al1ux5gFdOOUMbfD5TGm7cKVYPK8GB5JGSKlZyDTwayV0UYLt0iqz50r23PA
E5KnZ2Lc/Qf//ah7fw78NFy6eSL3tdE7vZ53KPID6JAt8fLfhZ0EKbiGxLq8s8/T
zAbLIOcMFg/qnDSeqwIdCLa1DOzVnb2W1suWJDEZwFt9j09isJpQjyfFTik/ac/U
+L1zTgWuquTN48CAl9yPwNoP+fwvFlB8iQWtiNXyvGIAugiTvZDe+mmFN4W51spr
/cZtfqWgP/iRHOrI/wuZTr5vOO0oH9cJe8giMOxgore1RgDRPby+VqzE+ntnp8FZ
v8txiW4nPbNo2DZxAB9quckxvJJ4FISbfON+xi9kDgiBYs5ybVJq8vcNGIvbub1l
Kyhnw0Vo8Y8ELKnC/uodde7Fvr8u3qV4P7iGrYvTyIGzGTrVPAJbpplt9cK75r5X
5rIxiWk4uGZ4mlhw7Ewc4g4QWTm40e1gT2wGj0hPVmRX84GAAFD+6jASDufQjVBW
qc/NwOlJFiCCsSB14QhJ9rMCTG2ifXYstRJwByYWPcj52626ZT8fdhlwmT7REjGy
wr/jfsy9Gu0WS+/+JiLiHAjdjbfr3CvFmt+jKLBC/XI3NBnv0wM=
=PXum
-----END PGP SIGNATURE-----

--Sig_/FXt.H9K20.aPyXYsUGYZgbK--
