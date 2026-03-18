Return-Path: <linux-media+bounces-56168-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEzhJJDwuWkYPwIAu9opvQ
	(envelope-from <linux-media+bounces-56168-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 01:23:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E82F62B49EE
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 01:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDD6D3074E33
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 00:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7211C861A;
	Wed, 18 Mar 2026 00:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyMotNHI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E751149C6F
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 00:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773793415; cv=pass; b=WVNPFW+jCy+JazpxC7wDPR6oLD3TAcLPoPnssdZkjWDGJIVKIiY+WSwHKZJwtBMv3LZoz43vqfqszM9kglRLNXW6x/56xE5MZwqO2csX+UibCRzf/F40UA0OiRZt4YMGa52SIDNmwGAOzaLjiazjELBz+NKKrr6WKB4WpSVMJlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773793415; c=relaxed/simple;
	bh=fH9hxrYkkBwoNL3JEd4c44eVqqNCxcr3Vs41TeweRvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdEVwfi2FACK5cW5q6wgscYNv1zwtqaxtld4UrPwlH4/k++GtIneAJ0ye7gowsZJynfMwcuIGMN/aX+QetlGP8dCrFVtdarF9jF8dPQ2+x3JeXBabUUxc7Vicn3bRCCjTG6P+o0nUwop9/sFi/ad9vdrXBsnOUiAeY14DhoJEMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyMotNHI; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-128e3125372so359949c88.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 17:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773793413; cv=none;
        d=google.com; s=arc-20240605;
        b=QU+KgQrDedwyGiXYT3nVyniQrsKFzP/rc4jC5UfH5VJba4qwDUcWwg6bSN3JriifB+
         plrS7xrnYd8rMu8pOE0d0ImKxId2GeEAZfrrX6iun2qJpjyBwtZL6PaSOLUGUFOvH8gz
         pMHkZsz3SZgAP11zvX249+0mR/YzVepK4U70B7JUB51Q0lPGlS5v8/SppZoO1zUi/CHn
         mWIlD8oNw/xQTNxXDI9duu8B6FRRA3b53+8a8gxIgm6X2een1T3gb6vU6TfDPSIKZJTK
         bMrvP21cEtYRbSBMeoSibNQ38J6Rdv094UZcLq5Wn02mkrQsFilzI0L6i2GpYAE/yi+R
         blLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AAISFoahTk0sWcyrKll4Zv46ajxfZHUbummn/P2IUl8=;
        fh=SUHx3lxdVvcKTVR88pDt0PHq6iishJqJW0D71/wP8Fc=;
        b=i01YBwBEypABoyH20x7T7FC0c+wEY6MSHHhOZflFaZsKbNBxkyrplqRSesKgtovGO1
         GRYyr+C2QLvxeo//qH8GrLgAHD1Tc/hi0WdOnwttZWsZ8PEOcNDqvj9gz/Q468td5Fxl
         53T4NnhWVDyEFnPoWfWXN37spdhR/3x8N2JLx7hyBggietCDJHXB+ZNdMWPOla9pXLyY
         xLHL+UM0T3n//yOcbhfkrGYgor89O2i09RosEYUbh7GvNx1+1zMhfjXwg/I1OOgQnGb6
         ThXeTFYKOAd29oTKiXN16mA/n7CK6qbDMfBVXMf4qkgjdq1yurZzbEdhVanQZFzVwdTe
         QR8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773793413; x=1774398213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAISFoahTk0sWcyrKll4Zv46ajxfZHUbummn/P2IUl8=;
        b=OyMotNHI6+lWXdJc3FJhFYTQOsCn3tWRBgNYLFWpnp3N06X+wGSrQWkDzCrfoUX64K
         OsiA2oX3PpugStnZSNxqgBU7+/fTd5Wc1MyIxGDi+lDZXmKIcNQNEueFjNdYAsfeRnFC
         rgAMkwqqgLnA3RHnR3zuHvbZv/HNA/54jSdcD8+GZkMt4g5iw6/QYqhMUjr8ZMQShfWg
         iQgTXOwTF2XwMwyjWblPIfhVkNT9mJJcqG8/k8kz/qvTb/p3qKtXvSggLSZFJ81vJjc4
         a5bgJHSprnJe/MErvO4xL8heiUD4qDrWV+9hk1LHZti8E6Apq6gW7/zeHdyUOSpcY+1q
         21hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773793413; x=1774398213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AAISFoahTk0sWcyrKll4Zv46ajxfZHUbummn/P2IUl8=;
        b=YWolGdT3e3sQQuCUxFmgN10som9HIysLdiisdd/bC6SvYXJdHxw8XRuWf4+bAQFIvy
         Er++twycIvA79RJBDJlUUIlpcbNaeVeXzj43rKfLa6UUv8mLGft3+keh5pxxi3S7YdYw
         mEj6nCwonpefCVuqvtQcJkhavsABJ5dUBQ6JUzZvSHbaO6jJictO6c59YNQREX7oWzFX
         0hIb+p1/9HASUeQhLrYUO/w/qkr8zmEhYtesu9R3Mi3VJnh0jzwQwDBQCJlKsSXQp/G9
         QSO1n3nu66FHd9dK8Xxsmyo9wN1hrA7FL7DzU888DgYdJiE/5jWRWKoY8J/2JylHTdnG
         dyXQ==
X-Gm-Message-State: AOJu0YzWVuuTaueYUxaQg3vgIYoxOyGQKMxC56G61kVdqJc5NjgFyNtD
	hyPbDzTUzbGRFhL5Z1cBkYMYniSP/GFcbiqEVL3wnfd3lm09+Wmc3ACkDePdjHtnP9Ai8FQ9vVH
	cweWTgNAon7v9uHQWyw5IJSB+/T71dHtZdIVU
X-Gm-Gg: ATEYQzwpy8+nfAm/J9QtTbn3QWPDRs4L5NjwEFKSyc96pwl2mr9Qm/aLZkmOsTq97Mr
	YU5pHK/ar3jg3mbvQQvp8arptvnwMumwnEHeyQd2DoZV9TKmuU5i0JZwVIaktqYY0mbq95Xv+4N
	eyuxl7KvH2UIIjENcMiun9iavKfYA7Ehw+Dq4Mt3ebCj0kHMLzZXl/1n7UQBI+s8TpkKzPimR8u
	YIyoSDi3u1pgyblkLr3+p6CD1PSlRPYSCsiNNd1l3yJDjprMC8euxa/UPxCFSB3tBRjuI2LEQvy
	oYYJUg==
X-Received: by 2002:a05:7022:2209:b0:11d:fbf1:1e27 with SMTP id
 a92af1059eb24-12991021ac1mr818488c88.19.1773793412989; Tue, 17 Mar 2026
 17:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
 <CAMSzxxScAW+sR6OzXt4NxOFx=Q0LDFko9d_xY4zoROYOZMzzdA@mail.gmail.com>
 <12a06e89-eb67-4be7-8b0a-9ea71ab4cf7c@kernel.org> <dcbdb336-3598-42d1-af23-bdfccc3210bf@kernel.org>
 <1860c0a2-e44a-477b-bc73-2bee2071bc73@kernel.org>
In-Reply-To: <1860c0a2-e44a-477b-bc73-2bee2071bc73@kernel.org>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Tue, 17 Mar 2026 20:23:20 -0400
X-Gm-Features: AaiRm50q5LCmMNyPYAD-hlVHp6VW9dGmNXCJ56Fg2oxshSNHyXZcUiU8l9BVvn0
Message-ID: <CAMSzxxRSORBb3N53iX6=anaJStu4ypOi6DQmme0xb9d+4HidsQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] media: pci: AVMatrix HWS capture driver
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56168-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,acasis.com:url,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: E82F62B49EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

 Hi Hans,

 Thanks for the reminder!

 I=E2=80=99ve now posted v2 here:
 https://lore.kernel.org/linux-media/20260318001056.465071-1-hoff.benjamin.=
k@gmail.com/T/#u

 This addresses the issues you called out from the media CI run.

 Thanks,
 Ben


On Tue, Mar 17, 2026 at 12:01=E2=80=AFPM Hans Verkuil <hverkuil+cisco@kerne=
l.org> wrote:
>
> On 09/02/2026 13:53, Hans Verkuil wrote:
> > Hi Ben,
> >
> > I ran the patches through our media CI and I got a number of failures:
> >
> > https://linux-media.pages.freedesktop.org/-/users/hverkuil/-/jobs/92826=
923/artifacts/report.htm
> >
> > Looking at it it is mostly missing 'static' for several functions, and
> > some unused variables.
> >
> > Can you take a look at these issues and post a v2?
>
> Ping?
>
> Regards,
>
>         Hans
>
> >
> > Thank you!
> >
> > Regards,
> >
> >       Hans
> >
> >
> > On 09/02/2026 12:47, Hans Verkuil wrote:
> >> On 08/02/2026 01:35, Ben Hoff wrote:
> >>> Hi all,
> >>>
> >>> Just following up on this new driver patch sent Jan 11.
> >>>
> >>> Happy to address review comments or adjust the approach if needed.
> >>>
> >>> I=E2=80=99m happy to maintain this driver going forward.
> >>
> >> It got lost in the flood of patches. Thank you for reminding me.
> >>
> >> I've delegated it to myself in patchwork, so I hope I'll have a review
> >> for you with two weeks tops. Ping me if you didn't hear from me after
> >> two weeks.
> >>
> >> Regards,
> >>
> >>      Hans
> >>
> >>>
> >>> Thanks,
> >>> Ben
> >>>
> >>> On Sun, Jan 11, 2026 at 9:24=E2=80=AFPM Ben Hoff <hoff.benjamin.k@gma=
il.com> wrote:
> >>>>
> >>>> Hi all,
> >>>>
> >>>> This series introduces an in-tree AVMatrix HWS PCIe capture driver.
> >>>> The driver supports up to four HDMI inputs and exposes the video cap=
ture
> >>>> path through V4L2. Audio support is intentionally omitted in this
> >>>> revision so the series can focus on the video pipeline and PCIe glue=
.
> >>>>
> >>>> Major pieces include:
> >>>>   - PCI glue with capability discovery, BAR setup, interrupt handlin=
g,
> >>>>     and power-management hooks.
> >>>>   - A vb2-dma-contig based capture pipeline with DV timings support,
> >>>>     per-channel controls, two-buffer management, and loss-of-signal
> >>>>     recovery.
> >>>>
> >>>> The baseline GPL out-of-tree driver is available at:
> >>>>   https://github.com/benhoff/hws/tree/baseline
> >>>> A vendor driver bundle is available at:
> >>>>   https://www.acasis.com/pages/acasis-product-drivers
> >>>> The vendor is not involved in this upstreaming effort.
> >>>>
> >>>> Prior RFC posting: https://lore.kernel.org/lkml/20251027195638.48112=
9-1-hoff.benjamin.k@gmail.com/
> >>>>
> >>>> Current status / open items:
> >>>>   - `v4l2-compliance` passes for each video node, and I have exercis=
ed
> >>>>     basic capture in OBS and run this driver in a steady state mode
> >>>>     daily
> >>>>
> >>>> v4l2-compliance (from v4l-utils git, v4l2-compliance 1.32.0):
> >>>> v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
> >>>>
> >>>> Compliance test for HwsCapture device /dev/video1:
> >>>>
> >>>> Driver Info:
> >>>>         Driver name      : HwsCapture
> >>>>         Card type        : AVMatrix HWS Capture 2
> >>>>         Bus info         : PCI:0000:17:00.0
> >>>>         Driver version   : 6.18.3
> >>>>         Capabilities     : 0x84200001
> >>>>                 Video Capture
> >>>>                 Streaming
> >>>>                 Extended Pix Format
> >>>>                 Device Capabilities
> >>>>         Device Caps      : 0x04200001
> >>>>                 Video Capture
> >>>>                 Streaming
> >>>>                 Extended Pix Format
> >>>>
> >>>> Required ioctls:
> >>>>         test VIDIOC_QUERYCAP: OK
> >>>>         test invalid ioctls: OK
> >>>>
> >>>> Allow for multiple opens:
> >>>>         test second /dev/video1 open: OK
> >>>>         test VIDIOC_QUERYCAP: OK
> >>>>         test VIDIOC_G/S_PRIORITY: OK
> >>>>         test for unlimited opens: OK
> >>>>
> >>>> Debug ioctls:
> >>>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >>>>         test VIDIOC_LOG_STATUS: OK
> >>>>
> >>>> Input ioctls:
> >>>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >>>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >>>>         test VIDIOC_G/S/ENUMINPUT: OK
> >>>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >>>>         Inputs: 1 Audio Inputs: 0 Tuners: 0
> >>>>
> >>>> Output ioctls:
> >>>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >>>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >>>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >>>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> >>>>
> >>>> Input/Output configuration ioctls:
> >>>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >>>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
> >>>>         test VIDIOC_DV_TIMINGS_CAP: OK
> >>>>         test VIDIOC_G/S_EDID: OK (Not Supported)
> >>>>
> >>>> Control ioctls (Input 0):
> >>>>                 info: checking v4l2_query_ext_ctrl of control 'User =
Controls' (0x00980001)
> >>>>                 info: checking v4l2_query_ext_ctrl of control 'Brigh=
tness' (0x00980900)
> >>>>                 info: checking v4l2_query_ext_ctrl of control 'Contr=
ast' (0x00980901)
> >>>>                 info: checking v4l2_query_ext_ctrl of control 'Satur=
ation' (0x00980902)
> >>>>                 info: checking v4l2_query_ext_ctrl of control 'Hue' =
(0x00980903)
> >>>>                 info: checking v4l2_query_ext_ctrl of control 'Brigh=
tness' (0x00980900)
> >>>>                 info: checking v4l2_query_ext_ctrl of control 'Contr=
ast' (0x00980901)
> >>>>                 info: checking v4l2_query_ext_ctrl of control 'Satur=
ation' (0x00980902)
> >>>>                 info: checking v4l2_query_ext_ctrl of control 'Hue' =
(0x00980903)
> >>>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >>>>         test VIDIOC_QUERYCTRL: OK
> >>>>                 info: checking control 'User Controls' (0x00980001)
> >>>>                 info: checking control 'Brightness' (0x00980900)
> >>>>                 info: checking control 'Contrast' (0x00980901)
> >>>>                 info: checking control 'Saturation' (0x00980902)
> >>>>                 info: checking control 'Hue' (0x00980903)
> >>>>         test VIDIOC_G/S_CTRL: OK
> >>>>                 info: checking extended control 'User Controls' (0x0=
0980001)
> >>>>                 info: checking extended control 'Brightness' (0x0098=
0900)
> >>>>                 info: checking extended control 'Contrast' (0x009809=
01)
> >>>>                 info: checking extended control 'Saturation' (0x0098=
0902)
> >>>>                 info: checking extended control 'Hue' (0x00980903)
> >>>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >>>>                 info: checking control event 'User Controls' (0x0098=
0001)
> >>>>                 info: checking control event 'Brightness' (0x0098090=
0)
> >>>>                 info: checking control event 'Contrast' (0x00980901)
> >>>>                 info: checking control event 'Saturation' (0x0098090=
2)
> >>>>                 info: checking control event 'Hue' (0x00980903)
> >>>>                 warn: v4l2-test-controls.cpp(1159): V4L2_CID_DV_RX_P=
OWER_PRESENT not found for input 0
> >>>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >>>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >>>>         Standard Controls: 5 Private Controls: 0
> >>>>
> >>>> Format ioctls (Input 0):
> >>>>                 info: found 1 formats for buftype 1
> >>>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >>>>                 warn: v4l2-test-formats.cpp(1485): S_PARM is support=
ed for buftype 1, but not for ENUM_FRAMEINTERVALS
> >>>>         test VIDIOC_G/S_PARM: OK
> >>>>         test VIDIOC_G_FBUF: OK (Not Supported)
> >>>>         test VIDIOC_G_FMT: OK
> >>>>         test VIDIOC_TRY_FMT: OK
> >>>>         test VIDIOC_S_FMT: OK
> >>>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >>>>         test Cropping: OK (Not Supported)
> >>>>         test Composing: OK (Not Supported)
> >>>>         test Scaling: OK
> >>>>
> >>>> Codec ioctls (Input 0):
> >>>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >>>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >>>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >>>>
> >>>> Buffer ioctls (Input 0):
> >>>>                 info: test buftype Video Capture
> >>>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >>>>         test CREATE_BUFS maximum buffers: OK
> >>>>         test VIDIOC_REMOVE_BUFS: OK
> >>>>         test VIDIOC_EXPBUF: OK
> >>>>         test Requests: OK (Not Supported)
> >>>>         test blocking wait: OK
> >>>>
> >>>> Test input 0:
> >>>>
> >>>> Stream using all formats:
> >>>>         test MMAP for Format YUYV, Frame Size 640x480:
> >>>>                 Stride 1280, Field None: OK
> >>>>                 Stride 1344, Field None: OK
> >>>>         test MMAP for Format YUYV, Frame Size 1920x1080:
> >>>>                 Stride 3840, Field None: OK
> >>>> Total for HwsCapture device /dev/video1: 51, Succeeded: 51, Failed: =
0, Warnings: 2
> >>>>
> >>>>
> >>>> Thanks for taking a look!
> >>>>
> >>>> Ben
> >>>>
> >>>> Ben Hoff (2):
> >>>>   media: pci: add AVMatrix HWS capture driver
> >>>>   MAINTAINERS: add entry for AVMatrix HWS driver
> >>>>
> >>>>  MAINTAINERS                            |    6 +
> >>>>  drivers/media/pci/Kconfig              |    1 +
> >>>>  drivers/media/pci/Makefile             |    1 +
> >>>>  drivers/media/pci/hws/Kconfig          |   12 +
> >>>>  drivers/media/pci/hws/Makefile         |    4 +
> >>>>  drivers/media/pci/hws/hws.h            |  175 +++
> >>>>  drivers/media/pci/hws/hws_irq.c        |  268 ++++
> >>>>  drivers/media/pci/hws/hws_irq.h        |   10 +
> >>>>  drivers/media/pci/hws/hws_pci.c        |  722 +++++++++++
> >>>>  drivers/media/pci/hws/hws_reg.h        |  144 +++
> >>>>  drivers/media/pci/hws/hws_v4l2_ioctl.c |  755 ++++++++++++
> >>>>  drivers/media/pci/hws/hws_v4l2_ioctl.h |   38 +
> >>>>  drivers/media/pci/hws/hws_video.c      | 1542 +++++++++++++++++++++=
+++
> >>>>  drivers/media/pci/hws/hws_video.h      |   29 +
> >>>>  14 files changed, 3707 insertions(+)
> >>>>  create mode 100644 drivers/media/pci/hws/Kconfig
> >>>>  create mode 100644 drivers/media/pci/hws/Makefile
> >>>>  create mode 100644 drivers/media/pci/hws/hws.h
> >>>>  create mode 100644 drivers/media/pci/hws/hws_irq.c
> >>>>  create mode 100644 drivers/media/pci/hws/hws_irq.h
> >>>>  create mode 100644 drivers/media/pci/hws/hws_pci.c
> >>>>  create mode 100644 drivers/media/pci/hws/hws_reg.h
> >>>>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
> >>>>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
> >>>>  create mode 100644 drivers/media/pci/hws/hws_video.c
> >>>>  create mode 100644 drivers/media/pci/hws/hws_video.h
> >>>>
> >>>> --
> >>>> 2.51.0
> >>>
> >>
> >>
> >
> >
>

