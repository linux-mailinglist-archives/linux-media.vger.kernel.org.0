Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10C7E6440AD
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 10:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235499AbiLFJxa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 04:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235502AbiLFJwH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 04:52:07 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F2220BDA
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 01:51:30 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id u5so4545416pjy.5
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 01:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9XFEuEO/uSZit0g9oIHRU2aY3eszS50qubKRuPycWJs=;
        b=SzO1dYdo4FZNipKusWblICfW51XRb9SaJyS30QqB6xydPzwLRFfgomz64CUIS7p4gy
         hLjM3PffKNgoSJJWCdfn9SYkufS5XSgXz0EYgm/yQy1AglhRjZ74bx/cJJbzEsYVHfel
         2Noc6i7tZCkSLn3I13pnVRL898goz8YFkVzPnbic4Tl78Kioo+ztCagru71Dju+z7+X2
         mekz/+HC/BUp2AsgaJ9Tt2C+gxOzvKE9vR1nmI930IOyFfrKC9Y1IOOIPKMlJnjTLsZv
         3eghgWsxkeK53uOZP+G5zU1YvbhenLS5k/ABftQ9zTXGxez/RbF1OpHd9yVAXGGVNKd/
         7ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XFEuEO/uSZit0g9oIHRU2aY3eszS50qubKRuPycWJs=;
        b=aJYg8bZQPGMKxVI4WHTOrI9ypoMP6bphQ4LXBJuYPfxUoArynoRCJ/bPVVtB22ByQs
         hJNqNkEOMjYDi345Shb5i5EjVHcLz8MHTMWAJfCMQg9dMSMoiy6i7L2l8HMUH5gV0zG8
         DVy1FkRN1NjsuVfptLSYQEOxCIAHgDEALdqx9O8Q8mXhQLHGqlHyo8M2H8FZw27QLMt2
         p9p/kvvhBFnGzCEEl55DhFGEowbWUjAaU0oMkwHyfnJy2IAtbtFERf27cTDJUliXU1Ck
         dtJLhejf+nwh0jVDudf7XxOM65XI5m9KbSP6DXzXEixJ+81SPt8gvYq3PfSlYx4kHnNi
         fJDg==
X-Gm-Message-State: ANoB5pmERRZ5vjnN/Ve20kMnirA4egjakGR4dzfO4VSuTrAQT/hdq9Ql
        G8KYfC8elmDc3V+kHvdS3W3QzbA83KQ=
X-Google-Smtp-Source: AA0mqf4o1iDbcLbVpPwWLY07E2c1JFPW5PyFLZdTxs9MHKJ/YwoO/ESEkz0Qu7qI65v8ACtMm5bCaA==
X-Received: by 2002:a17:902:f601:b0:186:8431:ece3 with SMTP id n1-20020a170902f60100b001868431ece3mr70883059plg.8.1670320290426;
        Tue, 06 Dec 2022 01:51:30 -0800 (PST)
Received: from debian.me (subs02-180-214-232-69.three.co.id. [180.214.232.69])
        by smtp.gmail.com with ESMTPSA id b15-20020a170902d50f00b00174f61a7d09sm12171161plg.247.2022.12.06.01.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 01:51:29 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
        id 49D20104553; Tue,  6 Dec 2022 16:51:27 +0700 (WIB)
Date:   Tue, 6 Dec 2022 16:51:27 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Robert Schlabbach <robert_s@gmx.net>
Subject: Re: [PATCH] media/frontend.h.rst.exceptions: add exceptions for new
 dvb defines
Message-ID: <Y48Qn58pF0Gm2evZ@debian.me>
References: <2bff9dd2-e4ef-1b10-e64e-3c62849eb3b0@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y79OFSX1vZHU7Ldk"
Content-Disposition: inline
In-Reply-To: <2bff9dd2-e4ef-1b10-e64e-3c62849eb3b0@xs4all.nl>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--y79OFSX1vZHU7Ldk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2022 at 02:33:45PM +0100, Hans Verkuil wrote:
> After some dvb/frontend.h additions, building the documentation
> gives lots of warnings. Add the missing pieces to
> frontend.h.rst.exceptions.
>=20

All warnings went away, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--y79OFSX1vZHU7Ldk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY48QnwAKCRD2uYlJVVFO
o4DHAP4pbGVRVUwKU8f6IyVgYryVXoIKjE92ujGWi/bMWG1lXwEAsEtlI+iuCkDY
pBG47Mq1cMY4F89SbEHSWZheWjfJ4As=
=zdvd
-----END PGP SIGNATURE-----

--y79OFSX1vZHU7Ldk--
