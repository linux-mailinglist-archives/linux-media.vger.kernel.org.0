Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF2BF4D03BD
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 17:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235257AbiCGQNC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 11:13:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244024AbiCGQMv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 11:12:51 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE4138BF4
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 08:11:55 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id o6so21189194ljp.3
        for <linux-media@vger.kernel.org>; Mon, 07 Mar 2022 08:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=sPD6de/4VBf5whu30hRBlFiSVI37I6HPJSrPyVSC4Vo=;
        b=lgb2C9P2UJt2fOMBIJVHmiH7O5gH96M75M+A/pmlwGT7Ksfjk6dtv9QA4b87zgEARi
         WmRv65UxWRvgeTbDo4j6hvFWISgLkpueaw/kZNka/cr7RlSe2O5rqF/TzKB+PXVv8CkD
         9QPrpNx25KULP41YQCZIuPHiXF+Nqt6ty4dnelwjFW/ribFuD3jEDN4ml4YVDEgBFA7n
         mSiOT73qwG98lRnPaiVUR1wVP74ixHELKJclSD4G5g+4vX2AOVBrBHwKs86ykhPgjS3N
         VDq5a/4ymByG2CkCEBl/kdxnuuMzStdYbEj0VJtSmc28SHtD+zCWzCv4AuGJ72mL0Prc
         n0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=sPD6de/4VBf5whu30hRBlFiSVI37I6HPJSrPyVSC4Vo=;
        b=lqrV8zjVrnMgx1lkN3l6NNody9FOCWRC9NYBAMcmV+I14RUelzWDXGQOA0YJEviA+l
         e9bSkBx/mMi841vL6pqIag/GZjcrgYF5ojxxR31lV4Y/4etF+7+LmZEGm6Od9uzmA8S5
         EOjUkCYaPM7HGahYHRtPfx0eUpHyGZwoYcME8Za6kLYau3Nt3xA8jPAdfbQa+ya9CoP8
         /BYEPFhkf0pv34CnYNI9S/0UAZNyN1lkWxsd0ud8hDnq2OnaU5z3wTV+PqgFle0dtG4O
         R/Qm7N67FG/BjagnFqizs+XL4XLOIGmAUKR53AFYYzJGk+qBtZAv5W4v2Fpi5D72bH0h
         cUsw==
X-Gm-Message-State: AOAM533tbO0lDsN8UWziyb2Wd9bXeTSR22+Lev3xMWfRJ4Y5k0hSsbon
        +3FahEH9W7Pscclp7JrBnl0=
X-Google-Smtp-Source: ABdhPJxSykseRwLSkRy10PYwQaVlAtqgnO1MR7RoJ5kXhuTGA9+UY5JNKQCmMIxalEQ5H/GvH6PGsg==
X-Received: by 2002:a2e:3c0b:0:b0:245:f5f8:3f4a with SMTP id j11-20020a2e3c0b000000b00245f5f83f4amr7966866lja.483.1646669511690;
        Mon, 07 Mar 2022 08:11:51 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id o15-20020a2e730f000000b00247eae1ebe7sm534599ljc.75.2022.03.07.08.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 08:11:51 -0800 (PST)
Date:   Mon, 7 Mar 2022 18:11:48 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Shashank Sharma <contactshashanksharma@gmail.com>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        Shashank Sharma <shashank.sharma@amd.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 2/3] edid-decode: Introduce libedid-decode APIs
Message-ID: <20220307181148.06dad1b1@eldfell>
In-Reply-To: <20220304125001.1732057-2-contactshashanksharma@gmail.com>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
        <20220304125001.1732057-2-contactshashanksharma@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/spyuBO9is=Ne0i2I461TyYG";
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

--Sig_/spyuBO9is=Ne0i2I461TyYG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri,  4 Mar 2022 13:50:00 +0100
Shashank Sharma <contactshashanksharma@gmail.com> wrote:

> From: Shashank Sharma <shashank.sharma@amd.com>
>=20
> This patch adds a shared library wrapper for edid-decode
> tool. With this library acting as an interface, other Linux
> processes would also be able to analyze their EDIDs using the
> core logic of edid-decode tools.
>=20
> This would be particularly useful for applications like a Compositor
> who wants to extract the information from an EDID, but doesn't
> want to add tons of code to do that.
>=20
> The initial version of the library APIs are basic and fundamental to
> understand the response of the community. The long term plan is to
> introduce more capable APIs which can:
> - extract color correction and colorspace capabilities of the display
>   from their respective CTA-861 blocks.
> - extract advance information like static and dynamic HDR capabilities,
>   YCBCR 4:2:0 support, color depth and bpc, max pixel clocks for
>   HDMI 2.0, 2.1 etc.
>=20
> This infomration will help a display manager or compositor to take
> several decisions related to display states and modeset.
>=20
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Shashank Sharma <contactshashanksharma@gmail.com>
> ---
>  libedid-decode-api.cpp | 174 +++++++++++++++++++++++++++++++++++++++++
>  libedid-decode-api.h   |  27 +++++++

You forgot to add the header in the Makefile as a dependency.


>  2 files changed, 201 insertions(+)
>  create mode 100644 libedid-decode-api.cpp
>  create mode 100644 libedid-decode-api.h
>=20
> diff --git a/libedid-decode-api.cpp b/libedid-decode-api.cpp
> new file mode 100644
> index 0000000..ce06ba6
> --- /dev/null
> +++ b/libedid-decode-api.cpp
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Author: Shashank Sharma <contactshashanksharma@gmail.com>
> + */
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +#include "libedid-decode-api.h"
> +
> +extern struct edid_state *extract_edid_state(int fd, FILE *error);
> +
> +/*
> + * This is the init function for the API, a user must call
> + * this function with the EDID file node, to extract the edid
> + * into a state, and then call the rest of the APIs with that state
> + * to extract information about EDID.
> + */
> +struct edid_state *libedid_parse_edid(const char *edid_path)
> +{
> +    int edid_fd, ret;
> +    struct edid_state *estate;
> +
> +    if (!edid_path) {
> +        printf("No EDID path provided\n");
> +        return NULL;
> +    }
> +
> +    /* Expecting path to a connector's EDID file like /sys/class/drm/...=
./edid */
> +    edid_fd =3D open(edid_path, O_RDONLY);
> +    if (edid_fd < 0) {
> +        printf("Failed to open fd at path %s\n", edid_path);
> +        return NULL;
> +    }
> +
> +    /* Extract the infomrmation from edid node and prepare it's state */
> +    estate =3D extract_edid_state(edid_fd, stderr);
> +    if (!estate) {
> +        printf("Failed to extract EDID\n");
> +        return NULL;
> +    }
> +    printf("EDID extracted\n");
> +
> +    /* Now parse edid blocks */
> +    ret =3D estate->parse_edid();
> +    if (ret < 0) {
> +        printf("Error parsing edid, err=3D%d \n", ret);
> +        estate =3D NULL;
> +    }
> +
> +    close(edid_fd);
> +    return estate;
> +}
> +
> +int libedid_num_blks(struct edid_state *estate)
> +{
> +    if (estate)
> +        return estate->num_blocks;
> +
> +    printf("EDID state not initialized\n");
> +    return -1;

Can you not simply document and require that 'estate' must be a valid
pointer created with libedid_parse_edid()?

A library probably should not printf() anything. I was just discussing
how libinput has a context object that you have to pass to every
function, but in libedid-decode case that context object might as well
be 'estate'. If there is a reason to log messages, the context object
carries callback hooks that the user can set.

A context object is also the place to put all the variables that would
otherwise need to be global. Global variables are not good for
libraries. Then again, I would not expect a EDID parsing library to
need any global data, and very few context data. Logging functions at
most.

> +}
> +
> +int libedid_has_cta_blks(struct edid_state *estate)
> +{
> +    if (estate)
> +        return estate->has_cta;
> +
> +    printf("EDID state not initialized\n");
> +    return -1;
> +}
> +
> +unsigned int libedid_get_max_hfreq_hz(struct edid_state *estate)
> +{
> +    if (estate)
> +        return estate->max_hor_freq_hz;
> +
> +    printf("EDID state not initialized\n");
> +    return 0;
> +}
> +
> +unsigned int libedid_get_max_vfreq_hz(struct edid_state *estate)
> +{
> +    if (estate)
> +        return estate->max_vert_freq_hz;
> +
> +    printf("EDID state not initialized\n");
> +    return 0;
> +}
> +
> +unsigned int libedid_get_max_pclk_khz(struct edid_state *estate)
> +{
> +    if (estate)
> +        return estate->max_pixclk_khz;
> +
> +    printf("EDID state not initialized\n");
> +    return 0;
> +}
> +
> +int libedid_get_edid_version_minor(struct edid_state *estate)
> +{
> +    if (estate)
> +        return estate->base.edid_minor;
> +
> +    printf("EDID state not initialized\n");
> +    return -1;
> +}
> +
> +int libedid_get_edid_get_num_dtd(struct edid_state *estate)
> +{
> +    if (estate)
> +        return estate->base.dtd_cnt;
> +
> +    printf("EDID state not initialized\n");
> +    return -1;
> +}
> +
> +int libedid_if_preferred_mode_native(struct edid_state *estate)
> +{
> +    if (estate)
> +        return estate->base.preferred_is_also_native;
> +
> +    printf("EDID state not initialized\n");
> +    return -1;
> +}
> +
> +int libedid_get_max_display_w_h_mm(struct edid_state *estate, int *wmm, =
int *hmm)
> +{
> +    if (estate && hmm && wmm) {
> +        *hmm =3D estate->base.max_display_height_mm;
> +        *wmm =3D estate->base.max_display_width_mm;
> +        return 0;
> +    }
> +
> +    printf("EDID state not initialized\n");
> +    return -1;
> +}
> +
> +int libedid_ctablk_has_hdmi(struct edid_state *estate)
> +{
> +    if (estate)
> +        return estate->cta.has_hdmi;
> +
> +    printf("EDID state not initialized\n");
> +    return -1;
> +}
> +
> +int libedid_ctablk_has_vcdb(struct edid_state *estate)
> +{
> +    if (estate)
> +        return estate->cta.has_vcdb;
> +
> +    printf("EDID state not initialized\n");
> +    return -1;
> +}
> +
> +int libedid_ctablk_has_hfvsdb(struct edid_state *estate)
> +{
> +    if (estate)
> +        return estate->cta.have_hf_vsdb;
> +
> +    printf("EDID state not initialized\n");
> +    return -1;
> +}
> +
> +unsigned int libedid_ctablk_supported_hdmi_vics(struct edid_state *estat=
e)
> +{
> +    if (estate)
> +        return estate->cta.supported_hdmi_vic_codes;
> +
> +    printf("EDID state not initialized\n");
> +    return -1;
> +}
> \ No newline at end of file
> diff --git a/libedid-decode-api.h b/libedid-decode-api.h
> new file mode 100644
> index 0000000..742b4a4
> --- /dev/null
> +++ b/libedid-decode-api.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT
> + *
> + * Author: Shashank Sharma <contactshashanksharma@gmail.com>
> + */
> +
> +#ifndef __LIBEDID_DECODE_API_H_
> +#define __LIBEDID_DECODE_API_H_
> +
> +#include "edid-decode.h"

You cannot include edid-decode.h in this intended-for-public header for
a couple of reasons:

- It is C++, while the library API/ABI needs to be C.
- You probably do not want to expose all those details as library ABI.

All the below should be declared inside an extern "C" block when
compiling as C++.

The most important bit is to document all the public functions so we
can understand how you expect the API to be used.

Would it be possible to use bool from stdbool.h?

> +
> +struct edid_state *libedid_parse_edid(const char *edid_path);

KMS clients get the raw bytes array from the kernel. Wayland
compositors would have no use for loading a file path, nor do they have
an fd pointing to the EDID data.

(const void *edid_data, size_t len) would be a more usable signature.

> +int libedid_num_blks(struct edid_state *estate);
> +int libedid_has_cta_blks(struct edid_state *estate);

How are these supposed to be used?

Do you expect the user to poke into struct edid_state internals?
If you don't, then 'struct edid_state' should be an opaque type. Right
now it's not opaque.

> +int libedid_get_edid_version_minor(struct edid_state *estate);
> +int libedid_get_edid_get_num_dtd(struct edid_state *estate);
> +int libedid_if_preferred_mode_native(struct edid_state *estate);
> +int libedid_get_max_display_w_h_mm(struct edid_state *estate, int *wmm, =
int *hmm);
> +int libedid_ctablk_has_hdmi(struct edid_state *estate);
> +int libedid_ctablk_has_vcdb(struct edid_state *estate);
> +int libedid_ctablk_has_hfvsdb(struct edid_state *estate);
> +
> +unsigned int libedid_get_max_pclk_khz(struct edid_state *estate);
> +unsigned int libedid_get_max_hfreq_hz(struct edid_state *estate);
> +unsigned int libedid_get_max_vfreq_hz(struct edid_state *estate);
> +unsigned int libedid_ctablk_supported_hdmi_vics(struct edid_state *estat=
e);
> +
> +#endif

Getters are fine, but maybe some of them could be grouped like the max
display width&height mm are. However, for each getter you have to ask:
how would the caller use the returned value? If there is no clear idea
of that, then the getter is not yet needed.

Some immediately useful getters would be for monitor make, model and
serial. If some of those fields could have multiple different source
blocks in EDID, then this would also be a nice demonstration of the
low-level vs. high-level API. In low-level API one might ask if a
certain block exists, and if so, access its fields. High-level API just
checks all the places and returns the most accurate information
available when the caller does not care where it comes from.

How do I destroy the struct edid_state I created?


Thanks,
pq

--Sig_/spyuBO9is=Ne0i2I461TyYG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmImLsQACgkQI1/ltBGq
qqcoDxAAgzdiJj+qoveXiTLlhTqZDmq9lLlFYvZ2ATVfxJYttlfL8XECaxcCCKTb
C1e49aaPT4tQHKD5oRCZUsJx38of7qxRGuB9UZPFxu/MW6SuVH1RHVyNV+G1X0hx
ARipe+9GXqhwZ10NbN0DlV5ystu8aGrni+Um7GmuMDIYOGQUKxUKkRreRF6Yb5hu
1JLOklqzd57VZPSAGOjLeCfc6gcP7HX8BwOlAdt+mdKrqdbBQ9bKT5wuz4/o9Hs3
fLEbq41huXXtJK/cBLG/53wJ1rec9rpZDEhd7V6Z/wPom8v33L7XNWochAw1+lza
NLNXTsRSjFX3fz3idWwdaxas+kPIS4hax3kgNM7YCaCnEEjfycG/+oKABK2cjOze
9g0RX/fQcxY9oW2ML4pgyTUpVPfjtgY3TJ6V1MTiwasSSLvoeSIOFr6Jr+CiP+TK
4uHRiSZSHMEmvULu5PA3obgq7LdREqVQDX72acRyJtL0GeirnGFgSBwK6koepMK6
eX08Q8D4gnlJijOyMc6qSVbdO8L4iE43SjbFZnNhiuJQ1yoxQAfolDIeA8kj5+G7
KddP3z6f7EvWbm2XQDkpgK97CzzyB0VuBwoNmR9ETx1u0Dth1J8r6N1sJDdwuDMV
rupT65NWBOmAwjpVxdDj+oxVM/XpfN2xRvOUzKeXhhgnU+RPCRk=
=QRWR
-----END PGP SIGNATURE-----

--Sig_/spyuBO9is=Ne0i2I461TyYG--
