Return-Path: <linux-media+bounces-60836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KfWOa+3/GkqTAAAu9opvQ
	(envelope-from <linux-media+bounces-60836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:02:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 764294EBC26
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F222B3019E48
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 16:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7D53EAC68;
	Thu,  7 May 2026 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ju5XOdxP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381C32EFD9B
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169737; cv=pass; b=QZniHvBfWWnl+GWy5ZkSpA8368nPlbpRHyXdJQSTa3GhIKBjZ4enlBGKnV7Q+P2SfDVQpzZsDaKKYWBT5ELehEnF7OevdQ85mNO01msMrf6FB7w/B4vb+peMu9zFNYWmMwdI0HKKDmSH6rITPvjr/xZcXJ5bt06nYn1ji3h1ssg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169737; c=relaxed/simple;
	bh=eVPSNKcXGc7intpqj8eRZGcZhSElyfptVgmwd/R/ID4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+yBj+ncVzH5Y7UmGR7Uxu+vat9wnyrUnkIqoEfT8p3tckPcdR8czNWmz2/RDcISPan9T0BAAa0u3owv5UsHVyMbxKDrBUgGdaJgi/YXpzKhwpEAZfwfpONCZvifrCYK22T4eRmlLqO3T4efhyIvYzKQToJwqrxOdLESmimgvuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ju5XOdxP; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7bdc947aaa3so10667837b3.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 09:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778169733; cv=none;
        d=google.com; s=arc-20240605;
        b=fjE1HQgydL/wbbwKf0KbaFhvtmDHgMQ5kN/RJB6ul08bXUTPxnUe9ZzeQ8E+x/kgGp
         BX6AaB2MwXk4ytAcujwTJxGsHCo5dt4KDtyNliZ1RfvPQgSik/OR5bOtXKPVda8lRCXe
         8zjH9QsRwIaIpWEXh2qFJ/xgcP+MqwCxMMDzJU/PULt32NBzyggDBtIuDfhCy+ylO83E
         QbGs/JkbnuYGcSJdyOXLgcn9DW4Tns/c8ZlaPQ1G5m5FurqW+F6C/pAGHULG2w6zKcDy
         /1/7neY1cT75X00ApZp7sDf1EzrnI9dUIEEGQCSw5zD+eLj0oQpPT1zDQxk84WAfbqIc
         ybmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sCzAM4JJwgqwHrKSLWzJenSSMH0ElIIqPVHzzu40RNo=;
        fh=CCFQjVYePOPMF9pp5K2XbiybZYpmID/lZHxImXW451M=;
        b=Y92mjRnM9bqb20IxxZndw7Wmkc/hlNiCTIhCeQk2KiHxLFbtr/Eje3VG4fxyMOa4I3
         7iDpHaBOKEUccE/W+tWmCgXA1gnOYKU8FRCqgodBsLaf57Jh9D+83EuYXkfdaCkB96d2
         oQnxDi9mSFfcDbCIQsMhB+3XKlrlti/Eicr3psUXBb2jpe8elcLsJJ/nS5gQnpf5F3Az
         yRbHoECPhYO+ZS0vOR6ob3/WZl4VmQc5uvDqJSSZRFAUcJ2RgQC+V5o5rUEAgTWr+HDm
         /ThhnsNxE28AKBGckwt/nWxNNmy1paYwGgFsRU5M+oQ1skgUMR00tBncjrMucbKGNt3G
         o3+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778169733; x=1778774533; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sCzAM4JJwgqwHrKSLWzJenSSMH0ElIIqPVHzzu40RNo=;
        b=ju5XOdxPH5c1YUNkkGb1yEZQZZJSpBHYYrC7i0Ro+E3rXKhBRS3aWZoy87YN9xbDjR
         vy5QFtSFcnQC6lQuq3F/K94JiZgRun55N/vXnE5Qv0Z3Y09pJQgAciLG2jLN0n5yORVV
         lFIRjt+iM/W6zgJQrO89H8vUDL6fFAwGDRl30phCeqCnpXq7WixjiU0DhdFNHDH3tgGA
         A/3mKWqdQgZnrcYrOJbfm4vp7Zrynr4T4TMRBSnST+xB21D8GAfIgRD4RFUQvi4hE9Mr
         eO/xH9NVggd8tEJ6sRSz34eQS5mJC3nDDWAoz8lyD3CIEzjLgfEY6I0Y38veI6bF6+ZK
         foUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169733; x=1778774533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCzAM4JJwgqwHrKSLWzJenSSMH0ElIIqPVHzzu40RNo=;
        b=ewRWJn7HIT/WQ/51nf8XnZmiyyX9MArQZZDFmNQMU/T+qgASJkPSGOzfMRaP5ohtkL
         gclcMztHOO801J0ZMRudCIT5ed1V5bLwmGKpJblkN0oHLcfkwXD0Gz44WO3NR4haVclg
         xTyT1b94oDiNl1aW/mZGFkx7KtTSMSPGh+yTnt96DnGuW8cRkoYD7LDMkHGOkwjGRofa
         I+ymOHcg2N94mKOYkSoDhuPk9VEESHd9KXX4TbBfBMD8IUPX1yCYQyjKxdi8wnFFMJkf
         YvvBnlfOt733QnA5qfh/QWjApPwvz4oItwDDVic/9kk+PZsm4aQCKxGfdoQnOwEXs1Lc
         wXBw==
X-Forwarded-Encrypted: i=1; AFNElJ+wvMVroFRIUnbmnP2zlksFOtRQOhhu+wsIQYep8c0kC51KOnuHFxXSOGAvAQSSC/vgNCe+a/rjIRHKHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNWfng4zm/Hr3nUVN8u5M93OdI/5rDhj9WdUe9xttiJRP2sAO4
	5QEGYs73ovgu8xyy6vLsYEaugwdJ1XW/8mKHYNETP9PJpfKkue1+UfR2B2ThsFuYZoPxPWeAEQt
	wKCVPup0/A43XDlMk6+e9bQ3hcoO4l/+RjcsG0GvVbQ==
X-Gm-Gg: Acq92OF72wB6A0G88RfLVvPSaCYUJxS0diGMO34thmPZb3gADFSIlNGeAgVlUZ+JoW8
	HC5DpbZKAmz6fj+RtCU0U1362uxWn6prtn2fUfe775Y6vFGIi9BhgXgkNPbxsLPtW77I9h20gZJ
	A4szKaJ3sb5f43h3PGiTBJf5C+ySc8ylUL1vaPJgTy7P8y4LiDIvbELwdGeOfzOxdxu/nR3kYl9
	xClLnD8+O5g93vOL4BBTRHjh9feBbYT8wfFwsj64mhQRUfuPSfUFVObIgkw7Bwcg8/Rvy95N3Br
	Y3RHduSVIXlu50zO0+3cNHx1vL0fFa+7TUQa8BDy4i2/tYPfWq65sybssQdqEIJ3MFelmeTJEav
	tAzfP+1XR730k76ciNuwTdc3X
X-Received: by 2002:a05:690c:6e81:b0:7bd:8cd8:dffd with SMTP id
 00721157ae682-7bdf5dd3ab7mr90024857b3.19.1778169732877; Thu, 07 May 2026
 09:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-3-660685030455@raspberrypi.com> <afyZw0htEcZez8k3@zed>
In-Reply-To: <afyZw0htEcZez8k3@zed>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 7 May 2026 17:01:56 +0100
X-Gm-Features: AVHnY4KseJ7WQrXaUc5MMaZS7l14fWhOmSba3uOaJNg47JILq8GpF50QpgoXz1s
Message-ID: <CAPY8ntDiSfCKAqtxnJ7DGtGZ_nd1eRgaxJ2y=X1L4dOkDDS+JQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] media: imx355: Programmatically set the crop
 parameters for each mode
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 764294EBC26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60836-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,raspberrypi.com:email,raspberrypi.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Jacopo

On Thu, 7 May 2026 at 15:00, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Dave
>
> On Wed, May 06, 2026 at 07:23:41PM +0100, Dave Stevenson wrote:
> > Currently the cropping is set via register entries in the per mode
> > register lists. Move those into the mode structure and set them
> > programmatically.
> >
> > x_out_size and y_out_size are duplicates of width and height, but
> > are retained in this patch for ease of review.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx355.c | 296 +++++++++++++++++++--------------------------
> >  1 file changed, 127 insertions(+), 169 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > index 8ea510218c7c..6179fe74c897 100644
> > --- a/drivers/media/i2c/imx355.c
> > +++ b/drivers/media/i2c/imx355.c
> > @@ -34,6 +34,13 @@
> >  #define IMX355_REG_FLL                       0x0340
> >  #define IMX355_FLL_MAX                       0xffff
> >
> > +#define IMX355_REG_X_ADD_START               0x0344
> > +#define IMX355_REG_Y_ADD_START               0x0346
> > +#define IMX355_REG_X_ADD_END         0x0348
> > +#define IMX355_REG_Y_ADD_END         0x034a
> > +#define IMX355_REG_X_OUT_SIZE                0x034c
> > +#define IMX355_REG_Y_OUT_SIZE                0x034e
> > +
> >  /* Exposure control */
> >  #define IMX355_REG_EXPOSURE          0x0202
> >  #define IMX355_EXPOSURE_MIN          1
> > @@ -102,6 +109,13 @@ struct imx355_mode {
> >
> >       /* Default register values */
> >       struct imx355_reg_list reg_list;
> > +
> > +     u16 x_add_start;
> > +     u16 y_add_start;
> > +     u16 x_add_end;
> > +     u16 y_add_end;
> > +     u16 x_out_size;
> > +     u16 y_out_size;
>
> Wouldn't it be better to define a per-mode v4l2_rect {}  and
> calculate the output size as [height - top + 1] (or [width - left + 1]) ?

Again I was largely going for the softly softly to avoid regressions.
Shifting from reg writes to the same numbers being visible in the
structures is difficult to get wrong and easy to review. Converting to
top/left is obvious. If you're prepared to double check all the values
are correct, then I'll update to move width & height into a v4l2_rect
alongside top & left.
It'll also combine patch 4 into this one to make it a bigger bang.

> In this way we can initialize a "sane" default analogue crop to
> program at s_start time. It then would be trivial once the driver is
> ported to the common RAW sensor model to use the selection target on
> the (eventually introduced) internal pad and use that one to program
> the analog crop ?

I haven't had a chance to look into the common RAW sensor model and
how it impacts things.

  Dave

>
> >  };
> >
> >  struct imx355_clk_params {
> > @@ -256,21 +270,9 @@ static const struct imx355_reg_list imx355_global_setting = {
> >  static const struct imx355_reg mode_3268x2448_regs[] = {
> >       { 0x0342, 0x0e },
> >       { 0x0343, 0x58 },
> > -     { 0x0344, 0x00 },
> > -     { 0x0345, 0x08 },
> > -     { 0x0346, 0x00 },
> > -     { 0x0347, 0x08 },
> > -     { 0x0348, 0x0c },
> > -     { 0x0349, 0xcb },
> > -     { 0x034a, 0x09 },
> > -     { 0x034b, 0x97 },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x0c },
> > -     { 0x034d, 0xc4 },
> > -     { 0x034e, 0x09 },
> > -     { 0x034f, 0x90 },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -278,21 +280,9 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
> >  static const struct imx355_reg mode_3264x2448_regs[] = {
> >       { 0x0342, 0x0e },
> >       { 0x0343, 0x58 },
> > -     { 0x0344, 0x00 },
> > -     { 0x0345, 0x08 },
> > -     { 0x0346, 0x00 },
> > -     { 0x0347, 0x08 },
> > -     { 0x0348, 0x0c },
> > -     { 0x0349, 0xc7 },
> > -     { 0x034a, 0x09 },
> > -     { 0x034b, 0x97 },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x0c },
> > -     { 0x034d, 0xc0 },
> > -     { 0x034e, 0x09 },
> > -     { 0x034f, 0x90 },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -300,21 +290,9 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
> >  static const struct imx355_reg mode_3280x2464_regs[] = {
> >       { 0x0342, 0x0e },
> >       { 0x0343, 0x58 },
> > -     { 0x0344, 0x00 },
> > -     { 0x0345, 0x00 },
> > -     { 0x0346, 0x00 },
> > -     { 0x0347, 0x00 },
> > -     { 0x0348, 0x0c },
> > -     { 0x0349, 0xcf },
> > -     { 0x034a, 0x09 },
> > -     { 0x034b, 0x9f },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x0c },
> > -     { 0x034d, 0xd0 },
> > -     { 0x034e, 0x09 },
> > -     { 0x034f, 0xa0 },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -322,21 +300,9 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
> >  static const struct imx355_reg mode_1940x1096_regs[] = {
> >       { 0x0342, 0x0e },
> >       { 0x0343, 0x58 },
> > -     { 0x0344, 0x02 },
> > -     { 0x0345, 0xa0 },
> > -     { 0x0346, 0x02 },
> > -     { 0x0347, 0xac },
> > -     { 0x0348, 0x0a },
> > -     { 0x0349, 0x33 },
> > -     { 0x034a, 0x06 },
> > -     { 0x034b, 0xf3 },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x07 },
> > -     { 0x034d, 0x94 },
> > -     { 0x034e, 0x04 },
> > -     { 0x034f, 0x48 },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -344,21 +310,9 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
> >  static const struct imx355_reg mode_1936x1096_regs[] = {
> >       { 0x0342, 0x0e },
> >       { 0x0343, 0x58 },
> > -     { 0x0344, 0x02 },
> > -     { 0x0345, 0xa0 },
> > -     { 0x0346, 0x02 },
> > -     { 0x0347, 0xac },
> > -     { 0x0348, 0x0a },
> > -     { 0x0349, 0x2f },
> > -     { 0x034a, 0x06 },
> > -     { 0x034b, 0xf3 },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x07 },
> > -     { 0x034d, 0x90 },
> > -     { 0x034e, 0x04 },
> > -     { 0x034f, 0x48 },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -366,21 +320,9 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
> >  static const struct imx355_reg mode_1924x1080_regs[] = {
> >       { 0x0342, 0x0e },
> >       { 0x0343, 0x58 },
> > -     { 0x0344, 0x02 },
> > -     { 0x0345, 0xa8 },
> > -     { 0x0346, 0x02 },
> > -     { 0x0347, 0xb4 },
> > -     { 0x0348, 0x0a },
> > -     { 0x0349, 0x2b },
> > -     { 0x034a, 0x06 },
> > -     { 0x034b, 0xeb },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x07 },
> > -     { 0x034d, 0x84 },
> > -     { 0x034e, 0x04 },
> > -     { 0x034f, 0x38 },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -388,21 +330,9 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
> >  static const struct imx355_reg mode_1920x1080_regs[] = {
> >       { 0x0342, 0x0e },
> >       { 0x0343, 0x58 },
> > -     { 0x0344, 0x02 },
> > -     { 0x0345, 0xa8 },
> > -     { 0x0346, 0x02 },
> > -     { 0x0347, 0xb4 },
> > -     { 0x0348, 0x0a },
> > -     { 0x0349, 0x27 },
> > -     { 0x034a, 0x06 },
> > -     { 0x034b, 0xeb },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x07 },
> > -     { 0x034d, 0x80 },
> > -     { 0x034e, 0x04 },
> > -     { 0x034f, 0x38 },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -410,21 +340,9 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
> >  static const struct imx355_reg mode_1640x1232_regs[] = {
> >       { 0x0342, 0x07 },
> >       { 0x0343, 0x2c },
> > -     { 0x0344, 0x00 },
> > -     { 0x0345, 0x00 },
> > -     { 0x0346, 0x00 },
> > -     { 0x0347, 0x00 },
> > -     { 0x0348, 0x0c },
> > -     { 0x0349, 0xcf },
> > -     { 0x034a, 0x09 },
> > -     { 0x034b, 0x9f },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x22 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x06 },
> > -     { 0x034d, 0x68 },
> > -     { 0x034e, 0x04 },
> > -     { 0x034f, 0xd0 },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -432,21 +350,9 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
> >  static const struct imx355_reg mode_1640x922_regs[] = {
> >       { 0x0342, 0x07 },
> >       { 0x0343, 0x2c },
> > -     { 0x0344, 0x00 },
> > -     { 0x0345, 0x00 },
> > -     { 0x0346, 0x01 },
> > -     { 0x0347, 0x30 },
> > -     { 0x0348, 0x0c },
> > -     { 0x0349, 0xcf },
> > -     { 0x034a, 0x08 },
> > -     { 0x034b, 0x63 },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x22 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x06 },
> > -     { 0x034d, 0x68 },
> > -     { 0x034e, 0x03 },
> > -     { 0x034f, 0x9a },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -454,21 +360,9 @@ static const struct imx355_reg mode_1640x922_regs[] = {
> >  static const struct imx355_reg mode_1300x736_regs[] = {
> >       { 0x0342, 0x07 },
> >       { 0x0343, 0x2c },
> > -     { 0x0344, 0x01 },
> > -     { 0x0345, 0x58 },
> > -     { 0x0346, 0x01 },
> > -     { 0x0347, 0xf0 },
> > -     { 0x0348, 0x0b },
> > -     { 0x0349, 0x7f },
> > -     { 0x034a, 0x07 },
> > -     { 0x034b, 0xaf },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x22 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x05 },
> > -     { 0x034d, 0x14 },
> > -     { 0x034e, 0x02 },
> > -     { 0x034f, 0xe0 },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -476,21 +370,9 @@ static const struct imx355_reg mode_1300x736_regs[] = {
> >  static const struct imx355_reg mode_1296x736_regs[] = {
> >       { 0x0342, 0x07 },
> >       { 0x0343, 0x2c },
> > -     { 0x0344, 0x01 },
> > -     { 0x0345, 0x58 },
> > -     { 0x0346, 0x01 },
> > -     { 0x0347, 0xf0 },
> > -     { 0x0348, 0x0b },
> > -     { 0x0349, 0x77 },
> > -     { 0x034a, 0x07 },
> > -     { 0x034b, 0xaf },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x22 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x05 },
> > -     { 0x034d, 0x10 },
> > -     { 0x034e, 0x02 },
> > -     { 0x034f, 0xe0 },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -498,21 +380,9 @@ static const struct imx355_reg mode_1296x736_regs[] = {
> >  static const struct imx355_reg mode_1284x720_regs[] = {
> >       { 0x0342, 0x07 },
> >       { 0x0343, 0x2c },
> > -     { 0x0344, 0x01 },
> > -     { 0x0345, 0x68 },
> > -     { 0x0346, 0x02 },
> > -     { 0x0347, 0x00 },
> > -     { 0x0348, 0x0b },
> > -     { 0x0349, 0x6f },
> > -     { 0x034a, 0x07 },
> > -     { 0x034b, 0x9f },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x22 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x05 },
> > -     { 0x034d, 0x04 },
> > -     { 0x034e, 0x02 },
> > -     { 0x034f, 0xd0 },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -520,21 +390,9 @@ static const struct imx355_reg mode_1284x720_regs[] = {
> >  static const struct imx355_reg mode_1280x720_regs[] = {
> >       { 0x0342, 0x07 },
> >       { 0x0343, 0x2c },
> > -     { 0x0344, 0x01 },
> > -     { 0x0345, 0x68 },
> > -     { 0x0346, 0x02 },
> > -     { 0x0347, 0x00 },
> > -     { 0x0348, 0x0b },
> > -     { 0x0349, 0x67 },
> > -     { 0x034a, 0x07 },
> > -     { 0x034b, 0x9f },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x22 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x05 },
> > -     { 0x034d, 0x00 },
> > -     { 0x034e, 0x02 },
> > -     { 0x034f, 0xd0 },
> >       { 0x0700, 0x00 },
> >       { 0x0701, 0x10 },
> >  };
> > @@ -542,21 +400,9 @@ static const struct imx355_reg mode_1280x720_regs[] = {
> >  static const struct imx355_reg mode_820x616_regs[] = {
> >       { 0x0342, 0x0e },
> >       { 0x0343, 0x58 },
> > -     { 0x0344, 0x00 },
> > -     { 0x0345, 0x00 },
> > -     { 0x0346, 0x00 },
> > -     { 0x0347, 0x00 },
> > -     { 0x0348, 0x0c },
> > -     { 0x0349, 0xcf },
> > -     { 0x034a, 0x09 },
> > -     { 0x034b, 0x9f },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x44 },
> >       { 0x0902, 0x00 },
> > -     { 0x034c, 0x03 },
> > -     { 0x034d, 0x34 },
> > -     { 0x034e, 0x02 },
> > -     { 0x034f, 0x68 },
> >       { 0x0700, 0x02 },
> >       { 0x0701, 0x78 },
> >  };
> > @@ -590,6 +436,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> >                       .regs = mode_3280x2464_regs,
> >               },
> > +             .x_add_start = 0x0000,
> > +             .y_add_start = 0x0000,
> > +             .x_add_end = 0x0ccf,
> > +             .y_add_end = 0x099f,
> > +             .x_out_size = 0x0cd0,
> > +             .y_out_size = 0x09a0,
> >       },
> >       {
> >               .width = 3268,
> > @@ -602,6 +454,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
> >                       .regs = mode_3268x2448_regs,
> >               },
> > +             .x_add_start = 0x0008,
> > +             .y_add_start = 0x0008,
> > +             .x_add_end = 0x0ccb,
> > +             .y_add_end = 0x997,
> > +             .x_out_size = 0x0cc4,
> > +             .y_out_size = 0x0990,
> >       },
> >       {
> >               .width = 3264,
> > @@ -614,6 +472,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
> >                       .regs = mode_3264x2448_regs,
> >               },
> > +             .x_add_start = 0x0008,
> > +             .y_add_start = 0x0008,
> > +             .x_add_end = 0x0cc7,
> > +             .y_add_end = 0x0997,
> > +             .x_out_size = 0x0cc0,
> > +             .y_out_size = 0x0990,
> >       },
> >       {
> >               .width = 1940,
> > @@ -626,6 +490,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
> >                       .regs = mode_1940x1096_regs,
> >               },
> > +             .x_add_start = 0x02a0,
> > +             .y_add_start = 0x02ac,
> > +             .x_add_end = 0x0a33,
> > +             .y_add_end = 0x06f3,
> > +             .x_out_size = 0x0794,
> > +             .y_out_size = 0x0448,
> >       },
> >       {
> >               .width = 1936,
> > @@ -638,6 +508,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
> >                       .regs = mode_1936x1096_regs,
> >               },
> > +             .x_add_start = 0x02a0,
> > +             .y_add_start = 0x02ac,
> > +             .x_add_end = 0x0a2f,
> > +             .y_add_end = 0x06f3,
> > +             .x_out_size = 0x0790,
> > +             .y_out_size = 0x0448,
> >       },
> >       {
> >               .width = 1924,
> > @@ -650,6 +526,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
> >                       .regs = mode_1924x1080_regs,
> >               },
> > +             .x_add_start = 0x02a8,
> > +             .y_add_start = 0x02b4,
> > +             .x_add_end = 0x0a2b,
> > +             .y_add_end = 0x06eb,
> > +             .x_out_size = 0x0784,
> > +             .y_out_size = 0x0438,
> >       },
> >       {
> >               .width = 1920,
> > @@ -662,6 +544,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
> >                       .regs = mode_1920x1080_regs,
> >               },
> > +             .x_add_start = 0x02a8,
> > +             .y_add_start = 0x02b4,
> > +             .x_add_end = 0x0a27,
> > +             .y_add_end = 0x06eb,
> > +             .x_out_size = 0x0780,
> > +             .y_out_size = 0x0438,
> >       },
> >       {
> >               .width = 1640,
> > @@ -674,6 +562,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
> >                       .regs = mode_1640x1232_regs,
> >               },
> > +             .x_add_start = 0x0000,
> > +             .y_add_start = 0x0000,
> > +             .x_add_end = 0x0ccf,
> > +             .y_add_end = 0x099f,
> > +             .x_out_size = 0x0668,
> > +             .y_out_size = 0x04d0,
> >       },
> >       {
> >               .width = 1640,
> > @@ -686,6 +580,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
> >                       .regs = mode_1640x922_regs,
> >               },
> > +             .x_add_start = 0x0000,
> > +             .y_add_start = 0x0130,
> > +             .x_add_end = 0x0ccf,
> > +             .y_add_end = 0x0863,
> > +             .x_out_size = 0x0668,
> > +             .y_out_size = 0x039a,
> >       },
> >       {
> >               .width = 1300,
> > @@ -698,6 +598,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
> >                       .regs = mode_1300x736_regs,
> >               },
> > +             .x_add_start = 0x0158,
> > +             .y_add_start = 0x01f0,
> > +             .x_add_end = 0x0b7f,
> > +             .y_add_end = 0x07af,
> > +             .x_out_size = 0x0514,
> > +             .y_out_size = 0x02e0,
> >       },
> >       {
> >               .width = 1296,
> > @@ -710,6 +616,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
> >                       .regs = mode_1296x736_regs,
> >               },
> > +             .x_add_start = 0x0158,
> > +             .y_add_start = 0x01f0,
> > +             .x_add_end = 0x0b77,
> > +             .y_add_end = 0x07af,
> > +             .x_out_size = 0x0510,
> > +             .y_out_size = 0x02e0,
> >       },
> >       {
> >               .width = 1284,
> > @@ -722,6 +634,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
> >                       .regs = mode_1284x720_regs,
> >               },
> > +             .x_add_start = 0x0168,
> > +             .y_add_start = 0x0200,
> > +             .x_add_end = 0x0b6f,
> > +             .y_add_end = 0x079f,
> > +             .x_out_size = 0x0504,
> > +             .y_out_size = 0x02d0,
> >       },
> >       {
> >               .width = 1280,
> > @@ -734,6 +652,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> >                       .regs = mode_1280x720_regs,
> >               },
> > +             .x_add_start = 0x0168,
> > +             .y_add_start = 0x0200,
> > +             .x_add_end = 0x0b67,
> > +             .y_add_end = 0x079f,
> > +             .x_out_size = 0x0500,
> > +             .y_out_size = 0x02d0,
> >       },
> >       {
> >               .width = 820,
> > @@ -746,6 +670,12 @@ static const struct imx355_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_820x616_regs),
> >                       .regs = mode_820x616_regs,
> >               },
> > +             .x_add_start = 0x0000,
> > +             .y_add_start = 0x0000,
> > +             .x_add_end = 0x0ccf,
> > +             .y_add_end = 0x099f,
> > +             .x_out_size = 0x0334,
> > +             .y_out_size = 0x0268,
> >       },
> >  };
> >
> > @@ -1076,6 +1006,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
> >  static int imx355_start_streaming(struct imx355 *imx355)
> >  {
> >       const struct imx355_reg_list *reg_list;
> > +     const struct imx355_mode *mode;
> >       int ret;
> >
> >       /* Global Setting */
> > @@ -1087,13 +1018,40 @@ static int imx355_start_streaming(struct imx355 *imx355)
> >       }
> >
> >       /* Apply default values of current mode */
> > -     reg_list = &imx355->cur_mode->reg_list;
> > +     mode = imx355->cur_mode;
> > +     reg_list = &mode->reg_list;
> >       ret = imx355_write_regs(imx355, reg_list->regs, reg_list->num_of_regs);
> >       if (ret) {
> >               dev_err(imx355->dev, "failed to set mode");
> >               return ret;
> >       }
> >
> > +     /* Set readout crop and size registers  */
> > +     ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_START, 2,
> > +                            mode->x_add_start);
> > +     if (ret)
> > +             return ret;
> > +     ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_START, 2,
> > +                            mode->y_add_start);
> > +     if (ret)
> > +             return ret;
> > +     ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_END, 2,
> > +                            mode->x_add_end);
> > +     if (ret)
> > +             return ret;
> > +     ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_END, 2,
> > +                            mode->y_add_end);
> > +     if (ret)
> > +             return ret;
> > +     ret = imx355_write_reg(imx355, IMX355_REG_X_OUT_SIZE, 2,
> > +                            mode->x_out_size);
> > +     if (ret)
> > +             return ret;
> > +     ret = imx355_write_reg(imx355, IMX355_REG_Y_OUT_SIZE, 2,
> > +                            mode->y_out_size);
> > +     if (ret)
> > +             return ret;
> > +
> >       /* Set PLL registers for the external clock frequency */
> >       ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
> >                              imx355->clk_params->extclk_freq);
> >
> > --
> > 2.34.1
> >
> >

