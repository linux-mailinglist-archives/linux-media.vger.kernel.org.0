Return-Path: <linux-media+bounces-62108-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BNeLPQfDGqoWgUAu9opvQ
	(envelope-from <linux-media+bounces-62108-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 10:31:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4239457A16C
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 10:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B00130D7BEA
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606193E1682;
	Tue, 19 May 2026 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoFarAgZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5503DBD4D
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179069; cv=pass; b=Ij1k8c8dzYrqwGO02KzHyJQOUStTf0IuxZ5JY/t7fL3fGeZfJKxjAwHFPHJmk+mHEQ/k78u+cSnmotLNBDGnGZSQeG0EDRdKfjuTpW8m7F0TLa7B0X3fuFjKMtoYPUm9RVZMdQ5GZnLaxSM5VQlezgyIIbumPhQFXRPjIWnrbyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179069; c=relaxed/simple;
	bh=+2JphY+nktmaf/PwzUVblf+PDVb8dtBzAGeaHQJSKkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o2V+aEqXhXqBhf89xxDZVCjf7NENmY2aRyTPTEf7Xv5G/gi6gXTb3rZTsfvTQoGHesyPDEmlsWdQXiORqmOJotni4fgW6zgwvISg+D/1exPOnsPCiWoQLrBNoQQcva6V3qFc19Ohq63LmlSH+WWaNjTpG7l1hDwBX4vg/eONOPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoFarAgZ; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7c58e6eb2c8so26210797b3.1
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 01:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779179067; cv=none;
        d=google.com; s=arc-20240605;
        b=g6PMZDyD+FqIcYQY/MCqrmKPqq2x8E/Bu0P+IpuJ4tnn2WweJ6+U8+3gWCs1JeXgY4
         xyXTMZdfbwNKJTMFjQwWmmiMlP5rqIrWYI2e2OuITlsUcq9Di4Vcgy/ZR0gvDqmDZnLn
         feAdVbi89Ol7ntp3BG93ry2AYn7RXn5FwKmo595hkTqD42BzSw4N/Po7JFhf10cmSMDu
         NV7dAoYWh2FDTCR8Clq2BI93HhMr83UJU/G5TiuKUKsbKL5lo/ztdTtSNUD2Y69YNmlt
         U8l63WGBo1r2A56dd98ZKeHwY4ci/C+BCaXxtRuN3x92QgGjM/xDDlDpIayfEPoBPx0F
         NHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6MJFOu1HURlx5XM1WoHG2w7zZ8Z0olnSEZRjhu2b8sE=;
        fh=eyHEcvclG2M1qJcEVwHu1lT7aegAIwc/LDaQdhtNheg=;
        b=fnaTrHwrco4dOR9/4EYDr6s380JOTyqIoYa3GbnafFx1W8zm9Y1IcjPYiCSnDPj4pr
         /R6+tmh9DHRLK7BgE5zS+BUjUNOb2f3ad8HdK23vSZOTm5shon3B3OT5H/ASIm+zNVqD
         3Dt+5vvYf8McNheU2hoFMJeoPpC+C/0gRgQZUNszYZrFvczkGYkqjP/cd+55xFZgTmys
         Asdd6eKfR6LK/XN4DR7d2ZDERMjMeZHCzK/W+UK72t7JQxFLKNA8CLjfFXBczXe2LUeF
         8Cwn4TraeuVQaZXZrZoeFz8dk0Cs5/Fz2g/7vOKTcSp3MPyQvMtMb8zWp2HB8uy2jTsv
         3RLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779179067; x=1779783867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MJFOu1HURlx5XM1WoHG2w7zZ8Z0olnSEZRjhu2b8sE=;
        b=WoFarAgZheN3OTzUYVPihx5Gav+2Iwpt46ncYsoF1Nh9RrC9u12u1FyDibMWYLfL/I
         AuCa0NQgTjcqQ6BOY3Ch/d/aR8shm3KQ7qXrDlIZccZIuUYVtBLjKg6IFAwO3Q/NwFoy
         QMee7SGs2ePyEtLqWcir0tG9IbDPT0jutxfa6BAM8IrlEb8sU4GNYL+3e8FFakBMsN/j
         MZnAmkjlk2Pw2AVYQAFyxDAt+rVPmCIsqQvHSS17UNw/6EhVulGaapf6L56N03YhpNWA
         +tmMqAPfGwPXhndKdUfKrb4fXOWD8qV7PAp06+PmPbgPLmwuZKdzy8kugXGraOe+f/Va
         qVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179067; x=1779783867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6MJFOu1HURlx5XM1WoHG2w7zZ8Z0olnSEZRjhu2b8sE=;
        b=VBK+ET3v52G9KRWqBVqhHD15sWwV74ndkrawWncAQ1bdtroAQS/Osy/jhcy9UjkqPd
         yf5y92YJ2RY5NyJQmHz1631xlXIgBDDt8WuWOHUMt9LvFctRH3kXjdZHoE6tccGsTRym
         qwBkc1FX1WgVOemymEhxCq1F2g4S5FXLpGt3p4RARb3GXGbARsTupDfs5mH533eMq+lD
         HJG5/i4W5+u7MAH2SSe189TPxLH4Kib/EeszvlWle75syAFsv3VCLUNIVjrqHWnb8G0y
         XFQfXtRvoJ6wheEhm7xHL1gBWeL8jv65u3Yxckb0HAetxgUKDQLP51jx4Ljn8I26dngh
         /Xiw==
X-Forwarded-Encrypted: i=1; AFNElJ83ib78uu8icF2dtBu/OLRcMiV47PzNB9Xhyg9uAhe4DjsvPtkdkrYdCEq5ECM/NX9WUh4NyfKoCw4s+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBa0NDSUo51TBPt9yDbeSuPXURuytotMupFtHXxed5u1i63R8h
	jZh8okxkG7ajgNDFgETtQuOlNc51B7vlQcdB8rZOHUjwQaBZZ0f+HLajAH9DGftTSD5y5XLqC6a
	Vd6/jbcaePE+rXEFp2Vyfwk6BbPHz+Ik=
X-Gm-Gg: Acq92OFwA1unaVRWvGc0ig2+s1au66f8PbJpsEZM24GgXrESJTtYnCZx/i/53XM79z0
	tseRp87d08FygsmLaxO7PJC2rinnAB5DhftOdgaqn/6yqF+PyAdIaa0TZP0NMqaZZAOV4ewWvsd
	2wxvbaeRTbyqtyLj8u4ZltiH8I5Xumspk9Wbd5osIKBofZA8R6puxEPbUlTrKIkNLFl91zSeisv
	fmIJfS5dp0wG8mU+0NHMK/JtRTISP2cO8EmLGfhtYZsaIyVxSMV1TSXJWfP/4MCyIA6lpKzcRzI
	AuVC1RZdm11epDhVenkqMEehPUA8VB2PK6zqyTKtmvo9lS9cdVPV9zTlZtxPATIcacCmNg==
X-Received: by 2002:a05:690c:f02:b0:7cf:ab4d:a0e6 with SMTP id
 00721157ae682-7cfab4da692mr7412417b3.19.1779179067451; Tue, 19 May 2026
 01:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515084030.21986-1-kartikey406@gmail.com> <afec1199-4889-4d35-964c-4432ec792fa3@collabora.com>
In-Reply-To: <afec1199-4889-4d35-964c-4432ec792fa3@collabora.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Tue, 19 May 2026 13:54:12 +0530
X-Gm-Features: AVHnY4It9V2jN-5fjRsBqTKrkzDjZ0cvyy8FQ1o37xh7kT1TdZijJ2KMlBZd7uk
Message-ID: <CADhLXY5Mp3QjKoYHpgdd+mehZnOt2fkhCWNNrjfH1rZsKPjycg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v3] drm/virtio: use uninterruptible
 resv lock for plane updates
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org, 
	olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, simona@ffwll.ch, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62108-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,chromium.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,lists.linux.dev,vger.kernel.org,lists.linaro.org,syzkaller.appspotmail.com];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,collabora.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4239457A16C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 17, 2026 at 9:44=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 5/15/26 11:40, Deepanshu Kartikey wrote:
> > +int virtio_gpu_array_lock_resv_uninterruptible(struct virtio_gpu_objec=
t_array *objs)
> > +{
> > +     unsigned int i;
> > +     int ret =3D 0;
> > +
> > +     if (objs->nents =3D=3D 1) {
> > +             dma_resv_lock(objs->objs[0]->resv, NULL);
> > +     } else {
> > +             ret =3D drm_gem_lock_reservations(objs->objs, objs->nents=
,
> > +                                             &objs->ticket);
>
> drm_gem_lock_reservations() is interruptible. Given that only one BO
> needs to be locked for the fix, make it
> virtio_gpu_lock_one_resv_uninterruptible() and fail with -EINVAL if
> objs->nents > 1
>
> --
> Best regards,
> Dmitry
>

I have sent patch v4.

Thanks

Deepanshu

