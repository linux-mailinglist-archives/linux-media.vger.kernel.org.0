Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1819B65C
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 20:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405582AbfHWSsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 14:48:55 -0400
Received: from anholt.net ([50.246.234.109]:50084 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390718AbfHWSsz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 14:48:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id ECA7010A364D;
        Fri, 23 Aug 2019 11:48:53 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
        by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id Is0mM7miBmoQ; Fri, 23 Aug 2019 11:48:53 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id BF93910A2890;
        Fri, 23 Aug 2019 11:48:52 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id ABF312FE2547; Fri, 23 Aug 2019 11:48:53 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Archit Taneja <architt@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 1/3] drm/vc4/vc4_hdmi: fill in connector info
In-Reply-To: <20190823112427.42394-2-hverkuil-cisco@xs4all.nl>
References: <20190823112427.42394-1-hverkuil-cisco@xs4all.nl> <20190823112427.42394-2-hverkuil-cisco@xs4all.nl>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1 (x86_64-pc-linux-gnu)
Date:   Fri, 23 Aug 2019 11:48:52 -0700
Message-ID: <87pnkvogyz.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=-=-=
Content-Type: text/plain

Hans Verkuil <hverkuil-cisco@xs4all.nl> writes:

> From: Dariusz Marcinkiewicz <darekm@google.com>
>
> Fill in the connector info, allowing userspace to associate
> the CEC device with the drm connector.

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl1gNRQACgkQtdYpNtH8
nugORA/+PxCuQAnHtJwESh5UxmaVIJ2cSKTCT3ua49pnzKX/3jFenLtfP47hWT9M
gZJz+UdC2kG8T8DInJoPdWniLCxkr/vQhA7DEQ9Z6AKOM80jNvTtvq0GTSUNcm6Y
kge/hbOTATYJXPgpkm8HwXfsjgz5pqvl1F1uNmXNvGxR+EWJ5MGl6/Tch7jFtXlj
lQOoU2SfPMJ4qPISf8hZo3Vzact/WWxJ8OCvSQGNcAaRkktUJRl0M9jS0W8cqxll
mIVM4l6GEP4grHIKwzAVlKD+r5NI6+lOYkfQNQ+FH0Tpdpaa4Jm1eGzhrUuamJEZ
xuPTHCIsSwqsszdiwrvK6YHxP3Uy0ZYMLq7RtE5SzqrJKxyKQbe23y/AhQEI4eGy
3ElG+gPekhP4T36H/n+y7A9G0pYNqPTzclY9/DOQHziEw/Cxix7GWpp6Wv7l7QbQ
1mfUGprukjhtVpTz5nhhgsxMaGudeAQ7PDnEoeacJY5R9ILKR12O45Pxb2p3g1hG
1jxChV8kr0GwOMCLPgQwv6sySbwIdUWUBXrZXhxWlWENcfAENMjFJIfXcDVg1bWZ
83M518nq2Q4YzENncNf+Xs+mnc5C+6+cRiDfloyFszi5AzHTq+XPwSUpRRDiJFDM
pV0DOY49HsCjf3bwn3qxW4Avle//AgBjtqhwsx9VqdHMQ7kydPI=
=W+Sx
-----END PGP SIGNATURE-----
--=-=-=--
