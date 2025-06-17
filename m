Return-Path: <linux-media+bounces-35066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 958CEADC980
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D1553A4392
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 11:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00BC2DBF74;
	Tue, 17 Jun 2025 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="Ftdiz5oS"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BD6211A3C;
	Tue, 17 Jun 2025 11:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160060; cv=none; b=P9fQT2kcn3YuaQ99nZe62uVg8141GR6TlZS1C1EAl68nb4sH6Hkxlj3/MS2Nbf0IUZq8i/cNdqU8/5rZq+8HQjtcAoUaaukRugJEsQrNK0W5GGoudUVFyl4zyGTI/WQXh99ZqQC2t6jTdHjoBM2oKFLqwcWV9GoXyiyHgTuoT1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160060; c=relaxed/simple;
	bh=ph62e8q/XBfNP72W+Xqs4TOEslw3S7usWpAwxtlUCNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1fGyNGufbXp27hZsN7E3Amc6QIwRtiSWjeSldNnbLL8hIFMkzDaPmaVZhg+Lv/gVehtOY7jYdySNd/w/pDbOZR6JRqeMhanylyXlP0ZvmRdQ3ubGI5rxtAKIVN3V1BuOqZKqSDu72k9F/bzgdzzeu1/4y6TE9HBUnnHlQ4PP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=Ftdiz5oS; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bM4X42CfLz15bX;
	Tue, 17 Jun 2025 11:34:12 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4bM4X36XqHz2xWj;
	Tue, 17 Jun 2025 11:34:11 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=Ftdiz5oS;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1750160052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pBWHD8NdHdIclX0KGDwUjH/EOHAQtc1fSNbAUi0jK1o=;
	b=Ftdiz5oS6F8KQuo4SsLb0qvnf/hgEnzq+jKTeFOPklQRMis26GsdO4sdoo+9MLQp/ghlUI
	DL39IYMbmnWpU5aRn3vylIPN+qIUkP8kZZ79oENSxJnc9zzMYuynS0cUCFWH9u8QnVAs2w
	lEj4R2iO587amHlBcpDt82o8YsfU3lv7v46IKJMPoheAD7RvfvTwl1LiGxMiAx5EzVdD+O
	jHHkokqcsRB24ULAF0sHwix+2r3tFDUWILXuNcBNSamJIYMQJjLdHnbr+aGKP77GB4sjam
	jZHXCO+uJyeZSR5QuULSOm311x80LybSgH7X/L6XacbmDHc1Ol4kQb4UPXwmPA==
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=685152b4 a=y7GQG8cVTJWmfFIGl7BB1w==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=cm27Pg_UAAAA:8 a=ahgvdpEijb1VIES30CMA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfJ73agwYynFYgw6QdSRkNBo5W6UjbFZojt9XSnk1XPN99ufnfIdl7dxc2tkusY0s0xsjvjunzBk2Hpsr0hDWQoM0eQWe5WnbxGTqrP60qHO+6AXYyUAB jcLY7WvixvlOBUbuFPKbQk6RowPI/2ONgdlN9R26s3UTuIkgOWS5M1/0pbaHFDXom53wj4ebWd1ySNIkfY8c9rgKXIp235odvtBgFxjAVYhgOp8zFQhHl9OW 4e27Dj+fY2EVqXsqz+S+6orNLYlIGAB2wr1/pD+rhc5gBoC/rRiuUVRLutXi2mvTayACmB9VW3Z0UdGY5bl7KSL3C4JM3fg9vuMT4nU601aGEuxv8vleLXOe sr9oXYIDPu/3AJQf3fi0zj7hARDwLsT1nDuOWD5YN2ES/twp8ow=
Message-ID: <9e43f9a6-666b-4941-b9df-baf822036391@jjverkuil.nl>
Date: Tue, 17 Jun 2025 13:34:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: Add automatic sort support for Makefile and
 Kconfig
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250516-keep-sorted-makefile-v1-1-82c6a4d3b1a8@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSBIYW5zIFZlcmt1
 aWwgPGhhbnNAamp2ZXJrdWlsLm5sPsLBlAQTAQoAPhYhBAUs3nvCFQU7aJ8byr0tYUhmFDtM
 BQJoBTEAAhsDBQkX+5V7BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEL0tYUhmFDtMb8EQ
 AK6Ecb5mGBanCa0R+J/WkWxGVsgqsaTjNU6nS5sl9lkiY64Tad6nF8RNO9YKRyfuokm2pxAD
 a91Tk92DFstszKGwiisEG7PQ3zXHEJTqxIosy9ueLbHTOvB4CnWVChcvaBWZ2uilyKFsWNTq
 mbDQf3/0UC3LxbEvGsYNU1Q6Pz+h+Pdv7GgdOJhYGKSLCpQyPYOyaU9tenHDKx6aNedNG4ZI
 2OAM18nDfKrEplSjDF9E9Ras65/n9iWQfGoUdxSlGrxM/t3EVgi1FXEq14FaCi6HhvreBZuw
 3NTHg4Za6bqnYsZnbyHY36bgnxi2YJYxKlh+IMT/TpfEh8nf2nnJTgs3bsNIVVaaYxJtl4w/
 Y48gKt6YzcWsHR6l0CSMQhZXQqp/Ljpi+/xtE6JJ/tJnG9Wyi3+hA11GFQ50uciXTpp9/w8s
 fScrv8qrfRiUsd+zfd0MC6EJmHSlW7qSVQjEauWDsdCFmsER8y/ab3DQb5uhrsyuooB+V7uj
 476vUbH/fM3KMrvh8HOTUBoAE/Mf82/bMlrduuU5PkbO+3/PcUR0WFUSK2yRK32GX/Tt2tD+
 YJq0RnyR8UeYslVLzyehrt8Cgc9KgHa8VUi/vkSTenjieYJYxgrd+oTYXB38gKlADnhw+zyp
 CsqeGGZu+SS2qrPUyUkeruRX7kC2tQ6gNoYpzsFNBFQ84W0BEADcy4iOoB5CIQUCnkGmLKdk
 kqhfXPvvSzsucep20OLNF96EymjBnwWboipJFOjZxwkmtAM+UnEVi2kRrtT844HFcM5eTrA2
 sEdQbThv16D0TQdt+dT0afvlvE1qNr4mGGNLiRyhRzC/pLvatD/jZHU8xRiSz/oZ+8dEUwzG
 4Skxztx9sSc+U1zRPc0ybiHxgM90oQ6Yo782InmN99Ac2WH6YLwpZQ1TOROF4HxeBfzfdMFi
 rudHzANNbn8LvvfRhMExVRtms+U/Ul3e730oEUpM18u4XJ8Y+CITnzOk7POfwYzHiKXqskw3
 bLnrQYF/QzDFsTFpewS3ojMzBq35CeLb5aH9LFY7q14m04m2cn8hkdq4nIPIk2x8hWgM19rh
 VaGWj8a6e7nQ30PerH89IXrBfWYvHezZzZzGG1JlLWktPNy/5dhAyrwiJIUo3ePFxfmjvFYa
 wn211qRkWi3GP4MYtk10WBvcQmuzyDYM/Usjt+LC+k3hT0mZ+Gz0FeTtY/OQ4+IwXnAdZM9m
 q88JVlijGVG0dOB03gLrr2LwihDJ31twAc3aJ4e9EHaiW6UBnwBdqeP4ghEylrqnn4jmJ6Uf
 D6qEANQ2L97e8vQyDeScP/Do+cDnhMm8Or0zAdK658fiWl78Xh0pRcx4g+opfwoQw5CfSf3o
 wh1ECJeNMC0g0QARAQABwsF8BBgBCgAmAhsMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wFAmaU
 3McFCRf7ldoACgkQvS1hSGYUO0zJTw//aaYKzeGfYF7WvSHUvGvtBO5Y/3XNC5xfU+jDKmlA
 vghX304jqDQ5314fLH7Kk4wE+dE7FaXZR+mMj5W1ORUfGwvMJ7ayemUVg3RyYggy6jQP5Rlb
 SCj9WFvHwNNbYTHFVMkAnVVKpwcjCYiUA82WK1/hP2ClE4dkS+WHtH6ABhO0hs32WoCNAzmT
 fdsOfXtSYN8wYWF0CI8wW4RiMu7rAX7xPPNhnVGz9vWyn06XDipCSIDuivsPNg/9XeUzjUg9
 eOvlMkphJ42MRyPJAWGmSeLm8mKwxoF094yAT6vIvYmT9yUnmf9BfVCJV+CnjEhvMpoAkUqi
 9cvaZfUdnsAnqQmoRJE0+yInhlMyWc+3xlGsa0snsTxNfqjaLH61CLt8oUQOgCI4cD4rJWks
 A8SyOqlgxEHnljUGmFEhCBUOV5GcXf1TfCXjMBiAKtex5cpvic4wZIJJtS1fS18PQ/DEC3vL
 UnhF1/AWSHp+sv8vlNgnncxLDCho8uVjZrn4jzswd6ticBUAsPAKDYnO7KDzfQlQhIHdq10v
 jlGW/FbxA1UUiuWH+/Ub3qh75oQHTTlYe9H+Qr8Ef231/xItks8c+OyoWV6Z9ZcZnHbOmy2I
 0wGRdGp8puOL7LzhLkIN66sY/+x4s+ANxyJK6U1nJVeq7tbbhqf2Se2mPG3b87T9ik8=
In-Reply-To: <20250516-keep-sorted-makefile-v1-1-82c6a4d3b1a8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

Hi Ricardo,

On 16/05/2025 14:22, Ricardo Ribalda wrote:
> Add keep-sorted annotations to the build files in the media subsystem.
> Thanks to this we can enforce the proper sorting with CI.
> 
> We use this occasion to fix the sorting of the files.
> 
> There might be some controversial sorting. Eg:
> obj-y += dvb-usb-v2/
> obj-y += dvb-usb/
> 
> This could be fixed with keep-sorted by_regex parameter, but I think
> it would make the code "uglier" for little benefit.

In my opinion using the keep-sorted annotation is not worth the effort.

It's rare that something has to stay sorted, and even more rare that it
would break something if it was not sorted, and providing a comment
is usually sufficient.

If this was something that was adopted kernel-wide, then it might be
more interesting, but I don't think this is something we should do just
for the media subsystem.

That said, posting patches that fix what was not properly sorted (but
without the keep-sorted annotation) are always welcome.

Regards,

	Hans

> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/common/Makefile           |  3 ++-
>  drivers/media/common/videobuf2/Makefile |  3 ++-
>  drivers/media/dvb-frontends/Makefile    |  4 ++--
>  drivers/media/pci/Makefile              | 24 +++++++++++++-----------
>  drivers/media/platform/Kconfig          |  2 ++
>  drivers/media/platform/Makefile         |  6 ++++--
>  drivers/media/radio/Makefile            |  9 ++++++---
>  drivers/media/rc/Makefile               |  6 ++++--
>  drivers/media/rc/keymaps/Makefile       | 19 ++++++++++---------
>  drivers/media/spi/Makefile              |  3 ++-
>  drivers/media/tuners/Makefile           |  3 ++-
>  drivers/media/usb/Makefile              |  8 +++++---
>  drivers/media/v4l2-core/Makefile        | 10 +++++-----
>  13 files changed, 59 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/media/common/Makefile b/drivers/media/common/Makefile
> index c5ab905e7c20017f596d9576b6eabcd5081e9385..7b5feb328371a7a0c93a19b15d1578d0af247447 100644
> --- a/drivers/media/common/Makefile
> +++ b/drivers/media/common/Makefile
> @@ -2,9 +2,10 @@
>  obj-y += b2c2/ saa7146/ siano/ v4l2-tpg/ videobuf2/
>  
>  # Please keep it alphabetically sorted by Kconfig name
> -# (e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start
>  obj-$(CONFIG_CYPRESS_FIRMWARE) += cypress_firmware.o
>  obj-$(CONFIG_TTPCI_EEPROM) += ttpci-eeprom.o
>  obj-$(CONFIG_UVC_COMMON) += uvc.o
>  obj-$(CONFIG_VIDEO_CX2341X) += cx2341x.o
>  obj-$(CONFIG_VIDEO_TVEEPROM) += tveeprom.o
> +# keep-sorted end
> diff --git a/drivers/media/common/videobuf2/Makefile b/drivers/media/common/videobuf2/Makefile
> index a6fe3f304685e9946738fdbaf77d45b967e7205a..dbaa35bfecce9eb6ed194ddd3d38b690fd78d48e 100644
> --- a/drivers/media/common/videobuf2/Makefile
> +++ b/drivers/media/common/videobuf2/Makefile
> @@ -7,7 +7,7 @@ ifeq ($(CONFIG_TRACEPOINTS),y)
>  endif
>  
>  # Please keep it alphabetically sorted by Kconfig name
> -# (e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start
>  obj-$(CONFIG_VIDEOBUF2_CORE) += videobuf2-common.o
>  obj-$(CONFIG_VIDEOBUF2_DMA_CONTIG) += videobuf2-dma-contig.o
>  obj-$(CONFIG_VIDEOBUF2_DMA_SG) += videobuf2-dma-sg.o
> @@ -15,3 +15,4 @@ obj-$(CONFIG_VIDEOBUF2_DVB) += videobuf2-dvb.o
>  obj-$(CONFIG_VIDEOBUF2_MEMOPS) += videobuf2-memops.o
>  obj-$(CONFIG_VIDEOBUF2_V4L2) += videobuf2-v4l2.o
>  obj-$(CONFIG_VIDEOBUF2_VMALLOC) += videobuf2-vmalloc.o
> +# keep-sorted end
> diff --git a/drivers/media/dvb-frontends/Makefile b/drivers/media/dvb-frontends/Makefile
> index a93146cb428c310be4e8cbc27d63c272168e9c6c..74d6d6d7d11aff78ce11fe438f81c1b3e42b0bf3 100644
> --- a/drivers/media/dvb-frontends/Makefile
> +++ b/drivers/media/dvb-frontends/Makefile
> @@ -17,8 +17,7 @@ stb0899-objs := stb0899_drv.o stb0899_algo.o
>  stv0900-objs := stv0900_core.o stv0900_sw.o
>  
>  # Please keep it alphabetically sorted by Kconfig name
> -# (e. g. LC_ALL=C sort Makefile)
> -
> +# keep-sorted start
>  obj-$(CONFIG_DVB_A8293) += a8293.o
>  obj-$(CONFIG_DVB_AF9013) += af9013.o
>  obj-$(CONFIG_DVB_AF9033) += af9033.o
> @@ -136,3 +135,4 @@ obj-$(CONFIG_DVB_ZD1301_DEMOD) += zd1301_demod.o
>  obj-$(CONFIG_DVB_ZL10036) += zl10036.o
>  obj-$(CONFIG_DVB_ZL10039) += zl10039.o
>  obj-$(CONFIG_DVB_ZL10353) += zl10353.o
> +# keep-sorted end
> diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
> index 02763ad8851157c04f7a8350e5f6a0a9ed093eea..f7a741cab19f1d100949db98a95a1620f54d1d44 100644
> --- a/drivers/media/pci/Makefile
> +++ b/drivers/media/pci/Makefile
> @@ -4,24 +4,25 @@
>  #
>  
>  # Please keep it alphabetically sorted by directory
> -# (e. g. LC_ALL=C sort Makefile)
> -obj-y        +=	ttpci/		\
> +# keep-sorted start skip_lines=1
> +obj-y        += \
>  		b2c2/		\
> -		pluto2/		\
> +		ddbridge/	\
>  		dm1105/		\
> -		pt1/		\
> -		pt3/		\
> +		intel/ 		\
>  		mantis/		\
> +		netup_unidvb/	\
>  		ngene/		\
> -		ddbridge/	\
> +		pluto2/		\
> +		pt1/		\
> +		pt3/		\
>  		saa7146/	\
>  		smipcie/	\
> -		netup_unidvb/	\
> -		intel/
> +		ttpci/
> +# keep-sorted end
>  
>  # Please keep it alphabetically sorted by Kconfig name
> -# (e. g. LC_ALL=C sort Makefile)
> -
> +# keep-sorted start
>  obj-$(CONFIG_VIDEO_BT848) += bt8xx/
>  obj-$(CONFIG_VIDEO_COBALT) += cobalt/
>  obj-$(CONFIG_VIDEO_CX18) += cx18/
> @@ -35,6 +36,7 @@ obj-$(CONFIG_VIDEO_SAA7134) += saa7134/
>  obj-$(CONFIG_VIDEO_SAA7164) += saa7164/
>  obj-$(CONFIG_VIDEO_SOLO6X10) += solo6x10/
>  obj-$(CONFIG_VIDEO_TW5864) += tw5864/
> -obj-$(CONFIG_VIDEO_TW686X) += tw686x/
>  obj-$(CONFIG_VIDEO_TW68) += tw68/
> +obj-$(CONFIG_VIDEO_TW686X) += tw686x/
>  obj-$(CONFIG_VIDEO_ZORAN) += zoran/
> +# keep-sorted end
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 9287faafdce5873c78a6a2012bf7f8a8c448b79b..f69969100dc82db5179501d9c8c1667184004786 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -62,6 +62,7 @@ config VIDEO_MUX
>  	  This driver provides support for N:1 video bus multiplexers.
>  
>  # Platform drivers - Please keep it alphabetically sorted
> +# keep-sorted start
>  source "drivers/media/platform/allegro-dvt/Kconfig"
>  source "drivers/media/platform/amlogic/Kconfig"
>  source "drivers/media/platform/amphion/Kconfig"
> @@ -90,5 +91,6 @@ source "drivers/media/platform/ti/Kconfig"
>  source "drivers/media/platform/verisilicon/Kconfig"
>  source "drivers/media/platform/via/Kconfig"
>  source "drivers/media/platform/xilinx/Kconfig"
> +# keep-sorted end
>  
>  endif # MEDIA_PLATFORM_DRIVERS
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 6fd7db0541c7ecca04c5da5839e4d3641178aa9d..ccde8ead09781d78f77f5ecdee099aa9b28d7e02 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -4,7 +4,7 @@
>  #
>  
>  # Place here, alphabetically sorted by directory
> -# (e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start
>  obj-y += allegro-dvt/
>  obj-y += amlogic/
>  obj-y += amphion/
> @@ -33,9 +33,11 @@ obj-y += ti/
>  obj-y += verisilicon/
>  obj-y += via/
>  obj-y += xilinx/
> +# keep-sorted end
>  
>  # Please place here only ancillary drivers that aren't SoC-specific
>  # Please keep it alphabetically sorted by Kconfig name
> -# (e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start
>  obj-$(CONFIG_VIDEO_MEM2MEM_DEINTERLACE)	+= m2m-deinterlace.o
>  obj-$(CONFIG_VIDEO_MUX)			+= video-mux.o
> +# keep-sorted end
> diff --git a/drivers/media/radio/Makefile b/drivers/media/radio/Makefile
> index 1ff46f3a6ed3fa6b23d5f057c15082b92cea2ac9..096b6dce14cd8f849ae449d44606e52180f871a8 100644
> --- a/drivers/media/radio/Makefile
> +++ b/drivers/media/radio/Makefile
> @@ -6,20 +6,20 @@
>  shark2-objs := radio-shark2.o radio-tea5777.o
>  
>  # Please keep it alphabetically sorted by Kconfig name
> -# (e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start
>  obj-$(CONFIG_RADIO_AZTECH) += radio-aztech.o
>  obj-$(CONFIG_RADIO_CADET) += radio-cadet.o
>  obj-$(CONFIG_RADIO_GEMTEK) += radio-gemtek.o
>  obj-$(CONFIG_RADIO_ISA) += radio-isa.o
>  obj-$(CONFIG_RADIO_MAXIRADIO) += radio-maxiradio.o
>  obj-$(CONFIG_RADIO_MIROPCM20) += radio-miropcm20.o
> -obj-$(CONFIG_RADIO_RTRACK2) += radio-rtrack2.o
>  obj-$(CONFIG_RADIO_RTRACK) += radio-aimslab.o
> +obj-$(CONFIG_RADIO_RTRACK2) += radio-rtrack2.o
>  obj-$(CONFIG_RADIO_SAA7706H) += saa7706h.o
>  obj-$(CONFIG_RADIO_SF16FMI) += radio-sf16fmi.o
>  obj-$(CONFIG_RADIO_SF16FMR2) += radio-sf16fmr2.o
> -obj-$(CONFIG_RADIO_SHARK2) += shark2.o
>  obj-$(CONFIG_RADIO_SHARK) += radio-shark.o
> +obj-$(CONFIG_RADIO_SHARK2) += shark2.o
>  obj-$(CONFIG_RADIO_SI470X) += si470x/
>  obj-$(CONFIG_RADIO_SI4713) += si4713/
>  obj-$(CONFIG_RADIO_SI476X) += radio-si476x.o
> @@ -32,9 +32,12 @@ obj-$(CONFIG_RADIO_TRUST) += radio-trust.o
>  obj-$(CONFIG_RADIO_TYPHOON) += radio-typhoon.o
>  obj-$(CONFIG_RADIO_WL1273) += radio-wl1273.o
>  obj-$(CONFIG_RADIO_ZOLTRIX) += radio-zoltrix.o
> +# keep-sorted end
>  
> +# keep-sorted start
>  obj-$(CONFIG_USB_DSBR) += dsbr100.o
>  obj-$(CONFIG_USB_KEENE) += radio-keene.o
>  obj-$(CONFIG_USB_MA901) += radio-ma901.o
>  obj-$(CONFIG_USB_MR800) += radio-mr800.o
>  obj-$(CONFIG_USB_RAREMONO) += radio-raremono.o
> +# keep-sorted end
> diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
> index 2bca6f7f07bc987a7b5c61f43f717e2b3cd967c8..8e0adabf109d65ba02bd20b5c57e027e92454ef2 100644
> --- a/drivers/media/rc/Makefile
> +++ b/drivers/media/rc/Makefile
> @@ -10,7 +10,7 @@ rc-core-$(CONFIG_BPF_LIRC_MODE2) += bpf-lirc.o
>  obj-$(CONFIG_RC_CORE) += rc-core.o
>  
>  # IR decoders - please keep it alphabetically sorted by Kconfig name
> -# (e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start
>  obj-$(CONFIG_IR_IMON_DECODER) += ir-imon-decoder.o
>  obj-$(CONFIG_IR_JVC_DECODER) += ir-jvc-decoder.o
>  obj-$(CONFIG_IR_MCE_KBD_DECODER) += ir-mce_kbd-decoder.o
> @@ -22,9 +22,10 @@ obj-$(CONFIG_IR_SANYO_DECODER) += ir-sanyo-decoder.o
>  obj-$(CONFIG_IR_SHARP_DECODER) += ir-sharp-decoder.o
>  obj-$(CONFIG_IR_SONY_DECODER) += ir-sony-decoder.o
>  obj-$(CONFIG_IR_XMP_DECODER) += ir-xmp-decoder.o
> +# keep-sorted end
>  
>  # stand-alone IR receivers/transmitters  - please keep it alphabetically
> -# sorted by Kconfig name (e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start
>  obj-$(CONFIG_IR_ENE) += ene_ir.o
>  obj-$(CONFIG_IR_FINTEK) += fintek-cir.o
>  obj-$(CONFIG_IR_GPIO_CIR) += gpio-ir-recv.o
> @@ -54,3 +55,4 @@ obj-$(CONFIG_RC_ATI_REMOTE) += ati_remote.o
>  obj-$(CONFIG_RC_LOOPBACK) += rc-loopback.o
>  obj-$(CONFIG_RC_ST) += st_rc.o
>  obj-$(CONFIG_RC_XBOX_DVD) += xbox_remote.o
> +# keep-sorted end
> diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> index d04572627cdd0b7962c5035a9202ca265d36eeb1..4ae66312eaf437c3ee25a809ef26cc28fa6c4573 100644
> --- a/drivers/media/rc/keymaps/Makefile
> +++ b/drivers/media/rc/keymaps/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  # Please keep keymaps alphabetically sorted by directory name
> -#(e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start skip_lines=1
>  obj-$(CONFIG_RC_MAP) += \
>  			rc-adstech-dvb-t-pci.o \
>  			rc-alink-dtu-m.o \
> @@ -17,8 +17,8 @@ obj-$(CONFIG_RC_MAP) += \
>  			rc-avermedia-dvbt.o \
>  			rc-avermedia-m135a.o \
>  			rc-avermedia-m733a-rm-k6.o \
> -			rc-avermedia.o \
>  			rc-avermedia-rm-ks.o \
> +			rc-avermedia.o \
>  			rc-avertv-303.o \
>  			rc-azurewave-ad-tu700.o \
>  			rc-beelink-gs1.o \
> @@ -44,9 +44,9 @@ obj-$(CONFIG_RC_MAP) += \
>  			rc-dvico-mce.o \
>  			rc-dvico-portable.o \
>  			rc-em-terratec.o \
> -			rc-encore-enltv2.o \
>  			rc-encore-enltv-fm53.o \
>  			rc-encore-enltv.o \
> +			rc-encore-enltv2.o \
>  			rc-evga-indtube.o \
>  			rc-eztv.o \
>  			rc-flydvb.o \
> @@ -74,16 +74,16 @@ obj-$(CONFIG_RC_MAP) += \
>  			rc-leadtek-y04g0051.o \
>  			rc-lme2510.o \
>  			rc-manli.o \
> -			rc-mecool-kiii-pro.o \
>  			rc-mecool-kii-pro.o \
> +			rc-mecool-kiii-pro.o \
>  			rc-medion-x10-digitainer.o \
> -			rc-medion-x10.o \
>  			rc-medion-x10-or2x.o \
> +			rc-medion-x10.o \
>  			rc-minix-neo.o \
> -			rc-msi-digivox-iii.o \
>  			rc-msi-digivox-ii.o \
> -			rc-msi-tvanywhere.o \
> +			rc-msi-digivox-iii.o \
>  			rc-msi-tvanywhere-plus.o \
> +			rc-msi-tvanywhere.o \
>  			rc-mygica-utv3.o \
>  			rc-nebula.o \
>  			rc-nec-terratec-cinergy-xs.o \
> @@ -126,8 +126,8 @@ obj-$(CONFIG_RC_MAP) += \
>  			rc-total-media-in-hand.o \
>  			rc-trekstor.o \
>  			rc-tt-1500.o \
> -			rc-twinhan1027.o \
>  			rc-twinhan-dtv-cab-ci.o \
> +			rc-twinhan1027.o \
>  			rc-vega-s9x.o \
>  			rc-videomate-m1f.o \
>  			rc-videomate-s350.o \
> @@ -135,9 +135,10 @@ obj-$(CONFIG_RC_MAP) += \
>  			rc-videostrong-kii-pro.o \
>  			rc-wetek-hub.o \
>  			rc-wetek-play2.o \
> -			rc-winfast.o \
>  			rc-winfast-usbii-deluxe.o \
> +			rc-winfast.o \
>  			rc-x96max.o \
>  			rc-xbox-360.o \
>  			rc-xbox-dvd.o \
>  			rc-zx-irdec.o
> +# keep-sorted end
> diff --git a/drivers/media/spi/Makefile b/drivers/media/spi/Makefile
> index 6ac7adc64124a211035a377c5778af597f9a5a62..ce07bcf8f93ffa358bad20d5588c44e6dd04b13d 100644
> --- a/drivers/media/spi/Makefile
> +++ b/drivers/media/spi/Makefile
> @@ -3,6 +3,7 @@
>  ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/cxd2880
>  
>  # Please keep it alphabetically sorted by Kconfig name
> -# (e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start
>  obj-$(CONFIG_CXD2880_SPI_DRV) += cxd2880-spi.o
>  obj-$(CONFIG_VIDEO_GS1662) += gs1662.o
> +# keep-sorted end
> diff --git a/drivers/media/tuners/Makefile b/drivers/media/tuners/Makefile
> index bd350a285aadad39d44f594c5f672e05f1cf55c4..ac7fc7031c3e3abbf4b37bfc76a0c8ed472aac81 100644
> --- a/drivers/media/tuners/Makefile
> +++ b/drivers/media/tuners/Makefile
> @@ -7,7 +7,7 @@ ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
>  tda18271-objs := tda18271-maps.o tda18271-common.o tda18271-fe.o
>  
>  # Please keep it alphabetically sorted by Kconfig name
> -# (e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start
>  obj-$(CONFIG_MEDIA_TUNER_E4000) += e4000.o
>  obj-$(CONFIG_MEDIA_TUNER_FC0011) += fc0011.o
>  obj-$(CONFIG_MEDIA_TUNER_FC0012) += fc0012.o
> @@ -46,3 +46,4 @@ obj-$(CONFIG_MEDIA_TUNER_TUA9001) += tua9001.o
>  obj-$(CONFIG_MEDIA_TUNER_XC2028) += xc2028.o
>  obj-$(CONFIG_MEDIA_TUNER_XC4000) += xc4000.o
>  obj-$(CONFIG_MEDIA_TUNER_XC5000) += xc5000.o
> +# keep-sorted end
> diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
> index 6d171beea20d3973db1a46df5e33938e340f2026..14b7a6446d724cd6fcbcf7b626d8f2a887b4362b 100644
> --- a/drivers/media/usb/Makefile
> +++ b/drivers/media/usb/Makefile
> @@ -4,17 +4,18 @@
>  #
>  
>  # DVB USB-only drivers. Please keep it alphabetically sorted by directory name
> -# (e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start
>  obj-y += b2c2/
> -obj-y += dvb-usb/
>  obj-y += dvb-usb-v2/
> +obj-y += dvb-usb/
>  obj-y += s2255/
>  obj-y += siano/
>  obj-y += ttusb-budget/
>  obj-y += ttusb-dec/
> +# keep-sorted end
>  
>  # Please keep it alphabetically sorted by Kconfig name
> -# (e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start
>  obj-$(CONFIG_DVB_AS102) += as102/
>  obj-$(CONFIG_USB_AIRSPY) += airspy/
>  obj-$(CONFIG_USB_GSPCA) += gspca/
> @@ -30,3 +31,4 @@ obj-$(CONFIG_VIDEO_HDPVR) += hdpvr/
>  obj-$(CONFIG_VIDEO_PVRUSB2) += pvrusb2/
>  obj-$(CONFIG_VIDEO_STK1160) += stk1160/
>  obj-$(CONFIG_VIDEO_USBTV) += usbtv/
> +# keep-sorted end
> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> index 2177b9d63a8ffc1127c5a70118249a2ff63cd759..8fd4a251c59b80d72264d8e3ac71468b84e1fae2 100644
> --- a/drivers/media/v4l2-core/Makefile
> +++ b/drivers/media/v4l2-core/Makefile
> @@ -14,16 +14,16 @@ videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
>  			v4l2-ctrls-request.o v4l2-ctrls-defs.o
>  
>  # Please keep it alphabetically sorted by Kconfig name
> -# (e. g. LC_ALL=C sort Makefile)
> +# keep-sorted start
>  videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
>  videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
>  videodev-$(CONFIG_SPI) += v4l2-spi.o
>  videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
>  videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
> +# keep-sorted end
>  
>  # Please keep it alphabetically sorted by Kconfig name
> -# (e. g. LC_ALL=C sort Makefile)
> -
> +# keep-sorted start
>  obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
>  obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
>  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
> @@ -32,6 +32,6 @@ obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
>  obj-$(CONFIG_V4L2_JPEG_HELPER) += v4l2-jpeg.o
>  obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
>  obj-$(CONFIG_V4L2_VP9) += v4l2-vp9.o
> -
> -obj-$(CONFIG_VIDEO_TUNER) += tuner.o
>  obj-$(CONFIG_VIDEO_DEV) += v4l2-dv-timings.o videodev.o
> +obj-$(CONFIG_VIDEO_TUNER) += tuner.o
> +# keep-sorted end
> 
> ---
> base-commit: 1b83a9f41bd13dae09fabf594918ea36a9bc0cfc
> change-id: 20250516-keep-sorted-makefile-ea5acc7dada6
> 
> Best regards,


