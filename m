Return-Path: <linux-media+bounces-25592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFD6A25D7D
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 15:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 037D57A0645
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 14:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AC020967C;
	Mon,  3 Feb 2025 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4uvyQh5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B6D1CD1F
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738594434; cv=none; b=iDG1o7YfHuDb+xMP28ktGb/iyVFWgoNDxdSpE7rzWmw5Epkte/Ae/Dq9vO8xHbjT23aI5XmfXxh0Nfl9cSJHBxxbNqSvcDDZe2DY+tpdNSdXJqRTvhclpNsHb9scsIpveDZHSBSu8GI8GSzvy/FFx3UPJnLkqUVb+o/IM7rPh9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738594434; c=relaxed/simple;
	bh=cqLXaJpx7oKl/y+TGAB5iab8NF2fZeSVB4Q8O6R6mds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gr9CM8hgwwUYQgzWxXb1WqsZuLkY8mi584D6enAndz5ndMUISflgblIFZR6JXcLkm2IgxNUwhOvF56Wj7nBNwyzxA0dCOyeB0Uct6buajj//grmGov+padgRmU6eIU4VkhgqUuSFmZew83mzVONlFEeNA3BPZhdSukQ9LFHwpsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4uvyQh5; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-518ae5060d4so1407152e0c.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 06:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738594432; x=1739199232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGrtJzId8YRXigd5IfgmUqZahzf9VKPAG7YVfCIBk84=;
        b=b4uvyQh5dNA4KGrq65BWoqmwP9o0qWn7NRYD0/tTkqEkmqGz7m5ZDO+D+npQQ0/njr
         VrrJvV9vsVS4/d/P1idK6sxAy+3NPDC9rNauzkuF+xvjxs2r1Scev5Dr+7A3Wy/CdMVN
         9Ay6a5dflqsmPpg03lRxezlAt46Uw7kzK2dA0vx4GTRDIH81McMoN1DcClX7OdPXDCpY
         EIkmpqlI2c72yTHKvz6jiSU+ukjU85RamUz7Q2yX0eN1jy7T5EP0GTIEH6FVsbCcTnsk
         kI6NsEzG5bx8I2ujwZU8Qj56yquxIATHAw3SEzaovOlmLrLDhNXbpm8VqE5bLkzTaUH9
         Cg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738594432; x=1739199232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGrtJzId8YRXigd5IfgmUqZahzf9VKPAG7YVfCIBk84=;
        b=RvfBMi3cg6S0efBVJNLHec8P7HNS2oGy1Tk7g3pjfFM8Wr6FNmWytJQFjfs+lNQZl5
         t1pq/ziUbCTwxAILxgh/sxigFWV907glMpiZlXApndzk0ZJK8dcSK/pCUFLhj+MWnbgz
         aAHj3/CzOyWnopykXnMfsRiMZ+YLIa0IQv3aAZ6+VHUq21Ng1K4dOHfyteP+6mI9yGiM
         LhgL3AyorSf604szbkyn8PAqP8DVc9KJ21bVlkKvQIsXSiSfgutPhf0L7umrSrsgP9qZ
         gYhkeIFI3TM4Bk3dm8dogIQSFT8A6DrVkqwfoLvASIoPVzazvT+4mJLjwgRvod5X3Hb9
         sXlg==
X-Gm-Message-State: AOJu0YwVZ+R2s3njOfxWIXJDUW3m/DhtY8a/7N3eDwdiQK5OQUm0FTr+
	5xdIohj0T+rLdcNJvcutnlq9Tb4WNc+83H/3a+8zwjvWXnRM7GJZyHfXA6V1kGOPXCfXkOygDd9
	nw8X8VvK7mwzVHF8JYt4ex6UTp00=
X-Gm-Gg: ASbGncsIj6llzptjwGwiA8Mvqas8jrfEBzJDmE0pyOb6MXRFVf/rwxxNVdN46140ury
	on+JyyDLNbmg1NEHKYybmCCXufcheoF7NzgAnQ9EgEEh7J2/MXrikV7juS2Gsee6bnXoGgwNe
X-Google-Smtp-Source: AGHT+IFnxjYuTkRHXnzDpFyyf3wi1hA977PCj+RqvGGIv1Gh+P0iNvqFeVzuWoGw4EWbJnYmUd43VurOooIeG07XC1k=
X-Received: by 2002:a05:6122:d86:b0:518:8bfe:d5f0 with SMTP id
 71dfb90a1353d-51e9e27dc34mr15504584e0c.0.1738594431933; Mon, 03 Feb 2025
 06:53:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com> <20250203085853.1361401-3-sakari.ailus@linux.intel.com>
In-Reply-To: <20250203085853.1361401-3-sakari.ailus@linux.intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Feb 2025 14:53:26 +0000
X-Gm-Features: AWEUYZk0fZH8WKajJ4a-t5_LFbJCH3w6xzVXYTODefds1dtcXnNbloLN-qFVKug
Message-ID: <CA+V-a8tEHsx1_H6LC1BYCegNHSx5T2dcxFx1ighmq4-iO3mS+g@mail.gmail.com>
Subject: Re: [RFC v5 02/15] media: Documentation: Add a hyphen to list-based
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 8:59=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Add a hyphen to list-based for uniform spelling in camera-sensor.rst.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  Documentation/userspace-api/media/drivers/camera-sensor.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst =
b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 8e1083417ae1..9a1e8aa9fc77 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -26,10 +26,10 @@ of cropping and scaling operations from the device's =
pixel array's size.
>
>  An example of such a driver is the CCS driver.
>
> -Register list based drivers
> +Register list-based drivers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> -Register list based drivers generally, instead of able to configure the =
device
> +Register list-based drivers generally, instead of able to configure the =
device
>  they control based on user requests, are limited to a number of preset
>  configurations that combine a number of different parameters that on har=
dware
>  level are independent. How a driver picks such configuration is based on=
 the
> @@ -67,7 +67,7 @@ is pixels and the unit of the ``V4L2_CID_VBLANK`` is li=
nes. The pixel rate in
>  the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in =
the same
>  sub-device. The unit of that control is pixels per second.
>
> -Register list based drivers need to implement read-only sub-device nodes=
 for the
> +Register list-based drivers need to implement read-only sub-device nodes=
 for the
>  purpose. Devices that are not register list based need these to configur=
e the
>  device's internal processing pipeline.
>
> --
> 2.39.5
>

