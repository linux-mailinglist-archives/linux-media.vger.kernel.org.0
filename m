Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69C5276B6BC
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 16:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbjHAOFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 10:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234477AbjHAOEz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 10:04:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA732735
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 07:04:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4BFBB615C9
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 14:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7D0C433C7;
        Tue,  1 Aug 2023 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690898681;
        bh=lI3n00luUKNfopH9HotLexiOPOuMEZpaKLOmB06ooZc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OEIpwVYkDq+meyS+F0NrjUec5s/e0v8SK2Iox7Y/zdkxJGa9HYCY+Qqv7P4WEfWkA
         kAoMlWAh+2te7rC1NLxY/R2kSiuXFh8wAvmYJibLgpADDbLlPyB16g5LTBMwjlEn1a
         G7PJjbM8fcOMRLDsi16jWNwGtrtbOMeTtKdLWHh8mu10k+SjrM2XtaV5pAZ4wWEZs7
         c9odn6bRGk8znCKs/8LH6xAP+wHnp1AXA5K2jOPPBq43w9OqfSl9oJB/cc8ZMmTL21
         1GOld3yySZ0K5npTLbN0VCfgXuNIqRPpImE/uS3azcZEP9z1QH5rL1s+UctXocUCsK
         NCSFJqIkD2kfQ==
Date:   Tue, 1 Aug 2023 15:04:34 +0100
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
Message-ID: <f4cee7c8-4399-41b2-bb3f-5d5dcac37ca8@sirena.org.uk>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
 <a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
 <87leeugbxm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VsD3ApJSux4lzU26"
Content-Disposition: inline
In-Reply-To: <87leeugbxm.wl-tiwai@suse.de>
X-Cookie: I thought YOU silenced the guard!
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--VsD3ApJSux4lzU26
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 01, 2023 at 02:54:45PM +0200, Takashi Iwai wrote:

> That's true.  The question is how more widely it'll be used, then.

Indeed.

> Is something like below what you had in mind, too?

Yes, or Andy's suggestion of just copying without trying to put a
redirect in works for me too.  I imagine there might be some
bikeshedding of the name, your proposal seems fine to me.

--VsD3ApJSux4lzU26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTJEPIACgkQJNaLcl1U
h9A8iAf/VmHGSowoYOko6J42O7KZJk6ZjskuMxi0WOqbX1goKvceOkJwETo8Cfzm
MrLOBWuTXcN5avbnlMHgH9HUEXcDXBFq+IUj/thURpKG+qdVrdqIwhKMzUcobR5T
DwqVPa45MfFzLxWBZwtl1nYXit0CAgTpar2lRq9GCWfHv3dwMGLNmvI67USOGHN0
3F8lmVRbVBzlZwOU+CTq+VBey5YGevoARVwdbbjdCnZwGYFWsO8OSRX+L207+mGa
LUEf7DHkkhqnQn8YNjYJmQD9al7Yp1DWBPA9P33bVWXXD22WlsbTDX5ofbJUOVrx
roVhdFa8eRp+iqemnmwT0/1rr0LHoA==
=qtD0
-----END PGP SIGNATURE-----

--VsD3ApJSux4lzU26--
