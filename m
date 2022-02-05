Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6749B4AA867
	for <lists+linux-media@lfdr.de>; Sat,  5 Feb 2022 12:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344326AbiBELlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Feb 2022 06:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbiBELll (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Feb 2022 06:41:41 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D4AC061346
        for <linux-media@vger.kernel.org>; Sat,  5 Feb 2022 03:41:40 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id m4so27443468ejb.9
        for <linux-media@vger.kernel.org>; Sat, 05 Feb 2022 03:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=CRBGZV7caa6ZqE8gU2mtQdO/b/sDkYiANciVbrk0lcs=;
        b=kiF9wSO3apXK36m/niIvPN9hCJFXln72WLnmGZW4wck7RIG3EOLEHAE9dFnEZAgQU/
         aFVJ0hq4TdmymurW+TKJzbqTq4wZLeSi7rrTpfJW5Pl/oSMLx+6StMK9ooUwM60OrhVA
         lNWlRHlaDtIJ5TXt2Viv2MczTRXHG84dJc+u3M3KAmUJE9e95e3bXCsnKQzH5MzIKbTz
         Pk7sNOo6aV7IafPL++0JYm0pC754TsJvVrrowtTA5VQ56aKFjjJJaj3j7trWPBOe8iQf
         tC7n/zKxXLRV3mwjWKiqKC1Qi61UCoD0lFgYBb/2sDMSbVGVzFHkcKeDU199yoamzgL0
         J/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to:content-transfer-encoding;
        bh=CRBGZV7caa6ZqE8gU2mtQdO/b/sDkYiANciVbrk0lcs=;
        b=jzXcTbDNZN7Mt89x4V7HZRadH45NDVtJMbNZKWLupCiVHDU6Jr6R4XmFrfOJDrJGcL
         jYpeI8WUNzCRpmPNuUw/CestF4qYixqJOX2hgXxs+f2D5t8GgmDIG7jZGpuCBBN2Nw7F
         9TexcZkkCAl4nfWwQwx5ltOVTJ9k6gUgd8X/CFg0MnJgCVb9T/zQjpGRBhDjNsmZmYJ0
         O1j2R0oGhTb9PzD+R6oyKnpl8hMowf90PjIl2MVqEQmrYbc36p1CUM/fauQevJO1SpdF
         BIp2Q+sgosSJt26Kqc1Qlh+bm68lO0FX32xgt3VkxmqsKAyWkr+AvGDlb2QaIrNrQYVh
         /g1g==
X-Gm-Message-State: AOAM533wKatAxi4+aUeZWoksTmlzGu+CFD6qfXkZyVCj1W3GDbJmi20T
        Tf9TVWENtAOuK/QZm44exGvzn999QEHXyBNNd8s=
X-Google-Smtp-Source: ABdhPJzH9aioWwnLqgA9rTxRA2PBMWLhXGFDYMTarmNlzAES3upx+AKNVEO/0nanWTZyFmRPs+FygPy/PXSwwLSxNEo=
X-Received: by 2002:a17:906:e8b:: with SMTP id p11mr247213ejf.237.1644061298877;
 Sat, 05 Feb 2022 03:41:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab4:a551:0:0:0:0:0 with HTTP; Sat, 5 Feb 2022 03:41:38 -0800 (PST)
Reply-To: anitajoshua2002@gmail.com
In-Reply-To: <CAE2UszEPtakPcKmFO=m8fTxpk8qWdwfkNrMP+C6MhRj4Z7MAYA@mail.gmail.com>
References: <CAE2UszFUT27FQbU2t9D5z8Xko-8aJ8mRaVmsmpNcghbCFB9Otw@mail.gmail.com>
 <CAE2UszEjC-yKzQ=vjLR0==nrG2VyPDLEE-Mdr6rwB2ugrbbXAg@mail.gmail.com>
 <CAE2UszG7GeyFFd+y1njaKNqjQBk=9BoRYu2mZkgu7THGdFdzPg@mail.gmail.com>
 <CAE2UszEdPULXnySYNKosV3tBJz80SoXgzD+CWK1FQWesFK9R5g@mail.gmail.com>
 <CAE2UszG8k72RknzAanDxRN-UDhC48svMJOoT9kjWdgGtJANPpQ@mail.gmail.com>
 <CAE2UszGkifw==ht=aCEEpz2E2CJXzQdYPwi1XvOVN6DGNNhDOQ@mail.gmail.com>
 <CAE2UszFAf0M9QNvFK7RF67pH0pJzv+r8tUqk9wy36_ztFk3EcQ@mail.gmail.com>
 <CAE2UszHE-+Hhe9A_DBZWqrXJXr-n8mjeYQL3ZVYEyASF1sHkzw@mail.gmail.com>
 <CAE2UszF5EOp6o3+sCHHLkU4jBECFnN1_Je0vw+1h4=pnMXMgRg@mail.gmail.com>
 <CAE2UszHdFe_-26XOE0JoeME96uMuQ2KnAMC87=YcEOtidtX3ZA@mail.gmail.com>
 <CAE2UszFovTJmFPYa77E8o6Lb8Jq6AoQKXmpsvh44K4v5mT9fgA@mail.gmail.com>
 <CAE2UszGLnL5eW2fj1Xr2kdeEYCSOmY0mn=6pGo_8BxYG8NWXNg@mail.gmail.com>
 <CAE2UszHLm5vdFM03E2=hvy6d-wuSzPwsj4_Dx+VJre0M5hEypw@mail.gmail.com>
 <CAE2UszFcYhdyiuKutt2HmS8Gn9aAg=ox8aJTy0YYvsLcY8s4dg@mail.gmail.com>
 <CAE2UszFruce_Ls-A4CvdnEMQbcugSogD-oTN4PgUw=hAeCpeJA@mail.gmail.com>
 <CAE2UszH8CTgHXFBCO707Fk7sZFpKE-6AqSOm6HFvsU4FikPjDA@mail.gmail.com>
 <CAE2UszGc6Lzz4yZ2K4S2nDfn0CAyye6KudiS0TQaweAvGJ6vZA@mail.gmail.com>
 <CAE2UszFUd95jZq6Ax-GivGr-TeJ5wYUxbw60jVA=TZdr6hvFEg@mail.gmail.com>
 <CAE2UszFjwE9LM-9CbKYdbjZpszmpOnPgw5PMtLAAjYg=vQTr4g@mail.gmail.com>
 <CAE2UszH2O+FLsvJtiTrv6O9dkTZ-khUVtVX5XbTn9iZ4-rQBLg@mail.gmail.com>
 <CAE2UszGEdWmkHOGb6C31+CSG_Orztsg=RqqDyDXdxOTLCYoUGQ@mail.gmail.com>
 <CAE2UszG9djwak=6pYpHBCN8FBbyUNGF_L-OsrBdcf4exV6Nd3w@mail.gmail.com>
 <CAE2UszGiixPb79VssQx6ohN7_dB+JjrSew93jWXaGqYeF4x3ow@mail.gmail.com>
 <CAE2UszE6XDMkno8xqYZd2GZnp-bqr3DRYeO5oBWY0xMkJcYq5w@mail.gmail.com>
 <CAE2UszEcSKGcwSBiw=1QQ+ag6jgkBKFOacms2LkhVNR8e3kP-g@mail.gmail.com>
 <CAE2UszFn1HqYcz2yLHSyN_DQa7bpyg7cWnDeO4ckT-NB+vUM7Q@mail.gmail.com>
 <CAE2UszE=OsFDunNxn4=2fngC8+7a8ZRpZQuZ+RCZ+rq3=z=_xA@mail.gmail.com>
 <CAE2UszGx7iKkKw-cTB=VC3ytu01Tw4vXPgvRs4c9+54rfMa=og@mail.gmail.com>
 <CAE2UszFP4fjjvj0-Eo6Q_qhNBPhPmdrgAkD03HyRf2CkDhEh4Q@mail.gmail.com>
 <CAE2UszHJ98oOuSyOk=dJxzaiT+ZOcwH4gYD-pWbwY7Jp2B4+Tg@mail.gmail.com>
 <CAE2UszGhUSVwO6ZrAQ56FiRHnJFDj9hdsGbdko-a-MeymG+PYA@mail.gmail.com>
 <CAE2UszFehjjV9E-vmBypN4xj4WHLbzDOPjCOwyyUMRU4Gw+R-Q@mail.gmail.com>
 <CAE2UszGTm2nNQrxJCFSxot1LFg48Rd3KwkWx5S+qv_hJ+ATWTQ@mail.gmail.com>
 <CAE2UszFVa06vVsAV2FO=Ha-oi2xxy5DdhPdKgNKS5hNxi=N0=Q@mail.gmail.com>
 <CAE2UszHgj0Q=_MW82wR_2HVgxyoxH7k=LSxG2up6Rqug-h6nKQ@mail.gmail.com>
 <CAE2UszG8XCYV6EW_MJA8n33WM1m+G_c9rOXVx48a1iL=Z=Qfrg@mail.gmail.com>
 <CAE2UszGpUC8BYjo3bVCLzEM+D_tPX9SvHGnjn_9L_yOPO=Vy-Q@mail.gmail.com>
 <CAE2UszGTrVx6oBUZoTtb08YNbE-pCpQju5g=W=EEBrP9cYM3LA@mail.gmail.com>
 <CAE2UszGSud_PJDp93fTG_s9mB=LZAFPHpegNb2EvTfvbxAPBGQ@mail.gmail.com>
 <CAE2UszFQy4rRg7q4MkbFuMJRa24Yj=1qDd_C0JT_fU3TStMY0A@mail.gmail.com>
 <CAE2UszH8Hf20OCf1A6LW4kwzt-YjU0KbMKc8OvisdWLrmArsPQ@mail.gmail.com>
 <CAE2UszEAaJvmRqYg9u25+Gqs-NvpQD6FXOepdUk-o3m6m_mgCw@mail.gmail.com>
 <CAE2UszGhQmGVyg0cwPynHgXTR6snRyiHFAAT1Jc4V1nHhu0TTw@mail.gmail.com>
 <CAE2UszHHoOKz5me1-nOgjcZOE+mHzWuF8qg7aLE8OrmJXoqfMg@mail.gmail.com>
 <CAE2UszGGoDNTtoodh1a_=aKoXmxf=OxTVZrgxe2-J7hVHQQqXQ@mail.gmail.com>
 <CAE2UszF_pHfbfsO+12pzwhT=4NTRa+Lth-4hkpT5PLZL1sUOFw@mail.gmail.com>
 <CAE2UszH-c2eE1HL9dZ_mQ6PxLPXzR1S1ks2nbtMcFffwW_c95A@mail.gmail.com>
 <CAE2UszHMMEJ41g27EfTGEi3a=yGLStC2P5kMRo16OSOoWe2xvA@mail.gmail.com>
 <CAE2UszGQAnSnPYCO_Zu_EwYXh4r6vvx4sQMwHvEXfjEdBEnMag@mail.gmail.com>
 <CAE2UszGcVFPa6ejzErHBjQDDZ0Qt1VcGQY6BHwLcuzF5oGjAAg@mail.gmail.com>
 <CAE2UszFRtChuc5nSzrjw7jJGfeP0antBu4uuFiLKGkZeQUi2Jw@mail.gmail.com>
 <CAE2UszG6VCCCeOQW=1xYav83q0CAc7=DpqyHH8gMVCAuanm3Ww@mail.gmail.com>
 <CAE2UszE_YH6+4UHEkYJYxzKatuEUXAAtVHF6Rs0pSf3yrLGdkA@mail.gmail.com>
 <CAE2UszFn=6Na_8F7GK_jmFURi4w9rLF+Ggotq3DzJ8AQ3Ggx=g@mail.gmail.com>
 <CAE2UszHm4VsQCwjUb07z0XA4ThANXhzORSgmpH2y3TXcvXx9HA@mail.gmail.com>
 <CAE2UszGG065wxcjU2W8gnigouHnewsO9VCJTQbxJV2z=riDaeQ@mail.gmail.com>
 <CAE2UszGAgr9D4QGdGBW=yTDysQe7ZLcHRmP1WqOKgaENE+rw7w@mail.gmail.com>
 <CAE2UszF=AJh8f0NO_yKoUzXh0C_be=+t0xsbGx=mLfvL08R5eA@mail.gmail.com>
 <CAE2UszEUbbKRAoM+wf+kjbAR1EP1n6WNO7X+sG2K4ick4N4RiA@mail.gmail.com>
 <CAE2UszHYbGtv59Rax80eNiUB3tHRXVD4LJ+UQ-8VP3prf3A7xA@mail.gmail.com>
 <CAE2UszHaJXxpdxqNz+3g0owmWu7AkW2x1EaiC68Yo=ywMe_QkQ@mail.gmail.com>
 <CAE2UszFDoL122fhQLpnhNnMRGz+AL2Wbjs8k+QpwOEAuvqKXsg@mail.gmail.com>
 <CAE2UszFGYdCEm5+hm8b_viMAN2TmrZdr1d8c4RCKE8GDh4_7pQ@mail.gmail.com>
 <CAE2UszEKV0Wu9Ma-hFJ1jU4eY6PL9-F=YCf1E=MZSeNeXSPXqw@mail.gmail.com>
 <CAE2UszG7CzPqrUc8yRsHPPcbg2PZ6+dNpqbH_nyWoi8DFnBiZQ@mail.gmail.com>
 <CAE2UszHJv5+0FbKyMTTtN0x+SPpFo4LSrpiJYeFE178HJy_9JQ@mail.gmail.com>
 <CAE2UszF=izj=Usm8HqLOAo_iJ=p-baH6AUbH71BP4WY=cgx3Mw@mail.gmail.com>
 <CAE2UszG8JyyVP6qjf=gZ18yCtLRUDawPZSw1zbm-4PYiH=pFPw@mail.gmail.com>
 <CAE2UszHasqsuU01YQOTqf3hMkdbYT_4SW7BTxuQTg1S0zByeMg@mail.gmail.com>
 <CAE2UszHhXO5j6gQd78a3g+w+b_tKFc7DjZJzcU3=RN43YQz9VA@mail.gmail.com>
 <CAE2UszGWU5D-YFRAMDBpf4szHLZmaYMVZBcsxroNtiLR7PLtSA@mail.gmail.com>
 <CAE2UszEJu0LDgO2paArcbnNX7=xmTDG860HfiOAs=u=u10C3Cg@mail.gmail.com>
 <CAE2UszE2wiZ8CTp7ChsEqPMcUEFW19BbaR8swQiz5YUJK1f+qg@mail.gmail.com>
 <CAE2UszGXdOcH7cNTgGzzvM7SLRtMw7v_wkMMQ7-_RN1Xz8FVLw@mail.gmail.com>
 <CAE2UszGTQPDuph-fv+1GwkcQxvjupwrAP8CRubzoUGm=H7407Q@mail.gmail.com>
 <CAE2UszHRCnfcDPiDp+u+mf6OFWk0WgnR6AQG-Nc6R3dXn1iMOQ@mail.gmail.com>
 <CAE2UszHUsRmGH9rp_GY3k7ZG5QQkSSKnpgiJ+6NZ_Q4ZhnOn=w@mail.gmail.com>
 <CAE2UszE4VXE6n6snf6gm2apcBq1tgyAYdE5ju2dRz5gQ-jOWpQ@mail.gmail.com>
 <CAE2UszGavPZxDQ_2K1r_knQM8bADF1w2Ua7=MH42k-qFtDNfNw@mail.gmail.com>
 <CAE2UszEH8K8e=NLe8ajW8FrbNrRb800dz+n_KeTiYhu0ssX13g@mail.gmail.com>
 <CAE2UszGN9qpix97EuexwY51TKuy-3SSgXcQL_9CzkDHpfb1tEg@mail.gmail.com>
 <CAE2UszE0jtkO3+VZ8S6_nXmJHaj2Jk3qe6UT8phcGdQhvR1UaA@mail.gmail.com>
 <CAE2UszHRpy2PgN26A3pYKgYxC9uxEjL5Mr8v5RO=QvL6LiujoA@mail.gmail.com>
 <CAE2UszHzB1tjfqYg-2A2fsSTjThchtRbDMHVkr58hX76dxf1hQ@mail.gmail.com>
 <CAE2UszHv34OPxraY=5yyzq6MLLDsxyjBJSAq83_k=mp9+ANCMA@mail.gmail.com>
 <CAE2UszE1d8O5b=ZcLPXZGyQ7O5nFHJbPfR4Zq90_EWM9T-_48w@mail.gmail.com>
 <CAE2UszG_QB2yneBh=meaSNKyF4GcFVVRX4cvT82C2GamifJVjg@mail.gmail.com>
 <CAE2UszE0TCwR_ReGoDM1yugN+JEYnnLZYYUm=Bk5DF44n-_BXQ@mail.gmail.com>
 <CAE2UszEGh8Nb50RpLcvppgmkH6drDZsr0yAyKTJD92mkm=CKcQ@mail.gmail.com>
 <CAE2UszFd+AXkrBv395Z4S-pZ=+EXxFjZZkJS7mx0xm0T-5FRNA@mail.gmail.com>
 <CAE2UszHey5SB4kEsgemiX7GPCyfE7gUnfNDyQcPBQC-aD0cj5A@mail.gmail.com>
 <CAE2UszHYTZzSh2gts7+KP=F8QCbMR6mzN5BcHv2bFQ+nb0aXXA@mail.gmail.com>
 <CAE2UszFYN2ruy1spRgvJFhGQz1fDx4EqDGNiq82BkEra9Gr-bA@mail.gmail.com>
 <CAE2UszEQERsaFYcLZc14gF8MkvqjcBGUarHVzGmYqTRrpWwLBg@mail.gmail.com>
 <CAE2UszGbgmpd_xRxUP-7G1gH=A9PHudZmNhP_YN_PDzxd8uckg@mail.gmail.com>
 <CAE2UszFCNrkJm_THty=WwSyP=r8pgbLc6nda2LN+6jR7DPTVdg@mail.gmail.com>
 <CAE2UszH+MPV5-NP04GE4-Smyb9MM5Nn3Ds9M6LW=6zrDTR6J0A@mail.gmail.com>
 <CAE2UszHHjtHz6pzHiE6RQYktcrDu_V4DYBKZeneaJBmmgfKbMg@mail.gmail.com>
 <CAE2UszHnbAuMc-B4aN44oXHjn7DPXEP8YbV1u+hKHtKDftgY-g@mail.gmail.com> <CAE2UszEPtakPcKmFO=m8fTxpk8qWdwfkNrMP+C6MhRj4Z7MAYA@mail.gmail.com>
From:   david tayo <agathamambo2015@gmail.com>
Date:   Sat, 5 Feb 2022 12:41:38 +0100
Message-ID: <CAE2UszHZ_PQbk1QExXbdrBWhRWhX4MiAA3zL+ypz7CNzCmp6Fw@mail.gmail.com>
Subject: Ref:
To:     anitajoshua2002@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moj dobar prijatelj



Zadovoljstvo mi je izvijestiti o svom uspjehu u prijenosu tih
sredstava uz suradnju novog partnera iz Vijetnama. Trenutno sam kod
njega na investicijskim projektima sa svojim dijelom pau=C5=A1ala. Me=C4=91=
utim,
nisam zaboravio ni va=C5=A1 trud i prija=C5=A1nje poku=C5=A1aje da mi pomog=
nete u
prijenosu sredstava, iako nam to nekako nije uspjelo.

Sakupio sam 750.000,00 dolara, =C5=A1to je pripisano debitnoj kartici
bankomata da vam nadoknadim va=C5=A1e po=C4=8Detne napore da mi pomognete u
transakciji za koju sam mislio da je nebeska za nas oboje. To =C5=A1to
zajedno posti=C5=BEem ovo je moj posljednji poku=C5=A1aj da vas kontaktiram
nakon nekoliko neuspje=C5=A1nih poku=C5=A1aja da vas kontaktiram. Sada
kontaktirajte moju tajnicu, njeno ime je g=C4=91a Anita Joshua,
kontaktirajte je sada da vam po=C5=A1alje bankomat karticu.

Svakako potvrdite njezine podatke kako ne biste dali pogre=C5=A1noj osobi
svoju bankomatsku karticu. Po=C5=A1aljite svoje puno ime, adresu,
zanimanje, direktni broj telefona

S po=C5=A1tovanjem,
David Tayo Esq
