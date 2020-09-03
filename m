Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8152D25CA02
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 22:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgICUL7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 16:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728358AbgICUL6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 16:11:58 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510F7C061244
        for <linux-media@vger.kernel.org>; Thu,  3 Sep 2020 13:11:56 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id gr14so4472078ejb.1
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2020 13:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:autocrypt:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=keaBMDvKw+TCo8siqc2qKHXa+phRYo+UKGIPeN13JWY=;
        b=Q8BcL0p97io3dfOBV3zCO3QD+mVcgfaOidkbzzePEyerK7tLhpXORSuj1H69Tgp2TG
         5TsYrp5zYMxRkFEBKqOcHe/EDVpxKvMwUr+COnTJH4L4YZpdI01+qS8qjc7vUN3pdwea
         ZZ1l9OQ+e1u+B7bI1Dp5NCI7ZW7UlSNYodTa4eZj1gEoRX2ym+OcSVTmW5IhhxACRaw5
         qtYQXBbH5LCRxe5tmkMpT+NOq0pAcUIC5ei1u+WYvzaXsQh1B4P81EiidGdKF9bhnP2i
         FmmO/wllTAzZJaYpuP9+TrFwIikkAXEl75GSfmIQvk4GOTkA5wlQpAZD1b6pN4ptVPdO
         6SKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:autocrypt:subject:message-id:date
         :user-agent:mime-version:content-language;
        bh=keaBMDvKw+TCo8siqc2qKHXa+phRYo+UKGIPeN13JWY=;
        b=bxAFiqakfd+ieZRv7wxo0NX93adAAg0VGt/DwN5eyfV0+ZGWfheBOwIKoA4qXjU1sH
         SI20CgYv4MRxeBQfk4Y8Nn5DtSMd1BT5UFjzhFO4DSY4tOiwUFu2xCewy9BO0qLP1C6u
         2oH9CtYkThU0HaHCKSH1XmGxL0swUNpprdQ7d+4QY43WyCLQURi3W2/RraiZ//e/3ifP
         p9M7zPRNe9p2CiEz8ox3wECXQduc49EfpPEqD0BFdEhmdd9H1JZZXr7SbAtWC9x5rxSA
         AVIIFMYkOzil5cXL2O2VgtQxU2MQzkamIDx6lY9ujlNUH/v0j37jt6h3+TRmSnpNe7dF
         e/7g==
X-Gm-Message-State: AOAM530ljy212liqRHqTc2y2CnEH+fQZ3nTaGdlNXuSnPuLnDsXTrGZ5
        75dPf7n0SHe+E0SIc1abSG+jiybwTtI=
X-Google-Smtp-Source: ABdhPJzg+BrpIlnx2ktYt23o3LlCfp+ANGUoJkfWq2OdIFw2zPcyw4GIZaTqjlzkKiIimAsjYIpJcg==
X-Received: by 2002:a17:906:b10:: with SMTP id u16mr3852818ejg.179.1599163914608;
        Thu, 03 Sep 2020 13:11:54 -0700 (PDT)
Received: from [192.168.0.104] (host-88-132-80-88.prtelecom.hu. [88.132.80.88])
        by smtp.googlemail.com with ESMTPSA id ce14sm3977439edb.25.2020.09.03.13.11.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 13:11:53 -0700 (PDT)
From:   "=?UTF-8?B?SHJvdGvDsyBHw6Fib3I=?=" <hrotkogabor@gmail.com>
X-Google-Original-From: =?UTF-8?B?SHJvdGvDsyBHw6Fib3I=?= <hrotko.gabor@gmail.com>
To:     linux-media@vger.kernel.org
Autocrypt: addr=hrotko.gabor@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFyQ9AsBEADDAlTiQ+dU5sqn9+CyprRdUrrpi5oqsXVr0APVWpeMXtpsdqU/LU93vVZy
 iDu/zg6ZMl+M2u16gMI0wSn4/Dkk6DvwJbFA5jp/6s6GqVE4c8/Lq9bDNNMNNMK54JyhlRyN
 h39+64Bl2VNBfnLXrgafPfdmaL69pbVYZAZPz/MiA3XWz+WVpIfa9VrNVpc6Wfsy8ZOi/SWZ
 A28y+giCApHaNgWFIu2r02MNylG4DVAnRoXi5mYMs6H4OFGSwMqwgnsvJWFUEjL952iUHpxv
 kAo7wtpJUpQhPKr8gRZZYWr/Cy92FDJ2dBSxoN2HFW2+QkYSw0AU6MKG0niupthocw4sT7Wi
 h/HZ+YxdpySE7b3Mmls/eKc9QFXjUS7ekgwG++vnYl8bA2tDaxP9vItff8XfqBXN9tBX/CvR
 V759p8QwCwzBJgO/hDFQgUukvfV4B+ivyxSogm3v3awtY1ATBSusXklspJts4CB+Ew+hdD4y
 hLe1836O3US+VF3NAnfokSkqGamECl28ByDQFgyLGaZDroKoz2c3K26XHfQ9BDRRHbFEe46N
 eK8wxlD3sFdbe7zravfcmPIEegz02vg6bqNu3EX30oTrEfnEPN5D9WaDSNkUUDS/7f7ZRYUQ
 vDtTpID4/3KS/WCyWsMHqQQJ5CwDx6zb4ZizNGYYz+/YGbNnjQARAQABtCdIcm90a8OzIEfD
 oWJvciA8aHJvdGtvLmdhYm9yQGdtYWlsLmNvbT6JAj0EEwEIACcFAlyQ9AsCGyMFCQlmAYAF
 CwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQjAVgCdYW2UG5vQ/9Es+cN+DaO6e1xUtJ9FfG
 ntz8He8oS/GiW4KHvn2V6mzzFcqnjmKz3B4UEVlCKl9lfNsM8Qjjq5obne26YEwHWfGiYpMM
 ffA7UZGbeM5rpTDrc0tRcxU1u+zemgZmpm+8RR45poloWBfgbnPDhs4gPU4NPSAij1XgClaJ
 h+xHDHQJH9Hi2QNuMtn8LWCqnOC5X73pCq9Ri6Xu9NeTBuKuGBHeVcIvP1Binvw+6NU9N2jq
 kmfdfEOmZPOQxpzUwJ232JChof9EmgTohaTb0jqiSbji/Vw4rOmM+cJcAGoIRvtXd292s9+F
 /MWA54RzBn8Mvf4Ra7Ak/00gUNkXDYCHu560FobEoQlgLeUcyIZ7r70gb2hIZqYD7PSTeyyO
 t+JvFZRpuJQ9bI+1A//lZaSIno5cpCAjF2jZFFvE2sM1GLDrLRHrrMwTVoWCvaKoNl1G9HtZ
 02e411K5zS4sdHdBqVJGXi8MoLks1uOFq3Lmob3Z492kniRrhnawYFHpsIPGHABGTIi15sC9
 wKuY2nk85GoGb5SwtLSgx0lAYQ+39SyU5jzdj3GyqDL0awL8ESzDHWLBM05OAocAa94LGC65
 tPQZdwYdMBJtfF3el8o2gl5iDykF7ADnxHltKoZZWRqUwmsnmEsXpXz3vxpqOPqVuaPYj3W8
 fLXTDMgAXlf5rtG5Ag0EXJD0CwEQANvUKBnWXZ/TNF89hKI9Rxz3EVnw6LEdAZVnn6A+GHIl
 nzy1PLnGdAec1mDzYOugmOhN7IabFMdNL8tMoCOWIBZLKwO/f69xEGeK7yxkijPi58O46qY+
 ZxyF7aI261Am4elOUEPKUCUqv1paW4ffvWb3CnYBQDkdUq3TZCq7I4D4slg+Jwo1Htaqd22r
 9kwLYeJZBnFp+Y/tCHOkeECQedbCjizPZHjgk1MLj04TXljL/igWBlVu8SQHuvG0yT0Ej/+d
 gBeLM8E2uiugb2jA+LILvz1hl/zTU6zMfrWBxOZlsiWL8Vp4C3oh/0mCs1IDtf76OOL9U7H3
 Y/iGBXv+F3idVeION2avyZ/9mhx88RTsgqtHx8jLIMQbTy6np6D+P6LItAeQeoz4mHZmm1C2
 43jlrZ7bIgIU2dmz9A63ZKOpC7UNpn0YjBfJ9b8a/TktZBxftMq5RfllLB/JMQK7srglKQXx
 2j7QNLQR39JyEUxM+TyVimrqm4Dc+krztlzaSKUVRlepAHO5wAmFwxuiUNKkOLvlY1v6dGuO
 rZvraZYI03uK5U7IFFKgxKs/AwrXiju+yvCTc2+GmdQXSqUI4DCX3W1C2uV4fCeNVmip5NkZ
 8DGRNjlsTN9A+mPbewqtPQ0MOa1HMf+jKoeVWOiNVloENkdf7qERH9lqwNAnN/VNABEBAAGJ
 AiUEGAEIAA8FAlyQ9AsCGwwFCQlmAYAACgkQjAVgCdYW2UFecQ//RuplAhSQqWX6lanQlRM5
 XhBXW6dk0/tHGZrIQQhir4NAEIyPpgEzIpR+sXXa1ZMDaBK/QJRVfuXJg47/ooLGbT0pxwY+
 M+WlGCvup1sCaMCKJoGeYKG12+LNKdw8gCPpelEsiZCno4/nWMZAhFIFyR2M/dkdiZ+VF5hX
 SydI4tWHZ47T7YvpQE1tvVCOZQHtF+bOnUNjHg3DybyKWQxFII/l3urqaDWdCY/PLRNyc9rZ
 jLmi/82RQpIB2rK2nR9ZTD1FfHOOfk+f51SDRME6jbREB9aEZ7bAvO1a8vNKfByM6Zz3K9C0
 BnoHLgCkmyFwEOnUfdIga7mLm2qcyKuu5r3xcUYM8b8gr5syFNv6uOClRiEJD9bDgWv9qbFo
 CVCy4PokK7QfqaOKT87iiEr8JRf48CSkJHydQgEtf7LrmVWJEifTg1y6kUpbgnGd9fc80Zm5
 8HlY05TycpyQiHnU3O0cJSA0/GdM72LEtqGhKasPaO0OYxQ4glI3sKDiDiUyLoCPS70V6JAE
 d2MypnYKmOrM3Sib/7mP5mwG6pZ/23n935Ge9ZbU0CrapvVv1PLJonrs9ZONoY7OfpOeyv5Z
 5VzKwvBnBtMqi+HkUc2hIOewJUC+wV6AaFOnPogHP7h1kPpU3V84vhLvMEkcy/M4xp5+WjyP
 w4wwgfrWmPAAPVE=
Subject: dvb-c channels for hu-PRTelecom
Message-ID: <5c9f1fe5-1d3a-17b2-abef-268ad7a52ba6@gmail.com>
Date:   Thu, 3 Sep 2020 22:11:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------CC201160E24B571F0570E66C"
Content-Language: hu-HU
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------CC201160E24B571F0570E66C
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable

Hi!


=A0Please put this file to this place:

dvb-c/hu-PRTelecom

at this repo:

https://git.linuxtv.org/dtv-scan-tables.git/tree/


Thanx

Roti


--------------CC201160E24B571F0570E66C
Content-Type: text/plain; charset=UTF-8;
 name="hu-PRTelecom"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="hu-PRTelecom"

# PRTelecom, Hungary
# For the following cities:
# Abony, Acs=C3=A1d, Ajka-Padragk=C3=BAt, Alatty=C3=A1n, Arl=C3=B3, =C3=81=
gfalva, =C3=81rokt=C5=91, Baj, Bakonycsernye, Balatonakali,
# Balatonakarattya, Balatoncsics=C3=B3, Balatonf=C5=B1zf=C5=91, Balatonke=
nese, Balatonszepezd, Balinka-Mecs=C3=A9r, Balsa, Bazsi,
# Bekecs, Bodajk, Bodrogkereszt=C3=BAr, Bodorfa, Bodrogkisfalud, Bodrogol=
aszi, Borsodszentgy=C3=B6rgy, B=C5=91, B=C5=91cs,
# Budakeszi, Budapest XXIII. ker=C3=BClet, Bugac, Bugac (Als=C3=B3monosto=
r), Bugacpusztah=C3=A1za, B=C3=BCk, Chernelh=C3=A1zadamonya,
# Cibakh=C3=A1za, Csabrendek, Csepreg, Csernely, Csokvaom=C3=A1ny, D=C3=B6=
ms=C3=B6d, Dunaharaszti, Dunavars=C3=A1ny, Em=C5=91d,
# Erd=C5=91b=C3=A9nye, Erd=C5=91horv=C3=A1ti, F=C3=BCz=C3=A9rkoml=C3=B3s,=
 G=C3=A1vavencsell=C5=91, G=C3=B3r, Gyep=C3=BCkaj=C3=A1n, Gy=C3=B6ngy=C3=B6=
starj=C3=A1n, Hal=C3=A1sztelek, Halimba,
# H=C3=A1romhuta, H=C3=A1rsk=C3=BAt, Hegyfalu, Hej=C5=91kereszt=C3=BAr, H=
ercegk=C3=BAt, Hidegk=C3=BAt, Holl=C3=B3h=C3=A1za, Horv=C3=A1tzsid=C3=A1n=
y, Igrici,
# Iklanber=C3=A9ny, J=C3=A1noshida, J=C3=A1szals=C3=B3szentgy=C3=B6rgy, J=
=C3=A1szap=C3=A1ti, J=C3=A1szber=C3=A9ny, J=C3=A1szber=C3=A9ny (Portelek)=
, J=C3=A1szboldogh=C3=A1za,
# J=C3=A1szd=C3=B3zsa, J=C3=A1szfels=C5=91szentgy=C3=B6rgy, J=C3=A1szf=C3=
=A9nyszaru, J=C3=A1sziv=C3=A1ny, J=C3=A1szj=C3=A1k=C3=B3halma, J=C3=A1szk=
is=C3=A9r, J=C3=A1szszentandr=C3=A1s, K=C3=A1ld,
# K=C3=A1ptalanfa, Kecsk=C3=A9d, Ken=C3=A9zl=C5=91, Kir=C3=A1lyszentistv=C3=
=A1n, Kishuta, Kiskunf=C3=A9legyh=C3=A1za, Kiszsid=C3=A1ny, Kocs=C3=A9r, =
Koml=C3=B3ska,
# K=C3=B3ph=C3=A1za, K=C3=B6rnye, K=C3=B6rnyeb=C3=A1nya, K=C5=91r=C3=B6st=
et=C3=A9tlen, K=C5=91szeg, K=C5=91szeg (K=C5=91szegfalva), K=C5=91szegpat=
y, Kunsz=C3=A1ll=C3=A1s,
# Kunszentm=C3=A1rton, Lakitelek, L=C3=A1batlan, Lesenceistv=C3=A1nd, Lit=
=C3=A9r, L=C3=B3cs, Makkoshotyka, M=C3=A1lyi, M=C3=A1rk=C3=B3, Mencshely,=

# Mesterh=C3=A1za, Meszlen, Mez=C5=91cs=C3=A1t, Monostorap=C3=A1ti, Nagyc=
enk, Nagygeresd, Nagyhuta, Nagyk=C5=91r=C3=B6s, Nagyv=C3=A1zsony,
# Nek=C3=A9zseny, Nemescs=C3=B3, Nemesgul=C3=A1cs, Nemeshany, Ny=C3=A1rl=C5=
=91rinc, Ny=C3=A9kl=C3=A1dh=C3=A1za, Nyir=C3=A1d, Olaszliszka, =C3=93buda=
v=C3=A1r, =C3=93lmod,
# =C3=93nod, =C3=96cs, Papkeszi, P=C3=A1lh=C3=A1za, Peresznye, P=C3=B3sfa=
, Pula, Pusztacs=C3=B3, Rakamaz, R=C3=A1k=C3=B3czifalva, R=C3=A9pceszentg=
y=C3=B6rgy,
# Saj=C3=B3petri, Sajtosk=C3=A1l, S=C3=A1razsad=C3=A1ny, S=C3=A1rospatak,=
 S=C3=A1ta, S=C3=A1toralja=C3=BAjhely, S=C3=A1toralja=C3=BAjhely (K=C3=A1=
rolyfalva, Rudab=C3=A1ny=C3=A1cska,
# Sz=C3=A9phalom), Sopron (Balf), S=C3=BCmeg, S=C3=BCmegpr=C3=A1ga, S=C3=BC=
tt=C5=91, Szabolcs, Szakony, Sz=C3=A1szberek, Szegi, Szegilong, Szeleste,=

# Szentantalfa, Szentjakabfa, Szerencs, Szolnok (Pletykafalu, Szandasz=C5=
=91l=C5=91s, Kertv=C3=A1ros), Szigethalom,
# Szigetszentmikl=C3=B3s, Szigetszentmikl=C3=B3s (Als=C3=B3bucka, Lakiheg=
y), Szom=C3=B3d, Sz=C5=91c, Tagyon, Taksony, Tali=C3=A1nd=C3=B6r=C3=B6gd,=
 Tarcal,
# Tarj=C3=A1n, Tata, Tata (Agosty=C3=A1n), Tiszaalp=C3=A1r, Tiszadorogma,=
 Tiszaeszl=C3=A1r, Tiszak=C3=A9cske, Tiszanagyfalu, Tiszaf=C3=B6ldv=C3=A1=
r,
# T=C3=ADm=C3=A1r, Tolcsva, T=C3=B3tv=C3=A1zsony, T=C3=B6m=C3=B6rd, T=C3=B6=
r=C3=B6kb=C3=A1lint, T=C3=B6rtel, =C3=9Ajsz=C3=A1sz, =C3=9Ark=C3=BAt, Vaj=
d=C3=A1cska. Vassur=C3=A1ny, V=C3=A1mos=C3=BAjfalu,
# V=C3=A1rgesztes, V=C3=A9rtessoml=C3=B3, V=C3=A9rtestolna, Viss, Zagyvar=
=C3=A9kas, Zalkod, Z=C3=A1nka, Zs=C3=A9deny
# In some of the cities not all the frequencies are available.
# freq sr fec mod
[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 482000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D AUTO
	MODULATION =3D QAM/AUTO
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 154000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 138000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 146000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 306000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 162000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 266000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 514000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 290000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 498000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 530000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 298000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 490000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 314000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 506000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 522000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 274000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO

[CHANNEL]
	DELIVERY_SYSTEM =3D DVBC/ANNEX_A
	FREQUENCY =3D 282000000
	SYMBOL_RATE =3D 6875000
	INNER_FEC =3D NONE
	MODULATION =3D QAM/256
	INVERSION =3D AUTO


--------------CC201160E24B571F0570E66C--
