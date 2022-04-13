Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7A614FF4FD
	for <lists+linux-media@lfdr.de>; Wed, 13 Apr 2022 12:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbiDMKnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Apr 2022 06:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233322AbiDMKne (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Apr 2022 06:43:34 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F6159384
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 03:41:12 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u19so1624807ljd.11
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 03:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=5RhlhScu9DjeeaPM6THLNS/7RXz89mXAxIetcuhpr6s=;
        b=VpbqC4etfvhKiPbQweSspHaAWkwhE0UTQQBWqtKcdvfpYXpGiqb2GEugt8pbctaf1Q
         Ixntsopr2pn7Ad9XtEfXjpGmCCmBQilr/ZuBFNCGzXSWjn8f24WNYJXoRdcY7xvtRBfp
         Ri8oOaH1e7Aqz8KmCu8/3bbMZIXwJHWSWm5hrPdIb/KrFLWpJ4gs2btW22Q8pL+O7xhH
         +d6H6No0Q2MXn8gEitC7rcAfzWz7XuKIj6NCHNZVceRgK7aXqDr20I3KxLuEgQY/1Eb3
         xDGzy5wen2yIXcVSBW3tVT5+z/vQc2nIapZiJEFmEHXU5aeClP6htmiJi3430P4Y2ekT
         HnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=5RhlhScu9DjeeaPM6THLNS/7RXz89mXAxIetcuhpr6s=;
        b=V+IUgkYZWt63gd81umcc6MnpjIpyABMUdRrKYFaQQkQ1jqC+WAcP3KfxFcaQEPl3Rp
         giiNJ959hjgKBpkQJMGqbxYvxDK0Ei5JtBJO8dSTxUBDtX/Hl51QckG5dzVpGfFWi5yE
         sywOVmXO/TpeDcCaBmQvb+u9d6llyfPSQosN9mfx6UtdPJoDUmWf7IOIqWSm6Nsz2egG
         0jsUFtSB8KBLZdmH4cRdAUhjBwjtWYUQBZ7GgCAFR2PVygFH+M3SwE9lSZA+W42OZI18
         4YUuGnuMhRlE+OtVEcnzpX16h15LX19vzVsxiAPBa47O4nsyumVGg4f9hCeWB3CeEw2S
         wZ4A==
X-Gm-Message-State: AOAM533uHI/Xlm/h5eoC1MxpqfYjAmkWkl5hOWZjJ/LdyhJXX+zYlOJV
        2ZiwzvbQzfa/74kzi6bqjPo=
X-Google-Smtp-Source: ABdhPJxdPWD3Dho/BCYmtjLtbRUN2DC87xbtPvs+li6NTswpEzINScsVskpM8opbzxd2ilUPwmEcIQ==
X-Received: by 2002:a2e:84c8:0:b0:24b:50bb:de7d with SMTP id q8-20020a2e84c8000000b0024b50bbde7dmr15096227ljh.40.1649846470360;
        Wed, 13 Apr 2022 03:41:10 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id t26-20020a19dc1a000000b0046bc0ee8554sm549319lfg.309.2022.04.13.03.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 03:41:09 -0700 (PDT)
Date:   Wed, 13 Apr 2022 13:40:58 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Shashank Sharma <contactshashanksharma@gmail.com>,
        Shashank Sharma <shashank.sharma@amd.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Message-ID: <20220413134058.07e849e3@eldfell>
In-Reply-To: <faf5be22-07a2-f928-085e-1a1e2aa01b12@xs4all.nl>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
        <faf5be22-07a2-f928-085e-1a1e2aa01b12@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s+7q9S9uLhBwFTrtJRmlwel";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/s+7q9S9uLhBwFTrtJRmlwel
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Mar 2022 13:09:37 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> Hi Shashank,
>=20
> There is no cover letter for this series, so I'll just reply to the
> first patch, but my comments are high-level and not specific to this
> patch.
>=20
> To be honest, I am not at all convinced that using edid-decode as a
> parser library is the right thing to do. It was never written with that
> in mind. The two purposes of edid-decode are to:
>=20
> 1) Convert the EDID to a human readable text, and
> 2) Verify if the EDID conforms to the various standards and is internally
>    consistent.
>=20
> As a result the state information that edid-decode stores is just the
> state that it needs to check conformity across Extension Blocks and/or
> Data Blocks. Most of the parsed data is just printed to stdout and checked
> and then forgotten.
>=20
> I have considered if it would make sense to make a library to parse and
> store the EDID data and have edid-decode sit on top of that, but that will
> make the conformity tests much harder. It's kind of interwoven with the
> parsing and a parser library is really not interested in that anyway.
>=20
> I think edid-decode can function very well as a reference source for
> a real EDID parser since edid-decode is very complete, but not as a
> EDID parser library.
>=20

Hi all,

since this discussion, more people have joined the effort and the
consensus became to start a new project instead of pushing to
edid-decode upstream.

The new project is at
https://gitlab.freedesktop.org/emersion/libdisplay-info
where we are currently discussing what the API should look like in the
issues and merge request comments, so there is essentially no code yet.

If the project gains enough traction, I expect it will be moved into a
non-personal namespace under fd.o to live a life of its own.


Thanks,
pq

--Sig_/s+7q9S9uLhBwFTrtJRmlwel
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJWqLoACgkQI1/ltBGq
qqdY3A/9FfgeOC1YxPFS3cdX9tHvhYFvzTmG9FWFDZ2aWmXwrI6bYdSyw6ywGPI8
rbxezjUXlA1qclshwawC58JSp3NEUyH4DkSlN+CGQ2na3TcmPJ8OFUFwM/CMik1x
EqKYS+Zpa9EgqYl+2R56HP43mbNvSkI8RWm0E3txNYAqwDL23Dd9Au1kDCPhfcWq
Q8ClUGK6aRQ99iALsFOlUhJB2cSNHma4fQ8V/KCcm6jK9ANnmlzkLn8TbRtZhjrk
HzRtW+mnIGNO2iUcJrcz6BPr3TDcQ+MgUregR4EUQcbuZkjmL7fnQIzVN6oLyrh8
GoKhn0CYA0E6/kTHxTwVpd8Q01akayZM7eIhgyympGhL1D2YeBQMlMeDJxL5/3Mh
6L6UiJacu1QgX4c7oJfvOS7PxkhUgFlxmc2LQp3uTj3djqUomdfN7A/KkZotXS+v
q7cFGrChqesM/8Bt0lVByEWQjUKaL6m3n8JW6MjUuZhtvZkCTw7HqTOUnYDRWWWS
vbOwr442PlDnZF8c3IRcmsyak+2kl+58HhvhW4pBH7yyNGqpPbCfWzadp2QvPQ1a
QBp12B7fgEMDZKdASrGbBjhNPC8SFVgktubw/eUsFBpGlsLruAF0lqQzlKBpZXoi
uLp/NlWddTNzDXkCVV+L7FH3gf99rHP9ldOfbGgD7GVrrsDB/2I=
=pALI
-----END PGP SIGNATURE-----

--Sig_/s+7q9S9uLhBwFTrtJRmlwel--
