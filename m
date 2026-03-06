Return-Path: <linux-media+bounces-54820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEHLMFsPq2n1ZgEAu9opvQ
	(envelope-from <linux-media+bounces-54820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 18:31:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D62F22636E
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 18:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16BBB304789C
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 17:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486C6421EFD;
	Fri,  6 Mar 2026 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0QuKWwI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A859135294F
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817635; cv=none; b=fUIGLS4QX87Y1ZyBZk/4MDp+FsMIJVdUR2OaXfSYqDxsFnIktE9On/2rnNtxMf2H01T0l6c+Mc+mUY2q0sqUfbx4XP3itoFsqUtokLcfDFO8oPblAGL5ldt1N58OSl0X9NlDeHrcB6vud8hWgE1FU+82RAoY28kkL/k7Wcbmnr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817635; c=relaxed/simple;
	bh=GhclToYLpG+7UMFBLf2ZmC1LGWDj2lllBQ5Rm1+HHeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5ClpC+VZ/kGJdTIKLG6yTo0fKPObVh1mygQk4rjanbVCm7Du8mapf0LWsyi1xrpW067IKedaR/BL/YFZ/GBMX4z3NWliRx2eExKSCLjNA2EihkUSNwPXiOfUN0lAdP48EjxHjeYjhh9mlOqdOmcBOrHptmvApGK6OEpZjzspAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0QuKWwI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2C8C19425
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817635;
	bh=GhclToYLpG+7UMFBLf2ZmC1LGWDj2lllBQ5Rm1+HHeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X0QuKWwIKsmDcGnlrpUm6yB2pihXgA6QnYd8IUEibiHrSNuEYsufpgaFky3ft/E3x
	 +k8gLScehB45uN8ll2nCrg5MFVG5cOFzng7aczmmuJ5UPzAPDrkBxJMFeNJSdAx519
	 4glCNghhsAObrjBqFZypUFPzqllh7KiwB+xoPuJkuzsdgnjT1nsaoASrVs8OgX7q1U
	 n9Uro5kGEi84Fod/pkVvc1TpFDLWICaWPjxCVGLbe85A1jY0tzAQCdn8i50MQZeObX
	 apByZC9DaB8qvVYwrGuaci2xaYMI0+UVEcIcRptuZD0LUK7vw+EgyePqCRkDzbPKQA
	 BCoheQn++AkqA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a3c62d7d2so9585111fa.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 09:20:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaWIJ07qKaabwVP+R86k2sU8ygjVmCwipztJelFarjzpfrcHgyuBprrZ3Yk9RRd4SlUnmoh29PYDZ2iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyakTihwfmunoxrLtG1sq4f/kVpirzadXw7BTLAEqO7Ep8fl3ad
	96/0fkBfIkCxs/9ahQ9kG8n3cT2p1FgTgLTin/mAcmNoXZowcbo9B9Fqo051bWSoTFEQcrE8/NL
	GFG5Gg+HpF6Rug/6ta7wXWrUuxxUuXOLD4vtx98Wb1w==
X-Received: by 2002:a2e:8a96:0:b0:386:8f97:d0b8 with SMTP id
 38308e7fff4ca-38a40d909b6mr9281811fa.20.1772817633825; Fri, 06 Mar 2026
 09:20:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com> <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com> <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com> <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com> <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
 <aagSewpM88KAZDcJ@shikoro> <aar3rj7Db6NmTVS_@hovoldconsulting.com>
In-Reply-To: <aar3rj7Db6NmTVS_@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 6 Mar 2026 18:20:21 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf5Ydt1JmaC63B-3wGXdLdYvE4jHhzD36t=PUTzuWfw2g@mail.gmail.com>
X-Gm-Features: AaiRm53pekvMkksI4fYGSCWmOvo94JFARCgE7Q2uLvo1sVDayAaQxKa6carQHj8
Message-ID: <CAMRc=Mf5Ydt1JmaC63B-3wGXdLdYvE4jHhzD36t=PUTzuWfw2g@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6D62F22636E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54820-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_TWELVE(0.00)[24];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 4:50=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> Bartosz seems to agree that my suggestion to decouple the driver data
> from the i2c_adapter would be better, and I'm willing to do the job.
>

Fair enough, I'll leave this for a couple of months then.

Bartosz

