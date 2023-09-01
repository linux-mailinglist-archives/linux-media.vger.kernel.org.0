Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76C2578F90C
	for <lists+linux-media@lfdr.de>; Fri,  1 Sep 2023 09:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240756AbjIAHYW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Sep 2023 03:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjIAHYV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Sep 2023 03:24:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1547AE7F
        for <linux-media@vger.kernel.org>; Fri,  1 Sep 2023 00:24:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B200DB824D8
        for <linux-media@vger.kernel.org>; Fri,  1 Sep 2023 07:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0954BC433C7;
        Fri,  1 Sep 2023 07:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693553056;
        bh=L1wTGO7jcST49mJRih4AiWgjXlctehjJ8YrF0b66cfo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aKiKv3UuvoWrND6Q9hNgh0vuL76qM7PgLy0uf3Kv00KoxGKYJBccmdi4o3daQTzw9
         3AZfK1flAB6pUItNbJ2mlFHCIZKtts8FIg92fIqswVB1tQYOfAGVidwdLF6V2viCtD
         cuEzwFNO/yLNs0XYc7aKHChbnCtEDnrgmttWcroAhYCsRmrylVLHIkgaKXEBP8g/gc
         PZPKCGhCGCKNYmI8Xlj7NtxUFMiL7AI87amd/v4sgxniOXBhiC2kzkR+BEn0RGaFbz
         s0NSxDO4OlbtSs5QV0Ln3DsuQLS3DA4zJFf7K0UEjNHBCU4gBn1MT0LcwAUKd/dsJV
         7hUjIvTakllYA==
Date:   Fri, 1 Sep 2023 09:24:13 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 0/6] drm, cec and edid updates
Message-ID: <6i3idgngjlyez6y7zleqrt54r7f4c3urifgerizhzoarwdilv2@auwk3cedxv2t>
References: <cover.1692884619.git.jani.nikula@intel.com>
 <8734zzjb9v.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ozwshuq3yartaaha"
Content-Disposition: inline
In-Reply-To: <8734zzjb9v.fsf@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ozwshuq3yartaaha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 09:51:24PM +0300, Jani Nikula wrote:
> On Thu, 24 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > Avoid accessing the raw edid directly. Pre-parse the source physical
> > address during normal EDID parsing and use that for CEC.
> >
> > Jani Nikula (6):
> >   drm/edid: add drm_edid_is_digital()
> >   drm/i915/display: use drm_edid_is_digital()
> >   drm/edid: parse source physical address
> >   drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
> >   drm/i915/cec: switch to setting physical address directly
>=20
> Maarten, Maxime, Thomas, ack for merging patches 1, 3 and 4 via via
> drm-intel?

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--ozwshuq3yartaaha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPGRnQAKCRDj7w1vZxhR
xU6YAP9/nBLQqasjSUnmIaVto2eMtVCdC2AZTWBPZfFcDpMACwD6AzFIeDo+Xjmq
gWpTkk9mBoI9m/bg7ZeEVAREmFwxdg0=
=x7aT
-----END PGP SIGNATURE-----

--ozwshuq3yartaaha--
