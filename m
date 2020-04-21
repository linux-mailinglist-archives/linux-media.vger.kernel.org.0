Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D3C1B3177
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 22:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgDUUug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 16:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726024AbgDUUuf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 16:50:35 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84270C0610D5;
        Tue, 21 Apr 2020 13:50:35 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id r26so5102865wmh.0;
        Tue, 21 Apr 2020 13:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uC+JJcP7egb4ofyt56mWCPOQaPZzoY/zRGrMx1VckLM=;
        b=FkFdVjeAsI+sBX/CNG+E14M9Wefz00vmoLhXMLng0Ap6nH8pB6UffYXTYQL5++aSg8
         1J4eBj+8aLXpkleQA/S9tsKYWIMzYjGJfGkohBOp9wQlSI6ir+6G2CfCGUwK2pFyM9Vg
         qH+gpFlVm1n46sdu8KwoYXdztEQ57V4GqwxtHOTlXUG4fVpn4LiMDq2gK2TkLSaj6n2z
         7VQPzfKSn9mI575D8WlJ8FuOEufKPawD5R1AuLS4Q5efX9ikJTH6nMUZUl4Vl03aYeYo
         RK+QpVSSB6N4XO13Bk474pJx0aLVgmnHJJ/WWiN7a4H4Gm9gL2scxNg1DEmEqaUfOYky
         crQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uC+JJcP7egb4ofyt56mWCPOQaPZzoY/zRGrMx1VckLM=;
        b=th+u7MOrxtVJu1G4mW20S4RaG2VlRN0ttTlvsin7/Dunn6hm7sQjhlY+B+pHE0HhyI
         OY6MlGq4jR9x1co+9LkvQjQjlX+SurAWyGVIcezjROm+J9voDMBuFNWAODw8fnzNx7ji
         zPrPYfx6Y4uow5tJd2qZbTa3nPZrYcxBUPE5XRtqagf5lj9Z68e9tOFmqDLZZj/1cDln
         SGgQHDPB/Fb4cpkOHG+dtqaAprAjqTx5Bvwo5idBcopK8OSE/cNzbmgQAw2SbcEda2Zj
         LDUA3ORr/mP3gm8TNRu94BDn2i4uMl50UZxjavbkWmflfEbRu1nTPqaCB5o3fCCtsgWb
         oxFw==
X-Gm-Message-State: AGi0PuYhMzgzWPhYzWXuBGsQKANdG/eosXljB7bLXYaBTYGWb9YaMwwM
        kKTNDQlk7QwZlwWyMR7iTdw=
X-Google-Smtp-Source: APiQypK+Gc5H9oDn9XvZP6m0OhwPMUU+tvlw+9xBndDEnwmM0sL73yQu3958nQ99/SmyVzxN2KK85g==
X-Received: by 2002:a7b:c927:: with SMTP id h7mr6687203wml.122.1587502234234;
        Tue, 21 Apr 2020 13:50:34 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id y20sm5413891wra.79.2020.04.21.13.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 13:50:33 -0700 (PDT)
Date:   Tue, 21 Apr 2020 22:50:32 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com,
        frankc@nvidia.com, sakari.ailus@iki.fi, helen.koike@collabora.com,
        digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v8 0/9] Add Tegra driver for video capture
Message-ID: <20200421205032.GD3233341@ulmo>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
 <5c44beca-4016-6e4f-01bb-e38480bfc34b@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline
In-Reply-To: <5c44beca-4016-6e4f-01bb-e38480bfc34b@xs4all.nl>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 01:09:50PM +0200, Hans Verkuil wrote:
> Hi Sowjanya,
>=20
> On 21/04/2020 02:11, Sowjanya Komatineni wrote:
> > This series adds Tegra210 VI and CSI driver for built-in test pattern
> > generator (TPG) capture.
> >=20
> > Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
> > CSI port is one-to-one mapped to VI channel for video capture.
> >=20
> > This series has TPG support only where it creates hard media links
> > between CSI subdevice and VI video device without device graphs.
> >=20
> > v4l2-compliance results are available below the patch diff.
>=20
> I'm ready to merge this v8. Looking at the series I should only merge
> patches 6 and 7, all other patches go through different subsystems, right?

You could also pick up patch 5 because it adds the bindings that are
implemented by the driver in patch 6. But I can also pick that up into
the Tegra tree. In fact, I do have a set of patches to convert some
Tegra bindings to the new json-schema format and the host1x file is
among them. If I do get around to finish those up for v5.8 it might be
better for me to pick up patch 5 so that I can base my conversion patch
on top of that.

Either way is fine with me, so I've acked the three patches. Take which
ones you want and I'll pick up the rest.

Thanks again for your guidance on this patch set!

Thierry

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fXJcACgkQ3SOs138+
s6FBjg/9FimcqXOseP9+byIOz8utrw/aQW03bxfp+khGtSfVES8b9+2uyWnlc+IM
qW2Kc56/5wDuBs2nXSxzJAadqov9o5381zJiiacxwuW84/SHA2csj5UVz8ymb/Uw
/Sfmk6RDZUb6y+TK4SWzWpwJmsvElhnxAidTh1Q2yDs7nyvqmBC1itkZOLHXibRL
u5/V7VVeIpEiqIoluxlj5pS9o54KJRNZwDknrXbzkgEzOnYMH9cuGpMsqwdUbFAb
74dKbjgYMzKcdlf8jz0oo1MBYisCemp760JQnWeI/Grp26xgDPCwU9nmPaapmpMP
+yAYWCg6Nj51sdwiU1/EsTDVXlP3tUjGB2l5IxkepGKGyc7KydbX9+WUXD7b8m/P
39Olhf1/jswjtwBPgitwSEX66ZheWbNwIykJo6RiRnu9F1Vnc8aJPbnJMuxqERix
TqCN2cIKWPJNr9TGOnuHfADbsCNWUpFBIaRxgqM1hTmSYeoMTwgYRCDLkVbK6q58
LTdMKeYu3iS4QpW0VwQ1JBZwzM8EezsUO63THUXKn+HUj0SiLpTE+5S7OmQvYf1K
Yo2liZF7SC45LCPFY1UvlbU3/1k6QpDMLIF923iGBRk6NebcHrIqBaJTjaum08uq
M/tFejv+n6cXergSPcHXgy4/oPyzEUrCJEt/ZfjLuldZuV2ZeKw=
=qERF
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--
