Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F03F76A162
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 21:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbjGaTkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 15:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbjGaTkc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 15:40:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E76199E
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 12:40:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 265E5612A3
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 19:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B911C433C8;
        Mon, 31 Jul 2023 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690832427;
        bh=cECi6X2ci0DniQ5oeatUmvY4BynKLN24yIpTW2oqPUI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pu9Dt3cSyPkYegGJ9c3RcGLOHMiyjYlxy/c+dwSkik3hsSr6ii0UfV6pPXMzZSw29
         fNPgqyOvrwfliVIKt5AJGy9mdsQbq2/YtSbIgqQrylUNJRxumy+84RfsQmE4Dw5kIF
         jE0dvSuBEn8+vMUiwPMxmECNCKPjy6HouNQ0BIEvdwkJur+8uYFtYjgVvSnIKWzQdM
         DDHosgDyhiqhIGv4zx2nbjuiMqJIOMvgMg3B1WrnybC49P4DpFjq9Uo8HNWIZo+caz
         wxxRfmO6DVmxgkHaE5PiQMgBuzVfh8Ofd2/8j1UG5oO7efcMiHxz3k5Js6tEMzyyfc
         PmqH1QqxTbzQg==
Date:   Mon, 31 Jul 2023 20:40:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     alsa-devel@alsa-project.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-media@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
Message-ID: <a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MD/Kb6s/g3sL17i7"
Content-Disposition: inline
In-Reply-To: <87h6pjj2ui.wl-tiwai@suse.de>
X-Cookie: Single tasking: Just Say No.
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--MD/Kb6s/g3sL17i7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 09:30:29PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > It really feels like we ought to rename, or add an alias for, the type
> > if we're going to start using it more widely - it's not helping to make
> > the code clearer.

> That was my very first impression, too, but I changed my mind after
> seeing the already used code.  An alias might work, either typedef or
> define genptr_t or such as sockptr_t.  But we'll need to copy the
> bunch of helper functions, too...

I would predict that if the type becomes more widely used that'll happen
eventually and the longer it's left the more work it'll be.

--MD/Kb6s/g3sL17i7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTIDiMACgkQJNaLcl1U
h9AUpgf+MRJ3Ppt4G8lH1I84wnMH5JXZKHV/vI1aV9xjjvXIKtZE/+CSYf6550C7
PPTHfzwnBYOTWVgfWpHzHkq4xz7gabS1iz+uA8zxlWUAANI55/958s9gfaUZuSaT
Iepv46KwktU7+VbRzRMDAmgONLI5mwne+8NxLW50eigUKQI9f+oP9W8xpmdP2d22
oGEIbn/BHmGWoQ6RPfY3HT2g3FVmr8i63MfkUTWDuJJ28/NrYttI78uMnxTIQ6sD
iGPaAtosS7XVd0iLf5CX4pxb+YoTNLQvC1dUX7PJ6bqZ5d140yXESPgyw3Lp8Q8l
WoEQ/BSZ7E+q6JpVPksvRB7XC1vkAA==
=VfqI
-----END PGP SIGNATURE-----

--MD/Kb6s/g3sL17i7--
