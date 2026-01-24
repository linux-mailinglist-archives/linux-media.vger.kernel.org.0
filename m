Return-Path: <linux-media+bounces-51451-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONW7GP95dGnU5wAAu9opvQ
	(envelope-from <linux-media+bounces-51451-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:51:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D15077CE2C
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C01543012CBD
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 07:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7146285050;
	Sat, 24 Jan 2026 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5ZJSAce"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3374201278
	for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 07:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769241084; cv=pass; b=YatAjkzsjS3f0oSLOzRujSWqZFnXG2wLArbkOlodDZCVSysGlWNv1AFw0pUInMoepA18lvguMNKWuEchgXAoxsU2es8ceLoOpTF53naQWGEC0NfCkzdsxibsE6EU+OFMvxFEwR0UBIgCpZIezJI2mXxudv0pUR21maLskCIAzh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769241084; c=relaxed/simple;
	bh=CcMe39txAhLfAgyaagr4G3bNs3fMigGeYbEiRD0a5pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9jxi5KVpN7dqFvHMzzwKyBLfX1T/NCX2muxJaT1kDuhca6qOj1bkDG3lqLmfvF38TY7FIcLa245gAdEN6mE9Dd6+FGKBoTkfsFnDoZ0LiREMvrmZdE6W44dIfyktZ4xBZJizndO2YPyJbaRkbMHZwVdwe3rH0DrF5LUfEwqy9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5ZJSAce; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7cfd57f0bf7so1931388a34.3
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 23:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769241082; cv=none;
        d=google.com; s=arc-20240605;
        b=MIYcBKfUDTyVD6+rCpQ4gnYgwNNiKRt20GQlxHjJEIeIrKv4UcLxDRxV8T8L8H4aY9
         hp3Mtt5DbG3x+s4pdhVtpqkqd43/vomADNKreN+lWXbZIJoAmbrqBI7Nlmk/XBXMP7Xq
         jL+yXLN73lntwm1/L3Xx/f0HhJze9ToxPE37WFP9K1RFkrhtV0DSHNLB0WwYLzzU+cBt
         z2vnlOuEYnZMLq5fEcUBF8x50bopHKp86u6LN2sjYT4mh4TWAbt/wFzW7NDb1z/0EEIC
         54EHrY42Byj6ayR9evhAsSwW8NO7iTk5lVRpeNBMYP6bOstRC53rNDIFsSd9Cks6OvPk
         +Lzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KTfl9br8QLrogNeoeGBoBI29tKNGf0rEYCxRgaonBcg=;
        fh=cKRP/NYyMI4jwukbh422T1YwlCKbIzisz+9qreqzUHc=;
        b=Kmi5fR7AUiBIIRnjXy5/QEn5Q0Ft0hnfNGKv2pZFZ76iX2ShDfgS6PV8JcQpjK5s9J
         qWFPXB5NeAvatWreh2UzwamkXrxiI2A+gyjRe36APjfkfXZ1lplify19R8EPaCmX5y4O
         9aLSsqnGBPQNiRjEirsUKBHlZWGe4rTJl9qOqMripewcMG2t3PRHRqSbaBwebxWGL+kd
         juIxBMpGxCT0NRNKvMKLGGEVLNPD5burZRnDe3NDPwxEYYEAYLpYWTIhh5+h53FlQRG4
         qm2/L02M6HLxj/yNwtWvi+KvjndEuJbNoSHJg239h9VOvZlTIlAWA10yD1KvPRSW0onQ
         18OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769241082; x=1769845882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTfl9br8QLrogNeoeGBoBI29tKNGf0rEYCxRgaonBcg=;
        b=T5ZJSAceMKKyyJI3aVxryIDePhB4HNY8J9ntS8DaaBUa5+AYhN9EFeX5u/ygnroyAB
         t4hzqGLfoZu9b+nYyE4cYDIesle0SerCWY8hbDD+vRPfK+/TvHEw0WdtSMPBu/to6fYN
         9FF/6R5URFQKa98kYiD7Mz3qevT+GbzAZufXAPH9FzvWLEBTFX3/JvwbUfW3NFfdhy4C
         pmLvbJgzbC9++J8/FStCMijOy57417zZUXK2ZYAIhzFUEgFQqLqcg4Gs9hHzgGDs82gG
         NRFPECz9PcsucZjHOg0pOl1L6JwrYBmmHjH/NUET0mdTPzgFwcwqDZwoOA2T1c1zTLWi
         bpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769241082; x=1769845882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KTfl9br8QLrogNeoeGBoBI29tKNGf0rEYCxRgaonBcg=;
        b=u1F4GNrChnmAWhdo9Bz1E5PLSOnNejRtA30+FKHUwjuC0ke9vajHSFZuOuAe5nz5w+
         1omElnj+XdgDOxNJe9rWuD1ioa4Ad2I2RQNHiHHW2yozbQdPNEJDrVh3/ITsUQYtHroz
         514KLl257jDD8TAbm3ST4u4E/GKgjhByCJl7oYIwtO2+cJSFAeISlVqR4zc0ct2yrbhD
         M/D+iycpxAlpfwYzA9CDEOUcddLRt2IXts3SHL8Pj7T11Ep+M019B3qIUdeT3NMu2Nog
         kk7yJXK2fQQrggI/cr+is1agJfMx1dLo19CdiLdNeH8FFc6i1BdNG4WK+H3L7jZBG81A
         LAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8LInGVYlpts0dl0bvnKiRDIx8rnaSDYwHKymo53jE+Xfc4ZfiNKZ0e1CDVVEXXQDHka9T5ngU1gOgvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzptqT74hJd3RbaGRZuXWGHhq+fy0Ol4yCoVR9kRwY2s2TEwHwx
	Stf6mRSZTK9l31jvVOUTnIy0VxI1ZbIx8WBqzBT7Np4fHsWCpLdzy6ImugbelHah2bfwQDa2/a7
	9nJjp8YceOwXA7kWGeVG/3I6uhQUp95c=
X-Gm-Gg: AZuq6aLdlgIOHZaYvUHeKl7sI+ffI3m5YSzojgkNrosp3q7gDIgT8Qig9mJABeZiz+6
	mo7PCIcrttAcJxI/1C6Mv47AiinXSlmV+2CJj7EowFZ/JBTAIdZ5b+YBecNokDe/PIV98rJuSU6
	ZYdUaEGZLyanjiEdY8Bw1/G/xyPPgR8u9CLx0Ny52RYBbxvTqY/g9v7fvQudAItx+HUUXKnnYaf
	3xD0yhckamZhW7Wx/K/3v3YFqGgyfnidJRZKD2pRL0pHO4rcw3qKIsNB8m3nX+rojbJnRlN
X-Received: by 2002:a05:6830:2813:b0:7cf:dd0c:2ba6 with SMTP id
 46e09a7af769-7d160b75f5dmr1749708a34.22.1769241081694; Fri, 23 Jan 2026
 23:51:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123153108.19204-1-sef1548@gmail.com> <20260123153610.GB415966@killaraus>
In-Reply-To: <20260123153610.GB415966@killaraus>
From: Nick Huang <sef1548@gmail.com>
Date: Sat, 24 Jan 2026 15:51:08 +0800
X-Gm-Features: AZwV_QjLPNg70DdGm5kxku022oKvcNcnWP5Y0OSlkS426TMHf7tJQBcfDugGY1E
Message-ID: <CABZAGRFnWAyqNUrLF2e5QCM3euGiVxDBCgucCmJw=BJyPqic6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/xcsi2rxss: use str_true_false() for boolean dev_info output
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kusogame68@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51451-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,vger.kernel.org,lists.infradead.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sef1548@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: D15077CE2C
X-Rspamd-Action: no action

Laurent Pinchart <laurent.pinchart@ideasonboard.com> =E6=96=BC 2026=E5=B9=
=B41=E6=9C=8823=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:36=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Jan 23, 2026 at 03:31:04PM +0000, Nick Huang wrote:
> > Refactor dev_info calls in xcsi2rxss_log_status() to use the
> > str_true_false() helper instead of inline ternary operators
> > ("true" : "false"). This makes the code cleaner, more readable,
> > and easier to maintain.
>
> That's a matter of personal preference, and I disagree with that. Please
> don't post this kind of refactoring that doesn't bring actual
> improvements, that's not a good use of reviewers and maintainers' time.
>
> > Added #include <linux/string_choices.h>
> > for future use if symbolic flag printing is needed.
> >
> > Signed-off-by: Nick Huang <sef1548@gmail.com>
> > ---
> >  drivers/media/platform/xilinx/xilinx-csi2rxss.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/=
media/platform/xilinx/xilinx-csi2rxss.c
> > index 146131b8f..e0c5b2ceb 100644
> > --- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> > +++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/of_irq.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/v4l2-subdev.h>
> > +#include <linux/string_choices.h>
> >  #include <media/media-entity.h>
> >  #include <media/mipi-csi2.h>
> >  #include <media/v4l2-common.h>
> > @@ -400,19 +401,19 @@ static int xcsi2rxss_log_status(struct v4l2_subde=
v *sd)
> >       dev_info(dev, "***** Core Status *****\n");
> >       data =3D xcsi2rxss_read(xcsi2rxss, XCSI_CSR_OFFSET);
> >       dev_info(dev, "Short Packet FIFO Full =3D %s\n",
> > -              data & XCSI_CSR_SPFIFOFULL ? "true" : "false");
> > +              str_true_false(data & XCSI_CSR_SPFIFOFULL));
> >       dev_info(dev, "Short Packet FIFO Not Empty =3D %s\n",
> > -              data & XCSI_CSR_SPFIFONE ? "true" : "false");
> > +              str_true_false(data & XCSI_CSR_SPFIFONE));
> >       dev_info(dev, "Stream line buffer full =3D %s\n",
> > -              data & XCSI_CSR_SLBF ? "true" : "false");
> > +              str_true_false(data & XCSI_CSR_SLBF));
> >       dev_info(dev, "Soft reset/Core disable in progress =3D %s\n",
> > -              data & XCSI_CSR_RIPCD ? "true" : "false");
> > +              str_true_false(data & XCSI_CSR_RIPCD));
> >
> >       /* Clk & Lane Info  */
> >       dev_info(dev, "******** Clock Lane Info *********\n");
> >       data =3D xcsi2rxss_read(xcsi2rxss, XCSI_CLKINFR_OFFSET);
> >       dev_info(dev, "Clock Lane in Stop State =3D %s\n",
> > -              data & XCSI_CLKINFR_STOP ? "true" : "false");
> > +              str_true_false(data & XCSI_CLKINFR_STOP));
> >
> >       dev_info(dev, "******** Data Lane Info *********\n");
> >       dev_info(dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\n");
> > @@ -421,9 +422,9 @@ static int xcsi2rxss_log_status(struct v4l2_subdev =
*sd)
> >               data =3D xcsi2rxss_read(xcsi2rxss, reg);
> >
> >               dev_info(dev, "%d\t%s\t\t%s\t\t%s\n", i,
> > -                      data & XCSI_DLXINFR_SOTERR ? "true" : "false",
> > -                      data & XCSI_DLXINFR_SOTSYNCERR ? "true" : "false=
",
> > -                      data & XCSI_DLXINFR_STOP ? "true" : "false");
> > +                      str_true_false(data & XCSI_DLXINFR_SOTERR),
> > +                      str_true_false(data & XCSI_DLXINFR_SOTSYNCERR),
> > +                      str_true_false(data & XCSI_DLXINFR_STOP));
> >
> >               reg +=3D XCSI_NEXTREG_OFFSET;
> >       }
>
> --
> Regards,
>
> Laurent Pinchart

Hi Laurent Pinchart

Thanks for your reply! Since this refactor doesn't introduce
significant logic improvements, let's stick to the original design to
respect the maintainers' time.

--=20
Regards,
Nick Huang

