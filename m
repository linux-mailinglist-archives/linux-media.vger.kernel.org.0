Return-Path: <linux-media+bounces-59742-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHNuLO4k8GnvOwEAu9opvQ
	(envelope-from <linux-media+bounces-59742-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 05:09:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F3247D046
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 05:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF19A301CCF9
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 03:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B5A31F9A6;
	Tue, 28 Apr 2026 03:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RrdlEuSw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNby8Got"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8775F2E718B
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777345753; cv=pass; b=nYSVYKebv7+JVm4BnLpiUdWGonGybekw582BzZm4+VJO38FHZjqmxrkDVxd1YAXiTXTdmXRIVQhRmuD3V/B5RfN2RZGHxg3RPhItMI8QDxQlI3Gk15lyUPxiNINpbxAoDrr6mKZigS/7DlINyCldr/8thaIjQVyfN3AhoJC/bMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777345753; c=relaxed/simple;
	bh=Md8iw30dghY+KfXWsKllBVS1ZVppR6JzktZl9UnfnsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQrzj0/2oVQJVFW2C8mkqsiedPiOgopkeaqjMCyf6CAdLYoe+n+WgAo0anJnQv9qdKJHZak0qgy3zXY25Ywn9OfQF2By7pJ2w6jG9z16w667UC0V40JN0FjlcOeKAwtdQyCDADExCjdK09AFtm43h2Vp1QXHa/Wf1NVlbhYquUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RrdlEuSw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cNby8Got; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777345750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h4lIpuOhpS3o5jTIST2U49aVLEDru8VCwX04lEd/W3o=;
	b=RrdlEuSwXHKfgWPf3yQJ0Bz2TNQ5v0l9MryuMTt1flKR2NEIlcnMvN+9J1CjcMwwW5ArAm
	26UylNkySTTrL3GmAmbPyfBR7+d6v/iSKz/sgl/YFFqO5tMGsob5Fy5XufIeW95a/S0F8s
	4VqX0LtgQuTyroGX7qS46PzPvXdxsu4=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-gsjnldJsNWyo8p08JKot0A-1; Mon, 27 Apr 2026 23:09:09 -0400
X-MC-Unique: gsjnldJsNWyo8p08JKot0A-1
X-Mimecast-MFC-AGG-ID: gsjnldJsNWyo8p08JKot0A_1777345748
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dce0f50eeeso14346440a34.2
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777345748; cv=none;
        d=google.com; s=arc-20240605;
        b=QFWJe/xGjc2fVFeRkNB+RldK2PRsbtM+b6DDRetu8C0Ub4AjYtvDNJPxkh1J3W7TYx
         N8epf88bArAJMP5jc645Qhy4whvKwbighRzne2hTdvmu2Yn8yEkIxWPdCH+mNbphta4/
         hniMTJsh65FvPEk2ChRXPh7q93NcTJFvbajTsoPEdlF91vcdrXWplZPbdMe00RDAgkJq
         IZ47MmoKXjz3b/ncKY2zJrIrLCOX2cMr8U8SFutaCZLEkdeefuGCW4dfJsUfs4lazhzK
         vswajBTf50SqevKX8EFUM1HS249NM0HAbgjWXFts5TzKiPHtitOUWBBsX2dQ7B6Bm1Pq
         KCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h4lIpuOhpS3o5jTIST2U49aVLEDru8VCwX04lEd/W3o=;
        fh=bywPb7jpoPYg7IwAcCQduOtoMA0GMa8VPXbhxkxvU8Y=;
        b=bPuNGqznTOEyxIE50G25b67HGuz6X5rxr2nvNLFS4bbuf+KX8boST2ZF/y7teEVj8a
         I0YtgYiqmWKpPbdslVVfInv1bf4acIjLdp7ASRQ2ehOG9kzhGvMJxFr6QciPXIZW/wAM
         8CmZAnLIFpg6k/vbm/Zen3k+ISEd4D54CiTANOlFyz2bPH2bsUSArJlgmV+KkICC/C1s
         aP5d/5mLpHwmKQRSxpARh485wHSxRcuSpXhgyVvFEV3kLKFZPB2PLKKRivgUQ+cUj8ig
         R/QEZk/A1XCMnd6ec/lnoTjnrvHnxhcLfOWMhLWINcWbP86gpelHLGTdqW6RtEJlnXN4
         UaYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777345748; x=1777950548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4lIpuOhpS3o5jTIST2U49aVLEDru8VCwX04lEd/W3o=;
        b=cNby8Gotag2IhY6xRJPYxKpdKUi0slJFy9jf51D0zzK279uoAy6XP2XNHLdRsvp2iW
         k6GDUUSQAEZbclAk/dLJdz9RXVSXNpRqcEl/p5+Fk1SoqqK/MInxYdjFvTvuayhepcFz
         +Ne1jEaMFbLwvYL1Uv5CN2CyjFhR6t4eBwcYQdSAf3cxk241LXYwt/ku1Yi3YuCsMoyG
         YdsCzV9nZth4sR3Z8AjrzP38erJb4Rr63GRge+UEZabZCN+FB7X32+klHHZ+h2S6DQnl
         sEGiDJ7Z+4YXJV9CFvgsLMDYhB85wEWMdNZ/qKfJx3buJZ84Fu4319dMa2sgfPB9lW7C
         B3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777345748; x=1777950548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h4lIpuOhpS3o5jTIST2U49aVLEDru8VCwX04lEd/W3o=;
        b=hDrInztQHGXhMWOriV4dUgfAweKzh2jkTLxEL0VKr9oN+60E4YVh2Yo79qxop7kYl1
         lL9aqmBojbeCixH83Xw7FattrlJL+3YZAiU9knn2unet7hnR/iiVe3gAQSKraiDVb9wQ
         xx1Ci6h+XD4Y35pOGoMZkkOyqw1FuOj1D2Wnla76B23x4xlCwoAc8EMrlKtzowPQi5TF
         lywcbluleYZcrhNvjbOin2uznpC4S2BL3pn4qrpjrBmterHwZsDlIpbSL449T1S+Ndo/
         gW8PEB3rxHawwA6vd58qXsE6hVbB1F04tbw/kvsI7GYvu59nnAn64wC4+CmIlD0/yEKY
         oPrw==
X-Forwarded-Encrypted: i=1; AFNElJ/B8ii+o58WfoqN4lnF+tWhic/y4iKHJblAQE+01GYo7ltWB6dNdT+UZ1Zi52SoQm+MIrIR1fEbK2tpLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvKbSlDZDUzqDKF6197NNg8+z1I8XYJks+TWrevIyghuFAGzg0
	IIRJ/mJI5hGsEZTA1lUsQBzUz0h1YN45Py06H7ZWGjimZwLrMtaF9x2LMUlqWJDJL8JDhUqI/lp
	OouCT76/RgH9R3/UiOxUQKxG0/37RX47EmJkk2+qtz+5Xlka2RqFPZHVQrqTrSxEkZy7hTpgtQS
	9+EoOdNGZFrCBs90unMJRGDx6PpgFVTSRFGPsuJug=
X-Gm-Gg: AeBDiesgeTq7jePGiI8UoWORQnLDL7g8f8a1JqR418EIG/CkzsnMg3Lt1PqnSDPcaA7
	IMudBWaaWN2MJwWcb64FNhisoZW9Ze+EUUf58iot//jFe1y4t867syxiSQMu5qlLHR9HwnyjIlY
	/pxEFRuPyV0Uzpcs0l96Cn7qd6h/JVxm8O1QyIy31cKaSCaywMCykI9m/BWy41KFcg1YQWFk+5z
	OZVVz5LUhq6T0FX
X-Received: by 2002:a05:6820:607:b0:684:bf61:ed25 with SMTP id 006d021491bc7-6965ca8fef6mr835438eaf.19.1777345748239;
        Mon, 27 Apr 2026 20:09:08 -0700 (PDT)
X-Received: by 2002:a05:6820:607:b0:684:bf61:ed25 with SMTP id
 006d021491bc7-6965ca8fef6mr835419eaf.19.1777345747794; Mon, 27 Apr 2026
 20:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417083214.222189-1-hpa@redhat.com> <20260417083214.222189-3-hpa@redhat.com>
 <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com> <aec9Pzr_ZUD0zBcK@kekkonen.localdomain>
 <07115433-dcfb-40a9-952a-5f841ee93947@oss.qualcomm.com> <aefYk9tbUOzNNdOk@kekkonen.localdomain>
In-Reply-To: <aefYk9tbUOzNNdOk@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 28 Apr 2026 11:08:56 +0800
X-Gm-Features: AVHnY4JZVbPPIvQ9OW-A6HBD3dytR5ngPGSC_k4pDPBn3FWTfC90jNfzFryzIKA
Message-ID: <CAEth8oGAgn9i3Fh_hes+KPhEwZCTNxKJdyOeQyt9i40inX0Kng@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 53F3247D046
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-59742-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Hans and Sakari,

On Wed, Apr 22, 2026 at 4:05=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Hans, Kate,
>
> On Tue, Apr 21, 2026 at 11:47:12AM +0200, Hans de Goede wrote:
> > Hi Sakari, Kate,
> >
> > On 21-Apr-26 11:02, Sakari Ailus wrote:
> > > Hi Hans,
> > >
> > > On Fri, Apr 17, 2026 at 12:16:11PM +0200, Hans de Goede wrote:
> >
> > ...
> >
> > >>> +
> > >>> +         cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
> > >>> +                         flip_bit, val, &ret);
> > >>> +
> > >>> +         return ret;
> > >>> + }
> > >>> +
> > >>> + /* vflip */
> > >>> + cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
> > >>> +                 flip_bit, val, &ret);
> > >>> + if (ret)
> > >>> +         return ret;
> > >>
> > >> Hmm, I wonder if the problem here is you doing 2 subsequent
> > >> cci_update_bits(). If the flip control registered is double-buffered
> > >> and the new value is latched as the actual value on the start
> > >> of the next frame; and this is combined with reading back
> > >> reading the active value, not the last written value then
> > >> the first time you do this the setting of the hflip bit will
> > >> be overwritten by the second cci_update_bits.
> > >>
> > >> I think it would be better to do something similar to what
> > >> imx219.c and replace these 2 cci_update_bits() calls with:
> > >>
> > >>         cci_write(imx471->regmap, IMX471_REG_ORIENTATION,
> > >>                   imx471->hflip->val | imx471->vflip->val << 1, &ret=
);
> > >>
> > >> I believe this should work here too.
> > >>
> > >>
> > >>> +
> > >>> + cci_write(sensor->regmap, IMX471_REG_V_WIN_OFFSET,
> > >>> +           value ? 0xe0 : 0xeb, &ret);
> > >>> + if (ret)
> > >>> +         return ret;
> > >>> +
> > >>> + cci_update_bits(sensor->regmap, IMX471_REG_H_WIN_OFFSET, 1,
> > >>> +                 value ? 0x01 : 0x00, &ret);
> > >>
> > >> No need for cci_update_bits() here, the register is always
> > >> initialized to 0xc8 so this can just use hardcoded values
> > >> like the V_WIN_OFFSET path:
> > >>
> > >>    cci_write(sensor->regmap, IMX471_REG_H_WIN_OFFSET,
> > >>              value ? 0xc9 : 0xc8, &ret);
> > >>
> > >>> + return ret;
> > >>
> > >> Updating both offsets here is wrong when hflip !=3D vflip, you
> > >> should only update V_WIN_OFFSET when changing vflip and
> > >> H_WIN_OFFSET when changing hflip.
> > >
> > > The cropping configuration should reflect the values on the sensor's =
pixel
> > > array and should not be affected by flipping. At least the crop windo=
w
> > > needs to be adjusted accordingly by the driver. Is there a need to ch=
ange
> > > flipping while streaming?
> >
> > Ah, that is a very valid question, no I don't think we do need to
> > set them while streaming.
> >
> > Kate if you cannot get the start_x / start_y coordinate changes
> > when changing flipping to work to get a stable bayer output
> > pattern, then another way to fix this is to only allow changing
> > the flip controls while not streaming and return -EBUSY otherwise.
> >
> > This can then be combined with reporting a flip-ctrl dependend
> > bayer-order so that userspace sees the right bayer-order after
> > flipping is applied as long as userspace reads the subdev format
> > after setting the controls (which libcamera does I believe).
>
> It's indeed currently a bit annoying to implement this. The common raw
> sensor model will make this easier as the driver just indicates the nativ=
e
> pattern to userspace. I don't have an estimate currently when that set
> would be in so the wait could be very long. Libcamera will need changes,
> too.
>
> >
> > For an example of an imx driver which reports a different
> > bayer order depending in flipping see: imx214.c and
> > the imx214_get_format_code() helper, a call to which should
> > be used to replace any hardcoded mbus-formats in the driver.
>

After many configuration attempts, tweaking the X, Y coordinates can
not get the right Bayer order for the hflip, and also breaks the
sensor's requirement (multiple by 4). However, changing the Bayer
format for each kind of flipping works, and the colour is correct for
every kind of flip, including h/v flipping. The side-effect is that
the user can't flip the image during runtime.

It also worked with libcamera. Qcam shows the right colour when
rotating the image 180 degrees.
I'll continue to work on this approach, :)

> --
> Regards,
>
> Sakari Ailus
>


--=20
BR,
Kate


