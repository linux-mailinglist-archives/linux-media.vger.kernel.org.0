Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5C3531507
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 21:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfEaTBJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 15:01:09 -0400
Received: from mail-qk1-f178.google.com ([209.85.222.178]:38661 "EHLO
        mail-qk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfEaTBJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 15:01:09 -0400
Received: by mail-qk1-f178.google.com with SMTP id a27so6989691qkk.5
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 12:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=h1Vb0ZBkEXSAEKlJj+A7s/WBWtJrzHfFRTZkfYAjP4s=;
        b=J0+bblV3uggvXnJsp51yOx4YPg1j7uj3XJun5+aocXeVzjS2wy+3/xaNbU2EDbTPvF
         RsmNbM5p7WXq6sP6nP9Ddm9LZ5N8B1z8H+h4TLd7WbckbnDgI84+t4Y4k4wXtbOXeb4L
         gsFxl4ZakXoNw9vVKM2h1JvtmrIOlaYmCqF33JyCg9mnozggGCLrwrTxJThcPYGNryOq
         m4rKDluRvPV5cc9H17jThBpprSui1bzwG2Q/IdSxsw63t59WTH5RhWM7dWmnFF76SIeV
         w7J5+XCRqmBYTUp7LWBN/2m7z9UIuBvgMrAKtAnUJKDMdtobUWOM0itwr96un+MK5BNt
         BUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=h1Vb0ZBkEXSAEKlJj+A7s/WBWtJrzHfFRTZkfYAjP4s=;
        b=osdhyBxSmxCtqsyJ/w3EevtwBnVLakjMlhxQLwnxnRxRnwmHR+VvPS5pKnrYAw1TY2
         Nfqta6GlVuuZxwvbUPCUDUl0VhK8pGtXTZFJfeWK8rDaomfqOKpRaDfOoRI8cUYVauRS
         HOXwkscIxFk85oBzwDVHX8JUY0J85WVaSEEMrxMtEO/HSeVNYcfXFHx6yNoRg0bqGsk/
         h+QpsGcNeKaXO1Xdjxei/U/V7mWw621owyLVq9PDMz206p1m1+2qnZmt/7GoRKgxnoP0
         9LGVaI4On2EvLjHkC2zNOC8IeAIcsEJy7f6Ti4cqiYh5721koJOE05uMHy+IpYq7cAb2
         AUrg==
X-Gm-Message-State: APjAAAXcyYOZKtXgDtr5gJATKzzwTeN3dxrXZwaxCn1O8tv41WZPFngZ
        LKYIHbIyc+0xukqP6HsYEYEqxToASGk=
X-Google-Smtp-Source: APXvYqw/NviMAxzj70QZPanW/N1z6EOkbxkG/x9YibWRJTD/2oJZcekmdv+RuqQCIfyoHzmSEt7mzw==
X-Received: by 2002:a37:a10b:: with SMTP id k11mr10405307qke.76.1559329268495;
        Fri, 31 May 2019 12:01:08 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id k54sm4766496qtk.54.2019.05.31.12.01.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 31 May 2019 12:01:07 -0700 (PDT)
Message-ID: <fd13ba000e24d15f4016cc89970766253e334d6f.camel@ndufresne.ca>
Subject: Re: [ANN] Patchwork version upgrade
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org
Date:   Fri, 31 May 2019 15:01:06 -0400
In-Reply-To: <20190531124050.3f06e1b8@coco.lan>
References: <20190531124050.3f06e1b8@coco.lan>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-X/blYjR0JMxHSTie7ZIa"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-X/blYjR0JMxHSTie7ZIa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 31 mai 2019 =C3=A0 12:40 -0300, Mauro Carvalho Chehab a =C3=A9c=
rit :
> Hi all,
>=20
> For a long time, we were running an old Patchwork version. The thing is t=
hat
> we had applied some patches on the top of it, and the upgrade was not
> trivial.
>=20
> Today, we upgraded it to its latest stable version. Just like before,
> you can access it via:
>=20
> 	https://patchwork.linuxtv.org
>=20
> As this is a new version, please report if you find any issues on it.

Actually I went a little into it, the black and white alternance for
lines clearly does not work. Any reason not to stick with the default
CSS for the content ?=20

An example that is readable:
https://patchwork.kernel.org/project/dri-devel/list/

regards,
Nicolas

--=-X/blYjR0JMxHSTie7ZIa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPF58gAKCRBxUwItrAao
HG0wAKDGbY/tru2x8BxZaBBSJEwCj5jykwCgiyNUlQ6si8I95Ltm4H27EfjnZNQ=
=A6iH
-----END PGP SIGNATURE-----

--=-X/blYjR0JMxHSTie7ZIa--

