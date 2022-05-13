Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC4B0525D00
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 10:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378087AbiEMIJ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 04:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378089AbiEMIJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 04:09:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E73C2A28EE
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 01:09:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 16DA761F34
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 08:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7C4C34100;
        Fri, 13 May 2022 08:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652429394;
        bh=Cn7e+vAO9S8gEqNpCyzp0PVnF0s9rCP3AhBe6NRbQWM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ggTCsNsLUYxW/LuqUxIKXFuliEtRA/RCLYH5bEnCdHyQumoOUUHXikJsTqA27GNku
         +xvKlflM75YtmtvZG8fG0xiX9X+dlbe9dYSOlllktmztPRlCP+uPHVkPuTQH2I/TJe
         XjMTCC1NPxbNPo7bPQQe8OH5YnvCZoAMZcikMnyhSBNsfaYJhgc494M+28L5UruODE
         y+jq1d/dg3OFJ4nA2UEkEDR2QIrBy/RwhAfxtJbies1L5qE51lO85HfGpWnbXRq2Sn
         X7WRX6M0Zj5Ws4hitlYesd5E/Pq9Bcdx4nqSx/StOC5N9JG3anH9uhiNBzG59nsPHI
         8flGeA0/FauMQ==
Date:   Fri, 13 May 2022 10:09:50 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v5.19] H.264 Field Decoding Support for
 Frame-based (#82804)
Message-ID: <20220513100926.0faea100@coco.lan>
In-Reply-To: <20220429063621.3369772-1-jenkins@linuxtv.org>
References: <5ac6c664-c130-265a-c8e0-6a47c9ebbd3f@xs4all.nl>
        <20220429063621.3369772-1-jenkins@linuxtv.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Em Fri, 29 Apr 2022 06:36:21 +0000
Jenkins <jenkins@linuxtv.org> escreveu:

> From: builder@linuxtv.org
>=20
> Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/5ac=
6c664-c130-265a-c8e0-6a47c9ebbd3f@xs4all.nl/
> Build log: https://builder.linuxtv.org/job/patchwork/203191/
> Build time: 00:24:05
> Link: https://lore.kernel.org/linux-media/5ac6c664-c130-265a-c8e0-6a47c9e=
bbd3f@xs4all.nl
>=20
> gpg: Signature made Fri 29 Apr 2022 06:02:35 AM UTC
> gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1=
E76
> gpg: Can't check signature: No public key
>=20
> Summary: got 4/23 patches with issues, being 4 at build time, plus one er=
ror when buinding PDF document
>=20
> Error/warnings:
>=20
> patches/0001-media-doc-Document-dual-use-of-H.264-pic_num-frame_n.patch:
>=20
>     allyesconfig: return code #0:
> 	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconfli=
cts-sr]
> 	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconfl=
icts-rr]
> 	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples'=
 to generate conflict counterexamples
>=20
>     allyesconfig: return code #0:
> 	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platfor=
m/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously a=
ssumed 'req' could be null (see line 674)
> 	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/sm=
susb.c:53:38: :warning: array of flexible structures
> 	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/sm=
susb.c:53:38: warning: array of flexible structures
> 	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885=
/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications af=
ter 60 seconds
> 	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-=
drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turnin=
g off implications after 60 seconds
> 	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/=
em28xx-video.c:2888 em28xx_v4l2_init() parse error: turning off implication=
s after 60 seconds
>=20
> patches/0004-media-h264-Use-v4l2_h264_reference-for-reflist.patch:
>=20
>     allyesconfig: return code #512:
> 	../drivers/media/platform/nvidia/tegra-vde/h264.c:823:22: error: =E2=80=
=98struct <anonymous>=E2=80=99 has no member named =E2=80=98top_field_order=
_cnt=E2=80=99
> 	make[6]: *** [../scripts/Makefile.build:288: drivers/media/platform/nvid=
ia/tegra-vde/h264.o] Error 1
> 	make[5]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvid=
ia/tegra-vde] Error 2
> 	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvid=
ia] Error 2
> 	make[4]: *** Waiting for unfinished jobs....
> 	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Err=
or 2
> 	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
> 	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: driver=
s] Error 2
> 	make: *** [Makefile:219: __sub-make] Error 2


This series break Kernel compilation. Please fix it and resubmit.

Thanks,
Mauro

>=20
>     allmodconfig: return code #512:
> 	../drivers/media/platform/nvidia/tegra-vde/h264.c:823:22: error: =E2=80=
=98struct <anonymous>=E2=80=99 has no member named =E2=80=98top_field_order=
_cnt=E2=80=99
> 	make[6]: *** [../scripts/Makefile.build:288: drivers/media/platform/nvid=
ia/tegra-vde/h264.o] Error 1
> 	make[5]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvid=
ia/tegra-vde] Error 2
> 	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvid=
ia] Error 2
> 	make[4]: *** Waiting for unfinished jobs....
> 	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Err=
or 2
> 	make[3]: *** Waiting for unfinished jobs....
> 	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
> 	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: driver=
s] Error 2
> 	make: *** [Makefile:219: __sub-make] Error 2
>=20
> patches/0005-media-h264-Increase-reference-lists-size-to-32.patch:
>=20
>     allyesconfig: return code #512:
> 	../drivers/media/platform/nvidia/tegra-vde/h264.c:823:22: error: =E2=80=
=98struct <anonymous>=E2=80=99 has no member named =E2=80=98top_field_order=
_cnt=E2=80=99
> 	make[6]: *** [../scripts/Makefile.build:288: drivers/media/platform/nvid=
ia/tegra-vde/h264.o] Error 1
> 	make[5]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvid=
ia/tegra-vde] Error 2
> 	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvid=
ia] Error 2
> 	make[4]: *** Waiting for unfinished jobs....
> 	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Err=
or 2
> 	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
> 	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: driver=
s] Error 2
> 	make: *** [Makefile:219: __sub-make] Error 2
>=20
>     allmodconfig: return code #512:
> 	../drivers/media/platform/nvidia/tegra-vde/h264.c:823:22: error: =E2=80=
=98struct <anonymous>=E2=80=99 has no member named =E2=80=98top_field_order=
_cnt=E2=80=99
> 	make[6]: *** [../scripts/Makefile.build:288: drivers/media/platform/nvid=
ia/tegra-vde/h264.o] Error 1
> 	make[5]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvid=
ia/tegra-vde] Error 2
> 	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvid=
ia] Error 2
> 	make[4]: *** Waiting for unfinished jobs....
> 	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Err=
or 2
> 	make[3]: *** Waiting for unfinished jobs....
> 	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
> 	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: driver=
s] Error 2
> 	make: *** [Makefile:219: __sub-make] Error 2
>=20
> patches/0006-media-h264-Store-current-picture-fields.patch:
>=20
>     allyesconfig: return code #512:
> 	../drivers/media/platform/nvidia/tegra-vde/h264.c:823:22: error: =E2=80=
=98struct <anonymous>=E2=80=99 has no member named =E2=80=98top_field_order=
_cnt=E2=80=99
> 	make[6]: *** [../scripts/Makefile.build:288: drivers/media/platform/nvid=
ia/tegra-vde/h264.o] Error 1
> 	make[5]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvid=
ia/tegra-vde] Error 2
> 	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvid=
ia] Error 2
> 	make[4]: *** Waiting for unfinished jobs....
> 	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Err=
or 2
> 	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
> 	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: driver=
s] Error 2
> 	make: *** [Makefile:219: __sub-make] Error 2
>=20
>     allmodconfig: return code #512:
> 	../drivers/media/platform/nvidia/tegra-vde/h264.c:823:22: error: =E2=80=
=98struct <anonymous>=E2=80=99 has no member named =E2=80=98top_field_order=
_cnt=E2=80=99
> 	make[6]: *** [../scripts/Makefile.build:288: drivers/media/platform/nvid=
ia/tegra-vde/h264.o] Error 1
> 	make[5]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvid=
ia/tegra-vde] Error 2
> 	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/nvid=
ia] Error 2
> 	make[4]: *** Waiting for unfinished jobs....
> 	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Err=
or 2
> 	make[3]: *** Waiting for unfinished jobs....
> 	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
> 	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1834: driver=
s] Error 2
> 	make: *** [Makefile:219: __sub-make] Error 2
>=20
>=20
> Error #512 when building PDF docs
>=20



Thanks,
Mauro
