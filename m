Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6568B79D636
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 18:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234937AbjILQ1H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Sep 2023 12:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbjILQ1G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Sep 2023 12:27:06 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E52F10E5
        for <linux-media@vger.kernel.org>; Tue, 12 Sep 2023 09:27:02 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-44e8f9f3cceso2345340137.1
        for <linux-media@vger.kernel.org>; Tue, 12 Sep 2023 09:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694536021; x=1695140821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pseX5mxL0XGzXErSRsw7i0t8QwNrs2tSMGIB1qfdxus=;
        b=RMfdOWrc44XJy4OGGhz9R9MjFJQL87EaWFfhnxGgUwlFTQHbjPyeVDhtQOXqKMiU5K
         M+lff2+vwdiqmAGWSu2QVAwUcAAB5sDyCd4eRvBgp9iqu5cPUYozJeZ4gY0Kj5u0Ie3+
         LpkK4eyuNHnLEqgQ/VnfHBeh6YZPFe+ggVrfyUnQIGR7/oHE/OKIHSDXNyWFmMQZ6Pd6
         wCrOtNjY400CXu8eQWpR95OeOD9ycdXOfacupDlS9cYK7NMUwd94dvL9ff4aFGWPIUXQ
         NRwivSUXydFSZuRMSy4gcS921oQVivfWFgxtVuDrA4j3V9WVd4RHAmMCAqp0wLzTvCRX
         GokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694536021; x=1695140821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pseX5mxL0XGzXErSRsw7i0t8QwNrs2tSMGIB1qfdxus=;
        b=LpU5J7HIHmgKd7rW3LlHdNmZOqvCTHdVTLj7l+7sxro3WjgZfTe4BA/3X9G1aaLSnV
         WBfi0JCX7/8wW4UBWUkuX3b+uWvhlTq7tlbI21oHMCmTowY5oLCLbLY3QMUt+cw9iuLm
         lu6HJsAPUXfEs/ekvvmD65XPAnqZiHGaTReW9Ew9RQsM9c9Q4ePp0YgQjphgwsjvR1oR
         5Fown3ZmRD9mOLFcCN2fgbrjInM4yZyYtljAJCndFZkAZO+duDdNSGdE1iyHqZ3uvLoe
         hv6siXVFjNopw+yyQ0HnUZDMISJha3S4Vgb8dzpTEuhjt20WaQKDC7TYsIGV4cVIUBOr
         oDmA==
X-Gm-Message-State: AOJu0YyWZtLYyDaJuxp7OSAA3ED57XV6tRRypnOzqMHFY4NKN26pgH1K
        MoxtnUZzWtSivxXrTpwMo+XzqQ==
X-Google-Smtp-Source: AGHT+IFDtSC5zf72fWLWq0KidTMLnnuiCSs2m6UzTaQRvRZ5DF8LMG6gf0LjN9NM/ZzZ9GASPC7izA==
X-Received: by 2002:a67:ce12:0:b0:44e:b30a:c0da with SMTP id s18-20020a67ce12000000b0044eb30ac0damr11417266vsl.26.1694536021760;
        Tue, 12 Sep 2023 09:27:01 -0700 (PDT)
Received: from fedora (072-189-067-006.res.spectrum.com. [72.189.67.6])
        by smtp.gmail.com with ESMTPSA id r17-20020a67c311000000b0044e97414232sm1719149vsj.33.2023.09.12.09.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 09:27:00 -0700 (PDT)
Date:   Tue, 12 Sep 2023 12:26:58 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Patrick Whewell <patrick.whewell@sightlineapplications.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: venus: Fix firmware path for resources
Message-ID: <ZQCRUkR9brqK0Fn7@fedora>
References: <6afa314b-ca5e-a924-de2f-f1db90770623@linaro.org>
 <20230719214943.22641-1-patrick.whewell@sightlineapplications.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MJaqVacy1OGcgh3o"
Content-Disposition: inline
In-Reply-To: <20230719214943.22641-1-patrick.whewell@sightlineapplications.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--MJaqVacy1OGcgh3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 02:49:42PM -0700, Patrick Whewell wrote:
> The firmware path for some of the resources is still the old format. This
> fixes the path to address the firmware correctly using the new .mbn
> format.
>=20
> Signed-off-by: Patrick Whewell <patrick.whewell@sightlineapplications.com>
> ---
> I've updated all .fwname to match the .mbn format. There is a
> qcom/venus-4.4/venus.mdt for the sdm660 that still remains but the linux-=
firmware
> package does not contain that firmware file anymore, so i left as is.

I noticed this patch hasn't been picked up yet. Is there anything
pending left for approval, or can it be merged now?

William Breathitt Gray

--MJaqVacy1OGcgh3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZQCRUgAKCRC1SFbKvhIj
K2p6AQC+12yl4i8rRO64p9Haennv4cMxjYHP55D91KkhvyLLtwD/VzljGXG7tbUY
qKV12MX45Zui13uOcezWMP2zCjewdQM=
=jLan
-----END PGP SIGNATURE-----

--MJaqVacy1OGcgh3o--
