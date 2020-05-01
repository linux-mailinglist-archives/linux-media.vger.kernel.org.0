Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E5D1C1BB3
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbgEARbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728495AbgEARbL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:31:11 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11257C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:31:11 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id d17so12253411wrg.11
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=ECPW8FfduXMdPh8D1w/NBWazTr3SCqbPLEe8bb28aKQ=;
        b=grLH3y4daF0CrvNawmS/DD51bIidQEfvoPQVut4600zmrXRX/znZP9nb3F2WbqetGc
         BmLKyOYpEcBCTZKf9gcknsyI3OXkFEWq2x1zp0xnnMk0typlosLy0QNY/LAtZJ65bWah
         1Xxd8+QXou7lS/JdNBiyic/n6eGROwPJ8s3juo2KoI9CwTpaDprECsFtl4/zhMxhO4xg
         jrEJZw8JRRT9rV9WUANieToe1pHtMkWMz05wv4NwUPQp8n+4WUkfOJOFHSI39/Zpiqyr
         1EvS5gnvoab73QyB/H4IzdipnRhZXeNa6C4ZYfQe9h7lskNF7bkMe3fj6qkirT+Hoojc
         Xkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=ECPW8FfduXMdPh8D1w/NBWazTr3SCqbPLEe8bb28aKQ=;
        b=KEIjvpydh4K5DZSBmtkRjR3laCk0NnprNtCaIOHIKcRdlkhbczMWD7ud4wOU8SBfEh
         2Dsg6DLPpP/mVkgG+vOMUAy4eav8UNYTF+BZUIGZm45GuQWrieCBtW12v0WcsIdfxCv2
         gObYCotVN54olXydKM/ch+qpg2BhG8MSqgcsi2CrRoA7klqy3VhDY9iAaRGC+yTCW/nc
         mYO4nE7HASDDRYtaRLljSXuzW8RFCRUVQRMImivuilyoAsV0TLbQIZFaYzq6DtECEide
         vNuLxIjJ6jAPKgerDFoZScs1Aj2hNsfNNw1oOIvSBiYUvxX/mM+01/iV924c0JeZ8C+7
         T28w==
X-Gm-Message-State: AGi0PuaRFRaUUrm/G2GXiPmXYTElYDZ1WVauTMbIlotXQMUMq9vuJzVE
        A1jbJnpbxaUO4wlhgP3cBzk=
X-Google-Smtp-Source: APiQypKX2fG95W8x7w+4iy4PUcnH6y8iSw8vOkTiJ3n0MmlOofgsqT1L8HaffMsJijaLbZMkmy2GwQ==
X-Received: by 2002:adf:e591:: with SMTP id l17mr5048252wrm.268.1588354269590;
        Fri, 01 May 2020 10:31:09 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id e21sm3173457wra.57.2020.05.01.10.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:31:09 -0700 (PDT)
Date:   Fri, 1 May 2020 19:31:05 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200501192844.397efcaa@ASUS>
In-Reply-To: <20200501113812.7f16b7ca@coco.lan>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <20200420224750.28c0181d@coco.lan>
 <dd8ab5df-31c7-f009-36e4-ca4fd0605e97@gmail.com>
 <20200422211344.2ec3d93e@coco.lan>
 <23b3a078-2a9a-5f50-a35e-9f40f5aa8a6e@gmail.com>
 <86413836-e4b5-cb53-3ac0-1764c693ec7b@gmail.com>
 <682558b0-a2cf-9fe2-6e54-20462ecccb5d@gmail.com>
 <20200425132255.4bf872b2@coco.lan>
 <131a4247-cef3-d651-a0ea-defd32b8bf20@gmail.com>
 <20200426185007.1954885a@coco.lan>
 <45817a6a-dd2f-13a6-835b-fd2b04ded23f@gmail.com>
 <20200427235027.15cd4e03@coco.lan>
 <d9ec5067-142c-66c9-c412-51ddf38e44f7@gmail.com>
 <20200429011339.03af3c2a@coco.lan>
 <3b7366b9-463d-c49b-0f2d-51a1d5475a9d@gmail.com>
 <20200429201753.3b2d679b@coco.lan>
 <6fffdf73-a0eb-1b1c-d894-e4799b8ef944@gmail.com>
 <20200430125544.10a9830d@coco.lan>
 <403b799e-6ae9-d62b-1f3a-a1b6b874071b@gmail.com>
 <20200501002510.0ead955d@coco.lan>
 <1a17ffad-9792-a4ff-519e-a4306e7bf3e1@gmail.com>
 <20200501113812.7f16b7ca@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/HYtGjRpJMSPfX0trXlgtbLq"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--MP_/HYtGjRpJMSPfX0trXlgtbLq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, 1 May 2020 11:38:12 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Fri, 1 May 2020 10:54:18 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>=20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
> >=20
> > Compiled and linked :-). We get some more output this time: =20
>=20
> Good!
>=20
>  [...] =20
>=20
> Hmm.. your e-mailer is breaking long lines again  :-(

Ok - then the configuration option I used is not reliable. I've now switche=
d to Claws Mail; I hope this resolves the problem.

>=20
> > [=C2=A0=C2=A0=C2=A0 9.175421] kernel: ov2680 i2c-OVTI2680:00: gmin: ini=
tializing atomisp module subdev data.PMIC ID 1
> > [=C2=A0=C2=A0=C2=A0 9.178755] kernel: ov2680 i2c-OVTI2680:00: supply V1=
P2A not
> > found, using dummy regulator [=C2=A0=C2=A0=C2=A0 9.189966] kernel: proc=
_thermal
> > 0000:00:0b.0: enabling device (0000 -> 0002)   =20
> > [=C2=A0=C2=A0=C2=A0 9.212704] kernel: ov2680 i2c-OVTI2680:00: supply VP=
ROG4B not
> > found, using dummy regulator
> > [=C2=A0=C2=A0=C2=A0 9.235024] kernel: ov2680 i2c-OVTI2680:00: supply Re=
gulator1p8v
> > not found, using dummy regulator =20
>=20
> I'll check this.
>=20
> > [=C2=A0=C2=A0=C2=A0 9.235057] kernel: proc_thermal 0000:00:0b.0: Creati=
ng sysfs
> > group for PROC_THERMAL_PCI
> > [=C2=A0=C2=A0=C2=A0 9.238185] kernel: ov2680 i2c-OVTI2680:00: supply Re=
gulator2p8v
> > not found, using dummy regulator
> > [=C2=A0=C2=A0=C2=A0 9.337925] kernel: atomisp: module is from the stagi=
ng
> > directory, the quality is unknown, you have been warned.
> > [=C2=A0=C2=A0=C2=A0 9.404666] kernel: atomisp-isp2 0000:00:03.0: enabli=
ng device
> > (0000 -> 0002)   =20
> > [=C2=A0=C2=A0=C2=A0 9.408680] kernel: atomisp-isp2 0000:00:03.0: ISP HP=
LL
> > frequency base =3D 1600 MHz
> > [=C2=A0=C2=A0=C2=A0 9.412197] kernel: atomisp-isp2 0000:00:03.0: Unsupp=
orted=20
> > hw_revision 0x2010 =20
>=20
> This is related to firmware load stuff. The code use those macros:
>=20
> 	#define ATOMISP_HW_REVISION_MASK	0x0000ff00
> 	#define ATOMISP_HW_REVISION_SHIFT	8
> 	#define ATOMISP_HW_REVISION_ISP2300	0x00
> 	#define ATOMISP_HW_REVISION_ISP2400	0x10
> 	#define ATOMISP_HW_REVISION_ISP2401_LEGACY 0x11
> 	#define ATOMISP_HW_REVISION_ISP2401	0x20
>=20
> 	#define ATOMISP_HW_STEPPING_MASK	0x000000ff
> 	#define ATOMISP_HW_STEPPING_A0		0x00
> 	#define ATOMISP_HW_STEPPING_B0		0x10
>=20
> According with the above, 0x2010 would mean ISP2401-B0.
>=20
> The code itself check those macros in order to load the right
> firmware:
>=20
>         if (isp->media_dev.hw_revision =3D=3D
>             ((ATOMISP_HW_REVISION_ISP2401 <<
> ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_A0))
>                 fw_path =3D "shisp_2401a0_v21.bin";
>=20
>         if (isp->media_dev.hw_revision =3D=3D
>             ((ATOMISP_HW_REVISION_ISP2401_LEGACY <<
> ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_A0))
>                 fw_path =3D "shisp_2401a0_legacy_v21.bin";
>=20
>         if (isp->media_dev.hw_revision =3D=3D
>             ((ATOMISP_HW_REVISION_ISP2400 <<
> ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0))
>                 fw_path =3D "shisp_2400b0_v21.bin";
>=20
>         if (!fw_path) {
>                 dev_err(isp->dev, "Unsupported hw_revision 0x%x\n",
>                         isp->media_dev.hw_revision);
>                 return NULL;
>         }
>=20
> It sounds that we need to add:
>=20
>         if (isp->media_dev.hw_revision =3D=3D
>             ((ATOMISP_HW_REVISION_ISP2401 <<
> ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0))
>                 fw_path =3D "shisp_2401b0_v21.bin";
>=20
> Eventually, other changes may be needed, depending on how different is
> this B0 revision from A0.
>=20
> Patch for it pushed. Please notice that it will seek for a firmware
> named "shisp_2401b0_v21.bin".

Unfortunately I was not able to find "shisp_2401b0_v21.bin"; so I changed t=
he values in the code and tried with "shisp_2401a0_v21.bin, irci_master_201=
40707_0622". I contacted Intel to see if they are willing to provide the ne=
wer firmware. Alan Cox mentioned in a commit message, that the drivers can =
be extracted from an "upgrade kit":

   "... The firmware files will usually be found in /etc/firmware on an And=
roid
   device but can also be extracted from the upgrade kit if you've managed
   to lose them somehow. ..."

But I did not yet figure out what this kit is.

There is also an open support request with Intel to get some hardware/firmw=
are documentation. But this will be difficult (as expected by you and Laure=
nt) - their process only supports requests from companies that sign an NDA.=
 But I opened a ticket as well to see if there's a way to get access to the=
ir developer network someway, or if it is possible that they send only the =
documents required.=20

I also sent an Mail to the original authors of the drivers at Intel. Two of=
 them no longer work there (mail was rejected), but one went trough. Let's =
see...

>=20
> This driver will also check if the firmware version is:
>=20
> 	"irci_ecr - master_20150911_0724"
>=20
> As far as I know, the firmware is linked to the driver's code.=20
> So, supporting a different firmware version will likely require
> changes at the driver.
>=20
> > [=C2=A0=C2=A0=C2=A0 9.416174] kernel: atomisp-isp2: probe of 0000:00:03=
.0 failed
> > with error -2 =20

With the older firmware it does not look good (full dmesg output attached):
[    9.416329] ov2680 i2c-OVTI2680:00: supply Regulator1p8v not found, usin=
g dummy regulator
[    9.425878] ov2680 i2c-OVTI2680:00: supply Regulator2p8v not found, usin=
g dummy regulator
[    9.471140] atomisp-isp2 0000:00:03.0: enabling device (0000 -> 0002)
[    9.476362] proc_thermal 0000:00:0b.0: enabling device (0000 -> 0002)
[    9.478540] ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
[    9.493784] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    9.495675] atomisp-isp2 0000:00:03.0: ISP HPLL frequency base =3D 1600 =
MHz
[    9.501274] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    9.510963] ov2680 i2c-OVTI2680:00: camera pdata: port: 1 lanes: 1 order=
: 00000002
[    9.515507] ov2680 i2c-OVTI2680:00: sensor_revision id =3D 0x2680, rev=
=3D 0
[    9.519100] ov2680 i2c-OVTI2680:00: register atomisp i2c module type 1
[    9.530607] proc_thermal 0000:00:0b.0: Creating sysfs group for PROC_THE=
RMAL_PCI
[    9.585233] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=3D0 as /devices/p=
ci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input17
[    9.591623] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=3D1 as /devices/p=
ci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input18
[    9.603063] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=3D2 as /devices/p=
ci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input19
[    9.688254] ------------[ cut here ]------------
[    9.691775] cpu_latency_qos_update_request called for unknown object
[    9.695279] WARNING: CPU: 3 PID: 523 at kernel/power/qos.c:296 cpu_laten=
cy_qos_update_request+0x3a/0xb0
[    9.698826] Modules linked in: snd_soc_acpi_intel_match snd_rawmidi snd_=
soc_acpi snd_soc_rl6231 snd_soc_core ath mac80211 snd_compress snd_hdmi_lpe=
_audio ac97_bus hid_sensor_accel_3d snd_pcm_dmaengine hid_sensor_gyro_3d hi=
d_sensor_trigger industrialio_triggered_buffer kfifo_buf hid_sensor_iio_com=
mon processor_thermal_device industrialio cfg80211 snd_pcm snd_seq intel_ra=
pl_common atomisp(C+) libarc4 intel_soc_dts_iosf cros_ec_ishtp intel_xhci_u=
sb_role_switch mei_txe cros_ec videobuf_vmalloc mei roles atomisp_ov2680(C)=
 videobuf_core snd_seq_device snd_timer spi_pxa2xx_platform videodev snd mc=
 dw_dmac intel_hid dw_dmac_core 8250_dw soundcore int3406_thermal int3400_t=
hermal intel_int0002_vgpio acpi_pad acpi_thermal_rel soc_button_array int34=
03_thermal int340x_thermal_zone mac_hid sch_fq_codel parport_pc ppdev lp pa=
rport ip_tables x_tables autofs4 hid_sensor_custom hid_sensor_hub intel_ish=
tp_loader intel_ishtp_hid crct10dif_pclmul crc32_pclmul ghash_clmulni_intel=
 i915 mmc_block i2c_algo_bit
[    9.698885]  aesni_intel crypto_simd drm_kms_helper cryptd syscopyarea s=
ysfillrect glue_helper sysimgblt fb_sys_fops cec intel_ish_ipc drm lpc_ich =
intel_ishtp hid_asus intel_soc_pmic_chtdc_ti asus_wmi i2c_hid sparse_keymap=
 sdhci_acpi wmi video sdhci hid_generic usbhid hid
[    9.736699] CPU: 3 PID: 523 Comm: systemd-udevd Tainted: G         C    =
    5.7.0-rc1+ #2
[    9.741309] Hardware name: ASUSTeK COMPUTER INC. T101HA/T101HA, BIOS T10=
1HA.305 01/24/2018
[    9.745962] RIP: 0010:cpu_latency_qos_update_request+0x3a/0xb0
[    9.750615] Code: 89 e5 41 55 41 54 41 89 f4 53 48 89 fb 48 81 7f 28 e0 =
7f c6 9e 74 1c 48 c7 c6 60 f3 65 9e 48 c7 c7 e8 a9 99 9e e8 b2 a6 f9 ff <0f=
> 0b 5b 41 5c 41 5d 5d c3 0f 1f 44 00 00 44 3b 23 74 ef 44 89 e2
[    9.760065] RSP: 0018:ffffa865404f39c0 EFLAGS: 00010282
[    9.764734] RAX: 0000000000000000 RBX: ffff9d2aefc84350 RCX: 00000000000=
00000
[    9.769435] RDX: ffff9d2afbfa97c0 RSI: ffff9d2afbf99808 RDI: ffff9d2afbf=
99808
[    9.774125] RBP: ffffa865404f39d8 R08: 0000000000000304 R09: 0000000000a=
aaaaa
[    9.778804] R10: 0000000000000000 R11: 0000000000000001 R12: 00000000fff=
fffff
[    9.783491] R13: ffff9d2afb4640b0 R14: ffffffffc07ecf20 R15: 00000000910=
00000
[    9.788187] FS:  00007efe67ff8880(0000) GS:ffff9d2afbf80000(0000) knlGS:=
0000000000000000
[    9.792864] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    9.797482] CR2: 00007ffc6424bdc8 CR3: 0000000178998000 CR4: 00000000001=
006e0
[    9.802126] Call Trace:
[    9.806775]  atomisp_pci_probe.cold.19+0x15f/0x116f [atomisp]
[    9.811441]  local_pci_probe+0x47/0x80
[    9.816085]  pci_device_probe+0xff/0x1b0
[    9.820706]  really_probe+0x1c8/0x3e0
[    9.825247]  driver_probe_device+0xd9/0x120
[    9.829769]  device_driver_attach+0x58/0x60
[    9.834294]  __driver_attach+0x8f/0x150
[    9.838782]  ? device_driver_attach+0x60/0x60
[    9.843205]  ? device_driver_attach+0x60/0x60
[    9.847634]  bus_for_each_dev+0x79/0xc0
[    9.852033]  ? kmem_cache_alloc_trace+0x167/0x230
[    9.856462]  driver_attach+0x1e/0x20

Well - It did more things than before. But my fear is that we really depend=
 on the rev b firmware, which is very difficult to get hold of :-(.

>=20
> That's because it didn't load the firmware.
>=20
> Thanks,
> Mauro

with kind regards,
Patrik


--MP_/HYtGjRpJMSPfX0trXlgtbLq
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=dmesg.01.05.2020-atomisp.txt.tar.gz

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
+tSnPv1/S/8L8fnYgABoAQA=

--MP_/HYtGjRpJMSPfX0trXlgtbLq--
