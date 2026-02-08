Return-Path: <linux-media+bounces-52350-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBk/CLluiGnOpQQAu9opvQ
	(envelope-from <linux-media+bounces-52350-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 12:08:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 781611087D6
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 12:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6A843010510
	for <lists+linux-media@lfdr.de>; Sun,  8 Feb 2026 11:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57836346AD1;
	Sun,  8 Feb 2026 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ae+M7HhE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB17533B6F1
	for <linux-media@vger.kernel.org>; Sun,  8 Feb 2026 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548881; cv=pass; b=T2pPHkVE0+xIISwo44+52Y8OmwMRvSQPMsyhR6a8CTRvJR99bKkrN2+spQsDLN5icoYEW8elaDEs6SUhWDIE6Wis7obgKiLH32HAP2vAoSlzoXznaL1lqdao8zv6SAnKTvP9dNm3SCmKIbX9zfcNoTAuZyGph39jQ1OzcOV6Tj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548881; c=relaxed/simple;
	bh=lmwlNcWPm29I5DEhvX9N9D/3fB16arRSpqA+boO3ZJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZwNZPmyxMecqtzGN8cKxm+tLgQTnU8nw0aadAa/zbb60AAC617mWTDnhejt+ekqJNrdWPT4S0zVcgEda1KDir/qs5mWbaQwa0Q+k3VbsHropjrF+fLUjjs/8G/tt2cTUExwa9vWQWewf8PepqVjL5cMzDqqJcmOgBQjxxdQFog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ae+M7HhE; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1248d27f293so13101c88.0
        for <linux-media@vger.kernel.org>; Sun, 08 Feb 2026 03:08:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770548881; cv=none;
        d=google.com; s=arc-20240605;
        b=WPhGxO4yvVRaVPh4UaP693EkrMpsemtinkQlVWmxC5wXM25WttznPTfaK0UAynHzR/
         L/sBk3iadIQIqzTwUJbsy/UbJmpmcfDh3mWQwjCyCsrtgI4mIXH72j3Y03DriuN0obLQ
         3P2coF+Lm5WmuWmFXc/Z7qWOZP7IxeLEpYTFbvezgKEJI/ktgt5SpOTxNf1dg5LaID9+
         FP+ehGGGhyp53MXP+ykrU+w+t7m6gyRLzSWUZunnItsovlVi2dtTkvtwW/E32H9YpbJS
         w9lxNYErKvmueWbzUW1UKvRs2/kojdgH+FuDu3PDAOsgJfq98ApKnOTl4IlfK5nI00cN
         luZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dz7Z9atgtbMAxxfncgHw+s00Hc63IUjYKuoDgmXQbTE=;
        fh=rXJ2wkkrse9i2IqGkXQHZyaNRl6RmZqF3o9p2Ouibvo=;
        b=K4FhPK7iTLFvuKaRxsKXB02E1vVVIJKLhQolDyzL7P77ecv2ZawrXn99Ie0FD4FF17
         aIP0URAi1S7mirT+r8xagU47p7NbPZSGv3kJBKZM4Cd6j2RJ0ghLI+LZGyrIv1PLSt6h
         UsPZ6Nc8wwrJgL33HCUdwNE2twktfnH6HvNB7jqnJW04AZxDuYh0csjsCrnSrveB7gs5
         KBdWY+XOsFO/M5A9ViIL7Sp7EglexTgtzmekhwmFoZmYSOLCiilAUG44Gn1Nqw8IXyS+
         3+TVfaV5osVHeiKI1PGIPplpQB7JmnkfYQP6ymcBzO+ohGztiMFHWDOG/ZfBJdwy4PB6
         wfNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770548881; x=1771153681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dz7Z9atgtbMAxxfncgHw+s00Hc63IUjYKuoDgmXQbTE=;
        b=ae+M7HhEe2zQ8NYMntrBLB6JnIKgWV0y7zk6ocvvfst/I1QUVh3domrDC1zq6RwIQk
         SCjNWykXPGULxYmbRjAqBGqFXqMhNqjZwJ12lsxXeEaId/qNtnBYFNVV/dIUXx9kO+uu
         Cc5BXqaB01uJDUIbhRTXvKkPTG/cggsd394ZiHM2SlF/WxUb6NUwjz7+jTwI1NisXnj2
         YjxIH+w6TC/dRpVw98OU28kPieo4qDJG6ZMD0I0XDo2tciywCgrCkjKGgu1e3crG2AmC
         hJj/akzXA4HlsMQlviN76wtlEsxiMytnuD7Cs6pSPJjUr9Pl86VW4PXaL7OrrvbpkcnE
         zN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770548881; x=1771153681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dz7Z9atgtbMAxxfncgHw+s00Hc63IUjYKuoDgmXQbTE=;
        b=ovACrtKSdZSZFiPJOJlTB9fgaiKO+2dUMIzayiX7MT0ITTbTnaDyvCJDWdiuv//2nQ
         T/3I5l92T1KumpIXqPk9V9wdnKkRwuZFnBaws6uk0FbkwPzN6jh2N0elOh9DoYNIE7Tw
         acbf1x4aj9EKG5eiu5xF1fIsnaChoKpmxvwmZchjRSv9C8xI+5KNjJXHvCNCbsb3v1Wi
         4sbGAdHGlZ/3sHoCOJoRFMXKRQ6RHasXuzJKxvDGT27mv1iCHWdJ2Q6Qv8hmwcyMfYK3
         JXBS0O83aRsmU7Un0J0aH/j2L+UEgjdG34YAW3uPchLWAaBsL1eJ0B81PULiFVIuwPFZ
         TTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZbwBWKUmO8+Ovl1JRQACqGJ8z52cJ4Lv8Q9gi39NYnOBmopSdkdSQ1A2TIWqgMGvEIgfVKn1/Amy1CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyglurnPGMqp3p/6+SgjTMaK1ipwKu6O2sw7TI/vyzC494Yv9Aq
	/A3KY5L6y4m6Lqchx4DBI+suMK06ZAvjyM/6V19J2ZhjmFwoDSiQHLzpD6h1j71qC2tcbvzZPLD
	9KXPkVH7XQwBLnzMtF21neW5QKQEdBvE=
X-Gm-Gg: AZuq6aLqaO1RRKKDujQmQq0pAIxzdPXsKU/3T89TIC/Otz5e1tinXeLcRIFNHb4bxqw
	00F5RqAu/gb/VVdYtzgQ3nEClox0IcCw2aCZnQxw2B/ZdTYK8nYrIZZ1TH/oMM+MAYbLI0h5ilr
	WRtA/Cf7oo07fXvu82cuV0/1EZxdc/ysnfnKuN94Aqs1ee3rQyFTb8T2Q2SwTymeOorjJYyZ6L6
	e4oukHSXfZq99WUnHOl4tarUoa+3EcsWg1tl25GBfP2VDlKfleHY4TY536wCXJmKROIYcstChWF
	QXNVyE+BW+NA0C3LQSBfOzX9bq2xnBWvv9n8F+9+NAETEcSyZZz0O3c=
X-Received: by 2002:a05:7022:fe04:b0:11d:f44c:afbc with SMTP id
 a92af1059eb24-12704074490mr4614462c88.37.1770548880672; Sun, 08 Feb 2026
 03:08:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207094841.603932-1-alperyasinak1@gmail.com> <20260207212723.GN1376807@killaraus.ideasonboard.com>
In-Reply-To: <20260207212723.GN1376807@killaraus.ideasonboard.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Sun, 8 Feb 2026 14:07:48 +0300
X-Gm-Features: AZwV_Qg14ydfDBfHuyQnZ3_EeILMKaWCqMxsGd7QXlghDc9HC55U-Jw-7RWhIlg
Message-ID: <CAGpma=7O5Uy1U-ePSixiyoWJremYk=x_L=oR19_VptgNAjen=A@mail.gmail.com>
Subject: Re: [PATCH] media: rzg2l-cru: Fix possible ERR_PTR deference
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52350-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alperyasinak1@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 781611087D6
X-Rspamd-Action: no action

> Have you seen this happening ?

No, I haven't seen this happen in practice. This was reported by
static analysis tool. Since the function explicitly documents these
error cases, it seemed appropriate to add defensive error checking to
avoid potential ERR_PTR dereference.


Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 8 =C5=9Eub 2026 Paz,
00:27 tarihinde =C5=9Funu yazd=C4=B1:
>
> On Sat, Feb 07, 2026 at 12:48:39PM +0300, Alper Ak wrote:
> > The media_pad_remote_pad_unique() can return ERR_PTR() on failure
> > (-ENOTUNIQ or -ENOLINK), but the code was dereferencing the return
> > value without checking for errors. Add IS_ERR() check before
> > dereferencing the pointer.
>
> Have you seen this happening ?
>
> > Fixes: d7d72dae81d5 ("media: rzg2l-cru: Retrieve virtual channel inform=
ation")
> > Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 162e2ace6931..a34c2188df1a 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -411,6 +411,12 @@ static int rzg2l_cru_get_virtual_channel(struct rz=
g2l_cru_dev *cru)
> >       int ret;
> >
> >       remote_pad =3D media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CR=
U_IP_SINK]);
> > +     if (IS_ERR(remote_pad)) {
> > +             ret =3D PTR_ERR(remote_pad);
> > +             dev_err(cru->dev, "Failed to get remote source pad: %d\n"=
, ret);
> > +             return ret;
> > +     }
> > +
> >       ret =3D v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, rem=
ote_pad->index, &fd);
> >       if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> >               dev_err(cru->dev, "get_frame_desc failed on IP remote sub=
dev\n");
>
> --
> Regards,
>
> Laurent Pinchart

