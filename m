Return-Path: <linux-media+bounces-62666-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMq1ClMdEWrIhQYAu9opvQ
	(envelope-from <linux-media+bounces-62666-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 05:21:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1C25BCF7A
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 05:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 175973032C51
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 03:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166F832B107;
	Sat, 23 May 2026 03:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G18wziLt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBB833AD8B
	for <linux-media@vger.kernel.org>; Sat, 23 May 2026 03:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779506199; cv=pass; b=U6Q8JeoWMSN7hh0yaX6X9zJPze882KuIFwLOdNeuOJ4SLH0a2hwmzzEhli68UQLbpKGjQOUWejFR/hWN8rM5HMKAwgLe2JHmmrCnLL+lUXTxryXNrUNMN0IGCuKiMr55OLo28iLjoyKFCDcvbwRkH2qBdxh5zZS2Ar+RR/yl6I0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779506199; c=relaxed/simple;
	bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMe7SgM9uM7uxqahj0D5ckir1VVZFHp/pknHgX0QFF9mAM6p2bPJpyiPpFT0ZSMrnnGgLDkDZkZ9hcTvKLKkJQqVN3q+8gRsz/HufTIlQryxvr+4IR4QO3q5ONr4NkTDnjN5GYb3oqafMOjFYiIY+NSkD3Q0aLfeBSYprAEWjtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G18wziLt; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-69d7f4cc61aso614311eaf.0
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 20:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779506195; cv=none;
        d=google.com; s=arc-20240605;
        b=Sx2c5CkyrmSKiJSq6G62YmQt9E8gwSZZax26WtKGhX2zwNPI+c/F7mXNAzrDsEHuAz
         bXjyCj3TuAdfT3fRMPpbrVSyHCqO+Zb9T37Xj+eYDtUvPhJ4rw0CuGVIIKEajFcyB44U
         a39MmqDZ/QVGEZCJj0dRm6HmeeVGghOWNsB8PzHUjilkBjWBFVEGzipzlYTVhxszrYaD
         Wi6azkaBO4eU/FlqMiH7dQaLE7FHIpALrJT7weIIBESpTigLTXoSSG6vk3PdnK9/mUlC
         ykw1bgcCgnFJ9Vrnju1Hq0IWeVBzRMfvFYEsdTqIASf1BRta6Ruk4aUsoHXxIukKFvXQ
         qnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
        fh=GP5zbwGsHIVGgxC1Fihe1L0ZnEh2ifkPL/J4fskmbDU=;
        b=a6HBV+GQdPXUB1QMm1Zy2F20eueazTE7reAoT8zJEfS+xoATkHNuRRNI6LzhDtV4eN
         BeKfWu1Jxvyi3Qx7H4OCcC9nG9xkJ5sKZ9F4y8QD+ZfGwUa1/q5wwqrFNzqzsDI4QKc0
         WAdmrvZwW4CNCtfiyJZC+FOZJz7g4cZc0v0C80QKu49ggVYcNGsRwzCcy4af12LXzshs
         8hT4eb72N8Lliq0Z5BEidxOD43SJ/uS/3GZJAf/7dOSn1GKi9z6cP0vsZSNriSwd8+Xl
         haiVrPsOTHK4iGmn0fvXO4C5XMWbV0QYezzfPnLhm8LGBKRrQ4iJUgQ3I+Fs+1gUwQV+
         ItNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779506195; x=1780110995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
        b=G18wziLt2fas6Wuxz+iikVp0LL/RSQHbKkqluK80Z0Sp/JJEKIPP+hWjeNSoMV0yYY
         3LPOOkJBhzSuzc9Qwk5KYddnaa/2cgAa5aW+vUr2Qo9dX/MIbg08PksWV29fSCfumuZU
         LGtfJC9v/tQMouK1uekt6v8yOs9+YrFjTM9FAcCEhJflalvb1zRNcRr2gQsFhev5Ti+O
         RgI7nTyTY/QtazDIiqY1Bkg2wgwJ2fsv0n6mNtwhYQ39Gqq7enP+poqTGJwDV15PK61o
         S8Ix6Rxt1YaTKjUp1KIqW+WcryJ9Bqee0Ixlkfw7Wh1Y44q5fcIdPAkc9HVnD2C4zFJG
         +kiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779506195; x=1780110995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
        b=qKoLjgvGh5QWufPmysFFllcTG2QnkZ13MLO38Hf2844Pou3P6NXewjbREUWYY9A7LH
         nmifVWbr/ldSdWsn8wnBazoUMgqLQmTSL0sFc3oOfhwC8dZ+Vo9sFP0bXFkMsqSUDufy
         m/CsW3FiYcPQRTQ+YL/zFdtlW2d4U+jYsTLoyqTxgHhax/Zstik+aDzbTuXGX1hFvF9y
         0gB9FsjV4CLkMuZAwKMzvC3vbDvzebihrvdaoIpTGw43K4s092VpTFv0cmh3jmE1tIfe
         Rov+BAf4Ox4dvxAgFdFQEqXHXOorm06Uy2cbFkVN/CpbH4nLlQR0h69KpQxNkhVOiDUg
         ojfA==
X-Gm-Message-State: AOJu0Yx1EZ8UToPXHL3nS26gVSZqB42Wm2h1uP1/gV7vpIz3iEA2s8fk
	w0i3wTT75E4v+qaUxgrJXS5JNaVklvo9DUskdmALMY1iEhsnfUo+laUsTCJ8amwUXq60R9SuqG+
	afzkUtv+F32iIMTHz8xC88jA8Wz/px14=
X-Gm-Gg: Acq92OECFu2uPi2Gx4/8fznw3UC8q1H3Gwdk9pYg3dp+wukbohP2yD23QvE/Wl5XEfz
	ZnFcqQWk/I4p4M14t6+i5haDKOuKWC23PtxOq0ug0LmdLhs7mkgTPH9CIXeFcs2hdWSoKvOBnvT
	/8Ljbxpv4LYOfjxMj2qqImYJQsIs64g06Vj/GYKeMsLzffqQH5zsqNLyLa3brHQp0FtV/ydA3Ka
	5PnzLfXzO6B9Pu4Fq8tNvOafVvSA04CPuiboBba1BbWdb4exiGmiBiWbZg/fs03rbNg7tSolozU
	crt/xUNlJqGnDZr+1a+TY3YQvtHIQvNO6IZNNncGX0rvLL+uGqWVhsz5s8taLAu3KHY=
X-Received: by 2002:a05:6820:4c08:b0:69d:521d:a4fc with SMTP id
 006d021491bc7-69d7ead810amr3088050eaf.8.1779506195590; Fri, 22 May 2026
 20:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-15-paulk@sys-base.io>
 <CAMxPZkg9MgZrsM2L0vKzzUOA_tnSLKHdHkzDsfH5_WRqSQgvZg@mail.gmail.com> <ahA61YIGM4Bqipu7@collins>
In-Reply-To: <ahA61YIGM4Bqipu7@collins>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 23 May 2026 06:45:45 +0330
X-Gm-Features: AVHnY4ISNoCKi2Ahpn2OwYGMSPucMAJaRMseXVZ6HijrWpM0v0rlwFD_MrYBAdY
Message-ID: <CAMxPZkj_2h507_3d+5aZe6b5wUrDOpA58y4OcD=D0TTj3FQcog@mail.gmail.com>
Subject: Re: [PATCH 14/16] media: sun6i-isp: Use V4L2 subdev active state
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[mail.gmail.com:server fail,sys-base.io:server fail,sin.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-62666-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2A1C25BCF7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul,

On Fri, May 22, 2026 at 2:45=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Arash,
>
> Le Thu 21 May 26, 12:53, arash golgol a =C3=A9crit :
> > I used LicheePi Zero Dock (V3s) with the following pipeline as test set=
up.
> >
> > ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
> > sun6i-isp-capture
> >
> > I verified TRY and ACTIVE state handling, including changing TRY
> > formats without affecting ACTIVE state. Format propagation from the
> > sink (csi) pad to the source pad was also tested.
> >
> > I also tested streaming with the sensor test pattern enabled and
> > verified the captured output was correct.
> >
> > Tested-by: Arash Golgol <arash.golgol@gmail.com>
>
> Thanks a lot for testing this! Did you test just this patch or the other
> ones (especially sun6i-csi format enumeration) as well?
>

Happy to help.
I only tested patch 14 for now, but I plan to test the other patches
as well when I get some more time, especially the sun6i-csi changes.

> Also if you have an opinion on the code itself feel free to drop a
> Reviewed-by tag, a lot of this work is very similar to what you did for
> sun6i-csi and other drivers.
>

From a code perspective, the changes look good to me.
Reviewed-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol

