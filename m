Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97D24D31F8
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 16:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233934AbiCIPnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 10:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbiCIPmw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 10:42:52 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B68177777
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 07:41:52 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id z11so4400075lfh.13
        for <linux-media@vger.kernel.org>; Wed, 09 Mar 2022 07:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=Fe2/CCyHJaTz6zPBpvs9zCKj+Mb5tSmF8nByrtG8Ao0=;
        b=Y/IFjnhYqmTz8MstYvYt/ksD/dIjSsoRhlkiSeSK1ac7vvvjmyeWGYdj41M823Pw8A
         5dwmjN1SQNVwMaEpGuZ/UQLq2D2N0WNZj3MihINLMD0CiTO3YwssMKYSCgkHhUyl5TKs
         esr18pA+lVuIA+HtUT0j8Zx4c3pPVrzuyZXjoKrIEyKs/K7aaQ2xtHsH2BrJJsddTIDF
         6bVLvwZ/GiBUXlZGJi0CxxmS/BdltkvBI609Rmv19muDhXfm5+hEoUkH4xrfnrhDhMK9
         hdZdwWi8419R8OBgE5ZWsc0CwWyunPj/3NywGMmtIZ9q6+7sLYBNp3WqbKg0ydMCfZaE
         xX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=Fe2/CCyHJaTz6zPBpvs9zCKj+Mb5tSmF8nByrtG8Ao0=;
        b=4drRbTTjZ9HCtwoWp34wg4Sv+I0G2/dWigVSETI2bYHGQq7A2gWdsbKzDmk6iSn8RG
         2DEsRHzmC7zIc+u8CIzsL48M72A+O1T3ndzZ8OJt7hg93T1xc46phO32DX7Mk8uZm+kw
         MNb+xl1V712a+2Q7eipmMUKZ2fKbw4IQkcBtGpZMO2O1Af4YlLDeKfkHYX+FUoNTzr2p
         UO76K2/8wcigR918G6wg6MHUo5K0jIRZWYwzNbj5erug8nc7t7upO1+GlPY3MG6iHDGG
         Ed4hfvh3FM+HGqaPK7bR7hva5s8y9ya1sDOX3KyiolJ8yJbPMiLD2Fvd6XIuhRNaE15z
         9aHg==
X-Gm-Message-State: AOAM532uWC2z6/H5fLoWKvT/nVRi3WucWnFWJmrbfJbO+qB32ZInxzK+
        7S2HXuLSNaYlnvvE49TXYB0=
X-Google-Smtp-Source: ABdhPJyuy9OvUsC5eZMcbuKs4l2aZQyKecnXnN2dy7YeTrD7I9H4VcARZR/rY9K4XQ4S4vnMoIiZ1Q==
X-Received: by 2002:ac2:41cf:0:b0:448:3116:3aa5 with SMTP id d15-20020ac241cf000000b0044831163aa5mr171583lfi.660.1646840509932;
        Wed, 09 Mar 2022 07:41:49 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id k10-20020a196f0a000000b0044824706bf2sm450058lfc.227.2022.03.09.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 07:41:49 -0800 (PST)
Date:   Wed, 9 Mar 2022 17:41:46 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     "Sharma, Shashank" <shashank.sharma@amd.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Shashank Sharma <contactshashanksharma@gmail.com>,
        linux-media@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Message-ID: <20220309174146.2e723d67@eldfell>
In-Reply-To: <af561b6e-1aa5-dc81-cc19-98da443eeffb@amd.com>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
        <faf5be22-07a2-f928-085e-1a1e2aa01b12@xs4all.nl>
        <20220308163053.70c81c0d@eldfell>
        <ac619e70-bedf-8855-f3e5-7f2aa3dc4f17@xs4all.nl>
        <20220309160933.78aba02a@eldfell>
        <af561b6e-1aa5-dc81-cc19-98da443eeffb@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oKSkSVQQh6KxA=cHQY1uxfA";
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

--Sig_/oKSkSVQQh6KxA=cHQY1uxfA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Mar 2022 15:31:11 +0100
"Sharma, Shashank" <shashank.sharma@amd.com> wrote:

> Hello Hans, Pekka,
>=20
> Thank you for providing your feedbacks on the first level draft of the=20
> library, and for your inputs.
>=20
> On 3/9/2022 3:09 PM, Pekka Paalanen wrote:
> > Hi Hans,
> >=20
> > thanks! If Shashank agrees, we can see how this would start to look
> > like. I suppose there would be the occasional patch series sent to this
> > mailing list and publicly discussed between me and Shashank while we
> > iterate. You could mostly ignore it if you want until the two of us
> > need your guidance.
> >=20
> > Even if it turns out that this cannot go into edid-decode upstream, I
> > don't think the exercise is going to go to waste. It would be the
> > beginnings of a new project. =20
>=20
> Based on what I could understand from the discussion so far, I could see=
=20
> that we have some basic requirements which are suggested by both of you,=
=20
> like:
>=20
> - We want to keep the current structure of EDID-decode as unchanged as=20
> possible, and want to keep the C++ states internal.
> - We want to make sure that the new library (if any) is C API, and apart=
=20
> from parsing the EDID, should be independent of EDID-decode core logic.
>=20
> May I propose something which might be able to keep both the=20
> expectations maintained upto a certain point, and does solve the purpose=
=20
> as well ? Please consider this and let me know how does it sounds:
>=20
> - We add a C wrapper library with following set of functions:
> 	- parse_edid_init()
> 	- query_a_particular_info_from_edid()
> 	- destroy_edid()
> - At init, Client app calls the library parse_edid_init() function with=20
> EDID (file node or raw data), this is when The library layer allocates a=
=20
> C struct for this EDID, which has two parts
> 	- base block stuff,
> 	- extension blocks stuff,
> - The library calls the internal edid-decode core function just to parse=
=20
> EDID, and get the edid-state, and then fills this C structure with all=20
> the information from edid-state.
> - The library caches the C structure for the EDID, and gives user an=20
> identifier for this EDID.
> - At a later stage, when this client tries to extract a particular=20
> infomration from EDID (like does this display support YCBCR420), the=20
> library identifies the EDID from cached EDID, and extracts the=20
> information from cached C struct and responds to the caller API.
> - During the display disconnection, client calls and asks the library to=
=20
> destroy the EDID structures, and it does.
>=20
> In this way, this library becomes the CPP->C translation layer, and it=20
> takes all the overheads like, and will use the edid-decode core APIs=20
> just for parsing the EDID. The edid-decode state remains internal, used=20
> immediately, and not being exposed to another process.
>=20
> Will that be something you guys would like to see as a prototype code ?

Hi Shashank,

from what I understood from Hans, edid-state structure just does not
contain most of the information the library would need to deliver. So
this won't work. You cannot just "wrap" edid-decode, because it does
not store all the information it parsed, it only prints it.

Try with the monitor make, model and serial number strings first to see
for yourself, e.g. "Display Product Name" entry.

I do not understand why "identifier for EDID" and searching instead of
just a plain opaque pointer. Like fopen() gives you a FILE* and then
it's up to you to fclose() it when you're done. The FILE* is not an
identifier or a handle, it's a pointer to some data structure whose
contents you must not access directly (the pointer is opaque).


Thanks,
pq

--Sig_/oKSkSVQQh6KxA=cHQY1uxfA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIoyroACgkQI1/ltBGq
qqeAxg//T54RhD0KaEUrARXTpKFvkXZHONBcX8iA7okkTAfTk62xvGOdKusFylBG
S1XAgupLEpupG/bLq0rK9SZ0vP0zzNX6EnOpjok4eVJM8HsVg/R4x1jaYe96BgY7
vh+klxYjOoLiB/nkkxwsrqfgXffJoOZO02OjbaDMZJ0491RoqxaBDed0qJwt1gnX
Lurm9IOKXsKaRhC0CALG6BOoeqUOKfSMXFbwBtREwxkdoVti0k+IMkmJMRrJL8Oq
MAClBs4smHXBzb9NV66JUfPuhCMv87Y9SpSYb70wz3DzvoYYkzarMLx8+4lgHZOI
YacqOULMvQiwmXuvlhrLXGjTW9iU+8apdLSckokTa1pfm9vFHj6OFCtvuUxfv7o+
b6pb9D4jbk2UaPUrHcNAZKIXvLMPs/Uq7XB8PL8rQamw7GpAEPWrShsrjBz32Mj4
Ihb+8mXDnfhuF1gN9WtFHLOBg6KWqRNJTSAYsDIah/1ek/kfg6oML1Vmfcxd27Nf
WoC5t0TSQXWa+tGo8mecTnQWJhyxCXmOpnIoLBvKmv02tY/iShxU+9QB5ZRrJDpE
EH63TpYZggFa2nnXDnbvhkXnLoybkACcuUyvYXovRgCDb0MH5X4tEXHN8/Z29bdT
/QgO0QtWhA2Lpa0oT97Zqegc18zVEO63DDAQvFz89/mSAf9dCvg=
=6WmN
-----END PGP SIGNATURE-----

--Sig_/oKSkSVQQh6KxA=cHQY1uxfA--
