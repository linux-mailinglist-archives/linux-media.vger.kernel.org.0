Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBECE34241
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 10:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfFDIzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 04:55:08 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:34821 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfFDIzH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 04:55:07 -0400
Received: by mail-wm1-f41.google.com with SMTP id c6so10880604wml.0
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 01:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=An2wjOXkM4btO7VgtTiSSbDZiYE6CbUrMKVp5TFzFXI=;
        b=SS9bIt54pSpN/LuQT8GMvKeEPqmuD+GVgpv2q0vh3vGEGNGkEIH2H/Ub4aEatvKBy4
         EXa52HjVef0mgZ8VXDl4wSBr/2EQreIgrzUFybxU9+5VaN7A7FBzrKQwn239e9cqBZ6b
         ANMqVDE22HyoTWuCtWWbBHiIBnXzrNgwGvjbJbHuV2qQuTyL7leQKqWq+l34TWYrrQeX
         TqjQMja5AQ6MCLvAdqeszMvtjWWava7J11J9yk/jQ4Egq15RYmCPkmKBsoOn9dfouPAS
         81/3jZZN1Ix3c2iXuR8vpe8bhdbS4xv8T0+K5alG+ehXsi7g1yN0C15fNgPfbD38hw+q
         94aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=An2wjOXkM4btO7VgtTiSSbDZiYE6CbUrMKVp5TFzFXI=;
        b=Ruv5oxRzPDQVvSPwbb/dr2k+TCd/MSr/A9ys4mdDJGDT+XX0KEHQ+F0S7YqjeEU1zc
         XbQL9af0aUdL4tFzGAfjiJajxhifbh9d151KCT7tjlzqxw9MV2+UKR4IfWeaAb1mIz/F
         XxspBTf3AOjfZaNdybYU5p6gGcgW9huTzo7yJb05mjOJRiHNWf35pMXLRXEdCLW9+g+5
         APwTz/ctKHFuTFWbBKFIi6rsoFzUZPInYAqlMBzxYVaex0PMAPxDcqPoVQ31g2N0L+kA
         71Q7uFelm96hYChEkA1+uyVslrE6xa3uvI6DvqwV2kMCncQqkNDJVhV6k0qY1i/jPups
         J/2w==
X-Gm-Message-State: APjAAAVR9EBktL/gq31F79gqsPliWfC+Zzkm1S0wVJcjosFxI6x+oc0n
        RIoEUoQF9iu6gAe44H+qzLk=
X-Google-Smtp-Source: APXvYqxea5LQqNpUCcWzMGGAoWNFNSLxvWpSJq7fvboPnzFH3u8S8AJsVVjui3Ti+gUop2g5mPT2Tg==
X-Received: by 2002:a1c:b684:: with SMTP id g126mr8394075wmf.176.1559638505450;
        Tue, 04 Jun 2019 01:55:05 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id b5sm12880219wrx.22.2019.06.04.01.55.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 01:55:04 -0700 (PDT)
Date:   Tue, 4 Jun 2019 10:55:03 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190604085503.GE9048@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <20190603112449.GA30132@ulmo>
 <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n+lFg1Zro7sl44OB"
Content-Disposition: inline
In-Reply-To: <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--n+lFg1Zro7sl44OB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 03, 2019 at 02:52:44PM -0400, Nicolas Dufresne wrote:
[...]
> There is one thing that come up though, if we enable per-frame decoding
> on top of per-slice decoder (like Cedrus), won't we force userspace to
> always compute l0/l1 even though the HW might be handling that ? Shall
> we instead pass the modification list and implement the non-parsing
> bits of applying the modifications in the kernel ?

Applying the modifications is a standard procedure, right? If it's
completely driver-agnostic, it sounds to me like the right place to
perform the operation is in userspace.

Thierry

--n+lFg1Zro7sl44OB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2MecACgkQ3SOs138+
s6EJUQ/+NmylTUHOdXYtOCqzgVrfsN2/ImlMWGz982Jk3sKtfnUHW7WuChN/ktwE
GQ+mTdkfTN8cr08b1yGsGlZKRv4RMIzIcEPXWPNLpifj2xE9KyoENhch0C23TG14
6Epk+KaMQIB1OMNHIES2PrWPKo//643vF/5+cHw8dGDKtmbASHxQlUdQ4UrxlR07
OccC8AFHGsTYSg5znEIbLfXnIxq+ZXBQI9bQxkQYBQQTPV2wNRfwCNMHdjRS4Pjq
c7VJXK+GyaJqmODQSDIXsOXrdHMDtuCFmOsZXiFXnIZLJn9z1TAMJvjPc3TM6yLb
b6wnFAHNDu31zfh+BaXJ0LqBxvqQbL4GV2OITnirJrHPwSl7nfE+oByPSpHs59VZ
qAOmlAyoEaGGNzuhjQujWiGh9P3IxFnit/ZkPo83HPir8krUuHEPAXtwbftPA0qw
tVsgx4V0eUL1l+l4QsbfigIIjKbAxCwBruEk9YppmGdsU2oPBdEv/srup+7bMki8
tmWBVPxLkvRXClJyOs1NleOfFxrjQj6tDywlTyPSveaBL86DZxtUmIpP6W4Orxmt
zJox3n7lv9kHmk2uxU2w6fjKKPoXm7lO4o4d18VOtJYw4O6b/YnbExieIJuov72L
KxMtnuYad0J4Rz5APr9aNjeM8V21SaiXMwKMrALMB7awwqAEQTI=
=xYKl
-----END PGP SIGNATURE-----

--n+lFg1Zro7sl44OB--
