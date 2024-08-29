Return-Path: <linux-media+bounces-17095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 833B2963CE0
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 105F01F25924
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 07:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126B117BB21;
	Thu, 29 Aug 2024 07:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjXtZbkc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D680014F130;
	Thu, 29 Aug 2024 07:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916494; cv=none; b=UUtY0m5FC2JSQefxILFqtgenufYeUI8rUe1Lw76qUUY5cXuOq1YCa/RfGSIAKzznAyhXWpPcO1wcUZXOAbI3hbDWSVBtuWJUEVlG9ANJBdOUeQ2Pvig2K6rZdC/aMy9/jVh0/uis9tRJMy5lnhqTx+tuKh2cQOcJwum8xldx8co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916494; c=relaxed/simple;
	bh=PQfIjE+PmdQrTQKQWcSQw+HFSJ0mOmQGSl+KTGzCNMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBnwya/dPMRLxNOzk9uGjFSA1GwxrGkel3wlzOu9RlbgSEFHKZiRd2HmrFl6duLygxxpCUI6qFgGFc4Y5Z4MLhzPe+cFNowYVH4FOpeNQ3hwqazGwzZWNae5D+VszjZWayKw3BnmLtuH1BUSx/EFuYRFRwjf03oHgoBmq3smP8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjXtZbkc; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-842f1dd60deso148673241.2;
        Thu, 29 Aug 2024 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724916492; x=1725521292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUZZF0VbqOXUJRA6E1h0X5ITJ42OUoUyo76011jYe0I=;
        b=kjXtZbkcM0RPHXoxZDTkl2O3jbAk9+UaqUS/DKUIfe1qrzurYVDx0HtYxsAgRf4d5n
         d3XWINQvxN3aHQev8qtH7rL6aYbOgHqEtNEeg7upTAV2w/08a0BuD1gM3oXq1OvWaqSD
         fNPLxnEBPxkbw3EXjtJ1bE8at+KaOmQptSV4G67xb5DgQn2MQJQLpnUSDRCCTdW37ne8
         3v4sFttpC0awKxHbpbxm05vRyiC6uRYRsWpwPchPz1fNoxMVgU98n3HkHr0yvAJ7MAEk
         6zHilnTMdV1VQCCrjOGolMDYxs7/QeUloDNC25M6vFX2LDFpe3V31VrZU0EbDyhsGNBV
         QzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724916492; x=1725521292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUZZF0VbqOXUJRA6E1h0X5ITJ42OUoUyo76011jYe0I=;
        b=c5JSBKwxI6lkba3Dbmzw2vPqgrc3dBJpA+6r+yZ8UZCW6Y66KkXRgH9UeXywMZHxuU
         vdWn3FIN/M6BbMlx3QbI6A2mOvQsXBF080f5M6wvnReNoHyJ4NfC1tU4bhImutgLG8GG
         EZoffHDeyROBo4+3bG3kurfJkTI74L09U4ZAkKDz1bzIBY5YuW3yPn9q8Ld9VnGAJZIg
         sMw7ENk125N2urNcDGPpBwIQCSxZSEBbJZsVJkTbW9vmoBRzMWkPkdpwkiU2zNIZ5t9w
         fRSkp8Ip9QXL+eViKG3Mz9WpHDHYWE3tGzsncgIVRuPXSUzJS7Bz9wwDc25zigVArT08
         O4qA==
X-Forwarded-Encrypted: i=1; AJvYcCUA2+QLuZ8Rw7S3zRvETcTuJmP9m4qSrub1vVV+IFvwYq7C2ISLYJt2iJc2lRegaMnK+OV8eds9kbH/3g==@vger.kernel.org, AJvYcCX+DdJ0BKtO0jtMj9DwnOwk4IOy0ZuD+4qBfiLCk/QeO6gxdxgFzHOgKglWU2FCyb4hdjRXVlrvLAI45eY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH66ljFHyPOmP2Nu02D6aYQq4J0VShBGzEDYvO0f++e5ax6TPr
	oPYd+wjMmvllfe185zB71h5WtCNmJY5udsOFjl1TBe2VV724pCKOotY9NiGCa9iOJAaECd8cyJv
	HiOhn8v3OS0Pauo04fTZEnaHQHuGInj7lKNQ=
X-Google-Smtp-Source: AGHT+IF7A5sev/r3tF8rZHlZdmaw85E+iNhZ8TsyUSSCVQ856ii1VYB+iLoxrMye0nqTFIIrBEoSa2SxcSbBavGRaPo=
X-Received: by 2002:a05:6102:4428:b0:49a:42f8:dd20 with SMTP id
 ada2fe7eead31-49a5ae70caamr2588637137.14.1724916491758; Thu, 29 Aug 2024
 00:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
 <5b880a060574363d5ea351e20e0766abb476f6db.1723190258.git.hverkuil-cisco@xs4all.nl>
 <20240828123844.4dcpfsgii736hrq5@basti-XPS-13-9310>
In-Reply-To: <20240828123844.4dcpfsgii736hrq5@basti-XPS-13-9310>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 29 Aug 2024 09:27:54 +0200
Message-ID: <CAPybu_3zpngUgDWg=Tp_6QhwFX3kf+Fe+BQPQ2DyVrOrzQGvpg@mail.gmail.com>
Subject: Re: [PATCH 3/6] media: docs: Add V4L2_CAP_EDID
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-input@vger.kernel.org, Erling Ljunggren <hljunggr@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:39=E2=80=AFPM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
>
> Hello,
>
> On 09.08.2024 09:57, Hans Verkuil wrote:
> >From: Erling Ljunggren <hljunggr@cisco.com>
> >
> >Add documentation for the new edid capability.
> >
> >Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
> >Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Regards,
> Sebastian
>
> >---
> > Documentation/userspace-api/media/v4l/biblio.rst      | 11 +++++++++++
> > .../userspace-api/media/v4l/vidioc-querycap.rst       | 11 +++++++++++
> > .../userspace-api/media/videodev2.h.rst.exceptions    |  1 +
> > 3 files changed, 23 insertions(+)
> >
> >diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Document=
ation/userspace-api/media/v4l/biblio.rst
> >index 72aef1759b60..35674eeae20d 100644
> >--- a/Documentation/userspace-api/media/v4l/biblio.rst
> >+++ b/Documentation/userspace-api/media/v4l/biblio.rst
> >@@ -334,6 +334,17 @@ VESA DMT
> >
> > :author:    Video Electronics Standards Association (http://www.vesa.or=
g)
> >
> >+.. _vesaeddc:
> >+
> >+E-DDC
> >+=3D=3D=3D=3D=3D
> >+
> >+
> >+:title:     VESA Enhanced Display Data Channel (E-DDC) Standard
> >+:subtitle:  Version 1.3
> >+
> >+:author:    Video Electronics Standards Association (http://www.vesa.or=
g)
> >+
> > .. _vesaedid:
> >
> > EDID
> >diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b=
/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> >index 6c57b8428356..3d11d86d9cbf 100644
> >--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> >+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> >@@ -244,6 +244,17 @@ specification the ioctl returns an ``EINVAL`` error=
 code.
> >       - 0x01000000
> >       - The device supports the :c:func:`read()` and/or
> >       :c:func:`write()` I/O methods.
> >+    * - ``V4L2_CAP_EDID``
> >+      - 0x02000000
> >+      - The device stores the EDID for a video input, or retrieves the =
EDID for a video
> >+        output. It is a standalone EDID device, so no video streaming e=
tc. will take place.
> >+
> >+        For a video input this is typically an eeprom that supports the
> >+        :ref:`VESA Enhanced Display Data Channel Standard <vesaeddc>`. =
It can be something
> >+        else as well, for example a micro controller.
> >+
> >+        For a video output this is typically read from an external devi=
ce such as an
> >+        HDMI splitter accessed by a serial port.
> >     * - ``V4L2_CAP_STREAMING``
> >       - 0x04000000
> >       - The device supports the :ref:`streaming <mmap>` I/O method.
> >diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exception=
s b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >index bdc628e8c1d6..d67fd4038d22 100644
> >--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >@@ -197,6 +197,7 @@ replace define V4L2_CAP_META_OUTPUT device-capabilit=
ies
> > replace define V4L2_CAP_DEVICE_CAPS device-capabilities
> > replace define V4L2_CAP_TOUCH device-capabilities
> > replace define V4L2_CAP_IO_MC device-capabilities
> >+replace define V4L2_CAP_EDID device-capabilities
> >
> > # V4L2 pix flags
> > replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
> >--
> >2.43.0
> >
> >
>


--=20
Ricardo Ribalda

