Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 849F8107F72
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 17:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKWQqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 11:46:21 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.139]:37146 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbfKWQqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 11:46:20 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id YYXziRYDERnrKYYY5iYY1s; Sat, 23 Nov 2019 09:46:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527577;
        bh=eMfH0jUyyVvljNUPJSi+h1AA6r7PFSbU94ecyI1drBA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=DbyooGFXXFXPZbMjrzwIEY4jFMAHbM4jrcHOZjN5HEe6AiySDJBSobv0H2lM+t1HU
         0EoarCsEwm77wgYdnzpdBwPAekQwaqkOPp4rRuTPYdCXBdbmUX47Z2r8/RT+CHbGZJ
         6TC+V0OTtzBHrbNfNHYq+3jjNndiwvR1QdfxkHRL4bS+Ekzo+T0ylxkP8nMmlb0MKb
         3ezrjj9LbVWGbkh4Umosvls86Thb+j1uzbLXw6VLMCzRT3fC4tjxF6Q8ePyXQWmUm9
         FPQdSZPX/Q9pRBJ/41Umf0WFg0Nk7M1no93tI47apXDlcp3bjg5cZvK/0npVCral6M
         PK1UJIe8U2VIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527577;
        bh=eMfH0jUyyVvljNUPJSi+h1AA6r7PFSbU94ecyI1drBA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=DbyooGFXXFXPZbMjrzwIEY4jFMAHbM4jrcHOZjN5HEe6AiySDJBSobv0H2lM+t1HU
         0EoarCsEwm77wgYdnzpdBwPAekQwaqkOPp4rRuTPYdCXBdbmUX47Z2r8/RT+CHbGZJ
         6TC+V0OTtzBHrbNfNHYq+3jjNndiwvR1QdfxkHRL4bS+Ekzo+T0ylxkP8nMmlb0MKb
         3ezrjj9LbVWGbkh4Umosvls86Thb+j1uzbLXw6VLMCzRT3fC4tjxF6Q8ePyXQWmUm9
         FPQdSZPX/Q9pRBJ/41Umf0WFg0Nk7M1no93tI47apXDlcp3bjg5cZvK/0npVCral6M
         PK1UJIe8U2VIg==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=_Dj-zB-qAAAA:8 a=Mm3cTRHjB386Wo1w-00A:9
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, joevt <joevt@shaw.ca>
Subject: [PATCH 10/10] edid-decode: add example EDIDs
Date:   Sat, 23 Nov 2019 08:46:04 -0800
Message-Id: <20191123164604.268-11-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
In-Reply-To: <20191123164604.268-1-joevt@shaw.ca>
References: <20191123164604.268-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHTxCG5BBpoqkDnryCe3eCAVNgzieEoKks7Hy73AmgTyK49aGkASM0AptWx4zV0Y8/jCwTFs5TrkkPIvdUsEt8sAo2NJLu50eliXViL5HtWazze6AqWL
 Ivc6cXFbpMN03Fh9mDgFJ+K5GGdyM6+/x80ISUtFMbStwXc+2qSB8FbbObvaYMRraG+3FdMCaFn7dspV4UaztgaiH0wPQVZ6HWw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

acer-xv273k*
- contains a broken example of "Display Interface Features Data Block" (appears to be missing the "additional combinations count" byte)
- contains an unknown "Vendor-Specific Data Block"

dell-p2415q-hdmi2.0
- contains an example of "YCbCr 4:2:0 Capability Map Data Block". They have specified that the last two "Video Data Block" resolutions 4K50Hz and 4K60Hz support "YCbCr 4:2:0", while lower refresh rates do not support "YCbCr 4:2:0". For example, HDMI 2.0 has bandwidth for 4K60 8bpc RGB and 4:4:4, but there is not enough bandwidth for 10bpc at 60Hz so 4:2:0 is allowed for that refresh rate.

dell-up2715k-dp1-tile1
- contains an example of "Type 1 VESA DMT Timings Block"

lg-ultrafine-5k*
- contains an example of "Display Parameters Block"
- contains an example of "ContainerID Data Block"

kogan-kaled24144f-hdmi
- contains a type 1 timing with a negative horizontal back porch.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 data/acer-xv273k-dp1                          | Bin 0 -> 384 bytes
 data/acer-xv273k-dp1-tile0                    | Bin 0 -> 384 bytes
 data/acer-xv273k-dp2                          | Bin 0 -> 384 bytes
 data/acer-xv273k-dp2-tile1                    | Bin 0 -> 384 bytes
 data/dell-p2415q-dp-mdp                       | Bin 0 -> 256 bytes
 data/dell-p2415q-hdmi1.4                      | Bin 0 -> 256 bytes
 data/dell-p2415q-hdmi2.0                      | Bin 0 -> 256 bytes
 data/dell-up2715k-dp1-tile1                   | Bin 0 -> 384 bytes
 data/dell-up2715k-dp2-tile0                   | Bin 0 -> 256 bytes
 data/dell-up2715k-mdp                         | Bin 0 -> 256 bytes
 data/dell-up2715k-mdp-switchresx              | Bin 0 -> 384 bytes
 data/kogan-kaled24144f-dp                     | Bin 0 -> 256 bytes
 data/kogan-kaled24144f-hdmi                   | Bin 0 -> 256 bytes
 data/lg-ultrafine-5k-v2-thunderbolt-dp1-tile0 | Bin 0 -> 384 bytes
 data/lg-ultrafine-5k-v2-thunderbolt-dp2-tile1 | Bin 0 -> 256 bytes
 15 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 data/acer-xv273k-dp1
 create mode 100644 data/acer-xv273k-dp1-tile0
 create mode 100644 data/acer-xv273k-dp2
 create mode 100644 data/acer-xv273k-dp2-tile1
 create mode 100644 data/dell-p2415q-dp-mdp
 create mode 100644 data/dell-p2415q-hdmi1.4
 create mode 100644 data/dell-p2415q-hdmi2.0
 create mode 100644 data/dell-up2715k-dp1-tile1
 create mode 100644 data/dell-up2715k-dp2-tile0
 create mode 100644 data/dell-up2715k-mdp
 create mode 100644 data/dell-up2715k-mdp-switchresx
 create mode 100644 data/kogan-kaled24144f-dp
 create mode 100644 data/kogan-kaled24144f-hdmi
 create mode 100644 data/lg-ultrafine-5k-v2-thunderbolt-dp1-tile0
 create mode 100644 data/lg-ultrafine-5k-v2-thunderbolt-dp2-tile1

diff --git a/data/acer-xv273k-dp1 b/data/acer-xv273k-dp1
new file mode 100644
index 0000000000000000000000000000000000000000..47c1528f315725450aa703e369c8709d5d607a5a
GIT binary patch
literal 384
zcmZSh4+ab@MH|_I`x#n|WEfet+9*|6s|&6PG~KGk7Z9TC!O-Z?*wA>Okzp#sW`>Ig
z7#V#pFf8~`VAo)vV9F30pvb@=wIvNCBHzHFAi)9=VPIhR%VRL%|Nm@8E(I_Eiu_@S
z2s1J__J)cuDKas8d<<k{W)Tu*6_KC7&J-ILpO9#;%*oE)%*ep-h~YpkGY^9RgGGe`
zLjofcbA}WH10$os1ct|~j~SovGaO)e#>UQ=7$(Es)DTi&;p@Pm@Pj7|>>`Kf3|R{n
zWCd_2%z(Nm{}9811q(t0;I5WqI8Y!|$-uzOs4;5+W6OWO1q}KPiVXQ2b_~o6tPBsn
jF|gFLM*_v<fnt&jj6hK}1`c+1X66U=K+jMPrc3|;_Ayfd

literal 0
HcmV?d00001

diff --git a/data/acer-xv273k-dp1-tile0 b/data/acer-xv273k-dp1-tile0
new file mode 100644
index 0000000000000000000000000000000000000000..d93c5d21f10d90f86eb8af00b205537d5b6323ca
GIT binary patch
literal 384
zcmZSh4+ab@MH|_I`x#n|WEfet+9*|6s|&6PG~KGk7Z9TC!O-Z?*wA>Okzp#sW`>Ig
z7#V#pFf8~`VAo)vV9F30pvb@=wIvNCBHzHFAi)9=VPIhR%VSXS|9>_kmjW07MgA~E
zgc+F|dqYK-ESZ=+J_a%}vj_>ZipWo3XNrxBPe`;^=45AYW@KP^#Bd;&nTJ7u!J<Ne
zA%T&JIYWwpfsxUmg5fdiW5y@^3<nsVv9U8IhRHBlHAoa%=sHB`xI$bc$0*BC6nH^S
zAx|R|Dw2PQVZnk0p#gAL%P|BN2vssLFf(dA_{Pvu&mPI3-yqMB&mqac$iU1nYXKw6
zf4&7kF-4%59Z-aoL5+cfot>HaK|KS55QA8k00Tokdp-xyXABIE&Osa5z$~H(j|l*}
CM^ga+

literal 0
HcmV?d00001

diff --git a/data/acer-xv273k-dp2 b/data/acer-xv273k-dp2
new file mode 100644
index 0000000000000000000000000000000000000000..08ac45b3a3a5013c3adef432c6eacfe3b3c65f51
GIT binary patch
literal 384
zcmZSh4+ab@MH|_I`x#n|WEfet+9*|6s|&6PG~KGk7Z9TC!O-Z?*wA>Okzp#sW`>Ig
z7#V#pFf8~`VAo)vV9F30pvb@=wIvNCBHzHFAi)9=VPIhR%VRL%|Nm@8E(I_Eiu_@S
z2s1J__J)cuDKas8d<<k{W)Tu*6_KC7&J-ILpO9#;%*oE)%*ep-h~YpkGY^9TgGGe`
zLjofcbA}WH10$os1ct|~j~SovGaO)e#>UQ=7$(Es)DTi&;p@Pm@Pj7|>>`Kf3|R{n
zWCd_2%z(Nm{}9811q(t0;I5Wq*iax;$-uzOs4;5+W6OWO1q}KPiVXQ2b_~o6tPBsn
jF|gFLM*_v<fnt&jj6hK}1`c+1X66U=K+jMPrc3|;`_WSY

literal 0
HcmV?d00001

diff --git a/data/acer-xv273k-dp2-tile1 b/data/acer-xv273k-dp2-tile1
new file mode 100644
index 0000000000000000000000000000000000000000..8e41faf6cd086876bda4519bc823815ee655013b
GIT binary patch
literal 384
zcmZSh4+ab@MH|_I`x#n|WEfet+9*|6s|&6PG~KGk7Z9TC!O-Z?*wA>Okzp#sW`>Ig
z7#V#pFf8~`VAo)vV9F30pvb@=wIvNCBHzHFAi)9=VPIhR%VSXS|9>_kmjW07MgA~E
zgc+F|dqYK-ESZ=+J_a%}vj_>ZipWo3XNrxBPe`;^=45AYW@KP^#Bd;&nTJ7v!J<Ne
zA%T&JIYWwpfsxUmg5fdiW5y@^3?~?#v9U8IhRHBlHAoa%=sHB`xI$bc$0*BC6nH^S
zAx|R|Dw2PQVZnk0p#gAL%Q09M2vssLFf(dA_{Pvu&mPI3-yqMB&mqac$iU1nYXKw6
zf4&7kF-4%59Z-aoL5+cfot>HaK|KS55QA8kfB-{1dp-xyXABIE&Osa5z$~H(iwOY5
C$5R0S

literal 0
HcmV?d00001

diff --git a/data/dell-p2415q-dp-mdp b/data/dell-p2415q-dp-mdp
new file mode 100644
index 0000000000000000000000000000000000000000..ffc77f0cbc914500564f7df3b08bddf27e315416
GIT binary patch
literal 256
zcmZSh4+abZYxXU0^6@cHmSSXCYARP@^~iNasPAGm?tqY`-VBBQjSVXgtaP||;330B
z21Z8T3k(ZB6xcP`8JIHgYbY`>NHH)l{AX}Cb}@G|v+y_Y@p0k;iu_@4arN<02rx1+
zG!5iZ0E+x&koA%4F=OCT00YLSOw6($0|ew1SVdTbg#?+I#6;QI7?nBY*_#;|7{cNh
z7A#nx8DO9Qvxdp4L88z?*C9ej6=Ja*qbx&F-~~B_JdIGO$l^4R<K!C<x_}nr0IvZ|
CY&!t}

literal 0
HcmV?d00001

diff --git a/data/dell-p2415q-hdmi1.4 b/data/dell-p2415q-hdmi1.4
new file mode 100644
index 0000000000000000000000000000000000000000..ada8d54fa0dd28c18763f41632502207bda56392
GIT binary patch
literal 256
zcmZSh4+abZYYr@M^6@cHmSSXXFqNx#^~iNasPAGm?tqY`-VBBQjSVXgtaP||;2{Ge
z5G+n(Sn#1hzQI7jl!0GEk%2*qfq~&agS)Ydxtp1Vzk!dB6BkhA4}*)VkB>rtk%^&c
zAeRDA<S&D)k6e!&1D66AFivD**83Pdft7`cU5rsgUPxG7K~agBO;A*sQ=Yw<k%1wX
znTG+W(MEwGftiVs$*Mu3&_dTCLPr&1uN<Q+P((&d0WLC+rG&xYQ$bY2hKMexny@&A
R1q&8v2B5eW=olcV0swnGJOKaz

literal 0
HcmV?d00001

diff --git a/data/dell-p2415q-hdmi2.0 b/data/dell-p2415q-hdmi2.0
new file mode 100644
index 0000000000000000000000000000000000000000..d9f3eca07a46223ae750a025b5bdc77242cd7b62
GIT binary patch
literal 256
zcmZSh4+abZYmP2(^6@cHmSSXXFqNx#^~iNasPAGm?tqY`-VBBQjSVXgtaP||;2{Ge
z5OBO;F!)pu)vzI=i-BK5k%2*qfq~&agS)Ydxtp1Vzk!dB6BkhA4}*)VkB>rtk%^&c
zAeRDA<S&D)k6e!p1D66AFs@}{cK8?}z{<kJF2*P#FC?t4ps2*mCMX&k7oV7*%qh>_
z%*eoy%gn<7)Lo&#kig8un0_Pn2xG+o_9y%d3<nrx8zc&4#1tZQR3R>z$5MjkHo34k
Vh6M{2Xa*Q4m?B&YbPNzQ0RUN@K>+{&

literal 0
HcmV?d00001

diff --git a/data/dell-up2715k-dp1-tile1 b/data/dell-up2715k-dp1-tile1
new file mode 100644
index 0000000000000000000000000000000000000000..424394df2b31b89aae15440c7f11be1d1e3ef86b
GIT binary patch
literal 384
zcmZSh4+abZYqmKATUr<hNiwo*wNa|DDpFk&V7y(8J0L`ngQ1aOGs8uOl@5&!7Y{H3
zL0BBaf&~jS0}K>Q8A1aT85pD(7#RLDxEXpm`<j}B8dz8ca{)#EFu1t-_$Y)17?~TI
zdV@s%GRS(%Z!u%!QUC*{wM@)BAC)=T*_#;|7<?}<Ecj4h*ASqP$^$l40;@ehW2gp9
z3WO>d7=#$angj$G{&U)MgG~my8WI}J3^qO&7+U`G&1cYWkY~u}uw`IkU||r5WnlTw
l2@$jB)&PoeG91~1EEWhBV`t#vXk_4EVPIhr!0P0a69Bq!MF9W+

literal 0
HcmV?d00001

diff --git a/data/dell-up2715k-dp2-tile0 b/data/dell-up2715k-dp2-tile0
new file mode 100644
index 0000000000000000000000000000000000000000..c95095fecc3962145d89efe0ae7caf7c6c1cb6cd
GIT binary patch
literal 256
zcmZSh4+abZYqmKATUr<hNiwo*wNa|DDpFk&V7y(8J0OICfq@YX%;yeRVDNxXz(B#2
zAv8ddfk6tW=s$y-p_j9-sY$4Tg=H`oP~;DTi>r^1LTG@IxuK~yNaQbrthf9YGe#~2
zFkqZeAXLe~AjBZnAOJLg)1Dish5@7t;u>ZK4S`q&mj9gd8T1?E8SJ?=7?>D18IJ5h
P77GN6fi;p!)K35az+)`|

literal 0
HcmV?d00001

diff --git a/data/dell-up2715k-mdp b/data/dell-up2715k-mdp
new file mode 100644
index 0000000000000000000000000000000000000000..835aaa5e87fd431a73579319724a97f4c136db27
GIT binary patch
literal 256
zcmZSh4+abZYj!vUTUr<hNiwo*wNa|DDpFk&V7y(8J0L`ngQ1aOGs8uOl@5&!7Y{H3
zf$s%|1s@9R8VnRn8A1aT85pD(7#RLDxEXpm`<j}B8dz8ca{)#EFu1t-_$Y)17?~TI
zdV@s%GRS(%Z!u%!QUC+SdrZtiA6+M~Ff%bKbF#BHGcqtRSv5!$TIf1N=%_->mJ5qx
tSg>G$W&pxAMp=fUzzcE;c^aWmH9cGxx)dJh3JBOugNR4~Z6geh0swE*IRO9w

literal 0
HcmV?d00001

diff --git a/data/dell-up2715k-mdp-switchresx b/data/dell-up2715k-mdp-switchresx
new file mode 100644
index 0000000000000000000000000000000000000000..d0d425a8d4db26170d21a92ee9e469eb7f9fc318
GIT binary patch
literal 384
zcmZSh4+abZYj!vUTUr<hNiwo*wNa|DDpFk&V7y(8J0L`ngQ1aOGs8uOl@5&!7Y{H3
zf$s%|1s@9R8VnRn8A1aT85pD(7#RLDxEXpm`<j}B8dz8ca{)#EFu1t-_$Y)17?~TI
zdV@s%GRS(%Z!u%!QUC*{yG+bNA6+M~Ff%bKbF#BHGcqtRSv5!$TIf1N=%_->mJ5qx
zSg>G$W&pxAMp=fUzzcE;c^aWmH9cGxx)dJh3JBOugNR4~Z6geh76_^^GcYrVG~_Wd
p{1=|jpx+?RV9y=Mz{J49z|FuFT%K8yoDq~-95IuyVPvS7007E9LjeE)

literal 0
HcmV?d00001

diff --git a/data/kogan-kaled24144f-dp b/data/kogan-kaled24144f-dp
new file mode 100644
index 0000000000000000000000000000000000000000..ce340a6c2fd85e6b459b33d966ad896a2bed6c60
GIT binary patch
literal 256
zcmZSh4+ac6?-*1VfIvoyk!7igLWObr(<Na6^VE0)Le`&V*vv4Mp|PRyK%xK21KkH0
z8JMgZBnmBb9U^pG8Se53GBC&iwf<$$n6P{~7bBMf7yw27FnBxqxVjjb7@C;4aVY>r
z1b`R`Fdk)M<~gX$$<E%)$iSf0)DTc$;p@Pm@Po%}6;P>ESAN5S0t*KR0|iqC2Ny-4
K2$E)MFj)XpaxDP>

literal 0
HcmV?d00001

diff --git a/data/kogan-kaled24144f-hdmi b/data/kogan-kaled24144f-hdmi
new file mode 100644
index 0000000000000000000000000000000000000000..f3d4a0f0700493d72de0e2cc8fb91214f2fbf1d6
GIT binary patch
literal 256
zcmZSh4+ac6?-*1VfIvoyk!6vILWN#pz_PG_1!}wjA?r^wY-X6s(Ady;pwNHif$js0
z3`|xH5``AJ4iP%840m}185kshTK_P3JNme~7?~KFn7DB%07d>XXiQkJK#_q<0Stg5
z0zixe7@L@wwLb<-U}a%uViXh-7GYx-6_Zy`=45AYW@KPUzY%+cvEl$jDl-p*0>iBO
zhKd3U1+b-I0g6CNyYd?r6j(So7$}%BIJf{s<TTAdBJxNgOp*)>0xpOufYdbH0NM|7
IDjbLd0L{=k0RR91

literal 0
HcmV?d00001

diff --git a/data/lg-ultrafine-5k-v2-thunderbolt-dp1-tile0 b/data/lg-ultrafine-5k-v2-thunderbolt-dp1-tile0
new file mode 100644
index 0000000000000000000000000000000000000000..13ab607a1763bf26fc8219904f7548963e9fd851
GIT binary patch
literal 384
zcmZSh4+ac!xh2tutyvk^WEoku+9*{t@K0P9<h((RKOjVbfq@YXsGea6_)uWiz@Z?)
z5D}utz#z3anjv7p0?hz~2m=Gde+EkfGrth$C`Thpb4xCu$R7qDcZJZLlA=Vn%)C@C
zrh5fKmCOu`3_Nz?V!R9@4%`71els;01hzbm>%YIiIbm0bRqnr6Ojns1G*r$owEXAu
zXJBuTXUONU1scZA5ZA}RQqKbsV`n!8ivbCuLB#~H{Xz_4O#(pYa@uo)wYmrUmPCWR
e%*-HiVGjexf6n<}YwfuMf%5D`8&6Q7&;$T`UqAr>

literal 0
HcmV?d00001

diff --git a/data/lg-ultrafine-5k-v2-thunderbolt-dp2-tile1 b/data/lg-ultrafine-5k-v2-thunderbolt-dp2-tile1
new file mode 100644
index 0000000000000000000000000000000000000000..abc93a47301db232ea159a68f1e5df5d64db4c27
GIT binary patch
literal 256
zcmZSh4+ac!xh2tutyvk^WEoku+9*{t@K0P9<h((RKOlsGfq@YX0EGmA7!_cO{AaK<
zF!Kv>j&d}zG`HjeD*waa<E{{zQ&N=ZmYJ8z#W=Y@sFIn1k%7lfT#T1N#DP1Y!f&P~
zgTR)@asBrfI4A51vC94Tis`BlgII%r0K<Pydv36$?!mq#(I7`LGl*Q+!@%*Mb3Oxm
TgFJ&hcOX!n9o1pDd2$l~Q#URF

literal 0
HcmV?d00001

-- 
2.21.0 (Apple Git-122.2)

