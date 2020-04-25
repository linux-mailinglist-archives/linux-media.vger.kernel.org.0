Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5EC51B8620
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2020 13:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgDYLXC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 07:23:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:43022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbgDYLXB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 07:23:01 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 19D3920714;
        Sat, 25 Apr 2020 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587813779;
        bh=C4DLuislGbzWwFPWwzmyYDnKsV5iDV0aPRwGT9mEalU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nHYizWbX2pcJjRoMGAP1jE/iiujcHYXPQ6nGR7OHBUXjJhUx5ESD7HHW1ITqfMSrt
         T3KFrFJajqYheD/xerubXAuPqah8YC5TGBIFn5zKiKbVZzcM+EIOHYEDqYggTkJn7m
         u8juYeNaF6VOIYPJfVBP1egenGVnpa7b2bWGpjq8=
Date:   Sat, 25 Apr 2020 13:22:55 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200425132255.4bf872b2@coco.lan>
In-Reply-To: <682558b0-a2cf-9fe2-6e54-20462ecccb5d@gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <20200418172549.7cca07a7@coco.lan>
        <20200418172654.74a1eeea@coco.lan>
        <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
        <20200420013109.65babb54@coco.lan>
        <e45de3ea-4b5c-f2d0-0844-1233ca15a939@gmail.com>
        <eb83f789-9595-55f0-d922-bab00ae85cff@gmail.com>
        <20200420224750.28c0181d@coco.lan>
        <dd8ab5df-31c7-f009-36e4-ca4fd0605e97@gmail.com>
        <20200422211344.2ec3d93e@coco.lan>
        <23b3a078-2a9a-5f50-a35e-9f40f5aa8a6e@gmail.com>
        <86413836-e4b5-cb53-3ac0-1764c693ec7b@gmail.com>
        <682558b0-a2cf-9fe2-6e54-20462ecccb5d@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Patrik,

Em Fri, 24 Apr 2020 12:07:30 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On 24.04.20 11:10, Patrik Gfeller wrote:
> >
> > On 24.04.20 10:52, Patrik Gfeller wrote: =20
> >>
> >> On 22.04.20 21:13, Mauro Carvalho Chehab wrote: =20
> >>> Em Wed, 22 Apr 2020 19:56:56 +0200
> >>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >>> =20
> >>>> On 20.04.20 22:47, Mauro Carvalho Chehab wrote: =20
> >>>>> Em Mon, 20 Apr 2020 20:27:25 +0200
> >>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu: =20
> >>>>>> Me again ... sorry to ask such a basic question, but I can't get=20
> >>>>>> your
> >>>>>> modified source code. I get the following error:
> >>>>>> =C2=A0 =C2=A0=C2=A0 > git clone https://git.linuxtv.org/mchehab/ex=
perimental.git/
> >>>>>> Cloning into 'experimental'...
> >>>>>> warning: adding alternate object store:
> >>>>>> https://git.linuxtv.org/git/linux.git/
> >>>>>> warning: adding alternate object store:
> >>>>>> https://git.linuxtv.org/git/media_tree.git/
> >>>>>> warning: adding alternate object store:
> >>>>>> https://git.linuxtv.org/git/linux.git/
> >>>>>> error: Unable to find fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f und=
er
> >>>>>> https://git.linuxtv.org/mchehab/experimental.git
> >>>>>> Cannot obtain needed object fc8670d1f72b746ff3a5fe441f1fca4c4dba0e=
6f
> >>>>>> while processing commit 6d80bfc14608f4bb5514b79721d30b486f50c987.
> >>>>>> error: fetch failed.
> >>>>>>
> >>>>>> Do I use the wrong command? =20
> >>>>> Better to use git:// url:
> >>>>>
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0git clone git://git.linuxtv.org/mchehab/exp=
erimental.git/ =20
> >>>> I was able to download and compile the code. I installed the kernel=
=20
> >>>> and
> >>>> tried to boot; unfortunately it hangs with the message "Loading=20
> >>>> initial
> >>>> ramdisk ..." - after I start the old kernel I check kern.log and=20
> >>>> syslog
> >>>> - but I do not see entries from the failed boot attempt. I'll read=20
> >>>> into
> >>>> the topic and try around. This will take some time ... so there=20
> >>>> will be
> >>>> a dealy, but it's not that I do not care or lacking interest, I just
> >>>> first have to sort this out. =20
> >>> Well, try to build it first without the atomisp driver. This would=20
> >>> allow
> >>> you to see what's going on. =20
> >>
> >> I was able to solve the problem I had with the ramdisk - I had to=20
> >> strip the kernel modules, probably the ramdisk file was too big.
> >>
> >> It is possible to boot with the atomisp driver, but I can not see the=
=20
> >> camera yet - but maybe that's due to missing firmware, as there were=20
> >> warnings when I installed the kernel that firmware files are missing. =
=20
> I've added the missing firmware files and now I do not have warnings=20
> when I create the ramdisk. Unfortunately it makes no difference - the=20
> device does not work yet (dmesg looks the same).
> >>
> >> The following I found in dmesg:
> >>
> >> [=C2=A0=C2=A0=C2=A0 9.331011] kernel: atomisp_ov2680: module is from t=
he staging=20
> >> directory, the quality is unknown, you have been warned.
> >> [=C2=A0=C2=A0=C2=A0 9.402456] kernel: ov2680 i2c-OVTI2680:00: gmin: in=
itializing=20
> >> atomisp module subdev data.PMIC ID 1
> >> [=C2=A0=C2=A0=C2=A0 9.421113] kernel: acpi OVTI2680:00: Failed to find=
 gmin variable=20
> >> OVTI2680:00_CamClk
> >> [=C2=A0=C2=A0=C2=A0 9.433478] kernel: acpi OVTI2680:00: Failed to find=
 gmin variable=20
> >> OVTI2680:00_ClkSrc
> >> [=C2=A0=C2=A0=C2=A0 9.443146] kernel: acpi OVTI2680:00: Failed to find=
 gmin variable=20
> >> OVTI2680:00_CsiPort
> >> [=C2=A0=C2=A0=C2=A0 9.456677] kernel: acpi OVTI2680:00: Failed to find=
 gmin variable=20
> >> OVTI2680:00_CsiLanes
> >> [=C2=A0=C2=A0=C2=A0 9.479411] kernel: ov2680 i2c-OVTI2680:00: supply V=
1P8SX not=20
> >> found, using dummy regulator
> >> [=C2=A0=C2=A0=C2=A0 ...
> >> [=C2=A0=C2=A0=C2=A0 9.510282] kernel: ov2680 i2c-OVTI2680:00: supply V=
2P8SX not=20
> >> found, using dummy regulator
> >> [=C2=A0=C2=A0=C2=A0 ...
> >> [=C2=A0=C2=A0=C2=A0 9.532284] kernel: ov2680 i2c-OVTI2680:00: supply V=
1P2A not=20
> >> found, using dummy regulator
> >> [=C2=A0=C2=A0=C2=A0 9.536200] kernel: ov2680 i2c-OVTI2680:00: supply V=
PROG4B not=20
> >> found, using dummy regulator
> >> [=C2=A0=C2=A0 ...'
> >> [=C2=A0=C2=A0=C2=A0 9.592064] kernel: ov2680 i2c-OVTI2680:00: unable t=
o set PMC rate 1
> >> [=C2=A0=C2=A0=C2=A0 9.623628] kernel: ov2680 i2c-OVTI2680:00: camera p=
data: port: 0=20
> >> lanes: 1 order: 00000002
> >> [=C2=A0=C2=A0=C2=A0 9.628258] kernel: ov2680 i2c-OVTI2680:00: sensor_r=
evision id =3D=20
> >> 0x2680, rev=3D 0
> >> [=C2=A0=C2=A0=C2=A0 9.636582] kernel: ov2680 i2c-OVTI2680:00: register=
 atomisp i2c=20
> >> module type 1
> >>
> >> The first signs of live :-) ... I'll try to find the firmware files=20
> >> to see if it makes a difference. =20

Atomisp driver uses ACPI to detect the camera configuration. As you
can see at drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:

	static const struct acpi_device_id ov2680_acpi_match[] =3D {
	        {"XXOV2680"},
	        {"OVTI2680"},
	        {},
	};
	MODULE_DEVICE_TABLE(acpi, ov2680_acpi_match);

The regulator data is parsed at
drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:

        if (pmic_id =3D=3D PMIC_REGULATOR) {
                gmin_subdevs[i].v1p8_reg =3D regulator_get(dev, "V1P8SX");
                gmin_subdevs[i].v2p8_reg =3D regulator_get(dev, "V2P8SX");
                gmin_subdevs[i].v1p2_reg =3D regulator_get(dev, "V1P2A");
                gmin_subdevs[i].v2p8_vcm_reg =3D regulator_get(dev, "VPROG4=
B");

                /* Note: ideally we would initialize v[12]p8_on to the
                 * output of regulator_is_enabled(), but sadly that
                 * API is broken with the current drivers, returning
                 * "1" for a regulator that will then emit a
                 * "unbalanced disable" WARNing if we try to disable
                 * it.
                 */
        }

There are two things that could be the cause of this issue:

1) Some patch could have broken support for it.

Doing a:

	git diff a49d25364dfb drivers/staging/media/atomisp/platform/intel-mid/ato=
misp_gmin_platform.c

will allow you to check the changes on this file.

2) Maybe recent BIOSes may have changed the names of the ACPI variables.

For instance, from the code, the driver should be seeking for those
variables for OV2680 (and several others that seem to be common among
multiple combinations):

	XXOV2680:00_CsiPort
	XXOV2680:00_CsiLanes
	XXOV2680:00_CamClk

It would be possible, that, on a modern BIOS, such vars were, for example,
renamed to 'XXOV2680_V2*'.

-

In any case, I guess the next step is to use some ACPI dump facility to che=
ck
how your BIOS is exporting camera-related data[1].

If the vars are the same, then there's a bug (condition 1) above. If
the vars are different, then some vars were added or renamed (condition 2).

With such information, you should be able to write a patch to
atomisp_gmin_platform.c adding support for the new way. Please notice that,
in the case of renames, the patch should keep support to the old way, as
otherwise support for other older hardware would break.

Using the file you sent, I decoded the DTST table and paste the relevant
parts for this camera, using:

	$ acpixtract /tmp/dmp/acpidump.txt=20
	$ iasl -d dsdt.dat

Now, we need to compare what it provides with what the code expects.
On a quick check, it seems that it provides those info about the sensor:


                    Local0 =3D Package (0x12)
                        {
                            "CamId",=20
                            "ov2680",=20
                            "CamType",=20
                            "1",=20
                            "CsiPort",=20
                            "0",=20
                            "CsiLanes",=20
                            "1",=20
                            "CsiFmt",=20
                            "15",=20
                            "CsiBayer",=20
                            "0",=20
                            "CamClk",=20
                            "1",=20
                            "Regulator1p8v",=20
                            "0",=20
                            "Regulator2p8v",=20
                            "0"
                        }

The regulator code seems to be expecting something different:

                gmin_subdevs[i].v1p8_reg =3D regulator_get(dev, "V1P8SX");
                gmin_subdevs[i].v2p8_reg =3D regulator_get(dev, "V2P8SX");
                gmin_subdevs[i].v1p2_reg =3D regulator_get(dev, "V1P2A");
                gmin_subdevs[i].v2p8_vcm_reg =3D regulator_get(dev, "VPROG4=
B");

Maybe if we add something like:

	if (IS_ERR(gmin_subdevs[i].v1p8_reg))
		gmin_subdevs[i].v1p8_reg =3D regulator_get(dev, "Regulator1p8v");

	if (IS_ERR(gmin_subdevs[i].v2p8_reg))
		gmin_subdevs[i].v2p8_reg =3D regulator_get(dev, "Regulator2p8v");

It would be able to properly initialize the regulators.

[1] Please take a look on this article:

	https://blog.fpmurphy.com/2014/12/decompiling-acpi-tables.html

    It explains how to transform an ACPI table dump into something useful.

    Basically, ACPI contains some code that the OSes run in order to get
    information about some devices.=20

Thanks,
Mauro

        Device (CAM1)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "OVTI2680")  // _HID: Hardware ID
            Name (_CID, "OVTI2680")  // _CID: Compatible ID
            Name (_SUB, "13A01043")  // _SUB: Subsystem ID
            Name (_DDN, "OV2680")  // _DDN: DOS Device Name
            Name (_UID, One)  // _UID: Unique ID
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                I2C7,=20
                ^^I2C7.PMI2
            })
            Name (_PR0, Package (0x03)  // _PR0: Power Resources for D0
            {
                P28T,=20
                P18D,=20
                CLK4
            })
            Name (PLDB, Package (0x01)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,  // ........
                    /* 0008 */  0x61, 0x0C, 0x00, 0x00, 0x03, 0x00, 0x00, 0=
x00,  // a.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                     =
      // ....
                }
            })
            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Dev=
ice
            {
                Return (PLDB) /* \_SB_.PCI0.I2C3.CAM1.PLDB */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Sett=
ings
            {
                Name (SBUF, ResourceTemplate ()
                {
                    GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestr=
ictionOutputOnly,
                        "\\_SB.GPO1", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0037
                        }
                    I2cSerialBusV2 (0x0036, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.PCI0.I2C3",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (SBUF) /* \_SB_.PCI0.I2C3.CAM1._CRS.SBUF */
            }

            Name (C1CD, Buffer (0x0220){})
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 =3D=3D ToUUID ("dc2f6c4f-045b-4f1d-97b9-882a6860a=
4be")))
                {
                    Local0 =3D Package (0x12)
                        {
                            "CamId",=20
                            "ov2680",=20
                            "CamType",=20
                            "1",=20
                            "CsiPort",=20
                            "0",=20
                            "CsiLanes",=20
                            "1",=20
                            "CsiFmt",=20
                            "15",=20
                            "CsiBayer",=20
                            "0",=20
                            "CamClk",=20
                            "1",=20
                            "Regulator1p8v",=20
                            "0",=20
                            "Regulator2p8v",=20
                            "0"
                        }
                    Return (Local0)
                }

                If ((Arg0 =3D=3D ToUUID ("377ba76a-f390-4aff-ab38-9b1bf33a3=
015")))
                {
                    Return ("OVTI2680")
                }

                If ((Arg0 =3D=3D ToUUID ("3c62aaaa-d8e0-401a-84c3-fc05656fa=
28c")))
                {
                    Return ("OV2680")
                }

                If ((Arg0 =3D=3D ToUUID ("822ace8f-2814-4174-a56b-5f029fe07=
9ee")))
                {
                    Return ("CIFF2192")
                }

                If ((Arg0 =3D=3D ToUUID ("2959512a-028c-4646-b73d-4d1b5672f=
ad8")))
                {
                    If ((BDID =3D=3D 0x04))
                    {
                        If ((FBID =3D=3D 0x02))
                        {
                            Return ("INTEL_FFRD")
                        }

                        If ((FBID =3D=3D 0x03))
                        {
                            Return ("INTEL_FFRD")
                        }
                    }

                    Return ("INTEL_RVP")
                }

                If ((Arg0 =3D=3D ToUUID ("918ab242-c37c-450a-9d0f-f47ab97c3=
dea")))
                {
                    Return (0x0101)
                }

                If ((Arg0 =3D=3D ToUUID ("ea3b7bd8-e09b-4239-ad6e-ed525f3f2=
6ab")))
                {
                    Return (0x1011)
                }

                If ((Arg0 =3D=3D ToUUID ("b65ac492-9e30-4d60-b5b2-f497c790d=
9cf")))
                {
                    Return (Zero)
                }

                If ((Arg0 =3D=3D ToUUID ("e770ab0f-2644-4bab-8628-d62f1683f=
b9d")))
                {
                    Return (0x05)
                }

                If ((Arg0 =3D=3D ToUUID ("1ea54ab2-cd84-48cc-9dd4-7f594ec3b=
015")))
                {
                    Return (0x02)
                }

                If ((Arg0 =3D=3D ToUUID ("8dbe2651-70c1-4c6f-ac87-a37cb46e4=
af6")))
                {
                    Return (One)
                }

                If ((Arg0 =3D=3D ToUUID ("75c9a639-5c8a-4a00-9f48-a9c3b5da7=
89f")))
                {
                    Return (Zero)
                }

                If ((Arg0 =3D=3D ToUUID ("2fa9bb94-9c5d-4aeb-8e6e-27434f81e=
3d3")))
                {
                    Return ("CHT_CR")
                }

                If ((Arg0 =3D=3D ToUUID ("647a6ca2-8b29-49ac-8806-d58b3d2d3=
ef5")))
                {
                    Return ("FFD")
                }

                If ((Arg0 =3D=3D ToUUID ("a6e922a1-f7b3-4399-b56a-406ae4168=
43b")))
                {
                    Return ("CHV")
                }

                If ((Arg0 =3D=3D ToUUID ("5960313b-0ab0-4940-8840-2cafa420c=
015")))
                {
                    Return ("ASUS")
                }

                If ((Arg0 =3D=3D ToUUID ("26257549-9271-4ca4-bb43-c4899d5a4=
881")))
                {
                    If ((Arg2 =3D=3D One))
                    {
                        Return (One)
                    }

                    If ((Arg2 =3D=3D 0x02))
                    {
                        Return (0x03003600)
                    }
                }

                If ((Arg0 =3D=3D ToUUID ("79234640-9e10-4fea-a5c1-b5aa8b197=
56f")))
                {
                    If ((Arg2 =3D=3D One))
                    {
                        Return (One)
                    }

                    If ((Arg2 =3D=3D 0x02))
                    {
                        Return (0x01003701)
                    }
                }

                If ((Arg0 =3D=3D ToUUID ("e9914eb6-592b-4228-ba5d-a0994bcb2=
0dd")))
                {
                    Local0 =3D Zero
                    While ((Local0 < 0x0220))
                    {
                        C1CD [Local0] =3D MEMB ((CA10 + Local0))
                        Local0++
                    }

                    Return (C1CD) /* \_SB_.PCI0.I2C3.CAM1.C1CD */
                }

                If ((Arg0 =3D=3D ToUUID ("f486d39f-d657-484b-84a6-42a565712=
b92")))
                {
                    Return (Buffer (0x20)
                    {
                        /* 0000 */  0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x0=
5, 0x00,  // ........
                        /* 0008 */  0x05, 0x01, 0x03, 0x03, 0x00, 0x00, 0x0=
0, 0x00,  // ........
                        /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0, 0x00,  // ........
                        /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0, 0x00   // ........
                    })
                }

                Return (Zero)
            }
        }





