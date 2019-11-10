Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1D6F6989
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 16:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfKJPF4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 10:05:56 -0500
Received: from sauhun.de ([88.99.104.3]:58846 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726402AbfKJPF4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 10:05:56 -0500
Received: from localhost (p54B3382A.dip0.t-ipconnect.de [84.179.56.42])
        by pokefinder.org (Postfix) with ESMTPSA id BFF662C0114;
        Sun, 10 Nov 2019 16:05:53 +0100 (CET)
Date:   Sun, 10 Nov 2019 16:05:53 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Seeking help for getting rid of i2c_clients_command()
Message-ID: <20191110150553.GA8040@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

I know it is 13 years since you wrote that code:

ba8fc39954bf ("V4L/DVB (4270): Add tda9887-specific tuner configuration")

There, you added i2c_clients_command() which looks today like this:

	i2c_clients_command(priv->i2c_props.adap, TUNER_SET_CONFIG,
			    &tda9887_cfg);

Now, I would like to get rid of the i2c_clients_command() API, and this
is the one remaining user. While trying to convert it into a local
function, I started wondering why i2c_clients_command() is used at all.
Why do we need to try all devices on the bus? A few lines later we have:

	tuner_i2c_xfer_send(&priv->i2c_props, buffer, 4);

so i2c_props.addr seems to have a valid address? Or are there multiple
tuners on that bus? Can you kindly shed some light on this?

Thank you!

   Wolfram


--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3IJ0gACgkQFA3kzBSg
KbbkoA//Y3W2y44Y6A9JuOK3eNBeSlPsh3Ulr7CYd7xLcCpPI+x+TrMhTuXErf/v
yUP3Nb+6QT3S/wXKfSxF055l3Ija2ZYN5jkFQ2pSxZmD031dBpFUuzjIOMI7DyHS
/j2cCtf7RD+9BXiq9Ygd8AqsNAVqTk86KOrysXYaJYPf6A1ilmgxSPDDvX6B8jBC
jNztxiopOvXaVuThHm36CTFgdj1otQTQ+k2BHATauj/Z/AfmZJFhyL1oPzPswJq4
iZU68K2qo2PyDR5s1R8FlumnDVGZTydVo/gvk6sLKbpRk83Ck+bBqzQTwzpWIX5o
yFkSBgXdr1VuM42OBO6cJnFfrs5pvGI3pAiCN6UYWe7rX+TaCUWHr8kmCtbKu+9h
JLnXJqOV6HLGIhvmE1lJLRM2lo/YHnXA39Tr3SzEN93BbDLRejwLwwEt5lSnVRqa
suFjURjsBwNE3sHe5bkTnlV7O8dlorNl2ugDJF95PSQ0Er0HSsa6oQN0Ky5hVp8N
XEAB9huPPwXIcuBP+qdSJLDsdgrirRN5iyyLTsD1VdLqO2OOOxUIu3aKfZp6Ni4L
h82GxZMy6x0zIVRd9Jc+d39La1TpwNuvnCkHK40IQSlKN8+j9SQxbndIqEyvwrdm
V3vD9YslsPC3YOGpsDmTBox/WgEJfwlYpvc5y7+RHU3v9cU7NcE=
=eJGv
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
