Return-Path: <linux-media+bounces-40805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0FB3261C
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 03:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D171AE427E
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 01:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BAB157A6B;
	Sat, 23 Aug 2025 01:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="R3/m9Or6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692CE13BC3F
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 01:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755911286; cv=none; b=qNYKoXFODJt9bbwXkignJNz+/ekty8XAru30qT8PLqa1WYOOEH4e2y6FDEZil7hpwBVqgAIH57ibw6vM1ksBvWBMzD0r9Q7DfzMPzZq/o5OcVLG8Xmv6hQccDtKo+1W1KSttOqYZgQ79HlEb+BDRDfUv2ZIlY6YBOwS0M2ZZiW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755911286; c=relaxed/simple;
	bh=lvhmupb3nsDVNP1cNP9FH0utwIw0UCx+9yQB02a9vn0=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=cKNOgEtAhZonS+sy6wEmkDiPffI+eHUiolWDzIu1Y3rJ8j3U38JQEjT1/xiCBVT1pT4JLmIcupfglIhw/ZAjQqbzwAVFTDu4Oi1gH48j/OsOzxSKRFd7BWqPzaAP/QfMg1sBZfyyAR6KZdGxey+bz5VI6bruDxGuoebx5BHXvKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch; spf=pass smtp.mailfrom=protonmail.ch; dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b=R3/m9Or6; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1755911280; x=1756170480;
	bh=MY5WfJ+QqH/y+yexewmqBgLf8Rf9PPhhPLF1j3iC69Y=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=R3/m9Or6tDvLiHWbHPgl82GXm+BedflPLviQKQUsTMB3liX/Jrj63XuFxbKmkdPm7
	 ZjSEiR2u27oMnvZ/cdX36Fi3wLUOCknOS6tHKrcFjoIZOCnEWjNMJ7aFhxbxEV7Z6g
	 CbBTxDHNDu1totzDTUQcV43fIl1Ps5IKf0MvSfNo9kyEYDXHBNPf5vs8+V85U2kQ7g
	 8YpZuauYjMMF/xdpMBDJm/tSkwp5yybvPoTZOa7kPezdYXmdiBwCz48P/c+6E+IIL2
	 EZJS+eb4YlMx98pyi33aW0XwF2CIF5PBVb6fUfpYXthGM7fvYi2EC4OG6cwJQMAD5K
	 5IfMkBTLoKqKA==
Date: Sat, 23 Aug 2025 01:07:57 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Edmund Laugasson <edmund.laugasson@protonmail.ch>
Subject: =?utf-8?Q?Bug_Report:_Internal_Cameras_Not_Detected_=E2=80=94_Missing_INT3472_`board=5Fdata`_for_HP_Elite_X2?=
Message-ID: <Le07tHa3FoWeOKsghoc7BxI10n1CGPNRwGwfySwbxx8eTjLHXfkA6YAeyPFsyo0FJoAZijYRE3FjvtqCybMS2wY3NwZvssMYXc4SPzjdU9o=@protonmail.ch>
Feedback-ID: 228665:user:proton
X-Pm-Message-ID: e05df1003d3bf12631d48a081aa16a55323d0890
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello!

Bug Report: Internal Cameras Not Detected =E2=80=94 Missing INT3472 `board_=
data` for HP Elite X2
---------------------------------------------------------------------------=
-------------

Summary:
Internal webcam on HP Elite X2 1012 G2 are not functional under Linux. The =
issue stems from the INT3472 power/clock controller lacking board-specific =
DMI descriptors (`board_data`), which prevents proper sensor connection (ov=
5670/ov7251) to the IPU3 pipeline (CIO2 =E2=86=92 IMGU). Consequently, came=
ras are not registered by `libcamera`, `v4l2-ctl`, or other userspace tools=
.

### 1. System Information

    DMI SysVendor: =C2=A0 =C2=A0 =C2=A0 HP

### 2. Relevant Logs (`dmesg`)

    int3472-tps68470 i2c-INT3472:05: TPS68470 REVID: 0x21

Interpretation:

-   INT3472 driver loaded but reports `-ENODEV: No board-data`, which means=
 the DMI lookup failed (model-specific data is missing).
   =20
-   As a result, sensor power rails default to =E2=80=9Cdummy regulator,=
=E2=80=9D meaning the sensor is not powered or linked, blocking pipeline se=
tup.
   =20

### 3. Media Topology Output (`media-ctl -p -d /dev/media0`)

    Media controller API version ...

Interpretation:
IPU3 bridge and subdevices are present, but sensor nodes (ov5670/ov7251) ar=
e missing. This confirms the camera pipeline is incomplete due to missing s=
ensor registration.

### 4. Affected Components and Use Cases

-   Kernel drivers:
   =20
    -   `drivers/platform/x86/intel/int3472.c` lacks a DMI table entry for =
this HP Elite X2 variant.
       =20
    -   IPU3 (`ipu3-cio2`, `ipu3-imgu`) and firmware are functional, but se=
nsor connectivity fails.
       =20
-   Libcamera / V4L2 Tools:
    Tools like `cam --list`, `libcamera`, `Cheese`, etc., do not detect any=
 cameras because the pipeline lacks the camera sensors.
   =20

### 5. Suggested Kernel Fix

Add a DMI descriptor for the HP Elite X2 into the INT3472 driver to enable =
proper sensor replication. For example:

    static const struct int3472_device_id hp_elite_x2_board_data[] =3D {

This should reside in `drivers/platform/x86/intel/int3472.c` alongside othe=
r DMI-based cases.

### 6. Additional Context & References

-   Similar issues have been reported in Launchpad for Ubuntu / Manjaro:
   =20
    > =E2=80=9CInternal webcams of my HP Elite X2 G2 work well in Windows b=
ut don=E2=80=99t work in Ubuntu 20.10 or Manjaro. Guvcview recognizes the C=
ameras as =E2=80=98Intel IPU3 CIO2=E2=80=99, but doesn=E2=80=99t show an im=
age.=E2=80=9D (https://bugs.launchpad.net/bugs/1913809, https://packages.de=
bian.org/changelog%3Alinux, https://bbs.archlinux.org/viewtopic.php?id=3D29=
7262&p=3D3)
   =20
-   Community notes:
    On Unix StackExchange, a user mentions that Intel IPU cameras require b=
oth libcamera and kernel sensor driver updates (i.e. including CIO2 bridge =
improvements). (https://unix.stackexchange.com/questions/581401/how-to-use-=
ipu3-cio-camera-in-linux)
   =20
-   The root cause (`-ENODEV: No board-data`) implies the lack of DMI entry=
 and architecture-level syscall.
   =20

### 7. Steps for Maintainers

1.  Confirm the device's DMI `sys_vendor`, `board_name`, etc.
   =20
2.  Add the entry into `int3472.c` with appropriate flags.
   =20
3.  Upstream and backport as needed.
   =20
4.  Notify distribution maintainers (Arch/Ubuntu/EndeavourOS) to include th=
is in kernel packages.
   =20

### Summary Table

Component

Status / Finding

=20

IPU3 (CIO2/IMGU)

Detected and functional

Firmware

Loaded successfully

INT3472 Driver

Loaded but fails DMI lookup (`No board-data`)

CMOS Sensors (ov5670/ov7251)

Not registered, sensors not part of pipeline

Result in userspace

No camera device appears (`cam --list` empty)

----
Thank you!
Edmund Laugasson

