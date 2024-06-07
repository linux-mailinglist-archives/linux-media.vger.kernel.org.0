Return-Path: <linux-media+bounces-12702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 247068FFDAA
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 09:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 227111C2241F
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 07:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3689E15AAB8;
	Fri,  7 Jun 2024 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJs4S3fw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D55B155CAB;
	Fri,  7 Jun 2024 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717747039; cv=none; b=KPm3AOatRX0OwqR8zK0B3ELdlyAzXdpa3QxynpU3rXOWDYSxiVgWSKNIX3U4jGhF4BfN4muKhPg+9gsfYb5nVDdCQ4R2C36CowyfBuDEUJbZWodgPUChPQLS8NU8nbqkjZIG3hQjCQoQ7KdV2eItBSMNLy2M673eWyD3CEke6Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717747039; c=relaxed/simple;
	bh=g6Va+Z0ohKfz7eXfxYO9xCRun7LJHKXk2sadRvB2F0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WoAsMutxxZgHYdUcZ46qlxqMB7jNLJCqSH+WlK2EzJmZLD44eYPAY4v1AALjdO1hqCmS/etZaLmo/aLbrVa6RbPlGkvzmJrtl4o6OOlgn9Z5IRokP2IMavxjviPBvwawm5Lx0EyW9B0of+TEChj5NL5C/iSaA+WlcWSIC2KhL3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJs4S3fw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF12C3277B;
	Fri,  7 Jun 2024 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717747039;
	bh=g6Va+Z0ohKfz7eXfxYO9xCRun7LJHKXk2sadRvB2F0U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PJs4S3fw1EGitDf0NXmloONiujMf8NmNpf7PDpsUBeWeqQIob0QfXd4deu66xgFx7
	 p0XXWgJ40BjT7+c3iE+JZiFenHZBkUCBKxTLA6GZ0L8O7pAB7I0l7EpGka82MoSf2Z
	 CX/+PuLVG5w1YyHJTTwj8uCefGQGbY+MlHcy6Is5Q+O74LppLnJWblfdrbbVQv8To2
	 k08ckos4WJw4QJna8S56xFnn4Ar3RypHUsYtcf8u5x4C5IMkWYM7425MlYVTLktHcS
	 6A1SSlLCdsXIdfthvdWBRDhnsrHcVIe4G3Nkpfqe3Ly0ZCH7kLbstI2nMvpHis0vGQ
	 5v1R/SptOV2hA==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5ba68c30395so210788eaf.1;
        Fri, 07 Jun 2024 00:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqcVt/eH0SIIROlplTlrME5EvC+Ukyv/amOWfl1p6w0bJOhq/jtHuh67c031Ukz6qvyKMW7RI7NPiDkOEM0cKssJckhZHFKfGs7Ys2oMgtziK93m7m89Mng/7hFKNiVXeBkxUqiLxYwBo=
X-Gm-Message-State: AOJu0Ywqt6Q1goQ51d//XpZVislD4mk0wV7lpH2ZPVox9/LQxht+VXjw
	vWidQSpVZKVKJ7LjAib6YjdbdSRtg7+q0/Kw0uxz9c74JzKSjBZTbKK8uUardgRvlH85eeRApR8
	gJeby2e2/y1rr7zMyVNH+Np4yOJA=
X-Google-Smtp-Source: AGHT+IGwbuLlETCCLw3LCaMkCnEI4XyLlbw9QF1Bs42Bhc6zhHL+C2mbuQ2AnEtralKPc1ICNO5qpkJjGvOD5+/JJ1Y=
X-Received: by 2002:a4a:ac08:0:b0:5aa:3e4f:f01e with SMTP id
 006d021491bc7-5baae73b688mr1654053eaf.1.1717747038386; Fri, 07 Jun 2024
 00:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8afe9391b96ff3e1c60e624c1b8a3b2bd5039560.camel@sapience.com>
 <ZlTllJeZBiGapHwZ@kekkonen.localdomain> <988e48090982c89ce0c906954832fdfb09a1ce34.camel@sapience.com>
 <eb10620deecc8feeae1e308c22de199be7c48ca6.camel@sapience.com>
 <ZmHasj3hfwwKimZF@kekkonen.localdomain> <7fb5f0d6-f105-4219-839b-908c96c42972@leemhuis.info>
In-Reply-To: <7fb5f0d6-f105-4219-839b-908c96c42972@leemhuis.info>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 7 Jun 2024 09:57:06 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hnELQtpRsC1JdsExr48yjdjB9B_u8hj+_CmpEQSUeRSQ@mail.gmail.com>
Message-ID: <CAJZ5v0hnELQtpRsC1JdsExr48yjdjB9B_u8hj+_CmpEQSUeRSQ@mail.gmail.com>
Subject: Re: 6.10-rc1 : crash in mei_csi_probe
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Genes Lists <lists@sapience.com>, 
	linux-kernel@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, wentong.wu@intel.com, 
	linux-media@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 7:07=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 06.06.24 17:50, Sakari Ailus wrote:
> > On Thu, Jun 06, 2024 at 11:39:35AM -0400, Genes Lists wrote:
> >> On Mon, 2024-05-27 at 16:58 -0400, Genes Lists wrote:
> >>> On Mon, 2024-05-27 at 19:57 +0000, Sakari Ailus wrote:
> >>>>
> >>>> Thanks for reporting this.
> >>>>
> >>>> On Mon, May 27, 2024 at 12:34:41PM -0400, Genes Lists wrote:
> >>>>>
> >>>>> First happened in 6.10-rc1 (6.9.2 stable is fine)
> >>>>
> >>>> Do you happen to have .config available? A full dmesg would also be
> >>>> helpful.
> >>>>
> >>>> Does the system crash after the warning or not?
> >>>
> >>> System stays up and remains quite usable.
> >>>
> >>> config and dmesg attached.
> >>
> >> Hi Sakari - just to let you know this is still happening in 6.10-rc2.
> >
> > It'll disappear once this patch is in:
> > <URL:https://lore.kernel.org/linux-acpi/MW5PR11MB5787C81ABF0C9FFF5A17E4=
888DF32@MW5PR11MB5787.namprd11.prod.outlook.com/T/#t>.
>
> Do you plan to submit this again while fixing the typo Wentong Wu
> pointed out? Or should Rafael (now CCed here) fix this while picking it
> up? He might not have seen it as he's not in the list of recipients; he
> furthermore is likely not aware that this is a regression fix, as it
> lacks Fixes, Reported-by and Closes tags.

Please see my reply to the patch:
https://lore.kernel.org/linux-acpi/CAJZ5v0i1NxGHMKskP7W+hAusjt=3D5jYYWTF2vg=
JPR0gnrNTgFaw@mail.gmail.com/

