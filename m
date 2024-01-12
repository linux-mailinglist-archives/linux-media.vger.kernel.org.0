Return-Path: <linux-media+bounces-3627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B09382BC91
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 09:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB8981C25062
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 08:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC6154BC8;
	Fri, 12 Jan 2024 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="EXFk6jgq"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733D7537E5
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1705049521; bh=jl2/9rnpdnGnebrMgRLZyufkkyvjr9sE2YBPU3wYHW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXFk6jgqVU56UqGEXmr5jR9ePcNruwz+hZkmvnwnsrCospPODK85UKDgyEk+lRlwR
	 qC+Avl2m8lP0wAo4DEBo5NqYbvFaI3Y8SnMlEwPR7mOmSweHbV/n18IqEeumNthp5f
	 17Y2eBovJoM5e4CI92pqVkjtCZHnHIbsgyLaAoe/QXse8h6a1GB2SyBlglv71OYEuk
	 D5qZB+BCtSn2bPQpMhcOM7ikqvG4Jc56++XGeVZpueQutyfoNP+SyCPLmM6A2s+MRa
	 sPznJkSYKZGyLeLxcqXVagQan572GJVVUDzvAufMxwYqJy6u+qqqAlnqdaPVM20g9v
	 nhSqv4xhNxRow==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id E35EB1000C6; Fri, 12 Jan 2024 08:52:01 +0000 (GMT)
Date: Fri, 12 Jan 2024 08:52:01 +0000
From: Sean Young <sean@mess.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, raj.khem@gmail.com,
	linux-media@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v4l-utils] keytable: meson: Restrict the installation of
 50-rc_keymap.conf
Message-ID: <ZaD9sQJJw5knO0Cm@gofer.mess.org>
References: <20240112031714.242522-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112031714.242522-1-festevam@gmail.com>

On Fri, Jan 12, 2024 at 12:17:14AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Currently, meson tries to install 50-rc_keymap.conf even if systemd
> is not used.
> 
> Commit 01f2c6c58e6f ("keytable: restrict installation of 50-rc_keymap.conf"),
> only allowed 50-rc_keymap.conf to be installed when both BPF and systemd
> were used.
> 
> Apply the same logic in meson to fix the problem.

Thanks, applied!

Sean

> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  utils/keytable/meson.build | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
> index 4130a4bea514..76ce329eae8e 100644
> --- a/utils/keytable/meson.build
> +++ b/utils/keytable/meson.build
> @@ -69,6 +69,8 @@ ir_keytable_udev_rules = files(
>  install_data(ir_keytable_udev_rules,
>               install_dir : ir_keytable_system_dir / 'rules.d')
>  
> +if ir_bpf_enabled
> +if dep_systemd.found()
>  if have_udevdsyscallfilter
>      ir_keytable_systemd_files = files(
>          '50-rc_keymap.conf',
> @@ -76,6 +78,8 @@ if have_udevdsyscallfilter
>      install_data(ir_keytable_systemd_files,
>                   install_dir : systemd_systemdir / 'systemd-udevd.service.d')
>  endif
> +endif
> +endif
>  
>  # Install non-existing directory to create empty directory structure
>  # See: https://github.com/mesonbuild/meson/issues/2904
> -- 
> 2.34.1

