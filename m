Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F36B313ED
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 19:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfEaRed (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 13:34:33 -0400
Received: from mail-qt1-f181.google.com ([209.85.160.181]:41025 "EHLO
        mail-qt1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfEaRed (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 13:34:33 -0400
Received: by mail-qt1-f181.google.com with SMTP id s57so1820754qte.8
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=6lx68IjyoXNHnEwVqZqtfrVRaTubo98gbYHgesOeQXA=;
        b=jKjgfLFqIX/vlkEA4U6elyOu0Nry4OhSHwaBBGakJ4SldVI2l6CKfx/itdGivTYnDx
         dHwI/9Yfrq/yE7NF9kbTnKNv6YNhlQqUbjMsoAKOVZR8hFdgNdBxuFXxYCDqEIN5D4C4
         omAEtjPEztnXQ+5ATdiiNg3ubFcectMntiMQcmRn9cjfJuQZS9bdJ8sOHT/86GBXqyB8
         m8OOkw5tYe92Xub9QWo04hUWSwXKl74GjH5g7UxbXg+tPTyYK7MzPgfpxOyw+bo57/li
         y47s5SEbJTMiAK1ecLLJvVTSOQ8ILOy+KBerJkdPzSp/7zvdKCnitUuyGL6MlP8Kpbd/
         qN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=6lx68IjyoXNHnEwVqZqtfrVRaTubo98gbYHgesOeQXA=;
        b=hmxbzDXQBTnuH8nfqT2DspFaU6P8C37F2VqKNv9qOSL5SYj9+TblJCdqwXVAOIkr+g
         BEOvn2XfVdYF1K6NAe4H5EBwkqmsih+3YM3Pntr6nHzmUE3hlrmws3wc8FOHwp6KBp83
         YWlwr43xL+APYjLlJW1Em4jzSS0htyjcmJsOBf3YhRZN5afkcsfdGGfSKKobc97dOLGi
         2F6APZHNFiTaJJRydujf4sX4qaeCgo+Fft1ezY1ThqIQ7JZKhbA9mv2/8eT0IHz2/xgE
         /t2KD9y4EkzPMTvnSEp6t6Ey4DIdfu/xsRAdq9otkbpln2cu93OfXuSDWjCKNyAdDXtX
         24jQ==
X-Gm-Message-State: APjAAAUjDNrzzQAQP5cLKsWhn1VVam3fmzxaiZrND2IXH2GI8olyoRcE
        4QYdzbNXQTB+JACC5mMwHYKULl/xxA4=
X-Google-Smtp-Source: APXvYqysC8YYIH4YglnIyQgGGSMDyJ/WlDs78ugPwXWR003s9vwWOkUrkAu89nFNTBjlbIrdswSOUw==
X-Received: by 2002:aed:2315:: with SMTP id h21mr10595345qtc.303.1559324072113;
        Fri, 31 May 2019 10:34:32 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id t17sm4169382qte.66.2019.05.31.10.34.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 31 May 2019 10:34:30 -0700 (PDT)
Message-ID: <c119f93921ea61fde490d33165495fa39620f940.camel@ndufresne.ca>
Subject: Re: [v8] media: imx: add mem2mem device
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 31 May 2019 13:34:28 -0400
In-Reply-To: <CAGngYiX3Hv3mkd-GB=LuvmwaAuVMsGg2vpjx_F2-J3F6hOBVZw@mail.gmail.com>
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
         <20190529154431.11177-1-TheSven73@gmail.com>
         <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
         <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
         <fa48a38ee8e370c195a872ba302f70329d52dca5.camel@ndufresne.ca>
         <e16e87bfdeee242a1dfb8c62b6f1528b346c3a99.camel@ndufresne.ca>
         <CAGngYiX3Hv3mkd-GB=LuvmwaAuVMsGg2vpjx_F2-J3F6hOBVZw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-g4ooUj0IBdVwWawtumXy"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-g4ooUj0IBdVwWawtumXy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 31 mai 2019 =C3=A0 12:07 -0400, Sven Van Asbroeck a =C3=A9crit =
:
> Hello Nicholas, thank you so much for investigating.
>=20
> On Fri, May 31, 2019 at 11:34 AM Nicolas Dufresne <nicolas@ndufresne.ca> =
wrote:
> > Now, if that pipeline was live, this would be a problem.
>=20
> This is where my gstreamer knowledge gets really hazy.
> What does it mean for a pipeline to be 'live' ?
> Would this be a problem when playing a 1080p30 h264
> video from a file?

Playback from file is not live. That basically means that the input of
your pipeline is not paced. You can read it as fast as you can, and you
don't have a limited amount of time to deal with it. An example live
pipeline would be:

  v4l2src ! v4l2h264enc ! rtph264pay ! udpsink

In this case, if v4l2h264 has too much latency, or is too slow, the
capture driver will start skipping captures, loosing information. The
latency is mostly for the case you have multiple streams though (e.g.
audio and video).

Nicolas

--=-g4ooUj0IBdVwWawtumXy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPFlpAAKCRBxUwItrAao
HKDsAJ4yqSaYiYk6KBpABmZXYTGCV57W9ACZAXdKTw9ZPJ5efDlSkvkshGKB9Io=
=5wEu
-----END PGP SIGNATURE-----

--=-g4ooUj0IBdVwWawtumXy--

