Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779402F7C2C
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 14:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732965AbhAONK2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 08:10:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:37818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732438AbhAONK1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 08:10:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2E122256F;
        Fri, 15 Jan 2021 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610716186;
        bh=f3Gebj2QRD4hWp5mkrPz0xAwREY4cfiqUQdsQMe5bfc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=m6n3n8fg9Mz5Mf0xOwwGHS6kI1OXmqtbWarRzxd0yNk20DPGQLnqNiFcK6D/Ai6jq
         Q5N22SKOvvm6JTpQOoO+B6+u1Dc7yDqMJSM2UPNqoqf1knwebLLNQNlgObGrv4v4BT
         gkXdK/J+gxu4Z1OtvvYrokoVN1nmGHBaUBwUyPUhaVT/ZQVqAhzLAi5uJKusyHw+Kt
         LONIvBQJtyh+MkXoJ9n58Mi5T+q3bgjNc4xaqW0QonF2oabTtjLy2Xoej9I0O7VHtv
         wS9/lmJN2UJETLAu8lktAB+Q/FeAO2q9LLQ+tUPLoa+CZR0DM4zgizfhMEen1oz54s
         q1H4RuVJbEx5A==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thomas Haemmerle <thomas.haemmerle@wolfvision.net>,
        laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org,
        Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
Subject: Re: [PATCH v4] usb: gadget: uvc: fix multiple opens
In-Reply-To: <20201201192730.5633-1-thomas.haemmerle@wolfvision.net>
References: <2920c6ea-d191-a6cb-ec90-dda22bb9df55@wolfvision.net>
 <20201201192730.5633-1-thomas.haemmerle@wolfvision.net>
Date:   Fri, 15 Jan 2021 15:09:39 +0200
Message-ID: <87pn261h4c.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thomas Haemmerle <thomas.haemmerle@wolfvision.net> writes:
> Currently, the UVC function is activated when open on the corresponding
> v4l2 device is called.
> On another open the activation of the function fails since the
> deactivation counter in `usb_function_activate` equals 0. However the
> error is not returned to userspace since the open of the v4l2 device is
> successful.
>
> On a close the function is deactivated (since deactivation counter still
> equals 0) and the video is disabled in `uvc_v4l2_release`, although the
> UVC application potentially is streaming.
>
> Move activation of UVC function to subscription on UVC_EVENT_SETUP
> because there we can guarantee for a userspace application utilizing
> UVC.
> Block subscription on UVC_EVENT_SETUP while another application already
> is subscribed to it, indicated by `bool func_connected` in
> `struct uvc_device`.
> Extend the `struct uvc_file_handle` with member `bool is_uvc_app_handle`
> to tag it as the handle used by the userspace UVC application.
>
> With this a process is able to check capabilities of the v4l2 device
> without deactivating the function for the actual UVC application.
>
> Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>

Laurent, do you agree with the change?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmABlBMRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZhCQ/+MXVsCg4n1nL/YF2IH9BeiPgOf2GkzI7A
BrTxdwUaw621IPlEoejsFXAduXz/U8WVNDVshOUkbbe64p9PZRNbTZPMRUlo+9Ed
9WJBHmol5Mw09cAjIxfle8t/pC90HH/obXSzBrJ9GDbfsGwKErZdYmpc0JomNTPb
bnbuuMOap28G1AFOKuVFbLl0vK4L+YfAxpCoRiMAIr94rv4thpPnOOfUtmHdPyu0
4ggFOI2T6O0P/sl2LuITWGznhChmM+1do+fVbqI7evVinPWcmFTTNC6YvPJVIg5X
qkeEDzEmmgFAuYkdeqwepFiqoLH3R6MkE43m8UH1gEktGbavlqRPZE7hI5y5AAA2
fC81pFk08aYvTvlHJWGZE7ugzbvOYqs8gGMkvFqPpfTby1bWmVJY6vbPctEAS0QP
Tel2zTjWGvP4LG/h1orS7bk77Piq1py4Ejou4ocuujsfCLavkBMrr5UQf3NeU2fS
WXhH7wO2E7weh6QFdmy0d4/xx9m/+XsH8j/jzkgYnOTglV4O8iB1a15G17g7e6hX
N55pVi5c3096K7sjtwaJ0KOL0MHj2CBXpJyfuPJSNgaYZ8xmdl5ZSxeoHJE33cs/
1+0MtDteWZkOjiP6lQTTSJPu+hEKxpDi6RDvOxdWkaiMfhzPXtM/C2PRk5SeNMfW
jrFikMFOsaA=
=pykO
-----END PGP SIGNATURE-----
--=-=-=--
